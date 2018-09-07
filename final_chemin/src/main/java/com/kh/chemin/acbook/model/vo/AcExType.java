package com.kh.chemin.acbook.model.vo;

public class AcExType {
	
	private String exCode;
	private int exNum;
	private String exName;
	
	public AcExType() {}

	public AcExType(String exCode, int exNum, String exName) {
		super();
		this.exCode = exCode;
		this.exNum = exNum;
		this.exName = exName;
	}

	public String getExCode() {
		return exCode;
	}

	public void setExCode(String exCode) {
		this.exCode = exCode;
	}

	public int getExNum() {
		return exNum;
	}

	public void setExNum(int exNum) {
		this.exNum = exNum;
	}

	public String getExName() {
		return exName;
	}

	public void setExName(String exName) {
		this.exName = exName;
	}

	@Override
	public String toString() {
		return "AcExType [exCode=" + exCode + ", exNum=" + exNum + ", exName=" + exName + "]";
	}
	
	
	

}
