package com.kh.chemin.acbook.model.vo;



import org.springframework.format.annotation.DateTimeFormat;

public class AcBook {
	
	private int acNo;
	private String userId;
	private String acDate;
	private int typeNum;
	private String exCode;
	private String cateNum;
	private int acCost;
	private String memo;
	
	public AcBook() {}

	public AcBook(int acNo, String userId, String acDate, int typeNum, String exCode, String cateNum, int acCost,
			String memo) {
		super();
		this.acNo = acNo;
		this.userId = userId;
		this.acDate = acDate;
		this.typeNum = typeNum;
		this.exCode = exCode;
		this.cateNum = cateNum;
		this.acCost = acCost;
		this.memo = memo;
	}

	public int getAcNo() {
		return acNo;
	}

	public void setAcNo(int acNo) {
		this.acNo = acNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAcDate() {
		return acDate;
	}

	public void setAcDate(String acDate) {
		this.acDate = acDate;
	}

	public int getTypeNum() {
		return typeNum;
	}

	public void setTypeNum(int typeNum) {
		this.typeNum = typeNum;
	}

	public String getExCode() {
		return exCode;
	}

	public void setExCode(String exCode) {
		this.exCode = exCode;
	}

	public String getCateNum() {
		return cateNum;
	}

	public void setCateNum(String cateNum) {
		this.cateNum = cateNum;
	}

	public int getAcCost() {
		return acCost;
	}

	public void setAcCost(int acCost) {
		this.acCost = acCost;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "AcBook [acNo=" + acNo + ", userId=" + userId + ", acDate=" + acDate + ", typeNum=" + typeNum
				+ ", exCode=" + exCode + ", cateNum=" + cateNum + ", acCost=" + acCost + ", memo=" + memo + "]";
	}
	
	
	
	
	}
