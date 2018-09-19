package com.kh.chemin.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;
import com.kh.chemin.member.model.vo.Member;

public interface MypageService {


	List<PlaceAttachment> selectAttachList(int plaNo);
	List<PlaceMenu> selectMenuList(int plaNo);
	int placeDelete(int plaNo);	
	int insertReview(Review review);
	List<QnA_board> selectQnaBoardList(int cPage, int numPerPage, String userId);
	int selectQnACount(String userId);
	List<Review> selectReviewList(int cPage, int numPerPage, String userId);
	int selectReviewCount(String userId);
	int warnMsg(String userId);
	

	List<Place> selectPlaceList(Map map, int cPage, int numPerPage);
	List<PlaceAttachment> selectAttachList(int plaNo);
	List<PlaceMenu> selectMenuList(int plaNo);
	int placeDelete(int plaNo);
	Place placeSelect(int plaNo);
	int placeUpdate(Place place,List<PlaceMenu> menuList,List<PlaceAttachment> attList);

	List<Map<String, Object>> selectOrderList(String userId, int cPage, int numPerPage);
	List<Map<String, Object>> selectOrderData(String userId);
	int selectTotalCount(String userId);
	List<Map<String, Object>> selectWishList(String userId);

	int selectPlaceCount(Map map);

//	=======================주리가 한 부분  시작=======================	
	int insertReview(Review review);
	List<QnA_board> selectQnaBoardList(int cPage, int numPerPage, String userId);
	int selectQnACount(String userId);
	List<Review> selectReviewList(int cPage, int numPerPage, String userId);
	int selectReviewCount(String userId);
	int UpdateQna(Map<String, String> map);
	int myQnaDel(String modal_qno);
	int insertReviewEdit(Review review);
	int myReviewDel(String modal_rno);
	
//	=======================주리가 한 부분  끝=======================	

	Map<String, Object> memberList(String userId);

}





