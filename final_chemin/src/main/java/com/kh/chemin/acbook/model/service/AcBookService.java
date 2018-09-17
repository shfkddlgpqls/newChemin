package com.kh.chemin.acbook.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.kh.chemin.acbook.model.vo.AcBook;

public interface AcBookService {
	//수입등록
	int insertIn(AcBook ac);
	//지출등록
	int insertEx(AcBook ac);
	//calendar.jsp: 달력 내 월별 수입지출현황
	List<Model> selectEb();
	
	//페이징
	List<Map<String, String>> selectPageList(int cPage, int numPerPage);
	
	int selectTotalCount();
	//일일지출 불러오기
	List<Model> selectDailySum();
	
	//월별 저축현황
	List<Model> selectSaveList();
	//소비등급
	List<Model> selectExGrade();
	
	List<Model> monthlyDispenditure();
	
	
	//타입별 소비-지출 패턴
	//List<Model> selectPatternList();
	//calendar.jsp: 수입 지출  출력, 
		//List<Model> selectList();	
	
	/*페이징처리
	List<Map<String, String>> acSelectList(int cPage, int numPerPage);*/
	
}
