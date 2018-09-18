package com.kh.chemin.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface MypageService {




	int insertReview(Review review);
	List<QnA_board> selectQnaBoardList(int cPage, int numPerPage, String userId);
	int selectQnACount(String userId);
	List<Review> selectReviewList(int cPage, int numPerPage, String userId);
	int selectReviewCount(String userId);
	
	List<Place> selectPlaceList(Map map, int cPage, int numPerPage);
	List<PlaceAttachment> selectAttachList(int plaNo);
	List<PlaceMenu> selectMenuList(int plaNo);
	int placeDelete(int plaNo);
	Place placeSelect(int plaNo);
	int placeUpdate(Place place,List<PlaceMenu> menuList,List<PlaceAttachment> attList);
	int selectPlaceCount(Map map);
}





