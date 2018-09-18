package com.kh.chemin.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface AdminService {
	List<Place> adminPlaceList(Map map,int cPage, int numPerPage);
	int selectPlaceCount(Map map);
	List<PlaceAttachment> selectAttachList(int plaNo);
	List<PlaceMenu> selectMenuList(int plaNo);
	int placeDelete(int plaNo);
	int plaStatusChange(Map map);
	int adminReMsg(Map map);
	int selectProductCount();
	List<Map<String, Object>> selectProductList(int cPage, int numPerPage);
	List<Map<String, String>> selectMallCate();
	int selectMemberCount();
	List<Map<String,Object>> selectMemberList(int cPage, int numPerPage);
	List<Map<String,Object>> rpList(String userId);
	int adminMemberDelete(String userId);
	List<Map<String,Object>> blackList();
	List<Map<String,Object>> searchList(HashMap<String,Object> map);
	
}
