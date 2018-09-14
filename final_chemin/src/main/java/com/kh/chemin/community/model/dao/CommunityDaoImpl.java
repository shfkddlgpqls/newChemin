package com.kh.chemin.community.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.community.model.vo.Attachment;
import com.kh.chemin.community.model.vo.Comment;
import com.kh.chemin.community.model.vo.Community;

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

	@Override
	public int communityWriteEnd(SqlSessionTemplate sqlSession, Community community) {
		return sqlSession.insert("community.communityWriteEnd",community);
	}

	@Override
	public int insertAttach(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("community.insertAttachment",a);
	}

	/*@Override
	public int updateLikeCount(SqlSessionTemplate sqlSession,int community_no) {
		return sqlSession.update("community.updateLikeCount",community_no);
	}*/

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
	public int like(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		System.out.println("::likeDao::"+map);
		return sqlSession.insert("community.like",map);
	}


}