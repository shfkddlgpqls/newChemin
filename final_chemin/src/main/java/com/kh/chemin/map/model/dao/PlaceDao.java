package com.kh.chemin.map.model.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;
import com.kh.chemin.map.model.vo.PlaceReview;

public interface PlaceDao {
	int placeInsert(SqlSessionTemplate sqlSession, Place place);
	int insertMenu(SqlSessionTemplate sqlSession, PlaceMenu m);
	int insertAttach(SqlSessionTemplate sqlSession, PlaceAttachment a);
	List<Place> placeList(SqlSessionTemplate sqlSession);
	Place placeSelect(SqlSessionTemplate sqlSession, int plaNo);
	List<PlaceAttachment> selectAttachList(SqlSessionTemplate sqlSession,int plaNo);
	List<PlaceMenu> selectMenuList(SqlSessionTemplate sqlSession,int plaNo);
	List<Place> placeSearch(SqlSessionTemplate sqlSession,Map map);
	List<PlaceReview> placeReviewList(SqlSessionTemplate sqlSession, int plaNo,int cPage, int numPerPage);
	int placeInsertReview(SqlSessionTemplate sqlSession, PlaceReview review);
	Place placeMatch(SqlSessionTemplate sqlSession, Map map);
	int reviewDelete(SqlSessionTemplate sqlSession, int reviewNo);
	int reviewUpdate(SqlSessionTemplate sqlSession, PlaceReview review);
	int selectReviewCount(SqlSessionTemplate sqlSession, int plaNo);
}
