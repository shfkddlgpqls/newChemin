package com.kh.chemin.mall.model.vo;

public class OrderDetail {
	private String orderNo;
	private String orderName;
	private String orderPhone;
	private String zipcode;
	private String orderAddr;
	private String payment;
	private int allPrice;
	private String orderNote;
	private String oDate;
	
	public OrderDetail() {}

	public OrderDetail(String orderNo, String orderName, String orderPhone, String zipcode, String orderAddr,
			String payment, int allPrice, String orderNote, String oDate) {
		super();
		this.orderNo = orderNo;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.zipcode = zipcode;
		this.orderAddr = orderAddr;
		this.payment = payment;
		this.allPrice = allPrice;
		this.orderNote = orderNote;
		this.oDate = oDate;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getOrderAddr() {
		return orderAddr;
	}

	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public int getAllPrice() {
		return allPrice;
	}

	public void setAllPrice(int allPrice) {
		this.allPrice = allPrice;
	}

	public String getOrderNote() {
		return orderNote;
	}

	public void setOrderNote(String orderNote) {
		this.orderNote = orderNote;
	}

	public String getoDate() {
		return oDate;
	}

	public void setoDate(String oDate) {
		this.oDate = oDate;
	}

	@Override
	public String toString() {
		return "OrderDetail [orderNo=" + orderNo + ", orderName=" + orderName + ", orderPhone=" + orderPhone
				+ ", zipcode=" + zipcode + ", orderAddr=" + orderAddr + ", payment=" + payment + ", allPrice="
				+ allPrice + ", orderNote=" + orderNote + ", oDate=" + oDate + "]";
	}
	
}
