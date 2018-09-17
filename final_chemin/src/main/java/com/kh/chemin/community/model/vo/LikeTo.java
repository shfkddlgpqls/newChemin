package com.kh.chemin.community.model.vo;

public class LikeTo {

	private int like_no;
	private int community_no;
	private String like_id;
	private int like_check;
	private int like_count;
	
	public LikeTo() {}

	public LikeTo(int like_no, int community_no, String like_id, int like_check, int like_count) {
		super();
		this.like_no = like_no;
		this.community_no = community_no;
		this.like_id = like_id;
		this.like_check = like_check;
		this.like_count = like_count;
	}

	public int getLike_no() {
		return like_no;
	}

	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}

	public int getCommunity_no() {
		return community_no;
	}

	public void setCommunity_no(int community_no) {
		this.community_no = community_no;
	}

	public String getLike_id() {
		return like_id;
	}

	public void setLike_id(String like_id) {
		this.like_id = like_id;
	}

	public int getLike_check() {
		return like_check;
	}

	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	@Override
	public String toString() {
		return "LikeTo [like_no=" + like_no + ", community_no=" + community_no + ", like_id=" + like_id
				+ ", like_check=" + like_check + ", like_count=" + like_count + "]";
	}

	
}
