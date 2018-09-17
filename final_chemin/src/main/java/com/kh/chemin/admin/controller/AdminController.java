package com.kh.chemin.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.chemin.admin.model.service.AdminService;
import com.kh.chemin.common.MallPageBar;
import com.kh.chemin.community.controller.CommunityController;
import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

@Controller
public class AdminController {
	private Logger logger=LoggerFactory.getLogger(AdminController.class);
	
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
	
	//물품등록 페이지
	@RequestMapping("/admin/adminProductReg.do")
	public String adminProductReg() {
		return "admin/adminProductReg";
	}
	
	//물품관리 페이지
	@RequestMapping("/admin/adminProductList.do")
	public String memberList() {
		return "admin/adminProductList";
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
	
	@RequestMapping("/admin/adminBoardManage.do")
	public ModelAndView adminBoardManage(ModelAndView mv)
	{
		int cPage = 1;
		int numPerPage = 4;
	
		//qna리스트 불러오기
		List<QnA_board> qlist = service.selectQnaBoardList(cPage,numPerPage);
		//전체 qna게시글 수 
		int qTotalCount = service.selectQnACount();
		//페이지바
		String qnaPageBar = MallPageBar.getAdminPage(cPage, numPerPage, qTotalCount);
				
		mv.addObject("qlist", qlist);
		mv.addObject("qnaPageBar", qnaPageBar);
		mv.setViewName("admin/adminBoard");
			
		return mv;
	}
	
	@RequestMapping("/admin/adminReviewBoard.do")
	public ModelAndView adminReviewBoardManage(ModelAndView mv)
	{
		int cPage = 1;
		int numPerPage = 4;
	
		//리뷰리스트 불러오기
		List<Review> rlist = service.selectReviewList(cPage,numPerPage);
		//전체 리뷰 게시글 수 
		int rTotalCount = service.selectReviewCount();
		//페이지바
		String reviewPageBar = MallPageBar.getReviewPage(cPage, numPerPage, rTotalCount);
		
		mv.addObject("rlist", rlist);
		mv.addObject("reviewPageBar", reviewPageBar);
		mv.setViewName("admin/adminReview");
			
		return mv;
	}	
		
	//주리가 한거 (9/13)
	@RequestMapping(value="/admin/adminBoard.do" ,produces = "application/text; charset=utf8")
	@ResponseBody
     public String adminBoard(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage) throws Exception 
	{
			int numPerPage= 4;
		  
	         Map<String, Object> map = new HashMap<String, Object>();
	         ObjectMapper mapper = new ObjectMapper();
	         String jsonStr = null;
	         
	         List<QnA_board> list = service.selectQnaBoardList(cPage,numPerPage);   
	           
	         //문의게시판  글 갯수
	         int qTotalCount = service.selectQnACount();
	         
	         //페이지바
	         String qnaPageBar = MallPageBar.getAdminPage(cPage, numPerPage, qTotalCount);
	         
	         map.put("list", list);
	         map.put("qnaPageBar", qnaPageBar);

	         jsonStr = mapper.writeValueAsString(map);
	         return jsonStr;
  
	}	
	
	@RequestMapping(value="/admin/adminReview.do",produces = "application/text; charset=utf8")
    @ResponseBody
      public String reviewPaging(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage) throws Exception 
	{
			int numPerPage= 4;
			String userId ="user";
		  
	         Map<String, Object> map = new HashMap<String, Object>();
	         ObjectMapper mapper = new ObjectMapper();
	         String jsonStr = null;
	        
	         //리뷰리스트 불러오기
	 		List<Review> rlist = service.selectReviewList(cPage,numPerPage);
	 		//전체 리뷰 게시글 수 
	 		int rTotalCount = service.selectReviewCount();
	 		//페이지바
	 		String reviewPageBar = MallPageBar.getReviewPage(cPage, numPerPage, rTotalCount);
	 	
	 		
	         logger.debug("list 값"+rlist);
	         logger.debug("rTotalCount 값"+rTotalCount);
	         logger.debug("reviewPageBar 값"+reviewPageBar);
	           
	         map.put("list", rlist);
	         map.put("pageBar", reviewPageBar);

	         jsonStr = mapper.writeValueAsString(map);
	         return jsonStr;
	}		
	
	
	@RequestMapping("/admin/qnainsert.do")
	public ModelAndView insertReply(String board_num, String admin_content)
	{
	
		//insert할 때 보낼 내용들 map에다 넣기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaNo", board_num);
		map.put("reply_content", admin_content);
		
		//서비스 다녀오자
		int result = service.insertReply(map);  
		
		int result2; //>update용 result2변수
		
		//서비스 다녀왔어요
		String msg = "";
		String loc = "";
		
		if(result>0) //insert가 성공적으로 잘 되면
		{
			//update를 서비스로 보내기 
			result2 = service.updateState(board_num);
			
			//update가 성공하면 (insert는 이미 성공한 상태)
			if(result2>0)
			{
				msg = "답변 글이 등록되었습니다.";
				loc = "/admin/adminBoardManage.do";
			}
			else
			{
				msg = "답변 글 등록에 실패하였습니다. 관리자에게 문의하세요.";
				loc = "/admin/adminBoardManage.do";
			}
		}
		else //insert가 실패하면
		{
			msg = "답변 글 등록에 실패하였습니다. 관리자에게 문의하세요.";
			loc = "/admin/adminBoardManage.do";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
}
