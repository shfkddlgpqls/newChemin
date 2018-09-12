package com.kh.chemin.map.model.vo;

import java.util.Date;

public class PlaceAttachment {
	private int attachmentNo;
	private int plaNo;
	private String orImg;
	private String reImg;
	private Date attachDate;
	
	public PlaceAttachment() {}

	public PlaceAttachment(int attachmentNo, int plaNo, String orImg, String reImg, Date attachDate) {
		super();
		this.attachmentNo = attachmentNo;
		this.plaNo = plaNo;
		this.orImg = orImg;
		this.reImg = reImg;
		this.attachDate = attachDate;
	}

	public int getAttachmentNo() {
		return attachmentNo;
	}

	public void setAttachmentNo(int attachmentNo) {
		this.attachmentNo = attachmentNo;
	}

	public int getPlaNo() {
		return plaNo;
	}

	public void setPlaNo(int plaNo) {
		this.plaNo = plaNo;
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

	public Date getAttachDate() {
		return attachDate;
	}

	public void setAttachDate(Date attachDate) {
		this.attachDate = attachDate;
	}

	@Override
	public String toString() {
		return "PlaceAttachment [attachmentNo=" + attachmentNo + ", plaNo=" + plaNo + ", orImg=" + orImg + ", reImg="
				+ reImg + ", attachDate=" + attachDate + "]";
	}
	
	
}
