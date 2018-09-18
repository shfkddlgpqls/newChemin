package com.kh.chemin.mall.model.service;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.chemin.mall.model.dao.DetailsDao;
import com.kh.chemin.mall.model.vo.Product;
import com.kh.chemin.mall.model.vo.QnA_board;
import com.kh.chemin.mall.model.vo.Review;

@Service
public class DetailsServiceImpl implements DetailsService 
{
	@Autowired
	DetailsDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
		//상품 상세내역 
		@Override
		   public Product selectProduct(int pno) 
		{
		      return dao.selectProduct(sqlSession, pno);
		}
	
		//문의하기 insert
		@Override
		public int insertQna(Map<String, String> map) 
		{
			return dao.insertQna(sqlSession,map);
		}

		//문의게시판 출력
		@Override
		public List<Map<String, String>> selectQnAList(int no) 
		{
			return dao.selectQnAList(sqlSession, no);
		}

		//문의게시판 총 갯수 출력
		@Override
		public int selectQnACount(int pno) 
		{
			return dao.selectQnACount(sqlSession,pno);
		}
		
		

		@Override
		public int selectReviewCount(int pno) 
		{
			return dao.selectReviewCount(sqlSession,pno);
		}

		@Override
		public List<QnA_board> selectQnaBoardList(int cPage, int numPerPage, int pno) 
		{
			return dao.selectQnaBoardList(sqlSession,cPage,numPerPage,pno);
		}

		@Override
		public List<Review> selectReviewList(int cPage, int numPerPage, int pno) 
		{
			return dao.selectReviewList(sqlSession,cPage,numPerPage,pno);
		}
		
		
		
		
}
