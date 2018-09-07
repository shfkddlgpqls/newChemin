package com.kh.chemin.acbook.model.vo;

public class AcCategory {
	
	private int typeNum;
	private String cateNum;
	private String cateName;
	
	public AcCategory() {}

	public AcCategory(int typeNum, String cateNum, String cateName) {
		super();
		this.typeNum = typeNum;
		this.cateNum = cateNum;
		this.cateName = cateName;
	}

	public int getTypeNum() {
		return typeNum;
	}

	public void setTypeNum(int typeNum) {
		this.typeNum = typeNum;
	}

	public String getCateNum() {
		return cateNum;
	}

	public void setCateNum(String cateNum) {
		this.cateNum = cateNum;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	@Override
	public String toString() {
		return "AcCategory [typeNum=" + typeNum + ", cateNum=" + cateNum + ", cateName=" + cateName + "]";
	}
	
	

}
