package com.kh.chemin.mall.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.mall.model.vo.Product;

@Repository
public class DetailsDaoImpl implements DetailsDao 
{
		//상품 정보 
		@Override
		 public Product selectProduct(SqlSessionTemplate sqlSession, int pno) 
		 {
		      return sqlSession.selectOne("details.selectProduct", pno);
		 }
		
		//문의사항 insert
		@Override
		public int insertQna(SqlSessionTemplate sqlSession, Map<String, String> map) 
		{
			return sqlSession.insert("details.insertQna", map);
		}

		//문의사항 게시판 출력
		@Override
		public List<Map<String, String>> selectQnAList(SqlSessionTemplate sqlSession, int no) 
		{
			return sqlSession.selectList("details.selectQnAList",no);
		}
		
		//문의게시판 총 갯수 출력
		@Override
		public int selectQnACount(SqlSessionTemplate sqlSession, int no) 
		{
			return sqlSession.selectOne("details.selectQnACount", no);
		}
}
