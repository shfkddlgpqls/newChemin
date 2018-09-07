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

