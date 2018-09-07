package com.kh.chemin.acbook.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.chemin.acbook.model.vo.AcBook;

@Repository
public class AcBookDaoImpl implements AcBookDao {

	@Override
	public int insertIn(SqlSessionTemplate sqlSession, AcBook ac) {
		return sqlSession.insert("ac.insertIn", ac);
	}

	@Override
	public int insertEx(SqlSessionTemplate sqlSession, AcBook ac) {
		return sqlSession.insert("ac.insertEx", ac);
	}

	@Override
	public List<Model> selectEb(SqlSessionTemplate sqlSession) {	
		return sqlSession.selectList("ac.selectEb");
	}
	//페이징
	@Override
	public List<Map<String, String>> selectPageList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		return sqlSession.selectList("ac.selectPageList",null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectTotalCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("ac.selectTotalCount");
	}

	@Override
	public List<Model> selectDailySum(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("ac.selectDailySum");
	}
	
	@Override
	public List<Model> selectSaveList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("ac.selectSaveList");
	}

	@Override
	public List<Model> selectExGrade(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("ac.selectExGrade");
	}

	@Override
	public List<Model> monthlyDispenditure(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("ac.monthlyDispenditure");
	}
	
	
	
	

	
	
	
	
}
