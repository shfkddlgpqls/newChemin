package com.kh.chemin.community.model.service;

import java.util.List;
import java.util.Map;

import com.kh.chemin.community.model.vo.Attachment;
import com.kh.chemin.community.model.vo.Comment;
import com.kh.chemin.community.model.vo.Community;

public interface CommunityService {

	List<Map<String,Object>> communityList();
	List<Map<String,Object>> attachmentList();
	int communityWriteEnd(Community community,List<Attachment> attList);
	List<Map<String,Object>> fileCount();
	List<Comment> commentList(int communityno);
	int commentWrite(Comment comment);

}

