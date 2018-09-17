package com.kh.chemin.community.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.community.model.vo.Attachment;
import com.kh.chemin.community.model.vo.Comment;
import com.kh.chemin.community.model.vo.Community;
import com.kh.chemin.community.model.vo.LikeTo;
import com.kh.chemin.community.model.vo.Report;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	@Override
	public List<Map<String,Object>> communityList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("community.communityList");
	}

	@Override
	public List<Map<String,Object>> attachmentList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("community.attachmentList");
	}
	
	/*@Override
	public List<Map<String, Object>> likeList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("community.likeList");
	}*/
	
	@Override
	public int communityWriteEnd(SqlSessionTemplate sqlSession, Community community) {
		return sqlSession.insert("community.communityWriteEnd",community);
	}

	@Override
	public int insertAttach(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("community.insertAttachment",a);
	}

	@Override
	public List<Comment> commentList(SqlSessionTemplate sqlSession,int community_no) {
		return sqlSession.selectList("community.selectComment",community_no);
	}

	@Override
	public int commentWrite(SqlSessionTemplate sqlSession,Comment comment) {
		return sqlSession.insert("community.commentWrite",comment);
	}

	@Override
	public Map selectOne(SqlSessionTemplate sqlSession, int community_no) {
		return sqlSession.selectOne("community.selectOne",community_no);
	}

	@Override
	public List<Map<String,String>> selectAttachmentsOne(SqlSessionTemplate sqlSession, int community_no) {
		return sqlSession.selectList("community.selectAttachmentsOne",community_no);
	}

	@Override
	public int selectDelete(SqlSessionTemplate sqlSession, int community_no) {
		return sqlSession.delete("community.selectDelete",community_no);
	}

	@Override
	public int communityUpdateEnd(SqlSessionTemplate sqlSession, Community community) {
		return sqlSession.update("community.communityUpdateEnd", community);
	}

	/*게시물 수정(파일 업로드)*/
	@Override
	public int updateAttach(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.update("community.updateAttach",a);
	}
	/*댓글 삭제*/
	@Override
	public int commentDelete(SqlSessionTemplate sqlSession, int comment_no) {
		System.out.println("::::commentDao::::");
		return sqlSession.delete("community.commentDelete", comment_no);
	}

	@Override
	public List<Map<String, Object>> communitySearch(SqlSessionTemplate sqlSession, String hashTag) {
		return sqlSession.selectList("community.search",hashTag);
	}

	@Override
	public List<Map<String, Object>> communityAttSearch(SqlSessionTemplate sqlSession, List<Integer> cno) {
		return sqlSession.selectList("community.searchAtt",cno);
		
	}

	@Override
	public int commentUpdate(SqlSessionTemplate sqlSession, Comment comment) {
		System.out.println("::commentUpdateDao::"+comment);
		return sqlSession.update("community.commentUpdate",comment);
	}


	@Override
	public List<Map<String, Object>> mycommunityList(SqlSessionTemplate sqlSession,String userId) {
		return sqlSession.selectList("community.myCommunityList",userId);
	}

	@Override
	public List<Map<String, Object>> myattachmentList(SqlSessionTemplate sqlSession, List<Integer> cno) {
		return sqlSession.selectList("community.myAttachmentList",cno);
	}

	@Override
	public LikeTo read(SqlSessionTemplate sqlSession, HashMap<String, Object> hashMap) {
		System.out.println("::likeReadRow::"+hashMap);
		return sqlSession.selectOne("community.likeRead",hashMap);
	}

	@Override
	public Community communityRead(SqlSessionTemplate sqlSession, int community_no) {
		System.out.println("communityReadRow:"+community_no);
		return sqlSession.selectOne("community.communityRead",community_no);
	}

	@Override
	public int likeCount(SqlSessionTemplate sqlSession, int community_no) {
		System.out.println("::likeCountDao::");
		return sqlSession.selectOne("community.likeCount",community_no);
	}

	@Override
	public int likeCheckUp(SqlSessionTemplate sqlSession, HashMap<String, Object> hashMap) {
		System.out.println("::likeCheckUpDao::");
		return sqlSession.update("community.likeCheckUp",hashMap);
	}

	@Override
	public int likeCntUp(SqlSessionTemplate sqlSession, int community_no) {
		System.out.println("::likeCntUpDao::");
		return sqlSession.update("community.likeCntUp",community_no);
	}

	@Override
	public int likeCheckDown(SqlSessionTemplate sqlSession, HashMap<String, Object> hashMap) {
		System.out.println("::likeCheckDown::");
		return sqlSession.update("community.likeCheckDown",hashMap);
	}

	@Override
	public int likeCntDown(SqlSessionTemplate sqlSession, int community_no) {
		System.out.println("::likeCntDown::");
		return sqlSession.update("community.likeCntDown",community_no);
	}

	@Override
	public int likeCreate(SqlSessionTemplate sqlSession, HashMap<String, Object> hashMap) {
		System.out.println("::likeCreateDao::");
		int result=sqlSession.insert("community.likeCreate",hashMap);
		System.out.println("::likeCreateResult::");
		return result;
	}

	@Override
	public List<Map<String, Object>> categoryFind(SqlSessionTemplate sqlSession, String community_category) {
		return sqlSession.selectList("community.categoryFind",community_category);
	}

	@Override
	public List<Map<String, Object>> categoryAttFind(SqlSessionTemplate sqlSession, List<Integer> cno) {
		return sqlSession.selectList("community.categoryAttFind",cno);
	}

	@Override
	public int reportWrite(SqlSessionTemplate sqlSession, Report report) {
		return sqlSession.insert("community.reportWrite",report);
	}

	@Override
	public int reportCountUp(SqlSessionTemplate sqlSession, String userid) {
		System.out.println("::신고당한자 카운트 올리기Dao::");
		return sqlSession.update("community.reportCountUp",userid);
	}

	/*@Override
	public int likeInsert(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		System.out.println("::likeDao::"+map);
		return sqlSession.insert("community.like",map);
	}

	@Override
	public int likeUpdate(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		System.out.println("::likeUpdateDao::"+map);
		return sqlSession.update("community.likeUpdate",map);
	}

	@Override
	public int likePlus(SqlSessionTemplate sqlSession, int community_no) {
		System.out.println("::likePlusDao::"+community_no);
		return sqlSession.update("community.likePlus",community_no);
	}

	@Override
	public int likeMinus(SqlSessionTemplate sqlSession, int community_no) {
		System.out.println("::likeMinusDao::"+community_no);
		return sqlSession.update("community.likeMinus",community_no);
	}*/



}