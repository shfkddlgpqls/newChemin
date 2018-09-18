package com.kh.chemin.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.mall.model.vo.Product;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Place> adminPlaceList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("admin.placeList");
	}

	@Override
	public List<PlaceAttachment> selectAttachList(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.selectList("admin.selectAttachList",plaNo);
	}

	@Override
	public List<PlaceMenu> selectMenuList(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.selectList("admin.selectMenuList",plaNo);
	}

	@Override
	public int placeDelete(SqlSessionTemplate sqlSession, int plaNo) {
		return sqlSession.delete("admin.placeDelete",plaNo);
	}

	@Override
	public int plaStatusChange(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.update("admin.plaStatusChange",map);
	}

	@Override
	public int adminReMsg(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.update("admin.adminReMsg",map);
	}

	@Override
	public int selectProductCount(SqlSessionTemplate sqlSession,Map<String, Object> map) {
		return sqlSession.selectOne("admin.selectProductCount",map);
	}

	@Override
	public List<Map<String, Object>> selectProductList(SqlSessionTemplate sqlSession, Map<String, Object> map, int cPage, int numPerPage) {
		return sqlSession.selectList("admin.selectProductList", map, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public List<Map<String, String>> selectMallCate(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("admin.selectMallCate");
	}

	@Override
	public int selectMaxPno(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectMapPno");
	}

	@Override
	public int insertProduct(SqlSessionTemplate sqlSession, Product product) {
		return sqlSession.insert("admin.insertProduct", product);
	}

	@Override
	public int productDelete(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.delete("admin.deleteProduct", pno);
	}

	@Override
	public Product selectProduct(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("admin.selectProduct", pno);
	}

	@Override
	public int updateProduct(SqlSessionTemplate sqlSession, Product product) {
		return sqlSession.update("admin.updateProduct", product);
	}

	@Override
	public List<String> productAuto(SqlSessionTemplate sqlSession, String search) {
		return sqlSession.selectList("admin.productAuto", search);
	}
	
	@Override
	public List<Map<String, Object>> selectOrderList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		return sqlSession.selectList("admin.selectOrderList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public List<Map<String, Object>> selectOrderData(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("admin.selectOrderdata");
	}

	@Override
	public int selectTotalCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectTotalCount");
	}

}
