package com.kh.chemin.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;
import com.kh.chemin.member.model.vo.Member;
import com.kh.chemin.mypage.model.dao.MypageDao;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Place> selectPlaceList(Map map, int cPage, int numPerPage) {
		List<Place> list = dao.selectPlaceList(sqlSession, map,cPage,numPerPage);
		return list;
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
		int result = dao.placeDelete(sqlSession, plaNo);
		return result;
	}

	@Override
	public Place placeSelect(int plaNo) {
		Place place = dao.placeSelect(sqlSession,plaNo);
		return place;
	}

	@Override
	public int placeUpdate(Place place, List<PlaceMenu> menuList, List<PlaceAttachment> attList) {
		int result=0;
		int plaNo=0;
		
		result = dao.placeUpdate(sqlSession, place);
		plaNo = place.getPlaNo();
		
		
		if(menuList.size()>0) {
			result = dao.removeMenu(sqlSession,plaNo);
			if(result>0) {
			for(PlaceMenu m : menuList) {
				m.setPlaNo(plaNo);
				result =dao.insertMenu(sqlSession, m);
				}
			}
		}
		if(attList.size()>0) {
			result = dao.removeAttach(sqlSession,plaNo);
			if(result>0) {
			for(PlaceAttachment a : attList) {
				a.setPlaNo(plaNo);
				result =dao.insertAttach(sqlSession, a);
			 }
			}
		}
		
		return result;
	}


	@Override
	public int warnMsg(String userId) {
		System.out.println("::warnMsgService::"+userId);
		return dao.warnMsg(sqlSession,userId);
	}

	@Override
	public int selectPlaceCount(Map map) {
		int totalCount = dao.selectPlaceCount(sqlSession, map);
		return totalCount;
	}
	
	//리뷰 글쓰기
		@Override
		public int insertReview(Review review) 
		{
			int result = dao.insertReview(sqlSession,review);
			
			return result;
		}

		@Override
		public List<QnA_board> selectQnaBoardList(int cPage, int numPerPage, String userId) 
		{
			return dao.selectQnaBoardList(sqlSession,cPage,numPerPage,userId); 
		}

	@Override
	public List<Map<String, Object>> selectOrderList(String userId, int cPage, int numPerPage) {
		return dao.selectOrderList(sqlSession, userId, cPage, numPerPage);
	}

	@Override
	public List<Map<String, Object>> selectOrderData(String userId) {
		return dao.selectOrderData(sqlSession, userId);
	}

	@Override
	public int selectTotalCount(String userId) {
		return dao.selectTotalCount(sqlSession, userId);
	}

	@Override
	public List<Map<String, Object>> selectWishList(String userId) {
		return dao.selectWishList(sqlSession, userId);
	}

		@Override
		public int selectQnACount(String userId) 
		{
			return dao.selectQnACount(sqlSession,userId);
		}

		@Override
		public List<Review> selectReviewList(int cPage, int numPerPage, String userId) 
		{
			return dao.selectReviewList(sqlSession,cPage,numPerPage,userId); 
		}

		@Override
		public int selectReviewCount(String userId) 
		{
			return dao.selectReviewCount(sqlSession,userId);
		}

		@Override
		public Map<String, Object> memberList(String userId) {
			return dao.memberList(sqlSession,userId);
		}	

}

