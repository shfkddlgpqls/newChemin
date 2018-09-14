package com.kh.chemin.acbook.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class AcFile {
	
	private MultipartFile file;
	public MultipartFile getFile() {
		return file;
	}
	
	public void setFile(MultipartFile file) {
		this.file=file;
	}

}
