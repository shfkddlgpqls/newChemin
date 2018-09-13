package com.kh.chemin.mall.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chemin.mall.model.dao.MallDao;
import com.kh.chemin.mall.model.vo.Cart;
import com.kh.chemin.mall.model.vo.OrderDetail;
import com.kh.chemin.mall.model.vo.Product;

@Service
public class MallServiceImpl implements MallService {
	@Autowired
	MallDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	// 회원 정보
	@Override
	public Map<String, Object> selectMember(String userId) {
		return dao.selectMember(sqlSession, userId);
	}

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

	// 장바구니 수량 변경
	@Override
	public int updateAmount(Map<String, String> map) {
		return dao.updateAmount(sqlSession, map);
	}

	// 장바구니 상품 삭제
	@Override
	public int deleteCart(Map<String, String> map) {
		return dao.deleteCart(sqlSession, map);
	}

	// 장바구니 데이터 가져오기
	@Override
	public List<Map<String, Object>> selectCartList(String userId) {
		return dao.selectCartList(sqlSession, userId);
	}

	// 장바구니에 orderNo 추가
	@Override
	public int updateCartList(Map<String, String> map) {
		return dao.updateCartList(sqlSession, map);
	}

	// 주문목록 추가
	@Override
	public int insertOrder(OrderDetail od) {
		return dao.insertOrder(sqlSession, od);
	}

	// 장바구니 구매 상태 y로 변경
	@Override
	public int updateCartNo(Map<String, String> map) {
		return dao.updateCartNo(sqlSession, map);
	}

	// 주문하려는 상품 가져오기
	@Override
	public List<Cart> selectCartOrder(Map<String, String> map) {
		return dao.selectCartOrder(sqlSession, map);
	}

	// 상품 재고, 판매현황 처리
	@Override
	public int updateProduct(Map<String, String> map) {
		return dao.updateProduct(sqlSession, map);
	}

	// 장바구니 상품 개수
	@Override
	public int selectCartCount(String userId) {
		return dao.selectCartCount(sqlSession, userId);
	}

	// 재고 확인
	@Override
	public List<Map<String, Object>> selectProductCount(String userId) {
		return dao.selectProductCount(sqlSession, userId);
	}

}
