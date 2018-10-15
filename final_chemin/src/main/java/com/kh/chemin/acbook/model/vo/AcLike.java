package com.kh.chemin.acbook.model.vo;

public class AcLike {
	
	private int likeNo;
	private int rNo;
	private String userId;
	private int likeCheck;
	
	public AcLike() {}

	public AcLike(int likeNo, int rNo, String userId, int likeCheck) {
		super();
		this.likeNo = likeNo;
		this.rNo = rNo;
		this.userId = userId;
		this.likeCheck = likeCheck;
	}

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getLikeCheck() {
		return likeCheck;
	}

	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}

	

}
