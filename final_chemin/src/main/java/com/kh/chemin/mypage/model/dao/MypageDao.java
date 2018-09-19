package com.kh.chemin.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;
import com.kh.chemin.member.model.vo.Member;

public interface MypageDao {
	List<Place> selectPlaceList(SqlSessionTemplate sqlSession, Map map, int cPage, int numPerPage);
	List<PlaceAttachment> selectAttachList(SqlSessionTemplate sqlSession,int plaNo);
	List<PlaceMenu> selectMenuList(SqlSessionTemplate sqlSession,int plaNo);
	int placeDelete(SqlSessionTemplate sqlSession, int plaNo);
	Place placeSelect(SqlSessionTemplate sqlSession, int plaNo);
	int placeUpdate(SqlSessionTemplate sqlSession, Place place);
	int insertMenu(SqlSessionTemplate sqlSession, PlaceMenu m);
	int insertAttach(SqlSessionTemplate sqlSession, PlaceAttachment a);
	int removeMenu(SqlSessionTemplate sqlSession, int plaNo);
	int removeAttach(SqlSessionTemplate sqlSession, int plaNo);
	int warnMsg(SqlSessionTemplate sqlSession, String userid);

	List<Map<String, Object>> selectOrderList(SqlSessionTemplate sqlSession, String userId, int cPage, int numPerPage);
	List<Map<String, Object>> selectOrderData(SqlSessionTemplate sqlSession, String userId);
	int selectTotalCount(SqlSessionTemplate sqlSession, String userId);
	List<Map<String, Object>> selectWishList(SqlSessionTemplate sqlSession, String userId);

	int selectPlaceCount(SqlSessionTemplate sqlSession, Map map);
	
	int insertReview(SqlSessionTemplate sqlSession, Review review);
	List<QnA_board> selectQnaBoardList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String userId);
	int selectQnACount(SqlSessionTemplate sqlSession, String userId);
	List<Review> selectReviewList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String userId);
	int selectReviewCount(SqlSessionTemplate sqlSession, String userId);
	Map<String, Object> memberList(SqlSessionTemplate sqlSession, String userId);

}