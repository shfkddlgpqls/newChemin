package com.kh.chemin.community.model.service;

import java.util.HashMap;
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
import com.kh.chemin.community.model.vo.LikeTo;
import com.kh.chemin.community.model.vo.Report;

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
	/*
	@Override
	public List<Map<String,Object>> likeList() {
		return dao.likeList(sqlSession);
	}*/

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
	public List<Comment> commentList(int communityno) {
		return dao.commentList(sqlSession,communityno);
	}

	@Override
	public int commentWrite(Comment comment) {
		return dao.commentWrite(sqlSession,comment);
	}

	@Override
	public Map selectOne(int community_no) {
		return dao.selectOne(sqlSession, community_no);
	}

	@Override
	public List<Map<String,String>> selectAttachmentsOne(int community_no) {
		return dao.selectAttachmentsOne(sqlSession, community_no);
	}

	@Override
	public int selectDelete(int community_no) {
		return dao.selectDelete(sqlSession, community_no);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public int communityUpdateEnd(Community community,List<Attachment> attList) {
		int result=0;
		int community_no=0;
		result=dao.communityUpdateEnd(sqlSession, community);
		community_no=community.getCommunity_no();
		if(attList.size()>0)
		{
			for(Attachment a : attList)
			{
				a.setCommunity_no(community_no);
				result=dao.updateAttach(sqlSession,a);
				
			}
		}
		return result;
	}
	/*댓글 삭제*/
	@Override
	public int commentDelete(int comment_no) {
		System.out.println("::::commentService::::");
		return dao.commentDelete(sqlSession,comment_no);
	}

	@Override
	public List<Map<String, Object>> communitySearch(String hashTag) {
		return dao.communitySearch(sqlSession,hashTag);
	}

	@Override
	public List<Map<String, Object>> communityAttSearch(List<Integer> cno) {
		return dao.communityAttSearch(sqlSession,cno);
	}

	@Override
	public int commentUpdate(Comment comment) {
		return dao.commentUpdate(sqlSession,comment);
	}

	@Override
	public List<Map<String, Object>> mycommunityList(String userId) {
		return dao.mycommunityList(sqlSession,userId);
	}

	@Override
	public List<Map<String, Object>> myattachmentList(List<Integer> cno) {
		return dao.myattachmentList(sqlSession,cno);
	}

	@Override
	public LikeTo read(HashMap<String, Object> hashMap) {
		System.out.println("::likeReadRow::"+hashMap);
		return dao.read(sqlSession, hashMap);
	}

	@Override
	public Community communityRead(int community_no) {
		System.out.println("communityRowRead:"+community_no);
		return dao.communityRead(sqlSession,community_no);
	}

	@Override
	public int likeCount(int community_no) {
		System.out.println("::likeCountService:::");
		return dao.likeCount(sqlSession,community_no);
	}

	@Override
	public int likeCheckUp(HashMap<String, Object> hashMap) {
		System.out.println("::likeCheckUpService::");
		return dao.likeCheckUp(sqlSession,hashMap);
	}

	@Override
	public int likeCntUp(int community_no) {
		System.out.println("::likeCntUpService::");
		return dao.likeCntUp(sqlSession,community_no);
	}

	@Override
	public int likeCheckDown(HashMap<String, Object> hashMap) {
		System.out.println("::likeCheckDown::");
		return dao.likeCheckDown(sqlSession,hashMap);
	}

	@Override
	public int likeCntDown(int community_no) {
		System.out.println("::likeCntDown::");
		return dao.likeCntDown(sqlSession,community_no);
	}

	@Override
	public int likeCreate(HashMap<String, Object> hashMap) {
		System.out.println("::likeCreateService::");
		return dao.likeCreate(sqlSession,hashMap);
	}

	@Override
	public List<Map<String, Object>> categoryFind(String community_category) {
		return dao.categoryFind(sqlSession,community_category);
	}

	@Override
	public List<Map<String, Object>> categoryAttFind(List<Integer> cno) {
		return dao.categoryAttFind(sqlSession,cno);
	}

	@Override
	public int reportWrite(Report report) {
		return dao.reportWrite(sqlSession,report);
	}

	@Override
	public int reportCountUp(String userid) {
		System.out.println("::신고당한자 카운트 올리기 Service::");
		return dao.reportCountUp(sqlSession,userid);
	}
	
	/*@Override
	public int likeInsert(HashMap<String, Object> map) {
		System.out.println(":::likeInsertService::"+map);
		return dao.likeInsert(sqlSession,map);
	}

	@Override
	public int likeUpdate(HashMap<String, Object> map) {
		System.out.println(":::likeDeleteService::"+map);
		return dao.likeUpdate(sqlSession,map);
	}

	@Override
	public int likePlus(int community_no) {
		System.out.println(":::likePlusService::"+community_no);
		return dao.likePlus(sqlSession,community_no);
	}

	@Override
	public int likeMinus(int community_no) {
		System.out.println(":::likeMinusService::"+community_no);
		return dao.likeMinus(sqlSession,community_no);
	}*/
	
	
}
