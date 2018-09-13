package com.kh.chemin.map.model.vo;

import java.util.Date;

public class PlaceReview {
   private int reviewNo;
   private String userId;
   private int plaNo;
   private String reStar;
   private String reContent;
   private Date reDate;
   private String orImg;
   private String reImg;
   
   public PlaceReview() {}

public PlaceReview(int reviewNo, String userId, int plaNo, String reStar, String reContent, Date reDate, String orImg,
		String reImg) {
	super();
	this.reviewNo = reviewNo;
	this.userId = userId;
	this.plaNo = plaNo;
	this.reStar = reStar;
	this.reContent = reContent;
	this.reDate = reDate;
	this.orImg = orImg;
	this.reImg = reImg;
}

public int getReviewNo() {
	return reviewNo;
}

public void setReviewNo(int reviewNo) {
	this.reviewNo = reviewNo;
}

public String getUserId() {
	return userId;
}

public void setUserId(String userId) {
	this.userId = userId;
}

public int getPlaNo() {
	return plaNo;
}

public void setPlaNo(int plaNo) {
	this.plaNo = plaNo;
}

public String getReStar() {
	return reStar;
}

public void setReStar(String reStar) {
	this.reStar = reStar;
}

public String getReContent() {
	return reContent;
}

public void setReContent(String reContent) {
	this.reContent = reContent;
}

public Date getReDate() {
	return reDate;
}

public void setReDate(Date reDate) {
	this.reDate = reDate;
}

public String getOrImg() {
	return orImg;
}

public void setOrImg(String orImg) {
	this.orImg = orImg;
}

public String getReImg() {
	return reImg;
}

public void setReImg(String reImg) {
	this.reImg = reImg;
}

@Override
public String toString() {
	return "PlaceReview [reviewNo=" + reviewNo + ", userId=" + userId + ", plaNo=" + plaNo + ", reStar=" + reStar
			+ ", reContent=" + reContent + ", reDate=" + reDate + ", orImg=" + orImg + ", reImg=" + reImg + "]";
}
   
   
}
