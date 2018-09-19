package com.kh.chemin.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Override
	public List<Place> selectPlaceList(SqlSessionTemplate sqlSession, Map map, int cPage, int numPerPage) {
		return sqlSession.selectList("mypage.selectPlaceList", map,new RowBounds((cPage-1)*numPerPage, numPerPage));
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
	public int warnMsg(SqlSessionTemplate sqlSession, String userId) {
		System.out.println(":::warnMsgDao:::"+userId);
		int result=sqlSession.selectOne("mypage.warnMsg",userId);
		return result;
	}
	
	@Override
	public int selectPlaceCount(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.selectOne("mypage.selectPlaceCount", map);
	}
	
	
//	=======================주리가 한 부분  시작=======================	
	
		//리뷰 넣기
		@Override
		public int insertReview(SqlSessionTemplate sqlSession, Review review) 
		{
			return sqlSession.insert("mypage.insertReview", review);
		}

		@Override
		public List<QnA_board> selectQnaBoardList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String userId) 
		{
			return sqlSession.selectList("mypage.selectQnaBoardList", userId, new RowBounds((cPage-1)*numPerPage, numPerPage));
		}

		@Override
		public int selectQnACount(SqlSessionTemplate sqlSession, String userId) 
		{
			return sqlSession.selectOne("mypage.selectQnACount", userId);
		}

		@Override
		public List<Review> selectReviewList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String userId) 
		{
			return sqlSession.selectList("mypage.selectReviewList", userId, new RowBounds((cPage-1)*numPerPage, numPerPage));
		}

		@Override
		public int selectReviewCount(SqlSessionTemplate sqlSession, String userId) 
		{
			return sqlSession.selectOne("mypage.selectReviewCount", userId);
		}

		@Override
		public int UpdateQna(SqlSessionTemplate sqlSession, Map<String, String> map) 
		{
			return sqlSession.update("mypage.UpdateQna", map);
		}

		@Override
		public int myQnaDel(SqlSessionTemplate sqlSession, String modal_qno) 
		{
			return sqlSession.delete("mypage.myQnaDel", modal_qno);
		}

		@Override
		public int insertReviewEdit(SqlSessionTemplate sqlSession, Review review) 
		{
			return sqlSession.insert("mypage.insertReviewEdit", review);
		}

		@Override
		public int myReviewDel(SqlSessionTemplate sqlSession, String modal_rno) 
		{
			return sqlSession.delete("mypage.myReviewDel", modal_rno);
		}
		
		
		

//		=======================주리가 한 부분  끝=======================
}
