package com.kh.chemin.acbook.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.chemin.acbook.model.vo.AcBook;
import com.kh.chemin.acbook.model.vo.AcCom;
import com.kh.chemin.acbook.model.vo.AcReply;
import com.kh.chemin.acbook.model.vo.PolaData;

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
	public int insertReply(SqlSessionTemplate sqlSession, AcReply rp) {
		return sqlSession.insert("ac.insertReply",rp);
	}

	@Override
	public List<Model> selectReply(SqlSessionTemplate sqlSession, String accNo) {
		return sqlSession.selectList("ac.selectReply",accNo);
	}

	@Override
	public int updateReply(SqlSessionTemplate sqlSession, AcReply rp) {
		return sqlSession.update("ac.updateReply",rp);
	}

	@Override
	public int deleteReply(SqlSessionTemplate sqlSession, int rNo) {
		return sqlSession.delete("ac.deleteReply",rNo);
	}

	@Override
	public int updateAcCom(SqlSessionTemplate sqlSession, AcCom acc) {
		return sqlSession.update("ac.updateAcCom",acc);
	}

	@Override
	public int deleteBoard(SqlSessionTemplate sqlSession, int accNo) {
		return sqlSession.delete("ac.deleteBoard",accNo);
	}

	@Override
	public int deleteBoardReply(SqlSessionTemplate sqlSession, int accNo) {
		return sqlSession.delete("ac.deleteBoardReply", accNo);
	}

	@Override
	public int updateAcOne(SqlSessionTemplate sqlSession, AcBook ac) {
		return sqlSession.update("ac.updateAcOne",ac);
	}

	@Override
	public int deleteAcOne(SqlSessionTemplate sqlSession, AcBook ac) {
		return sqlSession.delete("ac.deleteAcOne",ac);
	}

	@Override
	public List<PolaData> selectPolaData(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.selectPolaData",userId);
	}

	@Override
	public List<Model> selectMemoLank(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.selectMemoLank",userId);
	}

	@Override
	public List<Model> thisMonthlyData(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.thisMonthlyData",userId);
	}

	@Override
	public List<Model> monthlyMemoLank(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.monthlyMemoLank",userId);
	}

	@Override
	public List<Model> selectMonTime(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.selectMonTime",userId);
	}

	@Override
	public List<Model> selectMuchDay(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.selectMuchDay",userId);
	}

	@Override
	public List<Model> selectSavingCost(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("ac.selectSavingCost", userId);
	}

	@Override
	public int updateCount(SqlSessionTemplate sqlSession, String accNo) {
		return sqlSession.update("ac.updateCount", accNo);
	}
	
	
	
	
	
	
}