package com.kh.chemin.mall.model.service;

import java.util.List;
import java.util.Map;

import com.kh.chemin.mall.model.vo.Product;

public interface DetailsService 
{
		//상품 상세정보 불러오기
		Product selectProduct(int no);
		
		//문의사항 글 올리기 
		int insertQna(Map<String, String> map);

		//문의게시판 출력해오기
		List<Map<String, String>> selectQnAList(int no);

		//문의게시판 글의 총 갯수
		int selectQnACount(int no);
	
}
