package com.kh.chemin.community.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.chemin.community.model.service.CommunityService;
import com.kh.chemin.community.model.vo.Attachment;
import com.kh.chemin.community.model.vo.Comment;
import com.kh.chemin.community.model.vo.Community;
import com.kh.chemin.member.model.vo.Member;

@Controller
public class CommunityController {
	
	private Logger logger=LoggerFactory.getLogger(CommunityController.class);

	@Autowired
	private CommunityService service;
	
	
	@RequestMapping("/community/communityList.do")
	public ModelAndView communityList(ModelAndView mv)
	{
		List<Map<String,Object>> list=service.communityList();
		List<Map<String,Object>> attList=service.attachmentList();
		List<Map<String,Object>> fileCount=service.fileCount();
		
		System.out.println("fileCount::"+fileCount);
		System.out.println(list);
		System.out.println(attList);
		mv.addObject("fileCount",fileCount);
		mv.addObject("list",list);
		mv.addObject("attList",attList);
		mv.setViewName("community/communityList");
		return mv;
	}
	
	@RequestMapping("/community/communityWrite.do")
	public String communityWrite()
	{
		return "community/communityWrite";
	}
	
	@RequestMapping(value="/community/communityWriteEnd.do",method=RequestMethod.POST)
	public ModelAndView communityWriteEnd(HttpServletRequest request,MultipartFile[] upFile,Community community) 
	{
		for(int i=0;i<upFile.length;i++)
		{
			logger.debug("파일 업로드::"+upFile[i]);
			logger.debug("param.community::"+community);
			logger.debug("파라미터이름::"+upFile[i].getName());
			logger.debug("원본파일명::"+upFile[i].getOriginalFilename());
			logger.debug("파일 사이즈::"+upFile[i].getSize());
		}
		
		String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/community");
		logger.debug("파일저장주소::"+saveDir);
		List<Attachment> attList=new ArrayList(); 
		
		File dir=new File(saveDir);
		if(dir.exists()==false) dir.mkdirs();
		for(MultipartFile f : upFile)
		{
			if(!f.isEmpty())
			{
				String originalFilename=f.getOriginalFilename();
				String ext=originalFilename.substring(originalFilename.lastIndexOf(".")+1);
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSS");
				int rndNum=(int)(Math.random()*1000);
				String renamedFileName=sdf.format(new Date(System.currentTimeMillis()));
				renamedFileName+="_"+rndNum+"."+ext;
				try {
					f.transferTo(new File(saveDir+"/"+renamedFileName));
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				Attachment attach=new Attachment();
				attach.setOriginal_filename(originalFilename);
				attach.setRenamed_filename(renamedFileName);
				attList.add(attach);
			}
		}
		
		ModelAndView mv=new ModelAndView();
		int result=service.communityWriteEnd(community,attList); //db에 삽입해주는 메소드
		String msg="";
		String loc="";
		if(result>0) {
			msg="성공적으로 등록!!";
			loc="/community/communityList.do";
		}
		else 
		{
			msg="등록 실패";
			loc="/community/communityWrite.do";
			
		}

		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	/*@RequestMapping("/community/likecount.do")
	public String updateLikeCount(int community_no)
	{
		System.out.println("::updatelike Service::");
		int result=service.updateLikeCount(community_no);
		return "community/communityList";
	}*/

	@RequestMapping(value="/community/commentList.do",produces="application/text; charset=utf-8")
	@ResponseBody
	public String commentList(@RequestParam(value="community_no") int communityno) throws Exception
	{
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr=null;
		Map<String,Object> map=new HashMap<String,Object>();
		List<Comment> commentList=service.commentList(communityno);
		System.out.println("댓글::"+commentList);
		map.put("commentList", commentList);
		
		jsonStr=mapper.writeValueAsString(map);
		return jsonStr;
	}
	
	@RequestMapping(value="/community/commentWrite.do",produces="application/text; charset=utf-8")
	@ResponseBody
	public ModelAndView commentWrite(@ModelAttribute Comment comment,HttpSession session) throws Exception
	{
		String userId=(String)session.getAttribute("userId");
		ModelAndView mv=new ModelAndView();
		logger.debug("Comment::"+comment);
		comment.setWriter(userId);
		logger.debug("작성자::"+comment.getWriter());
		int result=service.commentWrite(comment);
		String msg="";
		String loc="";
		if(result>0) {
			msg="성공적으로 등록!!";
			loc="/community/communityList.do";
		}
		else 
		{
			msg="등록 실패";
			loc="/community/communityWrite.do";
			
		}

		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
		
		
	}
}

