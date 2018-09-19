<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>

    
	<div class="admin">
		<h2 class="text-center nanumFont" style="color:white">관리자 페이지 </h2>
	</div>
		
	
	<div class="container">
		<div class="row">
			
				<div class="col-md-12">
					<hr>
						<ul class="nav justify-content-center">
						    <li class="nav-item">
						      <strong><a class="nav-link adminAtag" href="${path }/admin/adminPage.do">회원 관리</a></strong>
						    </li>
						    <li class="nav-item">
						      <strong><a class="nav-link adminAtag" href="${path }/admin/adminPlaceList.do?plaStatus=N">장소 요청 내역</a></strong>
						    </li>
						    <li class="nav-item">
						      <strong><a class="nav-link adminAtag" href="${path }/admin/adminProductList.do">상품 관리</a></strong>
						    </li>
						    
						    <li class="nav-item">
						   		<strong><a class="nav-link adminAtag" href="${path }/admin/adminBoardManage.do">게시글 관리</a></strong>
						    </li>
						    
						    <li class="nav-item">
						   		<strong><a class="nav-link adminAtag" href="${path }/admin/adminReviewBoard.do">리뷰 관리</a></strong>
						    </li>
						  </ul>
						  <hr>
				</div>
			</div>	
		</div>