package com.kh.chemin.acbook.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
		mv.addObject("list", list);
		mv.addObject("lastDay",lastDay);
		logger.debug("this month value is: "+lastDay+list);
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
		mv.addObject("list1",list1);
		mv.addObject("list2",list2);
		mv.addObject("list3",list3);
		mv.setViewName("acbook/monthlyData");
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
		List<Model> monthlyExpenditure= service.monthlyExpenditure(userId);
		List<Model> preMonthlyData= service.preMonthlyData(userId);
		List<Model> prePreMonthlyData= service.prePreMonthlyData(userId);
		mv.addObject("monthlySumAvg",monthlySumAvg);
		mv.addObject("preMonthlySumAvg",preMonthlySumAvg);
		mv.addObject("prePreMonthlySumAvg",prePreMonthlySumAvg);		
		mv.addObject("monthlyExpenditure",monthlyExpenditure);
		mv.addObject("preMonthlyData",preMonthlyData);
		mv.addObject("prePreMonthlyData",prePreMonthlyData);				
		logger.debug("monthlySumAvg: "+ monthlySumAvg);
		logger.debug("preMonthlySumAvg: "+ preMonthlySumAvg);
		logger.debug("prePreMonthlySumAvg: "+ prePreMonthlySumAvg);
		logger.debug("monthlyExpenditure: "+ monthlyExpenditure);
		logger.debug("preMonthlyData: "+preMonthlyData);
		logger.debug("prePreMonthlyData: "+prePreMonthlyData);	
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
		AcCom acc = service.selectReadOne(accNo);
		logger.debug("return db acc data: "+acc);
		mv.addObject("acc",acc);
		mv.setViewName("acbook/ac_comBoardRead");
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

	/*//ac_savingChart.jsp: 수입 지출 패턴
	@RequestMapping("/ajax/selectInExPattern")
	public void selectInExPattern(HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException{
		List<Model> list = service.selectPatternList();
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
	}
	
	
	//회원정보 검색
	@RequestMapping("acbook/acSelectOne.do")
	public void acSelectOne(String ac_date, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(ac_date);
		List<Model> list = service.acSelectList(ac_date);
		response.setContentType("application/json;charset=UTF-8");
		new Gson().toJson(list,response.getWriter());
	}
	*/

}
