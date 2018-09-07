package com.kh.chemin.mall.model.vo;

import java.sql.Date;

public class Product {
	private int pno;
	private int cno;
	private String pName;
	private String details;
	private String oriImg;
	private String reImg;
	private int price;
	private int pCount;
	private int sales;
	private Date pDate;
	
	public Product() {}

	public Product(int pno, int cno, String pName, String details, String oriImg, String reImg, int price, int pCount,
			int sales, Date pDate) {
		super();
		this.pno = pno;
		this.cno = cno;
		this.pName = pName;
		this.details = details;
		this.oriImg = oriImg;
		this.reImg = reImg;
		this.price = price;
		this.pCount = pCount;
		this.sales = sales;
		this.pDate = pDate;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getOriImg() {
		return oriImg;
	}

	public void setOriImg(String oriImg) {
		this.oriImg = oriImg;
	}

	public String getReImg() {
		return reImg;
	}

	public void setReImg(String reImg) {
		this.reImg = reImg;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getpCount() {
		return pCount;
	}

	public void setpCount(int pCount) {
		this.pCount = pCount;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	@Override
	public String toString() {
		return "Product [pno=" + pno + ", cno=" + cno + ", pName=" + pName + ", details=" + details + ", oriImg="
				+ oriImg + ", reImg=" + reImg + ", price=" + price + ", pCount=" + pCount + ", sales=" + sales
				+ ", pDate=" + pDate + "]";
	}
	
}
