package com.kh.chemin.mall.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.chemin.common.MallPageBar;
import com.kh.chemin.mall.model.service.DetailsService;
import com.kh.chemin.mall.model.vo.Product;
import com.kh.chemin.mall.model.vo.QnA_board;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class DetailsController 
{
	@Autowired
	DetailsService service;
	
	private Logger logger = LoggerFactory.getLogger(DetailsController.class);

		// 상품 상세화면 이동
	/*	@RequestMapping("/mall/detail.do")
		public ModelAndView mallDetail(ModelAndView mv, int no)
		{
			//해당 상품 리스트 보내기 
			Product p = service.selectProduct(no);
			
			//리뷰게시판 불러오기
			
			//문의게시판 불러오기
			List<Map<String,String>> qList = service.selectQnAList(no);
			
			//문의게시판 갯수
			int qTotalCount = service.selectQnACount(no);
			
			System.out.println(qTotalCount);
			
		      
		    mv.addObject("product",p);
		    mv.addObject("qList", qList);
		    
		    logger.debug("문의게시판 값 출력 " +qList);
		    mv.setViewName("mall/productDetail");
		      
		    return mv;
		}
		*/
	
		//문의하기 등록
		@RequestMapping("/mall/insert.do")
		public String insertCart(String goods_code, String qna_option, String board_name, String qna_content, String userId, String user_input_pw,Model model)
		{	
			Map<String, String> map = new HashMap();
			
			map.put("USERID", userId);//
			map.put("QNAPW", user_input_pw);//
			map.put("PNO", goods_code);//
			map.put("QNA_CATE_NO", qna_option);//
			map.put("QNATITLE", board_name);//
			map.put("QNACONTENT", qna_content);//


			System.out.println(map);
			
			int result = service.insertQna(map);
			
			//메시지 출력
			String msg = "";
			String loc = "";
			
			if(result>0)
			{
				msg="문의 글이 성공적으로 등록되었습니다.";
			}
			else
			{
				msg = "문의 글 등록에 실패하였습니다. <br> 관리자에게 문의해보세요.";
			}
			
			loc="/";
			
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
				
			return "common/msg";
		}
		
		//맵핑값이 2개 메소드 만들기 
		/*data에 pno,cpage 쏴주고  > ajax
		 * cpage pno 받기 > 컨트롤러에서 받기 
		 * 게시판 리스트 받아오기 (리뷰/큐앤에이)
		 * list보낼 때 c,numper, 
		 * */
		
		//QnA 페이징 처리
		@RequestMapping(value="/mall/qnaPage.do",produces = "application/text; charset=utf8")
		@ResponseBody
		public String qnaPaging(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,  int pno) throws Exception 
		{
			int numPerPage= 4;
			Map<String, Object> map = new HashMap<String, Object>();
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = null;
			List<QnA_board> list = service.selectQnaBoardList(cPage,numPerPage,pno);	
			//관리자 list를 따로 불러오기
			
			//문의게시판  글 갯수
			int qTotalCount = service.selectQnACount(pno);
			
			//페이지바
			String qnaPageBar = MallPageBar.getQnaPage(cPage, numPerPage, qTotalCount);
			
			System.out.println("list 값"+list);
			System.out.println("qTotalCount 값"+qTotalCount);
			System.out.println("qnaPageBar"+qnaPageBar);
				
			//json
		/*	JSONObject jsonRes = null;
		    JSONArray jsonArr = new JSONArray();*/
//		    Map map=new HashMap();
//		    map.put("list", list);
			
		  
		    
			map.put("list", list);
			map.put("pageBar", qnaPageBar);
		   /* ModelAndView mv=new ModelAndView();
		    mv.addObject("list",list);
		    mv.setViewName("jsonView");
		    mv.addObject("pageBar",qnaPageBar);*/

			jsonStr = mapper.writeValueAsString(map);
			return jsonStr;
		    
		}	
		
}
