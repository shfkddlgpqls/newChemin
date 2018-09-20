package com.kh.chemin.acbook.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.chemin.acbook.common.Page;
import com.kh.chemin.acbook.model.service.AcBookService;
import com.kh.chemin.acbook.model.vo.AcBook;
import com.kh.chemin.acbook.model.vo.AcCom;
import com.kh.chemin.acbook.model.vo.AcReply;
import com.kh.chemin.acbook.model.vo.PolaData;
import com.kh.chemin.member.model.vo.Member;

@Controller
public class AcBookController extends HttpServlet{
	private Logger logger = LoggerFactory.getLogger(AcBookController.class);
	
	private static final long serialVersionUID = -5563158563639817L;
		
	@Autowired
	AcBookService service;
	
	@RequestMapping("ac_main.do")
	public ModelAndView acbook(ModelAndView mv, HttpSession session) {
		String lastDay = service.selectLastDay();
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();
		List<Model>list = service.selectinExCost(userId);
		List<Model>monAvg= service.monthlySumAvg(userId);
		List<Model>savCost = service.selectSavingCost(userId);
		mv.addObject("list", list);
		mv.addObject("lastDay",lastDay);
		mv.addObject("monAvg",monAvg);
		mv.addObject("savCost",savCost);
		logger.debug("savCost세브코스트응으으으"+savCost);
		mv.setViewName("acbook/ac_main");
		return mv;
	}
	
	@RequestMapping("ac_insertAc.do")
	public String ac_inputIn() {
		return "acbook/ac_insertAc";
	}

	@RequestMapping("ac_calendar.do")
	public String ac_calendar() {
		return "acbook/ac_calendar";
	}
	
	@RequestMapping("/ac_savingChart.do")
	public String ac_savingChart() {
		return "acbook/ac_savingChart";
	}

	@RequestMapping("/ac_community.do")
	public String ac_community() {
		return "acbook/ac_community";
	}
	
/*	@RequestMapping("/ac_monthlyData.do")
	public String ac_monthlyData() {
		return "acbook/monthlyData";
	}
*/	
	//writeJsp
	@RequestMapping("/ac_comBoard.do")
	public String form() {
		return "acbook/ac_comBoard";
	}
	

	//ac_insertAc
	@RequestMapping("acbook/insertAc.do")
	public String insertExpenditure(AcBook ac){
		
		int result= service.insertEx(ac);
		logger.debug("insert complate that data is: "+ac);
		String msg="";
		String loc="";

		if(result>0) {
			msg="플레리북 등록 완료";
		}
		else {
			msg="등록 실패!";
		}
		return "acbook/ac_calendar";
		
	}
	
