package com.kh.chemin.community.model.vo;

import java.util.Date;

public class Comment {

	private int comment_no;
	private int community_no;
	private String writer;
	private String content;
	private Date comment_date;
	
	public Comment() {}

	public Comment(int comment_no, int community_no, String writer, String content, Date comment_date) {
		super();
		this.comment_no = comment_no;
		this.community_no = community_no;
		this.writer = writer;
		this.content = content;
		this.comment_date = comment_date;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getCommunity_no() {
		return community_no;
	}

	public void setCommunity_no(int community_no) {
		this.community_no = community_no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setCommen_dDate(Date comment_date) {
		this.comment_date = comment_date;
	}

	@Override
	public String toString() {
		return "Comment [comment_no=" + comment_no + ", community_no=" + community_no + ", writer=" + writer
				+ ", content=" + content + ", commentDate=" + comment_date + "]";
	}
	
	
	
}
