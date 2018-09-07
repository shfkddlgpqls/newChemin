package com.kh.chemin.map.model.vo;

public class PlaceMenu {
	private int menuNo;
	private int plaNo;
	private String menuName;
	private String menuPrice;
	private String menuCheck;
	
	public PlaceMenu() {}

	public int getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}

	public int getPlaNo() {
		return plaNo;
	}

	public void setPlaNo(int plaNo) {
		this.plaNo = plaNo;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuPrice() {
		return menuPrice;
	}

	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}

	public String getMenuCheck() {
		return menuCheck;
	}

	public void setMenuCheck(String menuCheck) {
		this.menuCheck = menuCheck;
	}

	@Override
	public String toString() {
		return "PlaceMenu [menuNo=" + menuNo + ", plaNo=" + plaNo + ", menuName=" + menuName + ", menuPrice="
				+ menuPrice + ", menuCheck=" + menuCheck + "]";
	}
}
