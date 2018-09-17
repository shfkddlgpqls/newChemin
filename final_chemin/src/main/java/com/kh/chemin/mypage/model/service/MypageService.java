package com.kh.chemin.mypage.model.service;

import java.util.List;
<<<<<<< HEAD

import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface MypageService {
	List<Place> selectPlaceList(String userId);
	List<PlaceAttachment> selectAttachList(int plaNo);
	List<PlaceMenu> selectMenuList(int plaNo);
	int placeDelete(int plaNo);
	int insertReview(Review review);
	List<QnA_board> selectQnaBoardList(int cPage, int numPerPage, String userId);
	int selectQnACount(String userId);
	List<Review> selectReviewList(int cPage, int numPerPage, String userId);
	int selectReviewCount(String userId);
}
=======
import java.util.Map;

import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface MypageService {
	List<Place> selectPlaceList(Map map, int cPage, int numPerPage);
	List<PlaceAttachment> selectAttachList(int plaNo);
	List<PlaceMenu> selectMenuList(int plaNo);
	int placeDelete(int plaNo);
	Place placeSelect(int plaNo);
	int placeUpdate(Place place,List<PlaceMenu> menuList,List<PlaceAttachment> attList);
	int warnMsg(String userId);
	int selectPlaceCount(Map map);

}

>>>>>>> branch 'master' of https://github.com/shfkddlgpqls/newChemin.git
