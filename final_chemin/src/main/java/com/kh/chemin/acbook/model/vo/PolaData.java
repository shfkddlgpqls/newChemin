package com.kh.chemin.acbook.model.vo;

public class PolaData {
	
	private String acDate;
	private String acSum;
	
	public PolaData() {}

	public PolaData(String acDate, String acSum) {
		super();
		this.acDate = acDate;
		this.acSum = acSum;
	}

	public String getAcDate() {
		return acDate;
	}

	public void setAcDate(String acDate) {
		this.acDate = acDate;
	}

	public String getAcSum() {
		return acSum;
	}

	public void setAcSum(String acSum) {
		this.acSum = acSum;
	}

	@Override
	public String toString() {
		return "PolaData [acDate=" + acDate + ", acSum=" + acSum + "]";
	}
	
	

}
