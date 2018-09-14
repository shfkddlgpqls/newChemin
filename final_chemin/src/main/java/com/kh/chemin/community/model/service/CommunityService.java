package com.kh.chemin.community.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.chemin.community.model.vo.Attachment;
import com.kh.chemin.community.model.vo.Comment;
import com.kh.chemin.community.model.vo.Community;
import com.kh.chemin.community.model.vo.LikeTo;

public interface CommunityService {

	List<Map<String,Object>> communityList();
	List<Map<String,Object>> attachmentList();
	/*List<Map<String,Object>> likeList();*/
	int communityWriteEnd(Community community,List<Attachment> attList);
	List<Comment> commentList(int communityno);
	int commentWrite(Comment comment);
	Map selectOne(int community_no);
	List<Map<String,String>> selectAttachmentsOne(int community_no);
	int selectDelete(int community_no);
	int communityUpdateEnd(Community community,List<Attachment> attList);
	int commentDelete(int comment_no);
	
	List<Map<String,Object>> communitySearch(String searchValue);
	List<Map<String,Object>> communityAttSearch(List<Integer> cno);
	int commentUpdate(Comment comment);
	List<Map<String,Object>> mycommunityList(String userId);
	List<Map<String,Object>> myattachmentList(List<Integer> cno);
	
	/*int likePlus(int community_no);
	int likeMinus(int community_no);
	int likeInsert(HashMap<String,Object> map);
	int likeUpdate(HashMap<String,Object> map);*/
	LikeTo read(HashMap<String,Object> hashMap);
	Community communityRead(int communityno);
	int likeCount(int communityno);
	int likeCheckUp(HashMap<String,Object> hashMap);
	int likeCntUp(int communityno);
	int likeCheckDown(HashMap<String,Object> hashMap);
	int likeCntDown(int communityno);
	int likeCreate(HashMap<String,Object> hashMap);

}

