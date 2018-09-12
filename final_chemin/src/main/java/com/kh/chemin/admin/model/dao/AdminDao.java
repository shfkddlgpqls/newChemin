package com.kh.chemin.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface AdminDao {
	List<Place> adminPlaceList(SqlSessionTemplate sqlSession);
	List<PlaceAttachment> selectAttachList(SqlSessionTemplate sqlSession, int plaNo);
	List<PlaceMenu> selectMenuList(SqlSessionTemplate sqlSession ,int plaNo);
	int placeDelete(SqlSessionTemplate sqlSession, int plaNo);
	int plaStatusChange(SqlSessionTemplate sqlSession, Map map);
	int adminReMsg(SqlSessionTemplate sqlSession, Map map);
}
