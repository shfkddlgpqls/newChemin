<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

 <!-- 마이페이지 css-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/base/css/mypage.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    
 
<script>
	function fn_delete() 
	{
		confirm("삭제하시겠습니까?");
	}
</script>   
    

	<div class="mypage">
		<h2 class="text-center">마이페이지 입니당</h2>
	</div>
		
		<div class="container">
		<div class="row">
			
				<div class="col-md-12">
					<hr>
						<ul class="nav justify-content-center">
						    <li class="nav-item">
						      <strong><a class="nav-link mypageAtag" href="${path }/mypage/myOrderList.do">주문 목록	</a></strong>
						    </li>
						    <li class="nav-item">
						      <strong><a class="nav-link mypageAtag" href="${path }/mypage/myBoardList.do">게시글 관리</a></strong>
						    </li>
						    <li class="nav-item">
						      <strong><a class="nav-link mypageAtag" href="${path }/mypage/myShoppingCart.do">장바구니</a></strong>
						    </li>
						    <li class="nav-item">
						   		<strong><a class="nav-link mypageAtag" href="${path }/mypage/myWishList.do">찜 목록</a></strong>
						    </li>
						    <li class="nav-item">
						   		<strong><a class="nav-link mypageAtag" href="${path }/mypage/myPlaceList.do?userId=hyebeen">장소 등록 내역</a></strong>
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
		  		<h3>찜 목록</h3>
		  		<br>
		  	</div>		
		  		<div class="table-responsive">
	   			 <table id="review" class="table">
				      <thead>
				        <tr>
				          <th>상품(사진)</th>
				          <th>상품(이름)</th>
				          <th>금액</th>
				         <th></th>
				        </tr>
				      </thead>
				      
				      <tbody>
				        <tr>
				        	<td></td>
				        	<td>바나나</td>
				        	<td>8,000원</td>
				        	
				        	<td>
				        		<button type="button" class="btn btn-sm btn-success">장바구니에 추가</button>
				        		<button type="button" class="btn btn-sm btn-danger"  onclick="fn_delete();">삭제</button>
				        	</td>
				        </tr>    
				     </tbody>
				  </table>
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
		  	</div>
		  	
		  	  <div class="col-md-1"></div>  
		</div> 	
		</div>
		</section> 
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  