package com.kh.chemin.community.model.vo;

public class Attachment {

	private int attachment_no;
	private int community_no;
	private String original_filename;
	private String renamed_filename;
	
	public Attachment() {}

	public Attachment(int attachment_no, int community_no, String original_filename, String renamed_filename) {
		super();
		this.attachment_no = attachment_no;
		this.community_no = community_no;
		this.original_filename = original_filename;
		this.renamed_filename = renamed_filename;
	}

	public int getAttachment_no() {
		return attachment_no;
	}

	public void setAttachment_no(int attachment_no) {
		this.attachment_no = attachment_no;
	}

	public int getCommunity_no() {
		return community_no;
	}

	public void setCommunity_no(int community_no) {
		this.community_no = community_no;
	}

	public String getOriginal_filename() {
		return original_filename;
	}

	public void setOriginal_filename(String original_filename) {
		this.original_filename = original_filename;
	}

	public String getRenamed_filename() {
		return renamed_filename;
	}

	public void setRenamed_filename(String renamed_filename) {
		this.renamed_filename = renamed_filename;
	}

	@Override
	public String toString() {
		return "Attachment [attachment_no=" + attachment_no + ", community_no=" + community_no + ", original_filename="
				+ original_filename + ", renamed_filename=" + renamed_filename + "]";
	}
	
	
}
