package com.kh.chemin.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface MypageDao {
	List<Place> selectPlaceList(SqlSessionTemplate sqlSession, String userId);
	List<PlaceAttachment> selectAttachList(SqlSessionTemplate sqlSession,int plaNo);
	List<PlaceMenu> selectMenuList(SqlSessionTemplate sqlSession,int plaNo);
	int placeDelete(SqlSessionTemplate sqlSession, int plaNo);
	int insertReview(SqlSessionTemplate sqlSession, Review review);
	List<QnA_board> selectQnaBoardList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String userId);
	int selectQnACount(SqlSessionTemplate sqlSession, String userId);
	List<Review> selectReviewList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String userId);
	int selectReviewCount(SqlSessionTemplate sqlSession, String userId);
}
