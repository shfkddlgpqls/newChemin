package com.kh.chemin.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter {

   private Logger logger = LoggerFactory.getLogger(LoggerInterceptor.class);
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      if(logger.isDebugEnabled())
      {
         logger.debug("===================start===================");
         /*요청한 주소 잡기*/
         logger.debug(request.getRequestURI());
         logger.debug("-------------------------------------------");
      }
      
      return super.preHandle(request, response, handler);
   }

   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
         ModelAndView modelAndView) throws Exception {
      if(logger.isDebugEnabled())
      {
         /*응답뷰를 만드는 과정*/
         logger.debug("-------------------view maker-------------------");
         
      }
      super.postHandle(request, response, handler, modelAndView);
   }

   @Override
   public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
         throws Exception {
      
      if(logger.isDebugEnabled())
      {   
         //응답이 완전히 종료됨
         logger.debug("====================END=====================");
      }
      super.afterCompletion(request, response, handler, ex);
   }

   
}