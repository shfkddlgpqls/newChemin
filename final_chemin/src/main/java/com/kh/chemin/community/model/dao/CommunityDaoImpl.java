package com.kh.chemin.community.model.dao;

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
	public List<Map<String,Object>> fileCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("community.selectFileCount");
	}

	@Override
	public List<Comment> commentList(SqlSessionTemplate sqlSession,int communityno) {
		return sqlSession.selectList("community.selectComment",communityno);
	}

	@Override
	public int commentWrite(SqlSessionTemplate sqlSession,Comment comment) {
		return sqlSession.insert("community.commentWrite",comment);
	}

}
