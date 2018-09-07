package com.kh.chemin.acbook.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.chemin.acbook.model.dao.AcBookDao;
import com.kh.chemin.acbook.model.vo.AcBook;

@Service
public class AcBookServiceImpl implements AcBookService {

	
	@Autowired
	AcBookDao dao;
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertIn(AcBook ac) {
		return dao.insertIn(sqlSession, ac);
	}

	@Override
	public int insertEx(AcBook ac) {
		return dao.insertEx(sqlSession, ac);
	}

	@Override
	public List<Model> selectEb() {
		return dao.selectEb(sqlSession);
	}
	
	@Override
	public List<Map<String, String>> selectPageList(int cPage, int numPerPage) {
		return dao.selectPageList(sqlSession, cPage, numPerPage);
	}

	@Override
	public int selectTotalCount() {
		return dao.selectTotalCount(sqlSession);
	}

	@Override
	public List<Model> selectDailySum() {
		return dao.selectDailySum(sqlSession);
	}
	
	@Override
	public List<Model> selectSaveList() {
		return dao.selectSaveList(sqlSession);
	}

	@Override
	public List<Model> selectExGrade() {
		return dao.selectExGrade(sqlSession);
	}

	@Override
	public List<Model> monthlyDispenditure() {
		return dao.monthlyDispenditure(sqlSession);
	}
	
	
	
}
