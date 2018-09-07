package com.kh.chemin.acbook.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.chemin.acbook.common.Page;
import com.kh.chemin.acbook.model.service.AcBookService;
import com.kh.chemin.acbook.model.vo.AcBook;



@Controller
public class AcBookController extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5563158563639817L;
	@Autowired
	AcBookService service;
	
	@RequestMapping("ac_main.do")
	public String acbook() {
		return "acbook/ac_main";		
	}
	
	@RequestMapping("ac_inputIn.do")
	public String ac_inputIn() {
		return "acbook/ac_inputIn";
	}

	@RequestMapping("ac_dsepIn.do")
	public String ac_despIn() {
		return "acbook/ac_despIn";
	}

	@RequestMapping("ac_calendar.do")
	public String ac_calendar() {
		return "acbook/ac_calendar";
	}
	
	@RequestMapping("/ac_monthlyData.do")
	public String ac_monthlyData() {
		return "acbook/monthlyData";
	}
	@RequestMapping("/ac_savingChart.do")
	public String ac_savingChart() {
		return "acbook/ac_savingChart";
	}

	@RequestMapping("/ac_community.do")
	public String ac_community() {
		return "acbook/ac_community";
	}



	//ac_inputIn.jsp: 가계부 수입 입력
	@RequestMapping("acbook/insertIncome.do")
	public String insertIncome(AcBook ac) {
		int result = service.insertIn(ac);
		System.out.println(ac);
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="가계부에 수입이 등록되었습니다!";
		}
		else {
			msg="등록 실패!";
		}
		return "acbook/ac_calendar";
		
	}
	
	
	//ac_despIn.jsp : 가계부 지출 등록
	@RequestMapping("acbook/insertExpenditure.do")
	public String insertExpenditure(AcBook ac){
		
		int result= service.insertEx(ac);
		System.out.println(ac);
		String msg="";
		String loc="";
		
		//mem_id(project 연결되면 memberLoggedIn아이디와 일치하는 회원 아이디 가져오는것으로 변경)
		if(result>0) {
			msg="가계부에 지출이 등록되었습니다!";
		}
		else {
			msg="등록 실패!";
		}
		return "acbook/ac_calendar";
		
	}
	
	//ac_calendar.jsp: 달력내 수입 지출 출력
	@RequestMapping("/ajax/test.do")
	public void selectEvent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		List<Model> list = service.selectEb();
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
	}
	
	//ac_calendar.jsp: 가계부 상세정보 출력리스트
	@RequestMapping(value="acbook/acSelectPageList.do")
	public void selectPageList(@RequestParam(value="cPage", required=false, defaultValue ="1")int cPage, HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException{
		System.out.println(cPage);
		ModelAndView mv = new ModelAndView();
		int numPerPage=5;
		List<Map<String,String>>list = service.selectPageList(cPage,numPerPage);
		int totalCounts= service.selectTotalCount();
		
		mv.addObject("list",list);
		mv.addObject("totalCounts",totalCounts);
		mv.addObject("pageBar",Page.getPageCal(cPage, numPerPage, totalCounts, "acbook/acSelectPageList.do"));
		mv.setViewName("acbook/ac_calendar");
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(mv,response.getWriter());
		
	}
	
	@RequestMapping("/ajax/selectDailySum")
	public void selectDailySum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		List<Model>mlist = service.selectDailySum();
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(mlist, response.getWriter());
	}
	//savingchart.jsp: 월별 저축 현황
	@RequestMapping("/ajax/selectSaving.do")
	public void selectSaving(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
		List<Model> selectSaveList = service.selectSaveList();
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(selectSaveList, response.getWriter());
	
	}
	
	@RequestMapping("/ajax/selectExGrade")
	public void selectExGrade(HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException{
		List<Model>selectExGrade = service.selectExGrade();
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(selectExGrade, response.getWriter());
	}
	
	public String selectLank() {
		
		return "";
	}
	
	@RequestMapping("/ajax/monthlyDispenditure")
	public void monthlyDispenditure(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Model> monthlyDispenditure= service.monthlyDispenditure();
		response.setContentType(("application/json;charset=UTF-8"));
		System.out.println(monthlyDispenditure);
		new Gson().toJson(monthlyDispenditure, response.getWriter());
		
	};
	
/*	//ac_calendar.jsp: 가계부 상세정보 출력리스트
		@RequestMapping("/acbook/acSelectList.do")
		public void selectAcList(HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException{
			List<Model> list = service.selectList();
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(list, response.getWriter());
			
		}*/
		
	
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
