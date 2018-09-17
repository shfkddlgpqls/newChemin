package com.kh.chemin.acbook.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.chemin.acbook.model.vo.AcBook;
import com.kh.chemin.acbook.model.vo.AcCom;
import com.kh.chemin.acbook.model.vo.Reply;

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
	public List<Model> selectEb(SqlSessionTemplate sqlSession, String userId) {	
		return sqlSession.selectList("ac.selectEb", userId);
	}
	//페이징
	@Override
	public List<Map<String, String>> selectPageList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String userId) {
		return sqlSession.selectList("ac.selectPageList",userId,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectTotalCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("ac.selectTotalCount");
	}

	@Override
	public List<Model> selectDailySum(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.selectDailySum", userId);
	}
	
	@Override
	public List<Model> selectSaveList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("ac.selectSaveList");
	}

	@Override
	public List<Model> selectExGrade(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.selectExGrade",userId);
	}

	@Override
	public List<Model> monthlyExpenditure(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.monthlyExpenditure",userId);
	}

	@Override
	public Map<String, Object> acSelectOne(SqlSessionTemplate sqlSession, int acNo) {
		return sqlSession.selectOne("ac.acSelectOne",acNo);
	}

	@Override
	public int insertAcCom(SqlSessionTemplate sqlSession, AcCom acc) {
		return sqlSession.insert("ac.insertAcCom",acc);
	}

	@Override
	public AcCom selectReadOne(SqlSessionTemplate sqlSession, String accNo) {
		return sqlSession.selectOne("ac.selectReadOne",accNo);
	}

	@Override
	public List<Model> selectinExCost(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.selectinExCost",userId);
	}

	@Override
	public String selectLastDay(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("ac.selectLastDay");
	}

	@Override
	public List<Map<String, String>> acComList(SqlSessionTemplate sqlSession, int cPage, int numPerPage,String userId) {
		return sqlSession.selectList("ac.acComList",userId,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public List<Model> monthlySumAvg(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.monthlySumAvg",userId);
	}

	@Override
	public List<Model> preMonthlySumAvg(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.preMonthlySumAvg",userId);
	}

	@Override
	public List<Model> prePreMonthlySumAvg(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.prePreMonthlySumAvg",userId);
	}

	@Override
	public List<Model> preMonthlyData(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.preMonthlyData",userId);
	}

	@Override
	public List<Model> prePreMonthlyData(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.prePreMonthlyData",userId);
	}

	@Override
	public List<Model> preSelectDailySum(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.preSelectDailySum",userId);
	}

	@Override
	public List<Model> prePreSelectDailySum(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.prePreSelectDailySum",userId);
	}

	@Override
	public int insertReply(SqlSessionTemplate sqlSession, Reply rp) {
		return sqlSession.insert("ac.insertReply",rp);
	}

	@Override
	public List<Model> selectReply(SqlSessionTemplate sqlSession, String accNo) {
		return sqlSession.selectList("ac.selectReply",accNo);
	}
	
	
	
	
}