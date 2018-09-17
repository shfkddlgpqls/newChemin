package com.kh.chemin.admin.model.service;

<<<<<<< HEAD
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

	
	
	
=======
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chemin.admin.model.dao.AdminDao;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Place> adminPlaceList(Map map,int cPage, int numPerPage) {
		List<Place> placeList = dao.adminPlaceList(sqlSession,map,cPage,numPerPage);
		return placeList;
	}
	
	@Override
	public int selectPlaceCount(Map map) {
		int totalCount  = dao.selectPlaceCount(sqlSession, map);
		return totalCount;
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

	@Override
	public int selectProductCount() {
		return dao.selectProductCount(sqlSession);
	}

	@Override
	public List<Map<String, Object>> selectProductList(int cPage, int numPerPage) {
		return dao.selectProductList(sqlSession, cPage, numPerPage);
	}

	@Override
	public List<Map<String, String>> selectMallCate() {
		return dao.selectMallCate(sqlSession);
	}


	@Override
	public int selectMemberCount() {
		return dao.selectMemberCount(sqlSession);
	}

	@Override
	public List<Map<String, Object>> selectMemberList(int cPage, int numPerPage) {
		return dao.selectMemberList(sqlSession, cPage, numPerPage);
	}

	@Override
	public List<Map<String, Object>> rpList(String userId) {
		return dao.rpList(sqlSession, userId);
	}

	@Override
	public int reportCount(String userId) {
		return dao.reportCount(sqlSession,userId);
	}

	@Override
	public int adminMemberDelete(String userId) {
		System.out.println("::adminMemberDelete::"+userId);
		return dao.adminMemberDelete(sqlSession,userId);
	}

	@Override
	public List<Map<String, Object>> blackList() {
		return dao.blackList(sqlSession);
	}

	@Override
	public List<Map<String, Object>> searchList(HashMap<String,Object> map) {
		System.out.println("::searchListService::"+map);
		return dao.searchList(sqlSession,map);
	}

>>>>>>> branch 'master' of https://github.com/shfkddlgpqls/newChemin.git

}
