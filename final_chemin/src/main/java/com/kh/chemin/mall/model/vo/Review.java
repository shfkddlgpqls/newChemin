package com.kh.chemin.mall.model.vo;

public class Review 
{
	private int reNO;                     
	private String userId;      
	private int pno;          
	private String reContent;
	private String orImg;       
	private String reImg;       
    private String stars;     
    private String reDate;
    private String pname;
    
    public Review() {}

	public Review(int reNO, String userId, int pno, String reContent, String orImg, String reImg, String stars,
			String reDate,String pname) {
		super();
		this.reNO = reNO;
		this.userId = userId;
		this.pno = pno;
		this.reContent = reContent;
		this.orImg = orImg;
		this.reImg = reImg;
		this.stars = stars;
		this.reDate = reDate;
		this.pname = pname;
	}

	public int getReNO() {
		return reNO;
	}

	public void setReNO(int reNO) {
		this.reNO = reNO;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
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

	public String getStars() {
		return stars;
	}

	public void setStars(String stars) {
		this.stars = stars;
	}

	public String getReDate() {
		return reDate;
	}

	public void setReDate(String reDate) {
		this.reDate = reDate;
	}
	
	

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	@Override
	public String toString() {
		return "Review [reNO=" + reNO + ", userId=" + userId + ", pno=" + pno + ", reContent=" + reContent + ", orImg="
				+ orImg + ", reImg=" + reImg + ", stars=" + stars + ", reDate=" + reDate + ", pname=" + pname + "]";
	}

    
    
    
}
