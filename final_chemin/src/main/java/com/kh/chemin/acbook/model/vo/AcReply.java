package com.kh.chemin.acbook.model.vo;

public class AcReply {
	private int rNo;
	private int accNo;
	private String userId;
	private String rDate;
	private String rContent;
	private int likeCnt;
	
	public AcReply() {}

	public AcReply(int rNo, int accNo, String userId, String rDate, String rContent, int likeCnt) {
		super();
		this.rNo = rNo;
		this.accNo = accNo;
		this.userId = userId;
		this.rDate = rDate;
		this.rContent = rContent;
		this.likeCnt = likeCnt;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getAccNo() {
		return accNo;
	}

	public void setAccNo(int accNo) {
		this.accNo = accNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	
	
}
