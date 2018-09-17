package com.kh.chemin.admin.model.dao;

<<<<<<< HEAD
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface AdminDao {
	List<Place> adminPlaceList(SqlSessionTemplate sqlSession);
	List<PlaceAttachment> selectAttachList(SqlSessionTemplate sqlSession, int plaNo);
	List<PlaceMenu> selectMenuList(SqlSessionTemplate sqlSession ,int plaNo);
	int placeDelete(SqlSessionTemplate sqlSession, int plaNo);
	int plaStatusChange(SqlSessionTemplate sqlSession, Map map);
	int adminReMsg(SqlSessionTemplate sqlSession, Map map);
	
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
	
	

	

	
	
=======
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

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
	int selectProductCount(SqlSessionTemplate sqlSession);
	List<Map<String, Object>> selectProductList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	List<Map<String, String>> selectMallCate(SqlSessionTemplate sqlSession);
	int selectMemberCount(SqlSessionTemplate sqlSession);
	List<Map<String, Object>> selectMemberList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	List<Map<String,Object>> rpList(SqlSessionTemplate sqlSession, String userId);
	int reportCount(SqlSessionTemplate sqlSession, String userId);
	int adminMemberDelete(SqlSessionTemplate sqlSession, String userId);
	List<Map<String,Object>> blackList(SqlSessionTemplate sqlSession);
	List<Map<String,Object>> searchList(SqlSessionTemplate sqlSession,HashMap<String,Object> map);
>>>>>>> branch 'master' of https://github.com/shfkddlgpqls/newChemin.git
}
