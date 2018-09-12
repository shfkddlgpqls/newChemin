package com.kh.chemin.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.kh.chemin.community.model.vo.Attachment;
import com.kh.chemin.community.model.vo.Community;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface MypageService {
	List<Place> selectPlaceList(String userId);
	List<PlaceAttachment> selectAttachList(int plaNo);
	List<PlaceMenu> selectMenuList(int plaNo);
	int placeDelete(int plaNo);
	
	List<Map<String,Object>> communityList(String userId);
	List<Map<String,Object>> attachmentList(List<Integer> cno);
	
}
