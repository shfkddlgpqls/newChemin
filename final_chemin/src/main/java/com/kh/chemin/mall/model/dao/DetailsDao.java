package com.kh.chemin.mall.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.mall.model.vo.Product;

public interface DetailsDao 
{
		//상품 정보 
		Product selectProduct(SqlSessionTemplate sqlSession, int pno);
	
		//문의사항 입력
		int insertQna(SqlSessionTemplate sqlSession, Map<String, String> map);

		//문의게시판 출력
		List<Map<String, String>> selectQnAList(SqlSessionTemplate sqlSession, int no);

		//문의게시판 총 갯수
		int selectQnACount(SqlSessionTemplate sqlSession, int no);
}
