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
import org.springframework.ui.Model;
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

import net.sf.json.JSONObject;

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
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/community");
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
	
	@RequestMapping("/community/communityUpdate.do")
	public String communityUpdate(int community_no,Model model)
	{
		logger.debug("게시판 번호::"+community_no);
		Map community=service.selectOne(community_no);
		List<Map<String,String>> attachment=service.selectAttachmentsOne(community_no);
		model.addAttribute("community",community);
		model.addAttribute("attachment",attachment);
		return "community/communityUpdate";
	}
	
	@RequestMapping("/community/communityUpdateEnd.do")
	public ModelAndView communityUpdateEnd(Community community,HttpServletRequest request,MultipartFile[] upFile)
	{
		System.out.println("updateEnd:::::::"+community.getCommunity_no());
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/community");
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
		int result=service.communityUpdateEnd(community,attList);
		String msg="";
		String loc="";
		if(result>0) {
			msg="수정 완료";
			loc="/community/communityList.do";
		}
		else 
		{
			msg="수정 실패";
			loc="/community/communityUpdate.do";
			
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	
	@RequestMapping("/community/communityDelete.do")
	public ModelAndView communtiyDelete(int community_no,Model model)
	{
		ModelAndView mv=new ModelAndView();
		int result=service.selectDelete(community_no);
		String msg="";
		String loc="";
		if(result>0) {
			msg="게시물 삭제 완료";
			loc="/community/communityList.do";
		}
		else 
		{
			msg="게시물 삭제 실패";
			loc="/community/communityList.do";
			
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	

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
	
	
	@RequestMapping(value="/community/commentWrite.do",method=RequestMethod.POST)
	public ModelAndView commentWrite(@RequestParam (value="communityno") int community_no,
			@RequestParam (value="comWriter") String writer, String comWriter,@RequestParam (value="commentContent") String content,HttpSession session)
	{
		ModelAndView mv=new ModelAndView();
		Comment comment =new Comment(0,community_no,writer,content,null);
		logger.debug("Comment 전::"+comment);
		int result=service.commentWrite(comment);
		logger.debug("Comment 후::"+comment);
		String msg="";
		String loc="";
		if(result>0) {
			msg="성공적으로 등록!!";
			loc="/community/communityList.do";
		}
		else 
		{
			msg="등록 실패";
			loc="/community/communityList.do";
			
		}

		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/community/adminDelete.do")
	public ModelAndView adminDelete(int community_no)
	{
		ModelAndView mv=new ModelAndView();
		int result=service.selectDelete(community_no);
		String msg="";
		String loc="";
		if(result>0) {
			msg="게시물 삭제 완료";
			loc="/community/communityList.do";
		}
		else 
		{
			msg="게시물 삭제 실패";
			loc="/community/communityList.do";
			
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	/*댓글 삭제*/
	@RequestMapping("/community/commentDelete.do")
	public ModelAndView commentDelete(int comment_no)
	{
		ModelAndView mv=new ModelAndView();
		int result=service.commentDelete(comment_no);
		String msg="";
		String loc="";
		if(result>0) {
			msg="댓글 삭제 완료";
			loc="/community/communityList.do";
		}
		else 
		{
			msg="댓글 삭제 실패";
			loc="/community/communityList.do";
			
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/community/communitySearch.do")
	public ModelAndView communitySearch(HttpServletRequest request,ModelAndView mv) 
	{
		String hashTag=(String)request.getParameter("searchValue");
		System.out.println("검색 내용::::"+hashTag);
		List<Map<String,Object>> list=service.communitySearch(hashTag);
		
		//입력한 hashTag에 해당되는 게시물 번호를 배열로 받기
		List<Integer> cno=new ArrayList<Integer>();
		//게시물 번호를 list의 사이즈대로 만들어줌
		int[] no = new int[list.size()];
		//list에 있는 게시물번호가 object라서 string으로 바꿔준 후 int로 바꿔줌. 이렇게 두번해준 이유는 바로 integer로 변환이 안됐기 때문.
		for(int i=0;i<list.size();i++)
		{
			no[i]= (Integer.parseInt(list.get(i).get("COMMUNITYNO").toString()));
			//하나씩 받은 배열을 list안에 넣어줌
			cno.add(no[i]);
		}
		List<Map<String,Object>> attList=service.communityAttSearch(cno);
		mv.addObject("list",list);
		mv.addObject("attList",attList);
		mv.setViewName("/community/communityList");
		return mv;
	}
	
	@RequestMapping(value="/community/commentUpdate.do",method=RequestMethod.POST)
	public ModelAndView commentUpdate(Comment comment, ModelAndView mv)
	{
		int result=service.commentUpdate(comment);
		String msg="";
		String loc="";
		if(result>0) {
			msg="수정 완료";
			loc="/community/communityList.do";
		}
		else 
		{
			msg="수정 실패";
			loc="/community/communityUpdate.do";
			
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping(value="/community/like.do",method=RequestMethod.POST)
	public ModelAndView like(int community_no, HttpSession session,ModelAndView mv)
	{
		String userId=(String)session.getAttribute("memberLoggedIn");
		JSONObject obj=new JSONObject();
		
		ArrayList<String> msgs=new ArrayList<String>();
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("communityno", community_no);
		map.put("userId",userId);
		
		int like_check=0;
		int like_cnt=0;
		map.put("like_check", like_check);
		System.out.println(":::likeController::"+map);
		int result=service.like(map);
		String msg="";
		String loc="";
		if(result>0) {
			msg="추가 완료";
			loc="/community/communityList.do";
		}
		else 
		{
			msg="추가 실패";
			loc="/community/communityUpdate.do";
			
		}
		if(like_check==0) {
			System.out.println("좋아요!!");
			like_cnt++;
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
}

