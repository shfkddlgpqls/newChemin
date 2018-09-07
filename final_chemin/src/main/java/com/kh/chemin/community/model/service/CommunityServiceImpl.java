package com.kh.chemin.community.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chemin.community.model.dao.CommunityDao;
import com.kh.chemin.community.model.vo.Attachment;
import com.kh.chemin.community.model.vo.Comment;
import com.kh.chemin.community.model.vo.Community;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String,Object>> communityList() {
		return dao.communityList(sqlSession);
	}
	
	@Override
	public List<Map<String,Object>> attachmentList() {
		return dao.attachmentList(sqlSession);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public int communityWriteEnd(Community community,List<Attachment> attList) {
		int result=0;
		int community_no=0;
		System.out.println("attachmentService::before");
		result=dao.communityWriteEnd(sqlSession, community);
		ModelAndView mv=new ModelAndView();
		community_no=community.getCommunity_no();
		
		if(attList.size()>0)
		{
			for(Attachment a : attList)
			{
				a.setCommunity_no(community_no);
				result=dao.insertAttach(sqlSession,a);
				
			}
		}
		System.out.println("attachmentService::after");
		return result;
	}

	@Override
	public List<Map<String,Object>> fileCount() {
		return dao.fileCount(sqlSession);
	}

	@Override
	public List<Comment> commentList(int communityno) {
		return dao.commentList(sqlSession,communityno);
	}

	@Override
	public int commentWrite(Comment comment) {
		return dao.commentWrite(sqlSession,comment);
	}

	/*@Override
	public int updateLikeCount(int community_no) {
		return dao.updateLikeCount(sqlSession,community_no);
	}*/
}
