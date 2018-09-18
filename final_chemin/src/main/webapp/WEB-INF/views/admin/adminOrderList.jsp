<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/admin/adminMenuBar.jsp"/>

<!-- 마이페이지 css-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/base/css/adminPage.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
   
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/mall.css">

   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

   <script src="${path}/resources/base/js/jquery-1.11.3.min.js"></script>
   <script src="${path}/resources/base/js/star.js"></script>
     

    <style>
		.orderList {display:none;}
		.orderNo {display:table-row;}
		a {color:gray;}
	</style>
	<script>
		$(document).ready(function(){
			$(".orderNo a").click(function() {
			    $(this).parent().parent().nextUntil(".orderNo").toggle(500);
			    return false;
			});
		})	
	</script>
      
      <section>
      <div class="container">
      <div class="row">
        
        <div class="col-md-1"></div>
        
   
           <div class="col-md-10">
           
           <div>
              <h3>주문 목록 확인</h3>
              <br>
              <div class="test">
                  </div>
           </div>      
              <div class="table-responsive">
                <table id="review" class="table">
                	<colgroup>
                		<col width="20%">
                		<col width="10%">
                		<col width="40%">
                		<col width="15%">
                		<col width="15%">
                	</colgroup>
                  <thead>
                    <tr>
                      <th>주문 상세 번호</th>
                      <th>주문자</th>
                      <th>배송지 주소</th>
                      <th>결제액</th>
                      <th>주문일</th>
                    </tr>
                  </thead>

                 <tbody>
                 	<c:forEach items="${list }" var="od">
	                 	
	                    <tr class="orderNo">
	                       <td><a href="#">${od.ORDERNO }</a></td>
	                       <td>${od.USERID }</td>
	                       <td>${od.ORDERADDR }</td>
	                       <td><fmt:formatNumber value="${od.ALLPRICE }" type="currency"/></td>
	                       <td><fmt:formatDate value="${od.ODATE }" pattern="yy-MM-dd"/></td>
	                    </tr>
	                    
	                    <c:forEach items="${data }" var="d">
	                    	<c:if test="${od.ORDERNO eq d.ORDERNO }">
			                    <tr class="orderList">
			                    	<td></td>
			                    	<td>
							       		<div class="cart-img-product b-rad-4 o-f-hidden">
							            	<img src="${path}/resources/upload/productImg/${d.REIMG}" alt="IMG-PRODUCT" draggable="false">
							         	</div>
							       	</td>
			                    	<td>${d.PNAME }&nbsp;(${d.AMOUNT }개)</td>
							       	<td><fmt:formatNumber value="${d.TOTALPRICE }" type="currency"/></td>
							       	<td></td>
			                    </tr>
		                    </c:if>
	                    </c:forEach>
	                    
                    </c:forEach>
                 </tbody>
                 
              </table>
                </div>     
              <div class='row justify-content-center'>${pageBar }</div>
           </div>
           
             <div class="col-md-1"></div>  
      </div>    
   </div>
      
</section>
        
        

        
   
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  