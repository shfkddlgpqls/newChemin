package com.kh.chemin.admin.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.chemin.acbook.common.Page;
import com.kh.chemin.admin.model.service.AdminService;
import com.kh.chemin.common.MallPageBar;
import com.kh.chemin.community.controller.CommunityController;
import com.kh.chemin.mall.model.vo.Product;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;
import com.kh.chemin.member.model.vo.Member;

import net.sf.json.JSONArray;

@Controller
public class AdminController {
	private Logger logger=LoggerFactory.getLogger(CommunityController.class);
	
	@Autowired
	private AdminService service;
	
	//회원관리 페이지
	@RequestMapping("/admin/adminPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	//장소요청내역 페이지
	@RequestMapping("/admin/adminPlaceList.do")
	public String adminPlaceList(Model model) {
		List<Place> plaList = service.adminPlaceList();
		model.addAttribute("plaList", plaList);
		return "admin/adminPlaceList";
	}
	
	//상품관리 페이지
	@RequestMapping("/admin/adminProductList.do")
	public String memberList() {
		return "admin/adminProductList";
	}
	
	//상품등록페이지
	@RequestMapping("/admin/adminProductView.do")
	public String productView(Model model) {
		List<Map<String, String>> list = service.selectMallCate();
		model.addAttribute("cate", list);
		return "admin/adminProductEnroll";
	}
	
	//장소 상세 페이지(모달)
	@RequestMapping(value="/admin/adminPlaDetailList.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String adminPlaDetailList(int plaNo, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		
		List<PlaceAttachment> attachList = service.selectAttachList(plaNo);
		List<PlaceMenu> menuList = service.selectMenuList(plaNo);
		
		
		map.put("attachList", attachList);
		map.put("menuList", menuList);

		jsonStr = mapper.writeValueAsString(map);
		return jsonStr;
	}
	
	//장소삭제
	@RequestMapping("/admin/adminPlaceDelete.do")
	public ModelAndView placeDelete(int plaNo,String userId)
	{
		int result = service.placeDelete(plaNo);
				
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="장소가 삭제되었습니다.";
		}else {
			msg="장소가 삭제 되지 않았습니다.";
		}
		loc="/admin/adminPlaceList.do?userId="+userId;
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.addObject("result", result);
		mv.setViewName("common/msg");
		return mv;
	}
	
	//장소 상태 변경
	@RequestMapping("/admin/adminPlaceStatus.do")
	public ModelAndView placeStatus(int plaNo, char plaStatus)
	{
		Map<String, Object> map = new HashMap<>();
		map.put("plaNo", plaNo);
		map.put("plaStatus", plaStatus);
		int result = service.plaStatusChange(map);
		
		String msg="";
		String loc="";
		
		if(plaStatus=='Y') {
			if(result>0) {
				msg="승인되었습니다.";
			}else {
				msg="승인이 되지 않았습니다.";
			}
		}else if(plaStatus=='N') {
			if(result>0) {
				msg="취소되었습니다.";
			}else {
				msg="취소 되지 않았습니다.";
			}
		}
		
		loc="/admin/adminPlaceList.do";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.addObject("result", result);
		mv.setViewName("common/msg");
		return mv;
	}
	
	
	@RequestMapping("/admin/adminReMsg.do")
	public ModelAndView adminReMsg(int plaNo, String plaReMsg, char plaStatus) 
	{
		Map<String, Object> map = new HashMap<>();
		map.put("plaNo", plaNo);
		map.put("plaReMsg", plaReMsg);
		map.put("plaStatus", plaStatus);
		int result = service.adminReMsg(map);
		
		String msg="";
		String loc="";

			if(result>0) {
				msg="승인 거절되었습니다.";
			}else {
				msg="승인 거절되지 않았습니다.";
		}
		
		loc="/admin/adminPlaceList.do";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.addObject("result", result);
		mv.setViewName("common/msg");

		return mv;
	}
	
