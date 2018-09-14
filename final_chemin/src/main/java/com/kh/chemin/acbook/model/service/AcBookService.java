package com.kh.chemin.acbook.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.kh.chemin.acbook.model.vo.AcBook;
import com.kh.chemin.acbook.model.vo.AcCom;

public interface AcBookService {
	//수입등록
	int insertIn(AcBook ac);
	//지출등록
	int insertEx(AcBook ac);
	//calendar.jsp: 달력 내 월별 수입지출현황
	List<Model> selectEb(String userId);
	
	//페이징
	List<Map<String, String>> selectPageList(int cPage, int numPerPage, String userId);
	
	int selectTotalCount();
	//일일지출 불러오기
	List<Model> selectDailySum(String userId);
	
	//월별 저축현황
	List<Model> selectSaveList();
	//소비등급
	List<Model> selectExGrade(String userId);
	//카테고리별 지출
	List<Model> monthlyExpenditure(String userId);
	//ac_calendar.jsp: search list for detailView
	Map<String, Object> acSelectOne(int acNo);
	//insert community write data
	int insertAcCom(AcCom acc);
	//select readONe
	AcCom selectReadOne(String accNo);
	//acMain.jsp: selectEachCost
	 List<Model> selectinExCost(String userId);
	//acMain.jsp: lastDay
	String selectLastDay();
	//게시판 리스트
	List<Map<String, String>> acComList(int cPage, int numPerPage, String userId);
	//monthlyData.jsp
	List<Model> monthlySumAvg(String userId);
	List<Model> preMonthlySumAvg(String userId);
	List<Model> prePreMonthlySumAvg(String userId);
	List<Model> preMonthlyData(String userId);
	List<Model> prePreMonthlyData(String userId);
	List<Model> preSelectDailySum(String userId);
	List<Model> prePreSelectDailySum(String userId);
	
	
	
	//타입별 소비-지출 패턴
	//List<Model> selectPatternList();
	//calendar.jsp: 수입 지출  출력, 
		//List<Model> selectList();	
	
	/*페이징처리
	List<Map<String, String>> acSelectList(int cPage, int numPerPage);*/
	
}