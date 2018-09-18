package com.kh.chemin.mall.model.service;

import java.util.List;
import java.util.Map;

import com.kh.chemin.mall.model.vo.Cart;
import com.kh.chemin.mall.model.vo.OrderDetail;
import com.kh.chemin.mall.model.vo.Product;

public interface MallService {

	Map<String, Object> selectMember(String userId);
	
	List<Product> selectCateList(Map<String, Object> map, int cPage, int numPerPage);

	int selectCateCount(Map<String, Object> map);

	Product selectProduct(int pno);

	int insertCart(Map<String, Object> map);

	Cart selectCartItem(Map<String, Object> map);

	int deleteOldCart();

	int updateAmount(Map<String, String> map);

	int deleteCart(Map<String, String> map);

	List<Map<String, Object>> selectCartList(String userId);

	int updateCartList(Map<String, String> map);

	int insertOrder(OrderDetail od);

	int updateCartNo(Map<String, String> map);

	List<Cart> selectCartOrder(Map<String, String> map);

	int updateProduct(Map<String, String> map);

	int selectCartCount(String userId);

	List<Map<String, Object>> selectProductCount(String userId);

	List<String> selectMainList();

	Map<String, Object> selectWishCk(Map<String, Object> map);

	int insertWish(Map<String, Object> map);

	int deleteWish(Map<String, Object> map);

}
