<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- admin css-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/base/css/adminPage.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    
    
    
	<div class="admin">
		<h2 class="text-center">관리자 페이지 </h2>
	</div>
		
	
	<div class="container">
		<div class="row">
			
				<div class="col-md-12">
					<hr>
						<ul class="nav justify-content-center">
						    <li class="nav-item">
						      <strong><a class="nav-link adminAtag" href="${path }/admin/adminPage.do">회원관리</a></strong>
						    </li>
						    <li class="nav-item">
						      <strong><a class="nav-link adminAtag" href="${path }/admin/adminPlaceList.do">장소 요청 내역</a></strong>
						    </li>
						    <li class="nav-item">
						      <strong><a class="nav-link adminAtag" href="${path }/admin/adminProductReg.do">물품등록</a></strong>
						    </li>
						    <li class="nav-item">
						   		<strong><a class="nav-link adminAtag" href="${path }/admin/adminProductList.do">물품관리</a></strong>
						    </li>
						  </ul>
						  <hr>
				</div>
			</div>	
		</div>
		
		<section>
		<div class="container">
		<div class="row">
		  
		  <div class="col-md-1"></div>
		  
	
		  	<div class="col-md-10">
		  	
		  	<div>
		  		<h3>회원관리</h3>
		  		<br>
		  	</div>		
		  	
		  	</div>
		  	
		  	  <div class="col-md-1"></div>  
		</div> 	
		
		

	<div class="text-center">
				<ul class="pagination justify-content-center" >
					<li class="page-item">
						<a href="#" class="page-link" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					
					<li class="page-item"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item"><a href="#" class="page-link">3</a></li>
					<li class="page-item active"><a href="#" class="page-link">4</a></li>
					<li class="page-item"><a href="#" class="page-link">5</a></li>
					
					<li class="page-item">
					<a href="#" class="page-link" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
					</a>
					</li>
				</ul>
 	 	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  