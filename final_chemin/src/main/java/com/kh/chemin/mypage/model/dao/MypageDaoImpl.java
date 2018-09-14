package com.kh.chemin.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Override
	public List<Place> selectPlaceList(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("mypage.selectPlaceList", userId);
	}

	@Override
	public List<PlaceAttachment> selectAttachList(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.selectList("mypage.selectAttachList",plaNo);
	}

	@Override
	public List<PlaceMenu> selectMenuList(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.selectList("mypage.selectMenuList",plaNo);
	}

	@Override
	public int placeDelete(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.delete("mypage.placeDelete",plaNo);
	}

	@Override
	public Place placeSelect(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.selectOne("mypage.placeSelect", plaNo);
	}

	@Override
	public int placeUpdate(SqlSessionTemplate sqlSession, Place place) {
		return sqlSession.update("mypage.placeUpdate",place);
	}

	@Override
	public int insertMenu(SqlSessionTemplate sqlSession, PlaceMenu m) {
		return sqlSession.insert("mypage.updateMenu",m);
	}

	@Override
	public int insertAttach(SqlSessionTemplate sqlSession, PlaceAttachment a) {
		return sqlSession.insert("mypage.updateAttach",a);
	}

	@Override
	public int removeMenu(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.delete("mypage.removeMenu",plaNo);
	}

	@Override
	public int removeAttach(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.delete("mypage.removeAttach",plaNo);
	}

}

