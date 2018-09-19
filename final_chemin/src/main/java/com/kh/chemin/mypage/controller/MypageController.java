package com.kh.chemin.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import java.net.URLDecoder;
import java.net.URLEncoder;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

import com.kh.chemin.acbook.common.Page;
import com.kh.chemin.common.MallPageBar;
import com.kh.chemin.community.model.vo.Report;
import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.common.MallPageBar;
import com.kh.chemin.common.PlacePageBar;
import com.kh.chemin.map.controller.MapController;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;
import com.kh.chemin.member.model.vo.Member;
import com.kh.chemin.mypage.model.service.MypageService;

import net.sf.json.JSONArray;


@SessionAttributes(value = {"memberLoggedIn"})
@Controller
public class MypageController 
{		
	private Logger logger=LoggerFactory.getLogger(MypageController.class);
	
	 @Autowired
	   BCryptPasswordEncoder bCryptPasswordEncoder;
	 
	@Autowired
	private MypageService service;
	
	//주문 목록 페이지로 이동
	@RequestMapping("/mypage/myOrderList.do")
	public String myOrderList(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage, Model model, HttpSession session)
	{
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();
		int numPerPage = 5;
		List<Map<String, Object>> list = service.selectOrderList(userId, cPage, numPerPage);
		List<Map<String, Object>> data = service.selectOrderData(userId);
		int totalCount = service.selectTotalCount(userId);
		model.addAttribute("pageBar", Page.getPage(cPage, numPerPage, totalCount, "myOrderList.do"));
		model.addAttribute("list", list);
		model.addAttribute("data", data);
		return "mypage/myOrderList";
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
	
	// 찜 목록 불러오기
	@RequestMapping("/mypage/wishListData.do")
	public void wishListData(HttpSession session, HttpServletResponse response) throws Exception {
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();
		List<Map<String, Object>> list = service.selectWishList(userId);
		
		JSONArray jsonArr = new JSONArray();
		jsonArr.add(list);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonArr);
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
		loc="/mypage/myPlaceList.do?plaStatus=N";
		
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
	public ModelAndView placeUpdate(HttpSession session,Place place ,@RequestParam("mainImg")MultipartFile mainImg,@RequestParam("file")MultipartFile[] file,HttpServletRequest request,String[] menuName,String[] menuPrice,String[] menuCheck, String phoneFirst, String phoneMiddle, String phoneEnd,String postCode, String roadAddr, String jibunAddr,
			  String day, String startTime, String endTime,String subContent,String keyword1,String keyword2, String keyword3, String keyword4, String keyword5) {
			
			Member m = (Member)session.getAttribute("memberLoggedIn");
			String userId = m.getUserId();
			String phone=phoneFirst+"-"+phoneMiddle+"-"+phoneEnd;
			String address=roadAddr+"/"+postCode+"/"+jibunAddr;
			String time=day+"/"+startTime+"/"+endTime+"/"+subContent;
			String keyword = keyword1+" "+keyword2+" "+keyword3+" "+keyword4+" "+keyword5;
			place.setPlaPhone(phone);
			place.setPlaAddr(address);
			place.setPlaTime(time);
			place.setPlaKeyword(keyword);
			place.setUserId(userId);
			
			
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
			loc="/mypage/myPlaceList.do?plaStatus=N";
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.addObject("result", result);
			mv.setViewName("common/msg");
			return mv;
	}
	
	/*회원 정보*/
	@RequestMapping("/mypage/myMember.do")
	public String myMember(Model model, HttpSession session)
	{	
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();
		Map<String, Object> member = service.memberList(userId);
		model.addAttribute("member", member);
		return "mypage/myMember";
	}
	
	/*신고1번 받은 회원에게 메인에서 알림 띄어주기*/
	/*신고당한사람 메시지 띄어주기*/
	@RequestMapping(value="/mypage/warningMsg.do",produces="application/text; charset=utf-8")
	@ResponseBody
	public String warnMsg(String userId) throws Exception
	{
		logger.debug("::::warnMsgController:::"+userId);
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr=null;
		Map<String,Object> map=new HashMap<String,Object>();
		int warnNum=service.warnMsg(userId);
		map.put("warnNum", warnNum);
		jsonStr=mapper.writeValueAsString(map);
		return jsonStr;
	}
	
//	=======================주리가 한 부분 =======================	
	
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
          loc = "/mypage/myOrderList.do";
       }
       else
       {
          msg = "등록을 실패하였습니다 ㅠㅠㅠ";
          loc ="/mypage/myOrderList.do";
       }
       
       ModelAndView mv = new ModelAndView();
       
       mv.addObject("msg",msg);
       mv.addObject("loc", loc);
       mv.setViewName("common/msg");
       
