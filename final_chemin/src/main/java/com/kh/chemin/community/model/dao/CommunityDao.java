package com.kh.chemin.community.model.dao;

import java.util.HashMap;
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
/*	int updateLikeCount(SqlSessionTemplate sqlSession,int community_no);*/
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
	int like(SqlSessionTemplate sqlSession, HashMap<String,Object> map);
}

