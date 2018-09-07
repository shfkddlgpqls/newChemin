package com.kh.chemin.mall.model.vo;

import java.sql.Date;

public class Cart {
	private int listNo;
	private String userId;
	private String orderNo;
	private int pno;
	private int amount;
	private String payYn;
	private int totalPrice;
	private Date cDate;
	
	public Cart() {}

	public Cart(int listNo, String userId, String orderNo, int pno, int amount, String payYn, int totalPrice,
			Date cDate) {
		super();
		this.listNo = listNo;
		this.userId = userId;
		this.orderNo = orderNo;
		this.pno = pno;
		this.amount = amount;
		this.payYn = payYn;
		this.totalPrice = totalPrice;
		this.cDate = cDate;
	}

	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getPayYn() {
		return payYn;
	}

	public void setPayYn(String payYn) {
		this.payYn = payYn;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	@Override
	public String toString() {
		return "Cart [listNo=" + listNo + ", userId=" + userId + ", orderNo=" + orderNo + ", pno=" + pno + ", amount="
				+ amount + ", payYn=" + payYn + ", totalPrice=" + totalPrice + ", cDate=" + cDate + "]";
	}
	
}
