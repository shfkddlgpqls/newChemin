package com.kh.chemin.acbook.model.vo;

public class AcCom {
	
	private int accNo;
	private String accDate;
	private int accCount;
	private String birthDay;
	private String userId;
	private String accTitle;
	private String editor;

	public AcCom() {}

	public AcCom(int accNo, String accDate, int accCount, String birthDay, String userId, String accTitle,
			String editor) {
		super();
		this.accNo = accNo;
		this.accDate = accDate;
		this.accCount = accCount;
		this.birthDay = birthDay;
		this.userId = userId;
		this.accTitle = accTitle;
		this.editor = editor;
	}

	public int getAccNo() {
		return accNo;
	}

	public void setAccNo(int accNo) {
		this.accNo = accNo;
	}

	public String getAccDate() {
		return accDate;
	}

	public void setAccDate(String accDate) {
		this.accDate = accDate;
	}

	public int getAccCount() {
		return accCount;
	}

	public void setAccCount(int accCount) {
		this.accCount = accCount;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAccTitle() {
		return accTitle;
	}

	public void setAccTitle(String accTitle) {
		this.accTitle = accTitle;
	}

	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	@Override
	public String toString() {
		return "AcCom [accNo=" + accNo + ", accDate=" + accDate + ", accCount=" + accCount + ", birthDay=" + birthDay
				+ ", userId=" + userId + ", accTitle=" + accTitle + ", editor=" + editor + "]";
	}
	
	
	
	
	
}
