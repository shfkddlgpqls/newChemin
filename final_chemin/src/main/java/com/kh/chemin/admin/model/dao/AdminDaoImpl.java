package com.kh.chemin.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.mall.model.vo.Product;
import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
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
	public int selectProductCount(SqlSessionTemplate sqlSession,Map<String, Object> map) {
		return sqlSession.selectOne("admin.selectProductCount",map);
	}

	@Override
	public List<Map<String, Object>> selectProductList(SqlSessionTemplate sqlSession, Map<String, Object> map, int cPage, int numPerPage) {
		return sqlSession.selectList("admin.selectProductList", map, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public List<Map<String, String>> selectMallCate(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("admin.selectMallCate");
	}

	@Override
	public int selectMaxPno(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectMapPno");
	}

	@Override
	public int insertProduct(SqlSessionTemplate sqlSession, Product product) {
		return sqlSession.insert("admin.insertProduct", product);
	}

	@Override
	public int productDelete(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.delete("admin.deleteProduct", pno);
	}

	@Override
	public Product selectProduct(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("admin.selectProduct", pno);
	}

	@Override
	public int updateProduct(SqlSessionTemplate sqlSession, Product product) {
		return sqlSession.update("admin.updateProduct", product);
	}

	@Override
	public List<String> productAuto(SqlSessionTemplate sqlSession, String search) {
		return sqlSession.selectList("admin.productAuto", search);
	}
	
	@Override
	public List<Map<String, Object>> selectOrderList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		return sqlSession.selectList("admin.selectOrderList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public List<Map<String, Object>> selectOrderData(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("admin.selectOrderdata");
	}

	@Override
	public int selectTotalCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectTotalCount");
	}
	public int selectMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectMemberCount");
	}

	@Override
	public List<Map<String, Object>> selectMemberList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		return sqlSession.selectList("admin.selectMemberList",null,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public List<Map<String, Object>> rpList(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("admin.selectReportList",userId);
	}

	@Override
	public int reportCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("admin.reportCount",userId);
	}

	@Override
	public int adminMemberDelete(SqlSessionTemplate sqlSession, String userId) {
		System.out.println("::adminMemberDeleteDao::"+userId);
		return sqlSession.delete("admin.adminMemberDelete",userId);
	}

	@Override
	public List<Map<String, Object>> blackList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("admin.blackList");
	}


	@Override
	public List<Map<String, Object>> searchList(SqlSessionTemplate sqlSession, HashMap<String,Object> map) {
		System.out.println("::searchListDao::"+map);
		return sqlSession.selectList("admin.searchList",map);
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