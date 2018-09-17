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
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.chemin.common.MallPageBar;
import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.map.controller.MapController;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;
import com.kh.chemin.member.model.vo.Member;
import com.kh.chemin.mypage.model.service.MypageService;

@SessionAttributes("id") 
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
	
	//리뷰 글 작성
	@RequestMapping(value ="/mypage/review.do",method = RequestMethod.POST) 
	public ModelAndView insertReview(Review review, MultipartFile review_file, HttpServletRequest request)
	{
		//String userId, int pno, String reContent, String stars,
		//코드, 아이디, 내용, 별, 파일
		/*logger.debug("게시판 파일 : "+review_file);
		logger.debug("아이디 : "+userId);
		logger.debug("상품 번호 : "+pno);
		logger.debug("글 내용 : "+reContent);
		logger.debug("파일 사이즈 : "+stars);
		*/
		
		logger.debug("review 객체 : "+review);
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/review");
		File dir = new File(saveDir);
		if(dir.exists()==false) dir.mkdirs();
		
		if(!(review_file==null))
		{
			//f=review_file로 바꾸기
			String originalFilename = review_file.getOriginalFilename();
			
			/*중복 이름 거르기							
			 lastindexof : 뒤에서 부터 감				 
			ex) bs.html : 구분자가 "."이라서 아래 변수에는 .뒤인 html만 담김
			*/
			String ext = originalFilename.substring(originalFilename.lastIndexOf(".")+1);
			
			//이름 재 부여 위해
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSS");
			
			int rndNum = (int)(Math.random()*1000);
			
			//현재 시간을 기준으로 포맷팅 함
			String renamedFileName = sdf.format(new Date(System.currentTimeMillis()));
			
			//중복값이 있을 수 있으니 num으로 랜덤 값 부여
			renamedFileName += "_"+rndNum+"."+ext;
			
			try
			{
				/* multipartFile = f       
				 > 서버의 해당 경로에 파일을 저장하는 명령 */
				review_file.transferTo(new File(saveDir+"/"+renamedFileName));		
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			review.setOrImg(originalFilename);
			review.setReImg(renamedFileName);

		}
			
		int result = service.insertReview(review);
		
		//서비스 갔다왔따
		
		String msg = "";
		String loc = "";
		
		if(result>0)
		{
			msg = "성공적으로 등록하였습니다!";
			loc = "/";
		}
		else
		{
			msg = "등록을 실패하였습니다 ㅠㅠㅠ";
			loc ="/";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("msg",msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
	//게시글 관리 페이지로 이동
	@RequestMapping("/mypage/myBoardList.do")
	public ModelAndView mallDetail(ModelAndView mv, HttpServletRequest request)
	{
		int numPerPage= 4;
	    int cPage=1;
		
	    //유저 아이디 가져오기
	    /*Member m = (Member)session.getAttribute("memberLoggedIn");*/
//	    String userId = request.getParameter("userId");
	    String userId ="user";
	    
	    logger.debug("아이디 값 찍어보기"+userId); 
	    
	    //글 리스트 불러오기
	    List<QnA_board> qlist = service.selectQnaBoardList(cPage,numPerPage,userId);
	    List<Review> rlist = service.selectReviewList(cPage,numPerPage,userId);
		   
	    //전체 글 수 
	    int qTotalCount = service.selectQnACount(userId);
	    int rTotalCount = service.selectReviewCount(userId);
	    
	    //페이지바
	    String qnaPageBar = MallPageBar.getQnaPage(cPage, numPerPage, qTotalCount);
	    String reviewPageBar = MallPageBar.getReviewPage(cPage, numPerPage, rTotalCount);
	    
	    logger.debug("qna리스트 불러오기"+qlist); 
		logger.debug("전체 qna게시글 수 "+qTotalCount);
		logger.debug("qna페이지바 "+qnaPageBar);
		
		mv.addObject("qlist", qlist);
		mv.addObject("qnaPageBar", qnaPageBar);
		 mv.addObject("rlist",rlist);
		mv.addObject("reviewbar",reviewPageBar);
		
		mv.setViewName("mypage/myBoardList");
	    
		return mv;
	}

	//QnA 페이징 처리
	@RequestMapping(value="/mypage/myQna.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String qnaPaging(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage) throws Exception 
	{
		int numPerPage= 4;
		String userId ="user";
				  
		Map<String, Object> map = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		
		//글 리스트 불러오기
	    List<QnA_board> qlist = service.selectQnaBoardList(cPage,numPerPage,userId);
			         
	    //전체 글 수 
	    int qTotalCount = service.selectQnACount(userId);
			         
		//페이지바
		String qnaPageBar = MallPageBar.getQnaPage(cPage, numPerPage, qTotalCount);
			         
		 map.put("list", qlist);
		 map.put("pageBar", qnaPageBar);

		 jsonStr = mapper.writeValueAsString(map);
		return jsonStr;
	}	
	
	@RequestMapping(value="/mypage/myReview.do",produces = "application/text; charset=utf8")
    @ResponseBody
      public String reviewPaging(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage) throws Exception 
	{
			int numPerPage= 4;
			String userId ="user";
		  
	         Map<String, Object> map = new HashMap<String, Object>();
	         ObjectMapper mapper = new ObjectMapper();
	         String jsonStr = null;
	         List<Review> rlist = service.selectReviewList(cPage,numPerPage,userId);
   
	         //문의게시판  글 갯수
	         int rTotalCount = service.selectReviewCount(userId);
	         
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
		mv.setViewName("common/deleteMsg");
		return mv;
	}
	
}




