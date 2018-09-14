package com.kh.chemin.map.model.vo;

import java.util.Date;

public class Place {
	private int plaNo;
	private String userId;
	private String plaArea;
	private String plaCategory;
	private String plaName;
	private String orImg;
	private String reImg;
	private String plaPhone;
	private String plaAddr;
	private String plaTime;
	private String plaContent;
	private String plaKeyword;
	private String plaStamp;
	private String plaKey;
	private Date plaDate;
	private char plaStatus;	
	
	public Place() {}

	public Place(int plaNo, String userId, String plaArea, String plaCategory, String plaName, String orImg,
			String reImg, String plaPhone, String plaAddr, String plaTime, String plaContent, String plaKeyword,
			String plaStamp, String plaKey, Date plaDate, char plaStatus) {
		super();
		this.plaNo = plaNo;
		this.userId = userId;
		this.plaArea = plaArea;
		this.plaCategory = plaCategory;
		this.plaName = plaName;
		this.orImg = orImg;
		this.reImg = reImg;
		this.plaPhone = plaPhone;
		this.plaAddr = plaAddr;
		this.plaTime = plaTime;
		this.plaContent = plaContent;
		this.plaKeyword = plaKeyword;
		this.plaStamp = plaStamp;
		this.plaKey = plaKey;
		this.plaDate = plaDate;
		this.plaStatus = plaStatus;
	}

	public int getPlaNo() {
		return plaNo;
	}

	public void setPlaNo(int plaNo) {
		this.plaNo = plaNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPlaArea() {
		return plaArea;
	}

	public void setPlaArea(String plaArea) {
		this.plaArea = plaArea;
	}

	public String getPlaCategory() {
		return plaCategory;
	}

	public void setPlaCategory(String plaCategory) {
		this.plaCategory = plaCategory;
	}

	public String getPlaName() {
		return plaName;
	}

	public void setPlaName(String plaName) {
		this.plaName = plaName;
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

	public String getPlaPhone() {
		return plaPhone;
	}

	public void setPlaPhone(String plaPhone) {
		this.plaPhone = plaPhone;
	}

	public String getPlaAddr() {
		return plaAddr;
	}

	public void setPlaAddr(String plaAddr) {
		this.plaAddr = plaAddr;
	}

	public String getPlaTime() {
		return plaTime;
	}

	public void setPlaTime(String plaTime) {
		this.plaTime = plaTime;
	}

	public String getPlaContent() {
		return plaContent;
	}

	public void setPlaContent(String plaContent) {
		this.plaContent = plaContent;
	}

	public String getPlaKeyword() {
		return plaKeyword;
	}

	public void setPlaKeyword(String plaKeyword) {
		this.plaKeyword = plaKeyword;
	}

	public String getPlaStamp() {
		return plaStamp;
	}

	public void setPlaStamp(String plaStamp) {
		this.plaStamp = plaStamp;
	}

	public String getPlaKey() {
		return plaKey;
	}

	public void setPlaKey(String plaKey) {
		this.plaKey = plaKey;
	}

	public Date getPlaDate() {
		return plaDate;
	}

	public void setPlaDate(Date plaDate) {
		this.plaDate = plaDate;
	}

	public char getPlaStatus() {
		return plaStatus;
	}

	public void setPlaStatus(char plaStatus) {
		this.plaStatus = plaStatus;
	}

	@Override
	public String toString() {
		return "Place [plaNo=" + plaNo + ", userId=" + userId + ", plaArea=" + plaArea + ", plaCategory=" + plaCategory
				+ ", plaName=" + plaName + ", orImg=" + orImg + ", reImg=" + reImg + ", plaPhone=" + plaPhone
				+ ", plaAddr=" + plaAddr + ", plaTime=" + plaTime + ", plaContent=" + plaContent + ", plaKeyword="
				+ plaKeyword + ", plaStamp=" + plaStamp + ", plaKey=" + plaKey + ", plaDate=" + plaDate + ", plaStatus="
				+ plaStatus + "]";
	}

	
}