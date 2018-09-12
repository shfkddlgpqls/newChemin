package com.kh.chemin.mall.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.mall.model.vo.Cart;
import com.kh.chemin.mall.model.vo.OrderDetail;
import com.kh.chemin.mall.model.vo.Product;

@Repository
public class MallDaoImpl implements MallDao {
	
	// 회원 정보
	@Override
	public Map<String, Object> selectMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("mall.selectMember", userId);
	}

	// 카테고리별 상품 리스트 가져오기
	@Override
	public List<Product> selectCateList(SqlSessionTemplate sqlSession, Map<String, Object> map, int cPage, int numPerPage) {
		return sqlSession.selectList("mall.selectCateList", map, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	// 상품 개수
	@Override
	public int selectCateCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("mall.selectCateCount", map);
	}

	// pno이용 상품 불러오기
	@Override
	public Product selectProduct(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("mall.selectProduct", pno);
	}

	// 장바구니 추가
	@Override
	public int insertCart(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("mall.insertCart", map);
	}

	// 장바구니의 상품 가져오기 (존재여부 확인)
	@Override
	public Cart selectCartItem(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("mall.selectCartItem", map);
	}

	// 오래된 장바구니 데이터 삭제
	@Override
	public int deleteOldCart(SqlSessionTemplate sqlSession) {
		return sqlSession.delete("mall.deleteOldCart");
	}

	// 장바구니 수량 변경
	@Override
	public int updateAmount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.update("mall.updateAmount", map);
	}

	// 장바구니 상품 삭제
	@Override
	public int deleteCart(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.delete("mall.deleteCart", map);
	}

	// 장바구니 데이터 가져오기
	@Override
	public List<Map<String, Object>> selectCartList(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("mall.selectCartList", userId);
	}

	// 장바구니에 orderNo 추가
	@Override
	public int updateCartList(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.update("mall.updateCartList", map);
	}

	// 주문목록 추가
	@Override
	public int insertOrder(SqlSessionTemplate sqlSession, OrderDetail od) {
		return sqlSession.insert("mall.insertOrder", od);
	}

	// 장바구니 구매 상태 y로 변경
	@Override
	public int updateCartNo(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.update("mall.updateCartNo", map);
	}

	// 주문하려는 상품 가져오기
	@Override
	public List<Cart> selectCartOrder(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectList("mall.selectCartOrder", map);
	}

	// 상품 재고, 판매현황 처리
	@Override
	public int updateProduct(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.update("mall.updateProduct", map);
	}

	// 장바구니 상품 개수
	@Override
	public int selectCartCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("mall.selectCartCount", userId);
	}

	// 재고 확인
	@Override
	public List<Map<String, Object>> selectProductCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("mall.selectProductCount", userId);
	}

}
