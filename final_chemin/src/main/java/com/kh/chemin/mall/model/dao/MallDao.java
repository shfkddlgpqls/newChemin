package com.kh.chemin.mall.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.mall.model.vo.Cart;
import com.kh.chemin.mall.model.vo.OrderDetail;
import com.kh.chemin.mall.model.vo.Product;

public interface MallDao {

	Map<String, Object> selectMember(SqlSessionTemplate sqlSession, String userId);

	List<Product> selectCateList(SqlSessionTemplate sqlSession, Map<String, Object> map, int cPage, int numPerPage);

	int selectCateCount(SqlSessionTemplate sqlSession, Map<String, Object> map);

	Product selectProduct(SqlSessionTemplate sqlSession, int pno);

	int insertCart(SqlSessionTemplate sqlSession, Map<String, Object> map);

	Cart selectCartItem(SqlSessionTemplate sqlSession, Map<String, Object> map);

	int deleteOldCart(SqlSessionTemplate sqlSession);

	int updateAmount(SqlSessionTemplate sqlSession, Map<String, String> map);

	int deleteCart(SqlSessionTemplate sqlSession, Map<String, String> map);

	List<Map<String, Object>> selectCartList(SqlSessionTemplate sqlSession, String userId);

	int updateCartList(SqlSessionTemplate sqlSession, Map<String, String> map);

	int insertOrder(SqlSessionTemplate sqlSession, OrderDetail od);

	int updateCartNo(SqlSessionTemplate sqlSession, Map<String, String> map);

	List<Cart> selectCartOrder(SqlSessionTemplate sqlSession, Map<String, String> map);

	int updateProduct(SqlSessionTemplate sqlSession, Map<String, String> map);

	int selectCartCount(SqlSessionTemplate sqlSession, String userId);

	List<Map<String, Object>> selectProductCount(SqlSessionTemplate sqlSession, String userId);

}
