package com.kh.chemin.mall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chemin.common.MallPageBar;
import com.kh.chemin.mall.model.service.MallService;
import com.kh.chemin.mall.model.vo.Cart;
import com.kh.chemin.mall.model.vo.OrderDetail;
import com.kh.chemin.mall.model.vo.Product;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@SessionAttributes(value = {"memberLoggedIn"})
@Controller
public class MallController 
{
	@Autowired
	MallService service;
	
	// 메인 쇼핑몰로 이동
	@RequestMapping("/mall/mainMall.do")
	public ModelAndView mainMall()
	{
		ModelAndView mv = new ModelAndView();

		mv.setViewName("mall/mainMall");
		
		return mv;
	}
	
	// 카테고리별 상품 리스트 불러오기
	@RequestMapping("/mall/mallList.do")
	public void mallList(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage, HttpServletResponse response, int cno, String searchType, String searchData, int lowValue, int highValue) throws Exception {
		String ctype=null;
		String stype_h=null;
		String stype_n=null;
		String stype_lv=null;
		String stype_hv=null;
		
		if(cno!=0) ctype="카테고리 분류";
		if(searchType.equals("hit")) stype_h="hit";
		if(searchType.equals("new")) stype_n="new";
		if(searchType.equals("low")) stype_lv="low";
		if(searchType.equals("high")) stype_hv="high";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ctype", ctype);
		map.put("cno", cno);
		map.put("stype_h", stype_h);
		map.put("stype_n", stype_n);
		map.put("stype_lv", stype_lv);
		map.put("stype_hv", stype_hv);
		map.put("searchData", searchData);
		map.put("lowValue", lowValue);
		map.put("highValue", highValue);

		int numPerPage = 8;
		
		List<Product> list = service.selectCateList(map, cPage, numPerPage);

		int totalCount = service.selectCateCount(map);

		String pageBar = MallPageBar.getPageMall(cPage, numPerPage, totalCount);

		JSONObject jsonRes = null;
		JSONArray jsonArr = new JSONArray();

		DecimalFormat df = new DecimalFormat("#,###,###");
		if(!list.isEmpty()) {
			for(Product p : list) {
				jsonRes = new JSONObject();
				jsonRes.put("pno",p.getPno());
				jsonRes.put("pName", p.getpName());
				jsonRes.put("reImg", p.getReImg());
				jsonRes.put("price", df.format(p.getPrice()));
				jsonRes.put("pCount", p.getpCount());
				jsonRes.put("sales", p.getSales());
				jsonRes.put("pDate", p.getpDate());
				jsonArr.add(jsonRes);
			}
		}
		jsonArr.add(pageBar);
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonArr);
	}
	
	// 상품 상세화면 이동
   @RequestMapping("/mall/detail.do")
   public ModelAndView mallDetail(ModelAndView mv, int no)
   {
      //해당 상품 리스트 보내기 
      Product p = service.selectProduct(no);
      
      mv.addObject("product",p);
      mv.setViewName("mall/productDetail");
      
      return mv;
   }
	
	// 장바구니에 데이터 추가
	@RequestMapping("/mall/cartAdd.do")
	public void cartAdd(HttpServletResponse response, String userId, int pno, int amount) throws Exception {
		// 상품 가져오기
		Product product = service.selectProduct(pno);
		int price = product.getPrice() * amount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("pno", product.getPno());
		map.put("amount", amount);
		map.put("totalPrice", price);
		map.put("orderNo", ""); // order폼으로 넘어갈 때 생성하기

		int result = 0;
		// 로그인 한 경우에만 장바구니에 넣기
		if(userId!=null && !userId.equals("")) {
			// 장바구니에 데이터 추가! (장바구니에 이미 담긴 경우 제외)
			Cart c = service.selectCartItem(map); // userId, pno, payYn이 n인 데이터 : 장바구니에 담긴 상태
			if(c==null) // 장바구니에 없으면
				result = service.insertCart(map);
			else // 장바구니에 있으면
				result = -1;
		}

		JSONArray jsonArr = new JSONArray();
		jsonArr.add(result);
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonArr);
	}

	// 장바구니 이동
	@RequestMapping("/mall/cartList.do")
	public String cartList() {
		// 구매 상태가 n이고 일주일 넘은 데이터 삭제해주기 (모든 회원)
		service.deleteOldCart();
		
		return "mall/cartList";
	}
	
	// 장바구니 리스트 출력
	@RequestMapping("/mall/cartProduct.do")
	public void cartProduct(HttpServletResponse response, String userId) throws Exception {
		List<Map<String, Object>> list = service.selectCartList(userId);
		
		JSONArray jsonArr = new JSONArray();
		jsonArr.add(list);
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonArr);
	}
	
	// 장바구니 수량 변경
	@RequestMapping("/mall/updateAmount.do")
	public void updateAmount(HttpServletResponse response, String userId, String pno, String amount) throws IOException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("pno", pno);
		map.put("amount", amount);
		
		int result = service.updateAmount(map);
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	// 장바구니 상품 삭제
	@RequestMapping("/mall/deleteCart.do")
	public void deleteCart(HttpServletResponse response, String userId, String pno) throws IOException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("pno", pno);
		
		int result = service.deleteCart(map);
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	// 주문서 폼 이동
	@RequestMapping("/mall/orderForm.do")
	public String orderForm(ModelAndView mv, Model model, String userId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
		String orderNo = sdf.format(new Date());
		int val1 = (int)(Math.random()*10);
		int val2 = (int)(Math.random()*10);
		int val3 = (int)(Math.random()*10);
		orderNo+="_"+val1+val2+val3;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("orderNo", orderNo);
		
		// orderNo 추가하기
		service.updateCartList(map);
		
		// 화면에 보여줄 데이터
		List<Map<String, Object>> list = service.selectCartList(userId);
		Map<String, Object> member = service.selectMember(userId);
		
		// 값 처리
		int totalPrice = 0;
		int delivery = 0;
		int allPrice = 0;
		for(int i=0; i<list.size(); i++)
			totalPrice+=Integer.parseInt(String.valueOf(list.get(i).get("TOTALPRICE")));
		if(totalPrice<50000)
			delivery=3000;
		allPrice = totalPrice+delivery;
		Map<String, String> pay = new HashMap<String, String>();
		pay.put("total", Integer.toString(totalPrice));
		pay.put("delivery", Integer.toString(delivery));
		pay.put("all", Integer.toString(allPrice));
		
		model.addAttribute("list", list);
		model.addAttribute("member", member);
		model.addAttribute("pay", pay);
		
		return "mall/orderForm";
	}
	
	// 결제완료
	@RequestMapping("/mall/orderConfirm.do")
	public String orderConfirm(ModelAndView mv, String userId, String orderNo, String orderName, String orderPhone, String zipcode, String orderAddr, String payment, int allPrice, String orderNote) {
		OrderDetail od = new OrderDetail(orderNo, orderName, orderPhone, zipcode, orderAddr, payment, allPrice, orderNote, null);
		
		// 주문 목록 등록
		int result = service.insertOrder(od);
		
		Map<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("orderNo", orderNo);
		// 장바구니 상품 구매로 변경, 재고 처리, 판매 개수 처리
		if(result>0) {
			service.updateCartNo(map);
			// 주문하려는 상품 가져오기
			List<Cart> list = service.selectCartOrder(map);
			for(int i=0;i<list.size();i++) {
				map.put("pno", Integer.toString(list.get(i).getPno()));
				service.updateProduct(map);
			}
		}
		
		return "mypage/myOrderList";
	}
	
	// 장바구니 상품 개수
	@RequestMapping("/mall/cartCount.do")
	public void cartCount(HttpServletResponse response, String userId) throws IOException {
		int result = service.selectCartCount(userId);
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	// 재고 확인
	@RequestMapping("/mall/productCount.do")
	public void productCount(HttpServletResponse response, String userId) throws IOException {
		List<Map<String, Object>> list = service.selectProductCount(userId);
		
		JSONArray jsonArr = new JSONArray();
		jsonArr.add(list);
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonArr);
	}
	
}
