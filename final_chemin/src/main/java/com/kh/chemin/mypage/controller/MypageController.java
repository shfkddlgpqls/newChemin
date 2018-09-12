package com.kh.chemin.mypage.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.kh.chemin.community.model.vo.Attachment;
import com.kh.chemin.community.model.vo.Community;
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
	public String placeList(Model model, String userId)
	{
		List<Place> list = service.selectPlaceList(userId);
		model.addAttribute("list", list);
		return "mypage/myPlaceList";
	}
	

	@RequestMapping(value="/mypage/myPlaDetailList.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String plaDetailList(int plaNo, Model model) throws Exception
	{
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
	
	@RequestMapping("/mypage/myPlaceDelete.do")
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
		loc="/mypage/myPlaceList.do?userId="+userId;
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.addObject("result", result);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/mypage/myCommunityList.do")
	public ModelAndView myCommunityList(ModelAndView mv,String userId)
	{
		System.out.println("userId::"+userId);
		List<Map<String,Object>> list=service.communityList(userId);
		logger.debug("communityList::"+list);
		List<Integer> cno=new ArrayList<Integer>();
		int[] no = new int[list.size()];
		for(int i=0;i<list.size();i++)
		{
			no[i]= (Integer.parseInt(list.get(i).get("COMMUNITYNO").toString()));
			cno.add(no[i]);
		}
		List<Map<String,Object>> attList=service.attachmentList(cno);
		logger.debug("attachmentList::"+attList);
		
		mv.addObject("list",list);
		mv.addObject("attList",attList);
		mv.setViewName("mypage/myCommunityList");
		return mv;
	}
}




