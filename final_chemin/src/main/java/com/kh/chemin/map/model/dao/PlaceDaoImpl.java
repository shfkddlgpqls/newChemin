package com.kh.chemin.map.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

@Repository
public class PlaceDaoImpl implements PlaceDao {
	@Override
	public int placeInsert(SqlSessionTemplate sqlSession, Place place) {
		return sqlSession.insert("place.placeInsert",place);
	}

	@Override
	public int insertMenu(SqlSessionTemplate sqlSession, PlaceMenu m) {
		return sqlSession.insert("place.insertMenu",m);
	}

	@Override
	public int insertAttach(SqlSessionTemplate sqlSession, PlaceAttachment a) {
		return sqlSession.insert("place.insertAttach",a);
	}
}
