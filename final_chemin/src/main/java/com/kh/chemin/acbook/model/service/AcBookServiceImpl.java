package com.kh.chemin.acbook.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.chemin.acbook.model.dao.AcBookDao;
import com.kh.chemin.acbook.model.vo.AcBook;
import com.kh.chemin.acbook.model.vo.AcCom;
import com.kh.chemin.acbook.model.vo.AcReply;
import com.kh.chemin.acbook.model.vo.PolaData;

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
	public List<Model> selectEb(String userId) {
		return dao.selectEb(sqlSession, userId);
	}
	
	@Override
	public List<Map<String, String>> selectPageList(int cPage, int numPerPage, String userId) {
		return dao.selectPageList(sqlSession, cPage, numPerPage, userId);
	}

	@Override
	public int selectTotalCount() {
		return dao.selectTotalCount(sqlSession);
	}

	@Override
	public List<Model> selectDailySum(String userId) {
		return dao.selectDailySum(sqlSession, userId);
	}
	
	@Override
	public List<Model> selectSaveList() {
		return dao.selectSaveList(sqlSession);
	}

	@Override
	public List<Model> selectExGrade(String userId) {
		return dao.selectExGrade(sqlSession, userId);
	}

	@Override
	public List<Model> monthlyExpenditure(String userId) {
		return dao.monthlyExpenditure(sqlSession, userId);
	}

	@Override
	public Map<String, Object> acSelectOne(int acNo) {
		return dao.acSelectOne(sqlSession,acNo);
	}

	@Override
	public int insertAcCom(AcCom acc) {
		return dao.insertAcCom(sqlSession, acc);
	}

	@Override
	public AcCom selectReadOne(String accNo) {
		return dao.selectReadOne(sqlSession, accNo);
	}

	@Override
	public  List<Model> selectinExCost(String userId) {
		return dao.selectinExCost(sqlSession, userId);
	}

	@Override
	public String selectLastDay() {
		return dao.selectLastDay(sqlSession);
	}

	@Override
	public List<Map<String, String>> acComList(int cPage, int numPerPage, String userId) {
		return dao.acComList(sqlSession,cPage,numPerPage,userId);
	}

	@Override
	public List<Model> monthlySumAvg(String userId) {
		return dao.monthlySumAvg(sqlSession, userId);
	}

	@Override
	public List<Model> preMonthlySumAvg(String userId) {
		return dao.preMonthlySumAvg(sqlSession, userId);
	}

	@Override
	public List<Model> prePreMonthlySumAvg(String userId) {
		return dao.prePreMonthlySumAvg(sqlSession, userId);
	}

	@Override
	public List<Model> preMonthlyData(String userId) {
		return dao.preMonthlyData(sqlSession, userId);
	}

	@Override
	public List<Model> prePreMonthlyData(String userId) {
		return dao.prePreMonthlyData(sqlSession, userId);
	}

	@Override
	public List<Model> preSelectDailySum(String userId) {
		return dao.preSelectDailySum(sqlSession, userId);
	}

	@Override
	public List<Model> prePreSelectDailySum(String userId) {
		return dao.prePreSelectDailySum(sqlSession, userId);
	}

	@Override
	public int insertReply(AcReply rp) {
		return dao.insertReply(sqlSession,rp);
	}

	@Override
	public List<Model> selectReply(String accNo) {
		return dao.selectReply(sqlSession, accNo);
	}

	@Override
	public int updateReply(AcReply rp) {
		return dao.updateReply(sqlSession,rp);
	}

	@Override
	public int deleteReply(int rNo) {
		return dao.deleteReply(sqlSession,rNo);
	}

	@Override
	public int updateAcCom(AcCom acc) {
		return dao.updateAcCom(sqlSession, acc);
	}

	@Override
	public int deleteBoard(int accNo) {
		return dao.deleteBoard(sqlSession, accNo);
	}

	@Override
	public int deleteBoardReply(int accNo) {
		return dao.deleteBoardReply(sqlSession,accNo);
	}

	@Override
	public int updateAcOne(AcBook ac) {
		return dao.updateAcOne(sqlSession, ac);
	}

	@Override
	public int deleteAcOne(AcBook ac) {
		return dao.deleteAcOne(sqlSession, ac);
	}

	@Override
	public List<PolaData> selectPolaData(String userId) {
		return dao.selectPolaData(sqlSession, userId);
	}

	@Override
	public List<Model> selectMemoLank(String userId) {
		return dao.selectMemoLank(sqlSession,userId);
	}

	@Override
	public List<Model> thisMonthlyData(String userId) {
		return dao.thisMonthlyData(sqlSession,userId);
	}

	@Override
	public List<Model> monthlyMemoLank(String userId) {
		return dao.monthlyMemoLank(sqlSession,userId);
	}

	@Override
	public List<Model> selectMonTime(String userId) {
		return dao.selectMonTime(sqlSession,userId);
	}

	@Override
	public List<Model> selectMuchDay(String userId) {
		return dao.selectMuchDay(sqlSession,userId);
	}

	@Override
	public List<Model> selectSavingCost(String userId) {
		return dao.selectSavingCost(sqlSession,userId);
	}

	@Override
	public int updateCount(String accNo) {
		return dao.updateCount(sqlSession,accNo);
	}


	
	
	
	
}
