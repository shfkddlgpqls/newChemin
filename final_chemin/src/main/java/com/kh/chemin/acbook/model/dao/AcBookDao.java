package com.kh.chemin.acbook.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.ui.Model;

import com.kh.chemin.acbook.model.vo.AcBook;
import com.kh.chemin.acbook.model.vo.AcCom;
import com.kh.chemin.acbook.model.vo.AcReply;
import com.kh.chemin.acbook.model.vo.PolaData;

public interface AcBookDao {
	
	int insertIn(SqlSessionTemplate sqlSession, AcBook ac);
	
	int insertEx(SqlSessionTemplate sqlSession, AcBook ac);

	List<Model> selectEb(SqlSessionTemplate sqlSession, String userId);

	List<Map<String, String>> selectPageList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String userId);

	int selectTotalCount(SqlSessionTemplate sqlSession);

	List<Model> selectDailySum(SqlSessionTemplate sqlSession, String userId);

	List<Model> selectSaveList(SqlSessionTemplate sqlSession);

	List<Model> selectExGrade(SqlSessionTemplate sqlSession, String userId);

	List<Model> monthlyExpenditure(SqlSessionTemplate sqlSession, String userId);

	Map<String, Object> acSelectOne(SqlSessionTemplate sqlSession, int acNo);

	int insertAcCom(SqlSessionTemplate sqlSession, AcCom acc);

	AcCom selectReadOne(SqlSessionTemplate sqlSession, String accNo);

	 List<Model> selectinExCost(SqlSessionTemplate sqlSession, String userId);

	String selectLastDay(SqlSessionTemplate sqlSession);

	List<Map<String, String>> acComList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String userId);

	List<Model> monthlySumAvg(SqlSessionTemplate sqlSession, String userId);

	List<Model> preMonthlySumAvg(SqlSessionTemplate sqlSession, String userId);

	List<Model> prePreMonthlySumAvg(SqlSessionTemplate sqlSession, String userId);

	List<Model> preMonthlyData(SqlSessionTemplate sqlSession, String userId);

	List<Model> prePreMonthlyData(SqlSessionTemplate sqlSession, String userId);

	List<Model> preSelectDailySum(SqlSessionTemplate sqlSession, String userId);

	List<Model> prePreSelectDailySum(SqlSessionTemplate sqlSession, String userId);

	int insertReply(SqlSessionTemplate sqlSession,AcReply rp);

	List<Model> selectReply(SqlSessionTemplate sqlSession, String accNo);

	int updateReply(SqlSessionTemplate sqlSession, AcReply rp);

	int deleteReply(SqlSessionTemplate sqlSession, int rNo);

	int updateAcCom(SqlSessionTemplate sqlSession, AcCom acc);

	int deleteBoard(SqlSessionTemplate sqlSession, int accNo);

	int deleteBoardReply(SqlSessionTemplate sqlSession, int accNo);

	int updateAcOne(SqlSessionTemplate sqlSession, AcBook ac);

	int deleteAcOne(SqlSessionTemplate sqlSession, AcBook ac);

	List<PolaData> selectPolaData(SqlSessionTemplate sqlSession, String userId);

	List<Model> selectMemoLank(SqlSessionTemplate sqlSession, String userId);

	List<Model> thisMonthlyData(SqlSessionTemplate sqlSession, String userId);

	List<Model> monthlyMemoLank(SqlSessionTemplate sqlSession, String userId);

	List<Model> selectMonTime(SqlSessionTemplate sqlSession, String userId);

	List<Model> selectMuchDay(SqlSessionTemplate sqlSession, String userId);

	List<Model> selectSavingCost(SqlSessionTemplate sqlSession, String userId);

	int updateCount(SqlSessionTemplate sqlSession, String accNo);
	
	
}