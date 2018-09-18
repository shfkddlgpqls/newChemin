package com.kh.chemin.map.model.dao;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;
import com.kh.chemin.map.model.vo.PlaceReview;

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

	@Override
	public List<Place> placeList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("place.placeList");
	}

	@Override
	public Place placeSelect(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.selectOne("place.placeSelect", plaNo);
	}

	@Override
	public List<PlaceAttachment> selectAttachList(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.selectList("place.selectAttachList",plaNo);
	}

	@Override
	public List<PlaceMenu> selectMenuList(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.selectList("place.selectMenuList",plaNo);
	}

	@Override
	public List<Place> placeSearch(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.selectList("place.placeSearch", map);
	}

	@Override
	public List<PlaceReview> placeReviewList(SqlSessionTemplate sqlSession, int plaNo, int cPage, int numPerPage) {
		return sqlSession.selectList("place.placeReviewList", plaNo,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int placeInsertReview(SqlSessionTemplate sqlSession, PlaceReview review) {
		return sqlSession.insert("place.placeInsertReview", review);
	}

	@Override
	public Place placeMatch(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.selectOne("place.placeMatch", map);
	}

	@Override
	public int reviewDelete(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.delete("place.reviewDelete", reviewNo);
	}

	@Override
	public int reviewUpdate(SqlSessionTemplate sqlSession, PlaceReview review) {
		return sqlSession.update("place.reviewUpdate", review);
	}

	@Override
	public int selectReviewCount(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.selectOne("place.selectReviewCount", plaNo);
	}
}
