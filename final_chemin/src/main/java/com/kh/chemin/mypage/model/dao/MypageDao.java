package com.kh.chemin.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface MypageDao {
	List<Place> selectPlaceList(SqlSessionTemplate sqlSession, String userId);
	List<PlaceAttachment> selectAttachList(SqlSessionTemplate sqlSession,int plaNo);
	List<PlaceMenu> selectMenuList(SqlSessionTemplate sqlSession,int plaNo);
	int placeDelete(SqlSessionTemplate sqlSession, int plaNo);
	Place placeSelect(SqlSessionTemplate sqlSession, int plaNo);
	int placeUpdate(SqlSessionTemplate sqlSession, Place place);
	int insertMenu(SqlSessionTemplate sqlSession, PlaceMenu m);
	int insertAttach(SqlSessionTemplate sqlSession, PlaceAttachment a);
	int removeMenu(SqlSessionTemplate sqlSession, int plaNo);
	int removeAttach(SqlSessionTemplate sqlSession, int plaNo);

}

