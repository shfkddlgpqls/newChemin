package com.kh.chemin.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.chemin.member.model.vo.Member;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

   private Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      
      logger.debug("로그인 여부 체크하기!");
      Member loggedIn= (Member)request.getSession().getAttribute("memberLoggedIn");
      
      if(loggedIn==null)
      {
         logger.warn("로그인 안된 사용자 접속["+request.getRequestURI()+"]");
         request.setAttribute("msg", "로그인 후 이용 가능합니다.");
         request.setAttribute("loc", "/");
         
         request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
         return false; //더이상 넘어가면 안되기때문에 return값 false
      }
      return super.preHandle(request, response, handler); //항상 true값을 리턴함
   }

   
}