package com.kh.chemin.community.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.chemin.community.model.vo.Attachment;
import com.kh.chemin.community.model.vo.Comment;
import com.kh.chemin.community.model.vo.Community;

public interface CommunityService {

	List<Map<String,Object>> communityList();
	List<Map<String,Object>> attachmentList();
	int communityWriteEnd(Community community,List<Attachment> attList);
	List<Comment> commentList(int communityno);
	int commentWrite(Comment comment);
	Map selectOne(int community_no);
	List<Map<String,String>> selectAttachmentsOne(int community_no);
	int selectDelete(int community_no);
	int communityUpdateEnd(Community community,List<Attachment> attList);
	/*댓글 삭제*/
	int commentDelete(int comment_no);
	
	List<Map<String,Object>> communitySearch(String searchValue);
	List<Map<String,Object>> communityAttSearch(List<Integer> cno);
	int commentUpdate(Comment comment);
	
	int like(HashMap<String,Object> map);

}

