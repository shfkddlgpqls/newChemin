package com.kh.chemin.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface AdminService {
	List<Place> adminPlaceList();
	List<PlaceAttachment> selectAttachList(int plaNo);
	List<PlaceMenu> selectMenuList(int plaNo);
	int placeDelete(int plaNo);
	int plaStatusChange(Map map);
	int adminReMsg(Map map);
	
	//문의게시판 글의 총 갯수
	int selectQnACount();
	
	//게시글 관리 처음 페이지 게시글 불러올 때 
	List<QnA_board> selectQnaBoardList(int cPage, int numPerPage);
	
	//문의게시판 관리자 답변
	int insertReply(Map<String, Object> map);
	
	//문의글 상태 업데이트
	int updateState(String board_num);
	
	List<Review> selectReviewList(int cPage, int numPerPage);
	int selectReviewCount();
	

	

}
