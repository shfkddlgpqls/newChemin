package com.kh.chemin.acbook.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.ui.Model;

import com.kh.chemin.acbook.model.vo.AcBook;

public interface AcBookDao {
	
	int insertIn(SqlSessionTemplate sqlSession, AcBook ac);
	
	int insertEx(SqlSessionTemplate sqlSession, AcBook ac);

	List<Model> selectEb(SqlSessionTemplate sqlSession);

	List<Map<String, String>> selectPageList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);

	int selectTotalCount(SqlSessionTemplate sqlSession);

	List<Model> selectDailySum(SqlSessionTemplate sqlSession);

	List<Model> selectSaveList(SqlSessionTemplate sqlSession);

	List<Model> selectExGrade(SqlSessionTemplate sqlSession);

	List<Model> monthlyDispenditure(SqlSessionTemplate sqlSession);
	
	
}
