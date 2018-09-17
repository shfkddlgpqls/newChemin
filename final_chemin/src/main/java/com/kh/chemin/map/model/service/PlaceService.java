package com.kh.chemin.map.model.service;

import java.util.List;
import java.util.Map;

import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;
import com.kh.chemin.map.model.vo.PlaceReview;

public interface PlaceService {
	int placeInsert(Place place,List<PlaceMenu> menuList,List<PlaceAttachment> attList);
	List<Place> placeList();
	Place placeSelect(int plaNo);
	List<PlaceAttachment> selectAttachList(int plaNo);
	List<PlaceMenu> selectMenuList(int plaNo);
	List<Place> placeSearch(Map map);
	List<PlaceReview> placeReviewList(int plaNo,int cPage, int numPerPage);
	int selectReviewCount(int plaNo);
	int placeInsertReview(PlaceReview review);
	Place placeMatch(Map map);
	int reviewDelete(int reviewNo);
	int reviewUpdate(PlaceReview review);
}
