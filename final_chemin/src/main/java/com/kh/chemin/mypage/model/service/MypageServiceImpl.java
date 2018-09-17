package com.kh.chemin.mypage.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;
import com.kh.chemin.mypage.model.dao.MypageDao;

@Service
public class MypageServiceImpl implements MypageService 
{
	@Autowired
	private MypageDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Place> selectPlaceList(String userId) {
		List<Place> list = dao.selectPlaceList(sqlSession, userId);
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
	
	
	
	
	
	

}
