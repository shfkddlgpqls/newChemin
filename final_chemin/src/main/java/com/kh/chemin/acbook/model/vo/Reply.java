package com.kh.chemin.acbook.model.vo;

public class Reply {
	private int rNo;
	private int accNo;
	private String userId;
	private String rDate;
	private String rContent;
	
	public Reply() {}

	public Reply(int rNo, int accNo, String userId, String rDate, String rContent) {
		super();
		this.rNo = rNo;
		this.accNo = accNo;
		this.userId = userId;
		this.rDate = rDate;
		this.rContent = rContent;
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

	@Override
	public String toString() {
		return "Reply [rNo=" + rNo + ", accNo=" + accNo + ", userId=" + userId + ", rDate=" + rDate + ", rContent="
				+ rContent + "]";
	}
	
	
}
