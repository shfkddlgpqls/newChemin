<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
   <jsp:include page="/WEB-INF/views/admin/adminMenuBar.jsp"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- admin css-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/base/css/adminPage.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    
    
		
		<section>
		<div class="container">
		<div class="row">
		  
		  <div class="col-md-1"></div>
		  
	
		  	<div class="col-md-10">
		  	
		  	<div>
		  		<h3>물품등록</h3>
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