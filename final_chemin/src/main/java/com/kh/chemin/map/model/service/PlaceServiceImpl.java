package com.kh.chemin.map.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chemin.map.model.dao.PlaceDao;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;
import com.kh.chemin.map.model.vo.PlaceReview;

@Service
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	private PlaceDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int placeInsert(Place place, List<PlaceMenu> menuList, List<PlaceAttachment> attList) {
		int result=0;
		int plaNo=0;
		
		result = dao.placeInsert(sqlSession, place);
		plaNo = place.getPlaNo();
		
		if(menuList.size()>0) {
			for(PlaceMenu m : menuList) {
				m.setPlaNo(plaNo);
				result =dao.insertMenu(sqlSession, m);
			}
		}
		if(attList.size()>0) {
			for(PlaceAttachment a : attList) {
				a.setPlaNo(plaNo);
				result =dao.insertAttach(sqlSession, a);
			}
		}
		
		return result;
	}

	@Override
	public List<Place> placeList() {
		List<Place> placeList = dao.placeList(sqlSession);
		return placeList;
	}

	@Override
	public Place placeSelect(int plaNo) {
		Place place = dao.placeSelect(sqlSession,plaNo);
		return place;
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
	public List<Place> placeSearch(Map map) {
		List<Place> plaList = dao.placeSearch(sqlSession, map);
		return plaList;
	}

	@Override
	public List<PlaceReview> placeReviewList(int plaNo, int cPage, int numPerPage) {
		List<PlaceReview> reviewList = dao.placeReviewList(sqlSession, plaNo,cPage,numPerPage);
		return reviewList;
	}

	@Override
	public int placeInsertReview(PlaceReview review) {
		int result = dao.placeInsertReview(sqlSession, review);
		return result;
	}

	@Override
	public Place placeMatch(Map map) {
		Place plaMatch = dao.placeMatch(sqlSession, map);
		return plaMatch;
	}

	@Override
	public int reviewDelete(int reviewNo) {
		int result = dao.reviewDelete(sqlSession, reviewNo);
		return  result;
	}

	@Override
	public int reviewUpdate(PlaceReview review) {
		int result = dao.reviewUpdate(sqlSession, review);
		return result;
	}

	@Override
	public int selectReviewCount(int plaNo) {
		int result = dao.selectReviewCount(sqlSession, plaNo);
		return result;
	}
	
}
