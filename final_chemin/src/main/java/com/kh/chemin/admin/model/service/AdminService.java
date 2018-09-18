package com.kh.chemin.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.chemin.mall.model.vo.Product;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface AdminService {
	List<Place> adminPlaceList();
	List<PlaceAttachment> selectAttachList(int plaNo);
	List<PlaceMenu> selectMenuList(int plaNo);
	int placeDelete(int plaNo);
	int plaStatusChange(Map map);
	int adminReMsg(Map map);
	int selectProductCount(Map<String, Object> map);
	List<Map<String, Object>> selectProductList(Map<String, Object> map, int cPage, int numPerPage);
	List<Map<String, String>> selectMallCate();
	int selectMaxPno();
	int insertProduct(Product product);
	int productDelete(int pno);
	Product selectProduct(int pno);
	int updateProduct(Product product);
	List<String> productAuto(String search);
	List<Map<String, Object>> selectOrderList(int cPage, int numPerPage);
	List<Map<String, Object>> selectOrderData();
	int selectTotalCount();
}