	@RequestMapping("/admin/adminProductData.do")
	public void adminPData(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage, HttpServletResponse response, int searchCate, String searchOrder, String searchData) throws Exception {
		String cate = null;
		String stype_n=null;
		String stype_s=null;
		String stype_c=null;
		if(searchCate!=0) cate = "전체";
		if(searchOrder.equals("new")) stype_n="최신순";
		if(searchOrder.equals("sales")) stype_s="판매순";
		if(searchOrder.equals("stock")) stype_c="재고순";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cate", cate);
		map.put("searchCate", searchCate);
		map.put("stype_n", stype_n);
		map.put("stype_s", stype_s);
		map.put("stype_c", stype_c);
		map.put("searchOrder", searchOrder);
		map.put("searchData", searchData);
			
		int numPerPage = 10;
		int totalCount = service.selectProductCount(map);
		String pageBar = MallPageBar.getPageAdmin(cPage, numPerPage, totalCount);
		List<Map<String, Object>> list = service.selectProductList(map, cPage, numPerPage);
		
		JSONArray jsonArr = new JSONArray();
		jsonArr.add(list);
		jsonArr.add(pageBar);
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonArr);
	}
	
	@RequestMapping(value="/admin/productEnroll.do", method = RequestMethod.POST)
	public String productEnroll(Model model, Product product, @RequestParam("mainImg") MultipartFile mainImg, HttpServletRequest request) {
		// 대표이미지 저장경로 지정 및 서버에 이미지 저장
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/productImg");
		
		if(!mainImg.isEmpty()) {
			String oriImg = mainImg.getOriginalFilename();
			// 확장자
			String ext = oriImg.substring(oriImg.lastIndexOf(".")+1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String today = sdf.format(new Date(System.currentTimeMillis()));
			int no = service.selectMaxPno();
			String reImg = today+"_"+(no+1)+"."+ext;
			try { // 서버의 해당경로에 파일을 저장하는 명령
				mainImg.transferTo(new File(saveDir+"/"+reImg));
			} catch (Exception e) {
				e.printStackTrace();
			}
			product.setOriImg(oriImg);
			product.setReImg(reImg);
		}
		service.insertProduct(product);
		
		return "redirect:/admin/adminProductList.do";
	}
	
	@RequestMapping("/admin/productUpdate.do")
	public String productUpdate(Model model, int pno) {
		Product product = service.selectProduct(pno);
		List<Map<String, String>> list = service.selectMallCate();
		model.addAttribute("cate", list);
		model.addAttribute("product", product);
		return "admin/adminProductUpdate";
	}
	
	@RequestMapping("/admin/productUpdateEnd.do")
	public String productUpdateEnd(Model model, Product product, @RequestParam("mainImg") MultipartFile mainImg, HttpServletRequest request) {
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/productImg");
		
		if(!mainImg.isEmpty()) {
			// 기존 파일 삭제
			Product p = service.selectProduct(product.getPno());
			String img = request.getSession().getServletContext().getRealPath("/resources/upload/productImg/"+p.getReImg());
			File file = new File(img);
			if(file.exists() == true){
				file.delete();
			}
			
			String oriImg = mainImg.getOriginalFilename();
			// 확장자
			String ext = oriImg.substring(oriImg.lastIndexOf(".")+1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String today = sdf.format(new Date(System.currentTimeMillis()));
			int no = product.getPno();
			String reImg = today+"_"+no+"."+ext;
			try { // 서버의 해당경로에 파일을 저장하는 명령
				mainImg.transferTo(new File(saveDir+"/"+reImg));
			} catch (Exception e) {
				e.printStackTrace();
			}
			product.setOriImg(oriImg);
			product.setReImg(reImg);
		}
		service.updateProduct(product);
		
		return "redirect:/admin/adminProductList.do";
	}

	@RequestMapping("/admin/productDelete.do")
	public void productDelete(HttpServletRequest request, HttpServletResponse response, int pno) throws Exception {
		// 기존 파일 삭제
		Product product = service.selectProduct(pno);
		int result = service.productDelete(pno);
		
		String img = request.getSession().getServletContext().getRealPath("/resources/upload/productImg/"+product.getReImg());
		File file = new File(img);
		if(file.exists() == true){
			file.delete();
		}
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	@RequestMapping("/admin/productAuto.do")
	public void productAuto(String search, HttpServletResponse response) throws Exception {
		List<String> nameList=null;
		String csv="";
		if(!search.trim().isEmpty())
		{
			nameList= service.productAuto(search);
			if(!nameList.isEmpty()) {
				for(int i=0;i<nameList.size();i++) {
					if(i!=0) csv+=",";
					csv+=nameList.get(i);
				}
			}
		}
		response.setContentType("text/csv;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(csv);
	}
	
	@RequestMapping("/admin/adminOrderList.do")
	public String myOrderList(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage, Model model)
	{
		int numPerPage = 5;
		List<Map<String, Object>> list = service.selectOrderList(cPage, numPerPage);
		List<Map<String, Object>> data = service.selectOrderData();
		int totalCount = service.selectTotalCount();
		model.addAttribute("pageBar", Page.getPage(cPage, numPerPage, totalCount, "adminOrderList.do"));
		model.addAttribute("list", list);
		model.addAttribute("data", data);
		return "admin/adminOrderList";
	}
}
