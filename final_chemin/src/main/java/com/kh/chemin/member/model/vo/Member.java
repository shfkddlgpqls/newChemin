package com.kh.chemin.member.model.vo;

import java.util.Arrays;
import java.util.Date;

public class Member {
	
	private String userId;
	private String password;
	private String userName;
	private String gender;
	private Date birthDay;
	private String email;
	private String phone;
	private String hobby;
	private String originalImg;
	private String renameImage;
	
	public Member() {}

	public Member(String userId, String password, String userName, String gender, Date birthDay,
			String email, String phone, String hobby, String originalImg, String renameImage) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.gender = gender;
		this.birthDay = birthDay;
		this.email = email;
		this.phone = phone;
		this.hobby = hobby;
		this.originalImg = originalImg;
		this.renameImage = renameImage;
	}

	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getOriginalImg() {
		return originalImg;
	}

	public void setOriginalImg(String originalImg) {
		this.originalImg = originalImg;
	}

	public String getRenameImage() {
		return renameImage;
	}

	public void setRenameImage(String renameImage) {
		this.renameImage = renameImage;
	}

	@Override
	public String toString() {
		return "Member [ userId=" + userId + ", password=" + password + ", userName=" + userName
				+ ", gender=" + gender + ", birthDay=" + birthDay + ", email=" + email + ", phone=" + phone + ", hobby="
				+ hobby + ", originalImg=" + originalImg + ", renameImage=" + renameImage + "]";
	}
}