	/*메모랭킹*/
	@RequestMapping("acbook/selectMemoLank.do")
	public void selectMemoLank(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws ServletException,IOException {
		Member m=(Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();
		List<Model>mList = service.selectMemoLank(userId);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(mList, response.getWriter());
	}
	
	
	@RequestMapping("acbook/timePolar.do")
	public void selectPolarData(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException,IOException {
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();
		List<PolaData>p = service.selectPolaData(userId);
		//이번달 최다 지출 일
		List<Model>monDay = service.selectMuchDay(userId);
		List<PolaData> list1= new ArrayList();
		List<PolaData> list2= new ArrayList();
		List<PolaData> list3= new ArrayList();
		List<PolaData> list4= new ArrayList();
		List<PolaData> list5= new ArrayList();
		List<PolaData> list6= new ArrayList();
		List<PolaData> list7= new ArrayList();
		List<PolaData> list8= new ArrayList();
		/*List<Model>list = service.selectPolaData(userId);*/
		
		for(int i=0;i<p.size();i++) {
			logger.debug("get i값"+p.get(i));
			if(Integer.parseInt(p.get(i).getAcDate())>=0 && Integer.parseInt(p.get(i).getAcDate())<3) {
				list1.add(p.get(i));
			}else if(Integer.parseInt(p.get(i).getAcDate())>=3 && Integer.parseInt(p.get(i).getAcDate())<6) {
				list2.add(p.get(i));
			}else if(Integer.parseInt(p.get(i).getAcDate())>=6 && Integer.parseInt(p.get(i).getAcDate())<9) {
				list3.add(p.get(i));
			}else if(Integer.parseInt(p.get(i).getAcDate())>=9 && Integer.parseInt(p.get(i).getAcDate())<12) {
				list4.add(p.get(i));
			}else if(Integer.parseInt(p.get(i).getAcDate())>=12 && Integer.parseInt(p.get(i).getAcDate())<15) {
				list5.add(p.get(i));
			}else if(Integer.parseInt(p.get(i).getAcDate())>=15 && Integer.parseInt(p.get(i).getAcDate())<18) {
				list6.add(p.get(i));
			}else if(Integer.parseInt(p.get(i).getAcDate())>=18 && Integer.parseInt(p.get(i).getAcDate())<21) {
				list7.add(p.get(i));
			}else if(Integer.parseInt(p.get(i).getAcDate())>=21 && Integer.parseInt(p.get(i).getAcDate())<24) {
				list8.add(p.get(i));
			}
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list1",list1);
		mv.addObject("list2",list2);
		mv.addObject("list3",list3);
		mv.addObject("list4",list4);
		mv.addObject("list5",list5);
		mv.addObject("list6",list6);
		mv.addObject("list7",list7);
		mv.addObject("list8",list8);
		mv.addObject("monDay",monDay);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(mv, response.getWriter());
	}
	
	//ac_calendar.jsp: 달력내 수입 지출 출력
	@RequestMapping("/ajax/test.do")
	public void selectEvent(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException{
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();
		List<Model> list = service.selectEb(userId);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
	}
	
	//ac_calendar.jsp: 가계부 상세정보 출력리스트
	@RequestMapping(value="acbook/acSelectPageList.do")
	public void selectPageList(@RequestParam(value="cPage", required=false, defaultValue ="1")int cPage, HttpServletResponse response, HttpServletRequest request,HttpSession session) throws ServletException, IOException{
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();
		logger.debug("request parameter to ajax where ac_calendar.jsp, value is cPage: "+cPage);
		ModelAndView mv = new ModelAndView();
		int numPerPage=5;
		List<Map<String,String>>list = service.selectPageList(cPage,numPerPage,userId);
		int totalCounts= service.selectTotalCount();
		
		mv.addObject("list",list);
		mv.addObject("totalCounts",totalCounts);
		mv.addObject("pageBar",Page.getPageCal(cPage, numPerPage, totalCounts, "acbook/acSelectPageList.do"));
		mv.setViewName("acbook/ac_calendar");
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(mv,response.getWriter());
		
	}
	//일별 누적지출
	@RequestMapping("/ajax/selectDailySum")
	public void selectDailySum(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException{
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();
		List<Model>mlist = service.selectDailySum(userId);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(mlist, response.getWriter());
	}
	//savingchart.jsp: 월별 저축 현황
	@RequestMapping("/ajax/selectSaving.do")
	public void selectSaving(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Member m = (Member)session.getAttribute("memberLoggedIn");
		ModelAndView mv = new ModelAndView();
		String userId = m.getUserId();
		List<Model>list1 = service.selectDailySum(userId);
		List<Model>list2=service.preSelectDailySum(userId);
		List<Model>list3=service.prePreSelectDailySum(userId);

		List<Model> monthlySumAvg= service.monthlySumAvg(userId);
		List<Model> preMonthlySumAvg= service.preMonthlySumAvg(userId);
		List<Model> prePreMonthlySumAvg= service.prePreMonthlySumAvg(userId);
		//금월, 전월, 전전월 카테고리별 지출 합계
		List<Model> thisMonthlyData= service.thisMonthlyData(userId);
		List<Model> preMonthlyData= service.preMonthlyData(userId);
		List<Model> prePreMonthlyData= service.prePreMonthlyData(userId);
		mv.addObject("list1",list1);
		mv.addObject("list2",list2);
		mv.addObject("list3",list3);
		mv.addObject("monthlySumAvg",monthlySumAvg);
		mv.addObject("preMonthlySumAvg",preMonthlySumAvg);
		mv.addObject("prePreMonthlySumAvg",prePreMonthlySumAvg);
		mv.addObject("thisMonthlyData",thisMonthlyData);
		mv.addObject("preMonthlyData",preMonthlyData);
		mv.addObject("prePreMonthlyData",prePreMonthlyData);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(mv, response.getWriter());
	
	}
	//소비등급
	@RequestMapping("/ajax/selectExGrade")
	public void selectExGrade(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws ServletException, IOException{
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();
		List<Model>selectExGrade = service.selectExGrade(userId);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(selectExGrade, response.getWriter());
	}
	
	//acMain.jsp:카테고리별 지출합계
	@RequestMapping("/ajax/monthlyExpenditure")
	public void monthlyExspenditure(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws ServletException, IOException {
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();
		List<Model> monthlyExpenditure= service.monthlyExpenditure(userId);
		response.setContentType(("application/json;charset=UTF-8"));
		new Gson().toJson(monthlyExpenditure, response.getWriter());
		
	}
	//monthlyData.jsp:풀데이터
	@RequestMapping("/acbook/selectFullData.do")
	public void fullData(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
		ModelAndView mv = new ModelAndView();
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();	
		//이번달 평균 지출
		List<Model> monAvg= service.monthlySumAvg(userId);
		//저번달 평균 지출
		List<Model> preAvg= service.preMonthlySumAvg(userId);
		//이번달 메모 랭킹
		List<Model>monMemo = service.monthlyMemoLank(userId);
		//이번달 수입 지출
		List<Model>monInEx = service.selectinExCost(userId);
		//이번달 최다 지출 평균 시간대
		List<Model>monTime =  service.selectMonTime(userId);
		//이번달 최다 지출 일
		List<Model>monDay = service.selectMuchDay(userId);
		//마지막 날
		String lastDay = service.selectLastDay();
		mv.addObject("monAvg",monAvg);
		mv.addObject("preAvg",preAvg);
		mv.addObject("monMemo",monMemo);
		mv.addObject("monInEx",monInEx);
		mv.addObject("monTime",monTime);
		mv.addObject("monDay",monDay);
		mv.addObject("lastDay",lastDay);		
		response.setContentType(("application/json;charset=UTF-8"));
		new Gson().toJson(mv, response.getWriter());
	}
	
	
	//monthlyData.jsp: 전전월, 전월, 금월 카테고리별 지출
	@RequestMapping("/ac_monthlyData.do")
	public ModelAndView selectEachMonthlyData(ModelAndView mv,HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();
		//금월,전월,전전월 총 지출 합계, 일평균 지출액
		List<Model> monthlySumAvg= service.monthlySumAvg(userId);
		List<Model> preMonthlySumAvg= service.preMonthlySumAvg(userId);
		List<Model> prePreMonthlySumAvg= service.prePreMonthlySumAvg(userId);
		//금월, 전월, 전전월 카테고리별 지출 합계
		List<Model> thisMonthlyData= service.thisMonthlyData(userId);
		List<Model> preMonthlyData= service.preMonthlyData(userId);
		List<Model> prePreMonthlyData= service.prePreMonthlyData(userId);
		String lastDay = service.selectLastDay();
		List<Model>inexCost = service.selectinExCost(userId);
		mv.addObject("inexCost", inexCost);
		mv.addObject("lastDay",lastDay);
		mv.addObject("monthlySumAvg",monthlySumAvg);
		mv.addObject("preMonthlySumAvg",preMonthlySumAvg);
		mv.addObject("prePreMonthlySumAvg",prePreMonthlySumAvg);		
		mv.addObject("thisMonthlyData",thisMonthlyData);
		mv.addObject("preMonthlyData",preMonthlyData);
		mv.addObject("prePreMonthlyData",prePreMonthlyData);
		mv.addObject("lastDay",lastDay);
		mv.addObject("inexCost",inexCost);
		
		logger.debug("monthlySumAvg: "+ monthlySumAvg);
		logger.debug("preMonthlySumAvg: "+ preMonthlySumAvg);
		logger.debug("prePreMonthlySumAvg: "+ prePreMonthlySumAvg);
		logger.debug("thisMonthlyData: "+ thisMonthlyData);
		logger.debug("preMonthlyData: "+preMonthlyData);
		logger.debug("prePreMonthlyData: "+prePreMonthlyData);
		logger.debug("lastDay"+lastDay);
		logger.debug("inexCost"+inexCost);
		mv.setViewName("acbook/monthlyData");
		return mv;
	}
	
	
	//request acNo for search acBook detailView
	@RequestMapping(value="acbook/acSelectOne.do")
	public void acSelectOne(@RequestParam(value="acNo")int acNo, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("request parameter to ajax where ac_calendar.jsp, value is acNo: "+acNo);
		Map<String,Object> map = new HashMap<String, Object>();
		map = service.acSelectOne(acNo);
		logger.debug("this is map: "+map);
		response.setContentType("application/json;charset=UTF-8");
		new Gson().toJson(map,response.getWriter());
	}
	//가계부 정보 삭제
	@RequestMapping("acbook/deleteAcBook.do")
	public String deleteAcOne(AcBook ac) {
		int result=service.deleteAcOne(ac);
		String msg="";
		String loc="";
		if(result>0) {
			msg="플레리북 등록 완료";
		}
		else {
			msg="등록 실패!";
		}
		return "acbook/ac_calendar";
	}
	//가계부 정보 수정
	@RequestMapping("acbook/updateAcBook.do")
	public String updateAcOne(@RequestParam(value="acNo")int acNo, AcBook ac,HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
		ModelAndView mv = new ModelAndView();
		logger.debug("Acbook: "+ac);
		int result = service.updateAcOne(ac);
		logger.debug("insert complate that data is: "+ac);
		String msg="";
		String loc="";
		if(ac!=null) {
			msg="플레리북 수정이 완료되었습니다.";
		}
		else {
			msg="등록 실패!";
		}
		return "acbook/ac_calendar";
	}
	
	@RequestMapping(value="acbook/acComList.do")
	public void acComList(@RequestParam(value="cPage", required=false, defaultValue ="1")int cPage, HttpServletResponse response, HttpServletRequest request,HttpSession session) throws ServletException, IOException{
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String userId = m.getUserId();
		ModelAndView mv = new ModelAndView();
		int numPerPage=5;
		List<Map<String,String>>list = service.acComList(cPage,numPerPage,userId);
		int totalCounts= service.selectTotalCount();
		
		mv.addObject("list",list);
		mv.addObject("totalCounts",totalCounts);
		mv.addObject("pageBar",Page.getPageCal(cPage, numPerPage, totalCounts, "acbook/acComList.do"));
		mv.setViewName("acbook/ac_community");
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(mv,response.getWriter());
		
	}
	
	//글읽기
	@RequestMapping("acbook/selectReadOne.do")
	public ModelAndView selectReadOne(HttpServletRequest request, ModelAndView mv) {
		String accNo = request.getParameter("accNo");
		logger.debug(accNo + "accNo");
		int accCount = service.updateCount(accNo);
		AcCom acc = service.selectReadOne(accNo);
		logger.debug("return db acc data: "+acc);
		mv.addObject("acc",acc);
		mv.setViewName("acbook/ac_comBoardRead");
		return mv;
		
	}
	
	//글수정이동
	@RequestMapping(value="acbook/updateWrite")
	public ModelAndView updateWrite(@RequestParam(value="accNo")String accNo,ModelAndView mv) {
		AcCom acc = service.selectReadOne(accNo);
		mv.addObject("acc",acc);
		logger.debug("글수정: "+acc);
		mv.setViewName("acbook/ac_comBoardWrite");
		return mv;
	}
	
	//댓글등록
	@RequestMapping(value="acbook/ReplyWrite.do",method = RequestMethod.POST)
	public void insertReply(@RequestParam(value="rDate")String rDate,@RequestParam(value="accNo")int accNo,@RequestParam(value="rNo")int rNo,@RequestParam(value="userId")String userId,@RequestParam(value="rContent")String rContent, HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		ModelAndView mv = new ModelAndView();
		AcReply rp = new AcReply(rNo,accNo,userId,rDate,rContent);
		logger.debug("rp"+rp);
		int result=service.insertReply(rp);
		mv.addObject("rp",rp);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(mv,response.getWriter());
	}
	//댓글 가져오기
	@RequestMapping(value="acbook/GetReply.do", method=RequestMethod.POST)
	public void selectReplyList(@RequestParam(value="accNo")String accNo, HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
		List<Model> rpList = service.selectReply(accNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("rpList",rpList);
		logger.debug("rpList"+rpList);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(mv,response.getWriter());
		
	}
	//댓글수정
	@RequestMapping(value="acbook/updateReply.do", method=RequestMethod.POST)
	public String updateReply(AcReply rp){
		logger.debug("댓글수정 번호 컨텐츠"+rp);
		int result = service.updateReply(rp);
		ModelAndView mv = new ModelAndView();
		String msg="";
		if(result>0) {
			msg="수정되었습니다.";
		}
		else {
			msg="등록이 실패했습니다.";
		}
		return "acbook/ac_community";
	}
	
	//댓글삭제
	@RequestMapping("acbook/deleteRP")
	public String deleteReply(@RequestParam(value="rNo")int rNo) {
		logger.debug("rNO"+rNo);
		int result= service.deleteReply(rNo);
		ModelAndView mv = new ModelAndView();
		String msg="";
		if(result>0) {
			msg="삭제되었습니다.";
		}
		else {
			msg="삭제에 실패했습니다.";
		}
		return "acbook/ac_community";
	}
	
	//글 수정하기
	@RequestMapping(value="acbook/updateBoard.do", method = RequestMethod.POST)
	public ModelAndView updateBoard(AcCom acc) {
		ModelAndView mv = new ModelAndView();
		logger.debug("글 수정 Acc: "+acc);
		int result=service.updateAcCom(acc);
		
		String msg="";
		String loc="";

		if(result>0) {
			msg="글이 수정되었습니다.";
			loc="/ac_community.do";
		}
		else {
			msg="수정에 실패했습니다.";
			loc="/ac_community.do";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	@RequestMapping(value="acbook/deleteWrite")
	public ModelAndView deleteBoard(@RequestParam(value="accNo")int accNo) {
		int result1 = service.deleteBoardReply(accNo);
		int result = service.deleteBoard(accNo);
		ModelAndView mv = new ModelAndView();
		String msg="";
		String loc="";

		if(accNo>0) {
			msg="글이 삭제되었습니다.";
			loc="/ac_community.do";
		}
		else {
			msg="삭제에 실패했습니다.";
			loc="/ac_community.do";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	//smartEditor
	@RequestMapping(value = "acbook/insertBoard.do", method = RequestMethod.POST)
	public ModelAndView insertBoard(AcCom acc) {
		ModelAndView mv = new ModelAndView();
		logger.debug("AcCom value: "+acc);
		int result=service.insertAcCom(acc);
		
		String msg="";
		String loc="";

		if(result>0) {
			msg="등록되었습니다.";
			loc="/ac_community.do";
		}
		else {
			msg="등록이 실패했습니다.";
			loc="/ac_community.do";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping(value="/acbook/multiplePhotoUpload.do",method =  RequestMethod.POST)
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "/resources" + File.separator + "acbook/photoUpload" + File.separator;
	         logger.debug("filepath is:  "+filePath);
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// 서버에 파일쓰기 /////////////////
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+"/chemin/resources/acbook/photoUpload/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	 @RequestMapping(value = "acbook/download.do", method = RequestMethod.POST)
	    public void download(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
	        try {
	            String imgData = request.getParameter("imgData");
	            imgData = imgData.replaceAll("data:image/png;base64,", "");
	 
	            byte[] file = Base64.decodeBase64(imgData);
	            ByteArrayInputStream is = new ByteArrayInputStream(file);
	 
	            response.setContentType("image/png");
	            response.setHeader("Content-Disposition", "attachment; filename=report.png");
	 
	            IOUtils.copy(is, response.getOutputStream());
	            response.flushBuffer();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	 
	    }



}
