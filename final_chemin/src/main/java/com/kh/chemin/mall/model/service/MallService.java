package com.kh.chemin.mall.model.service;

import java.util.List;
import java.util.Map;

import com.kh.chemin.mall.model.vo.Cart;
import com.kh.chemin.mall.model.vo.Product;

public interface MallService {

	List<Product> selectCateList(Map<String, Object> map, int cPage, int numPerPage);

	int selectCateCount(Map<String, Object> map);

	Product selectProduct(int pno);

	int insertCart(Map<String, Object> map);

	Cart selectCartItem(Map<String, Object> map);

	int deleteOldCart();

	List<Map<String, Object>> selectCartList(String userId);


}
