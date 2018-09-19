package com.kh.chemin.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.mall.model.vo.Product;
import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface AdminDao {
	List<Place> adminPlaceList(SqlSessionTemplate sqlSession,Map map,int cPage, int numPerPage);
	int selectPlaceCount(SqlSessionTemplate sqlSession,Map map);
	List<PlaceAttachment> selectAttachList(SqlSessionTemplate sqlSession, int plaNo);
	List<PlaceMenu> selectMenuList(SqlSessionTemplate sqlSession ,int plaNo);
	int placeDelete(SqlSessionTemplate sqlSession, int plaNo);
	int plaStatusChange(SqlSessionTemplate sqlSession, Map map);
	int adminReMsg(SqlSessionTemplate sqlSession, Map map);
	int selectProductCount(SqlSessionTemplate sqlSession, Map<String, Object> map);
	List<Map<String, Object>> selectProductList(SqlSessionTemplate sqlSession, Map<String, Object> map, int cPage, int numPerPage);
	List<Map<String, String>> selectMallCate(SqlSessionTemplate sqlSession);
	int selectMaxPno(SqlSessionTemplate sqlSession);
	int insertProduct(SqlSessionTemplate sqlSession, Product product);
	int productDelete(SqlSessionTemplate sqlSession, int pno);
	Product selectProduct(SqlSessionTemplate sqlSession, int pno);
	int updateProduct(SqlSessionTemplate sqlSession, Product product);
	List<String> productAuto(SqlSessionTemplate sqlSession, String search);
	List<Map<String, Object>> selectOrderList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	List<Map<String, Object>> selectOrderData(SqlSessionTemplate sqlSession);
	int selectTotalCount(SqlSessionTemplate sqlSession);
	int selectMemberCount(SqlSessionTemplate sqlSession);
	List<Map<String, Object>> selectMemberList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	List<Map<String,Object>> rpList(SqlSessionTemplate sqlSession, String userId);
	int adminMemberUpdate(SqlSessionTemplate sqlSession, String userId);
	List<Map<String,Object>> blackList(SqlSessionTemplate sqlSession);
	List<Map<String,Object>> searchList(SqlSessionTemplate sqlSession,HashMap<String,Object> map);
	int adminMemberCancel(SqlSessionTemplate sqlSession, String userId);

		//문의게시판 총 갯수
		int selectQnACount(SqlSessionTemplate sqlSession);	
		
		//게시글 관리 처음 페이지 게시글 불러올 때 
		List<QnA_board> selectQnaBoardList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);

		//답변 게시글 입력
		int insertReply(SqlSessionTemplate sqlSession, Map<String, Object> map);
		
		//답변 상태 업데이트
		int updateState(SqlSessionTemplate sqlSession, String board_num);

		List<Review> selectReviewList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
		int selectReviewCount(SqlSessionTemplate sqlSession);
		
}
