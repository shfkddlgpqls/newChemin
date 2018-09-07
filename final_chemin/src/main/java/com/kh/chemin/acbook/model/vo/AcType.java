package com.kh.chemin.acbook.model.vo;

public class AcType {
	
	private int typeNum;
	private String typeName;
	
	public AcType() {};

	public AcType(int typeNum, String typeName) {
		super();
		this.typeNum = typeNum;
		this.typeName = typeName;
	}

	public int getTypeNum() {
		return typeNum;
	}

	public void setTypeNum(int typeNum) {
		this.typeNum = typeNum;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Override
	public String toString() {
		return "AcType [typeNum=" + typeNum + ", typeName=" + typeName + "]";
	};
	
	

}
