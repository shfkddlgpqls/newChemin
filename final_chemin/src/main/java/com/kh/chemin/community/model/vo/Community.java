package com.kh.chemin.community.model.vo;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Community {

	private int community_no;
	private String community_category;
	private String community_title;
	private String community_writer;
	private String community_content;
	private Date community_date;
	private String community_hashTag;
	
	public Community() {}

	public Community(int community_no, String community_category, String community_title, String community_writer,
			String community_content, Date community_date, String community_hashTag) {
		super();
		this.community_no = community_no;
		this.community_category = community_category;
		this.community_title = community_title;
		this.community_writer = community_writer;
		this.community_content = community_content;
		this.community_date = community_date;
		this.community_hashTag = community_hashTag;
	}

	public int getCommunity_no() {
		return community_no;
	}

	public void setCommunity_no(int community_no) {
		this.community_no = community_no;
	}

	public String getCommunity_category() {
		return community_category;
	}

	public void setCommunity_category(String community_category) {
		this.community_category = community_category;
	}

	public String getCommunity_title() {
		return community_title;
	}

	public void setCommunity_title(String community_title) {
		this.community_title = community_title;
	}

	public String getCommunity_writer() {
		return community_writer;
	}

	public void setCommunity_writer(String community_writer) {
		this.community_writer = community_writer;
	}

	public String getCommunity_content() {
		return community_content;
	}

	public void setCommunity_content(String community_content) {
		this.community_content = community_content;
	}

	public Date getCommunity_date() {
		return community_date;
	}

	public void setCommunity_date(Date date) {
		this.community_date = date;
	}

	public String getCommunity_hashTag() {
		return community_hashTag;
	}

	public void setCommunity_hashTag(String community_hashTag) {
		this.community_hashTag = community_hashTag;
	}

	@Override
	public String toString() {
		return "Community [community_no=" + community_no + ", community_category=" + community_category
				+ ", community_title=" + community_title + ", community_writer=" + community_writer
				+ ", community_content=" + community_content + ", community_date=" + community_date
				+ ", community_hashTag=" + community_hashTag + "]";
	}	
}