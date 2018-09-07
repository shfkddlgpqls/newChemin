package com.kh.chemin.mall.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chemin.mall.model.dao.MallDao;
import com.kh.chemin.mall.model.vo.Cart;
import com.kh.chemin.mall.model.vo.Product;

@Service
public class MallServiceImpl implements MallService {
	@Autowired
	MallDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	// 카테고리별 상품 리스트 가져오기
	@Override
	public List<Product> selectCateList(Map<String, Object> map, int cPage, int numPerPage) {
		return dao.selectCateList(sqlSession, map, cPage, numPerPage);
	}

	// 상품 개수
	@Override
	public int selectCateCount(Map<String, Object> map) {
		return dao.selectCateCount(sqlSession, map);
	}

	// pno이용 상품 불러오기
	@Override
	public Product selectProduct(int pno) {
		return dao.selectProduct(sqlSession, pno);
	}

	// 장바구니 추가
	@Override
	public int insertCart(Map<String, Object> map) {
		return dao.insertCart(sqlSession, map);
	}

	// 장바구니의 상품 가져오기 (존재여부 확인)
	@Override
	public Cart selectCartItem(Map<String, Object> map) {
		return dao.selectCartItem(sqlSession, map);
	}

	// 오래된 장바구니 데이터 삭제
	@Override
	public int deleteOldCart() {
		return dao.deleteOldCart(sqlSession);
	}

	// 장바구니 데이터 가져오기
	@Override
	public List<Map<String, Object>> selectCartList(String userId) {
		return dao.selectCartList(sqlSession, userId);
	}

	
	
	
	
	


	
}
