package com.kh.chemin.map.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface PlaceDao {
	int placeInsert(SqlSessionTemplate sqlSession, Place place);
	int insertMenu(SqlSessionTemplate sqlSession, PlaceMenu m);
	int insertAttach(SqlSessionTemplate sqlSession, PlaceAttachment a);
}
