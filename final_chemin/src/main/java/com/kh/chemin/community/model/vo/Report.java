package com.kh.chemin.community.model.vo;

public class Report {

	private int rno;
	private String category;
	private String rwriter; 
	private String content;
	
	public Report() {}

	public Report(int rno, String category, String rwriter, String content) {
		super();
		this.rno = rno;
		this.category = category;
		this.rwriter = rwriter;
		this.content = content;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getRwriter() {
		return rwriter;
	}

	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Report [rno=" + rno + ", category=" + category + ", rwriter=" + rwriter + ", content=" + content + "]";
	}
}
