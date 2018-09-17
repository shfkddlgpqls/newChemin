package com.kh.chemin.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.chemin.common.PlacePageBar;
import com.kh.chemin.map.controller.MapController;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;
import com.kh.chemin.mypage.model.service.MypageService;

@Controller
public class MypageController 
{		
	private Logger logger=LoggerFactory.getLogger(MapController.class);

	@Autowired
	private MypageService service;
	
	//주문 목록 페이지로 이동
	@RequestMapping("/mypage/myOrderList.do")
	public String myOrderList()
	{
		return "mypage/myOrderList";
	}
	
	//게시글 관리 페이지로 이동
	@RequestMapping("/mypage/myBoardList.do")
	public String mallDetail()
	{
		return "mypage/myBoardList";
	}
	
	//장바구니로 이동
	@RequestMapping("/mypage/myShoppingCart.do")
	public String shoppingCart()
	{
		return "mypage/myShoppingCart";
	}
	
	
	//찜 목록으로 이동
	@RequestMapping("/mypage/myWishList.do")
	public String wishList()
	{
		return "mypage/myWishList";
	}
	
	//장소 등록 페이지로 이동
	@RequestMapping("/mypage/myPlaceList.do")
	public String placeList(Model model, char plaStatus)
	{
		/*List<Place> list = service.selectPlaceList(userId);
		model.addAttribute("list", list);*/
		model.addAttribute("plaStatus", plaStatus);
		return "mypage/myPlaceList";
	}
	
	//장소 승인상태에 따른 리스트
		@RequestMapping(value="/mypage/placeStatusList.do",produces = "application/text; charset=utf8")
		@ResponseBody
		public String placeStatusList(char plaStatus,String plaCategory, String userId,@RequestParam(value="cPage",required=false,defaultValue="1") int cPage) throws Exception {
			int numPerPage =6;
			
			Map<String, Object> map = new HashMap<String, Object>();
			Map<String, Object> map1 = new HashMap<String, Object>();
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = null;
			
			
			map.put("plaStatus", plaStatus);
			map.put("plaCategory", plaCategory);
			map.put("userId", userId);
			
			List<Place> list = service.selectPlaceList(map,cPage,numPerPage);
			
			//승인상태 글 갯수
			int totalCount = service.selectPlaceCount(map);
			
			String pageBar = PlacePageBar.getPagePlace(cPage, numPerPage, totalCount);
			map1.put("list", list);
			map1.put("pageBar",  pageBar);
			jsonStr = mapper.writeValueAsString(map1);
			return jsonStr;
		}
	
	//장소 상세 페이지 이동
	@RequestMapping(value="/mypage/myPlaDetailList.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String plaDetailList(int plaNo, Model model) throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		
		List<PlaceAttachment> attachList = service.selectAttachList(plaNo);
		List<PlaceMenu> menuList = service.selectMenuList(plaNo);
		
		System.out.println(attachList);
		map.put("attachList", attachList);
		map.put("menuList", menuList);

		jsonStr = mapper.writeValueAsString(map);
		return jsonStr;
		
	}
	
	//장소 삭제
	@RequestMapping("/mypage/myPlaceDelete.do")
	public ModelAndView placeDelete(int plaNo,String userId)
	{
		System.out.println(plaNo);
		int result = service.placeDelete(plaNo);
				
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="장소가 삭제되었습니다.";
		}else {
			msg="장소가 삭제 되지 않았습니다.";
		}
		loc="/mypage/myPlaceList.do?userId="+userId;
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.addObject("result", result);
		mv.setViewName("common/msg");
		return mv;
	}
	
	//장소 수정
	@RequestMapping("/mypage/myPlaceSelect.do")
	public String placeSelect(int plaNo,Model model)
	{
		Place place = service.placeSelect(plaNo);
		List<PlaceAttachment> attach = service.selectAttachList(plaNo);
		List<PlaceMenu> menu = service.selectMenuList(plaNo);
		model.addAttribute("place", place);
		model.addAttribute("attach", attach);
		model.addAttribute("menu", menu);
		return "mypage/placeUpdate";
	}
	
	//마이페이지 장소 등록 수정
	@RequestMapping("/mypage/placeUpdate.do")
	public ModelAndView placeUpdate(Place place ,@RequestParam("mainImg")MultipartFile mainImg,@RequestParam("file")MultipartFile[] file,HttpServletRequest request,String[] menuName,String[] menuPrice,String[] menuCheck, String phoneFirst, String phoneMiddle, String phoneEnd,String postCode, String roadAddr, String jibunAddr,
			  String day, String startTime, String endTime,String subContent,String keyword1,String keyword2, String keyword3, String keyword4, String keyword5) {
			
			String phone=phoneFirst+"-"+phoneMiddle+"-"+phoneEnd;
			String address=roadAddr+"/"+postCode+"/"+jibunAddr;
			String time=day+"/"+startTime+"/"+endTime+"/"+subContent;
			String keyword = keyword1+" "+keyword2+" "+keyword3+" "+keyword4+" "+keyword5;
			place.setPlaPhone(phone);
			place.setPlaAddr(address);
			place.setPlaTime(time);
			place.setPlaKeyword(keyword);
			place.setUserId("hyebeen");
			
			
			//대표이미지 저장경로 지정 및 서버에 이미지 저장
			String saveDirMain = request.getSession().getServletContext().getRealPath("/resources/upload/place/main");
			if(!mainImg.isEmpty()) {	
			String orImg = mainImg.getOriginalFilename();
			String reImg = orImg;
			try {
			mainImg.transferTo(new File(saveDirMain+"/"+reImg));
			} catch (IOException e) {
			e.printStackTrace();
			} 
			place.setOrImg(orImg);
			place.setReImg(reImg);
			}
			
			//배열수 만큼 가격정보 db에 넣기
			List<PlaceMenu> menuList = new ArrayList();
			for(int i=0; i<menuName.length; i++) {
			if(!menuName[i].isEmpty()&&!menuPrice[i].isEmpty()) {
			PlaceMenu menu = new PlaceMenu();
			menu.setMenuName(menuName[i]);
			menu.setMenuPrice(menuPrice[i]);
			menuList.add(menu);
			}
			}
			
			List<PlaceAttachment> attList = new ArrayList();
			String saveDirAttch = request.getSession().getServletContext().getRealPath("/resources/upload/place/attach");
			for(MultipartFile f : file) {
			if(!f.isEmpty()) {
			String attachOrImg = f.getOriginalFilename();
			String attachReImg = attachOrImg;
			try {
				f.transferTo(new File(saveDirAttch+"/"+attachReImg));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			PlaceAttachment attach = new PlaceAttachment();
			attach.setOrImg(attachOrImg);
			attach.setReImg(attachReImg);
			attList.add(attach);
			}
			}
			
			
			int result = service.placeUpdate(place,menuList,attList);
			String msg="";
			String loc="";
			
			if(result>0) {
			msg="장소 수정이 완료되었습니다.";
			}else {
			msg="장소 수정이 완료 되지 않았습니다.";
			}
			loc="/";
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.addObject("result", result);
			mv.setViewName("common/msg");
			return mv;
	}
}





