package com.kh.chemin.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Place> adminPlaceList(SqlSessionTemplate sqlSession,Map map,int cPage,int numPerPage) {
		return sqlSession.selectList("admin.placeList",map,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectPlaceCount(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.selectOne("admin.selectPlaceCount",map);
	}
	
	@Override
	public List<PlaceAttachment> selectAttachList(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.selectList("admin.selectAttachList",plaNo);
	}

	@Override
	public List<PlaceMenu> selectMenuList(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.selectList("admin.selectMenuList",plaNo);
	}

	@Override
	public int placeDelete(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.delete("admin.placeDelete",plaNo);
	}

	@Override
	public int plaStatusChange(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.update("admin.plaStatusChange",map);
	}

	@Override
	public int adminReMsg(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.update("admin.adminReMsg",map);
	}

	@Override
	public int selectProductCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectProductCount");
	}

	@Override
	public List<Map<String, Object>> selectProductList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		return sqlSession.selectList("admin.selectProductList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public List<Map<String, String>> selectMallCate(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("admin.selectMallCate");
	}

	

}
