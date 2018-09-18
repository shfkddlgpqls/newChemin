package com.kh.chemin.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.mall.model.vo.Product;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface AdminDao {
	List<Place> adminPlaceList(SqlSessionTemplate sqlSession);
	List<PlaceAttachment> selectAttachList(SqlSessionTemplate sqlSession, int plaNo);
	List<PlaceMenu> selectMenuList(SqlSessionTemplate sqlSession ,int plaNo);
	int placeDelete(SqlSessionTemplate sqlSession, int plaNo);
	int plaStatusChange(SqlSessionTemplate sqlSession, Map map);
	int adminReMsg(SqlSessionTemplate sqlSession, Map map);
	int selectProductCount(SqlSessionTemplate sqlSession, Map<String, Object> map);
	List<Map<String, Object>> selectProductList(SqlSessionTemplate sqlSession, Map<String, Object> map, int cPage, int numPerPage);
	List<Map<String, String>> selectMallCate(SqlSessionTemplate sqlSession);
	int selectMaxPno(SqlSessionTemplate sqlSession);
	int insertProduct(SqlSessionTemplate sqlSession, Product product);
	int productDelete(SqlSessionTemplate sqlSession, int pno);
	Product selectProduct(SqlSessionTemplate sqlSession, int pno);
	int updateProduct(SqlSessionTemplate sqlSession, Product product);
	List<String> productAuto(SqlSessionTemplate sqlSession, String search);
	List<Map<String, Object>> selectOrderList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	List<Map<String, Object>> selectOrderData(SqlSessionTemplate sqlSession);
	int selectTotalCount(SqlSessionTemplate sqlSession);
}
