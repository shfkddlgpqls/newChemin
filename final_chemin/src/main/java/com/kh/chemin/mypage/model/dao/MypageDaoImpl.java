package com.kh.chemin.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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


	@Override
	public List<Map<String, Object>> communityList(SqlSessionTemplate sqlSession,String userId) {
		return sqlSession.selectList("mypage.communityList",userId);
	}

	@Override
	public List<Map<String, Object>> attachmentList(SqlSessionTemplate sqlSession, List<Integer> cno) {
		return sqlSession.selectList("mypage.attachmentList",cno);
	}

	@Override
	public List<Map<String, Object>> selectOrderList(SqlSessionTemplate sqlSession, String userId, int cPage, int numPerPage) {
		return sqlSession.selectList("mypage.selectOrderList", userId, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public List<Map<String, Object>> selectOrderData(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("mypage.selectOrderdata", userId);
	}

	@Override
	public int selectTotalCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("mypage.selectTotalCount", userId);
	}

	@Override
	public List<Map<String, Object>> selectWishList(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("mypage.selectWishList", userId);
	}
	
}

