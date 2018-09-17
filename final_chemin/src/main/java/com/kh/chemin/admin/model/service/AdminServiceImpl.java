package com.kh.chemin.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chemin.admin.model.dao.AdminDao;
import com.kh.chemin.community.controller.CommunityController;
import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

@Service
public class AdminServiceImpl implements AdminService {
	
	private Logger logger=LoggerFactory.getLogger(AdminServiceImpl.class);

	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Place> adminPlaceList() {
		List<Place> placeList = dao.adminPlaceList(sqlSession);
		return placeList;
	}

	@Override
	public List<PlaceAttachment> selectAttachList(int plaNo) {
		List<PlaceAttachment> attachList = dao.selectAttachList(sqlSession,plaNo);
		return attachList;
	}

	@Override
	public List<PlaceMenu> selectMenuList(int plaNo) {
		List<PlaceMenu> menuList = dao.selectMenuList(sqlSession,plaNo);
		return menuList;
	}

	@Override
	public int placeDelete(int plaNo) {
		int result = dao.placeDelete(sqlSession,plaNo);
		return result;
	}

	@Override
	public int plaStatusChange(Map map) {
		int result = dao.plaStatusChange(sqlSession,map);
		return result;
	}

	@Override
	public int adminReMsg(Map map) {
		int result = dao.adminReMsg(sqlSession, map);
		return result;
	}

	//문의게시판 총 갯수 출력
	@Override
	public int selectQnACount() 
	{
		return dao.selectQnACount(sqlSession);
	}
	

	@Override
	public List<QnA_board> selectQnaBoardList(int cPage, int numPerPage) 
	{
		return dao.selectQnaBoardList(sqlSession,cPage,numPerPage);
	}

	
	//관리자 글 답변
	@Override
	public int insertReply(Map<String, Object> map) 
	{
		logger.debug("서비스 map요"+map);
		return dao.insertReply(sqlSession, map);
		
	}

	@Override
	public int updateState(String board_num) 
	{
		return dao.updateState(sqlSession,board_num);
	}

	@Override
	public List<Review> selectReviewList(int cPage, int numPerPage) 
	{
		return dao.selectReviewList(sqlSession,cPage,numPerPage);
	}

	@Override
	public int selectReviewCount() 
	{
		return dao.selectReviewCount(sqlSession);
	}

	
	
	

}
