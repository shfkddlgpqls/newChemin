package com.kh.chemin.community.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.community.model.vo.Attachment;
import com.kh.chemin.community.model.vo.Comment;
import com.kh.chemin.community.model.vo.Community;

public interface CommunityDao {

	List<Map<String,Object>> communityList(SqlSessionTemplate sqlSession);
	List<Map<String,Object>> attachmentList(SqlSessionTemplate sqlSession);
	int communityWriteEnd(SqlSessionTemplate sqlSession, Community community);
	int insertAttach(SqlSessionTemplate sqlSession, Attachment a);
	List<Map<String,Object>> fileCount(SqlSessionTemplate sqlSession);
/*	int updateLikeCount(SqlSessionTemplate sqlSession,int community_no);*/
	List<Comment> commentList(SqlSessionTemplate sqlSession,int communityno);
	int commentWrite(SqlSessionTemplate sqlSession,Comment comment);
}

=======
package com.kh.chemin.community.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.community.model.vo.Attachment;
import com.kh.chemin.community.model.vo.Comment;
import com.kh.chemin.community.model.vo.Community;
import com.kh.chemin.community.model.vo.LikeTo;
import com.kh.chemin.community.model.vo.Report;

public interface CommunityDao {

	/*커뮤니티 리스트, 파일 리스트*/
	List<Map<String,Object>> communityList(SqlSessionTemplate sqlSession);
	
	List<Map<String,Object>> attachmentList(SqlSessionTemplate sqlSession);
	
	/*List<Map<String,Object>> likeList(SqlSessionTemplate sqlSession);*/
	
	int communityWriteEnd(SqlSessionTemplate sqlSession, Community community);
	
	int insertAttach(SqlSessionTemplate sqlSession, Attachment a);
	
	List<Comment> commentList(SqlSessionTemplate sqlSession,int communityno);
	
	int commentWrite(SqlSessionTemplate sqlSession,Comment comment);
	
	Map selectOne(SqlSessionTemplate sqlSession, int community_no);
	
	List<Map<String,String>> selectAttachmentsOne(SqlSessionTemplate sqlSession, int community_no);
	
	int selectDelete(SqlSessionTemplate sqlSession, int community_no);
	
	int communityUpdateEnd(SqlSessionTemplate sqlSession, Community community);
	
	int updateAttach(SqlSessionTemplate sqlSession, Attachment a);
	
	int commentDelete(SqlSessionTemplate sqlSession, int comment_no);
	
	List<Map<String,Object>> communitySearch(SqlSessionTemplate sqlSession, String hashTag);
	
	List<Map<String,Object>> communityAttSearch(SqlSessionTemplate sqlSession, List<Integer> cno);
	
	int commentUpdate(SqlSessionTemplate sqlSession, Comment comment);
	
	/*나만보기 리스트 */
	List<Map<String,Object>> mycommunityList(SqlSessionTemplate sqlSession,String userId);
	
	List<Map<String,Object>> myattachmentList(SqlSessionTemplate sqlSession, List<Integer> cno);
	
	/*좋아요*/
	/*int likeInsert(SqlSessionTemplate sqlSession, HashMap<String,Object> map);
	
	int likeUpdate(SqlSessionTemplate sqlSession, HashMap<String,Object> map);
	
	int likePlus(SqlSessionTemplate sqlSession, int community_no);
	
	int likeMinus(SqlSessionTemplate sqlSession, int community_no);*/
	
	LikeTo read(SqlSessionTemplate sqlSession, HashMap<String,Object> hashMap);
	
	Community communityRead(SqlSessionTemplate sqlSession, int community_no);
	
	int likeCount(SqlSessionTemplate sqlSession, int community_no);
	
	int likeCheckUp(SqlSessionTemplate sqlSession, HashMap<String,Object> hashMap);
	
	int likeCntUp(SqlSessionTemplate sqlSession, int community_no);
	
	int likeCheckDown(SqlSessionTemplate sqlSession,HashMap<String,Object> hashMap);
	
	int likeCntDown(SqlSessionTemplate sqlSession, int community_no);
	
	int likeCreate(SqlSessionTemplate sqlSession, HashMap<String,Object> hashMap);
	
	List<Map<String,Object>> categoryFind(SqlSessionTemplate sqlSession, String community_category);
	
	List<Map<String,Object>> categoryAttFind(SqlSessionTemplate sqlSession, List<Integer> cno);
	
	int reportWrite(SqlSessionTemplate sqlSession, Report report);
	
	int reportCountUp(SqlSessionTemplate sqlSession, String userid);
}