       return mv;
    }
		
		//게시글 관리 페이지로 이동
		@RequestMapping("/mypage/myBoardList.do")
		public ModelAndView myBoardDetail(ModelAndView mv, HttpSession session)
		{
			int numPerPage= 4;
		    int cPage=1;
			
		    //유저 아이디 가져오기
		    Member m = (Member)session.getAttribute("memberLoggedIn");
		    String userId = m.getUserId();
//		    String userId ="user";
		    
		    logger.debug("페이지로 이동 값 찍어보기"+userId); 
		    
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
		public String qnaPaging(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage, HttpSession session) throws Exception 
		{
			int numPerPage= 4;

			 //유저 아이디 가져오기
		    Member m = (Member)session.getAttribute("memberLoggedIn");
		    String userId = m.getUserId();
		    logger.debug("qnaPaging userId"+userId);
					  
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
	      public String reviewPaging(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage, HttpSession session) throws Exception 
		{
				int numPerPage= 4;
				 //유저 아이디 가져오기
			    Member m = (Member)session.getAttribute("memberLoggedIn");
			    String userId = m.getUserId();
			  
			    logger.debug("review userId"+userId);
			    
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
		
		@RequestMapping("/mypage/qnaEdit.do") 
		public ModelAndView updateUserQna(ModelAndView mv, String userId, String qnaNo, String board_name, String qna_cate_no, String qna_content, String user_input_pw)
		{
			Map<String, String> map = new HashMap();
			
			map.put("USERID", userId);//
			map.put("QNAPW", user_input_pw);//
			map.put("QNO", qnaNo);//
			map.put("QNA_CATE_NO", qna_cate_no);//
			map.put("QNATITLE", board_name);//
			map.put("QNACONTENT", qna_content);//
			
			logger.debug("컨트롤러 임당 "+map);
			
			int result = service.UpdateQna(map);
			logger.debug("컨트롤러 임당 결과값이 어떻게 나오나요? "+result);
			
			//메시지 출력
			String msg = "";
			String loc = "";
			
			if(result>0)
			{
				msg="문의 글이 성공적으로 수정되었습니다.";
				loc="/mypage/myBoardList.do";
			}
			else
			{
				msg = "문의 글 등록에 실패하였습니다. <br> 관리자에게 문의해보세요.";
				loc="/mypage/myBoardList.do";
			}
						
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
						
	  	return mv;
		}
		
		@RequestMapping("/mypage/qnaDel.do")
		public ModelAndView myQnaDel(ModelAndView mv,@RequestParam(value = "modal_qno") String modal_qno )
		{
			int result = service.myQnaDel(modal_qno);
			
			//서비스 갔다왔따
			
			String msg = "";
			String loc = "";
			
			if(result>0)
			{
				msg = "선택하신 문의글이 성공적으로 삭제 되었습니다.";
				loc = "/mypage/myBoardList.do";
			}
			else
			{
				msg = "삭제 작업을 실패하였습니다. 관리자에게 문의하세요";
				loc ="/mypage/myBoardList.do";
			}
			
			mv.addObject("msg",msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			
			return mv;	

			
		}
		
		
	//리뷰 글 작성
	@RequestMapping(value ="/mypage/myReviewEdit.do",method = RequestMethod.POST) 
	public ModelAndView updateReview(Review review, MultipartFile review_file, HttpServletRequest request)
	{

					logger.debug("review 객체 : "+review);
					
					String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/review");
					File dir = new File(saveDir);
					if(dir.exists()==false) dir.mkdirs();
					
					if(review_file!=null) //!(review_file==null)
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
					else
					{
						review.setOrImg(null);
						review.setReImg(null);
					}
						
					int result = service.insertReviewEdit(review);
					
					//서비스 갔다왔따
					
					String msg = "";
					String loc = "";
					
					if(result>0)
					{
						msg = "성공적으로 등록하였습니다!";
						loc = "/mypage/myBoardList.do";
					}
					else
					{
						msg = "등록을 실패하였습니다 ㅠㅠㅠ";
						loc ="/mypage/myBoardList.do";
					}
					
					ModelAndView mv = new ModelAndView();
					
					mv.addObject("msg",msg);
					mv.addObject("loc", loc);
					mv.setViewName("common/msg");
					
					return mv;
				}
	
	//리뷰 삭제하기 
	@RequestMapping("/mypage/reviewDel.do")
	public ModelAndView myReviewDel(ModelAndView mv,@RequestParam(value = "modal_rno") String modal_rno )
	{
		int result = service.myReviewDel(modal_rno);
		
		//서비스 갔다왔따
		
		String msg = "";
		String loc = "";
		
		if(result>0)
		{
			msg = "리뷰가 성공적으로 삭제 되었습니다.";
			loc = "/mypage/myBoardList.do";
		}
		else
		{
			msg = "삭제 작업을 실패하였습니다. 관리자에게 문의하세요";
			loc ="/mypage/myBoardList.do";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;	

	}
	
}