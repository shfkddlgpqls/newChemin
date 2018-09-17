package com.kh.chemin.admin.model.service;

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


}
