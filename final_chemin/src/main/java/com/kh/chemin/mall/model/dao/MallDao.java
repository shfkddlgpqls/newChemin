package com.kh.chemin.mall.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.mall.model.vo.Cart;
import com.kh.chemin.mall.model.vo.Product;

public interface MallDao {

	List<Product> selectCateList(SqlSessionTemplate sqlSession, Map<String, Object> map, int cPage, int numPerPage);

	int selectCateCount(SqlSessionTemplate sqlSession, Map<String, Object> map);

	Product selectProduct(SqlSessionTemplate sqlSession, int pno);

	int insertCart(SqlSessionTemplate sqlSession, Map<String, Object> map);

	Cart selectCartItem(SqlSessionTemplate sqlSession, Map<String, Object> map);

	int deleteOldCart(SqlSessionTemplate sqlSession);

	List<Map<String, Object>> selectCartList(SqlSessionTemplate sqlSession, String userId);

	

	

}
