package com.kh.chemin.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.chemin.admin.model.service.AdminServiceImpl;
import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	private Logger logger=LoggerFactory.getLogger(AdminDaoImpl.class);

	@Override
	public List<Place> adminPlaceList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("admin.placeList");
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

	//문의게시판 총 갯수 출력
	@Override
	public int selectQnACount(SqlSessionTemplate sqlSession) 
	{
		return sqlSession.selectOne("admin.selectQnACount");
	}
	

	//게시글 관리 처음 페이지 게시글 불러올 때 
	@Override
	public List<QnA_board> selectQnaBoardList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) 
	{
		return sqlSession.selectList("admin.selectQnaBoardList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	//관리자 답변 글 
	@Override
	public int insertReply(SqlSessionTemplate sqlSession, Map<String, Object> map) 
	{
		logger.debug("dao의 map요"+map);
		return sqlSession.insert("admin.insertReply",map);
	}

	@Override
	public int updateState(SqlSessionTemplate sqlSession, String board_num) 
	{
		return sqlSession.update("admin.updateState", board_num);
	}

	@Override
	public List<Review> selectReviewList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) 
	{
		return sqlSession.selectList("admin.selectReviewList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectReviewCount(SqlSessionTemplate sqlSession) 
	{
		return sqlSession.selectOne("admin.selectReviewCount");
	}

	

	

	
	
	
}
