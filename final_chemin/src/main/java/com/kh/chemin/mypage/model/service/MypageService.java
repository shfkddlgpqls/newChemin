package com.kh.chemin.mypage.model.service;

import java.util.List;

import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface MypageService {
	List<Place> selectPlaceList(String userId);
	List<PlaceAttachment> selectAttachList(int plaNo);
	List<PlaceMenu> selectMenuList(int plaNo);
	int placeDelete(int plaNo);
}
