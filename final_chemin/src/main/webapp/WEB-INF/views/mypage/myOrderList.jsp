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
		  		<h3>주문 내역 확인</h3>
		  		<br>
		  	</div>		
		  		<div class="table-responsive">
	   			 <table id="review" class="table">
				      <thead>
				        <tr>
				          <th>주문 상세 번호</th>
				          <th>상품(사진)</th>
				          <th>상품(이름)</th>
				          <th>수량</th>
				          <th>총액</th>
				          <th>주문일</th>
				          <th></th>
				        </tr>
				      </thead>
				      
				      <tbody>
				        <tr>
				        	<td>20180901_111</td>
				        	<td></td>
				        	<td>바나나</td>
				        	<td>10</td>
				        	<td>80,000원</td>
				        	<td>2018.09.01</td>
				        	<td>
				        		<button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#review_modal">리뷰 작성</button>
				        		<button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#question_modal">문의하기 </button>
				        	</td>
				        </tr>   
				        
				        <tr>
				        	<td>20180901_111</td>
				        	<td></td>
				        	<td>바나나</td>
				        	<td>10</td>
				        	<td>80,000원</td>
				        	<td>2018.09.01</td>
				        	<td>
				        		<button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#review_modal">리뷰 작성</button>
				        		<button type="button" class="btn btn-sm btn-info"  data-toggle="modal" data-target="#question_modal">문의하기 </button>
				        	</td>
				        </tr> 
				        
				        <tr>
				        	<td>20180901_111</td>
				        	<td></td>
				        	<td>바나나</td>
				        	<td>10</td>
				        	<td>80,000원</td>
				        	<td>2018.09.01</td>
				        	<td>
				        		<button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#review_modal">리뷰 작성</button>
 								 <button type="button" class="btn btn-sm btn-info"  data-toggle="modal" data-target="#question_modal">문의하기 </button>
				        	</td>
				        </tr> 
				        
				        <tr>
				        	<td>20180901_111</td>
				        	<td></td>
				        	<td>바나나</td>
				        	<td>10</td>
				        	<td>80,000원</td>
				        	<td>2018.09.01</td>
				        	<td>
				        		<button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#review_modal">리뷰 작성</button>
				        		<button type="button" class="btn btn-sm btn-info"  data-toggle="modal" data-target="#question_modal">문의하기 </button>
				        	</td>
				        </tr> 
				        
				        <tr>
				        	<td>20180901_111</td>
				        	<td></td>
				        	<td>바나나</td>
				        	<td>10</td>
				        	<td>80,000원</td>
				        	<td>2018.09.01</td>
				        	<td>
				        		<button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#review_modal">리뷰 작성</button>
				        		<button type="button" class="btn btn-sm btn-info"  data-toggle="modal" data-target="#question_modal">문의하기 </button>
				        	</td>
				        </tr> 
				        
				        <tr>
				        	<td>20180901_111</td>
				        	<td></td>
				        	<td>바나나</td>
				        	<td>10</td>
				        	<td>80,000원</td>
				        	<td>2018.09.01</td>
				        	<td>
				        		<button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#review_modal">리뷰 작성</button>
				        		<button type="button" class="btn btn-sm btn-info"  data-toggle="modal" data-target="#question_modal">문의하기 </button>
				        	</td>
				        </tr> 
				     </tbody>
				  </table>
		   		 </div>  	
		  	</div>
		  	
		  	  <div class="col-md-1"></div>  
		</div> 	
		
		<!-- 리뷰하기 모달 -->
		 <!-- The Modal -->
		  <div class="modal fade" id="review_modal">
		    <div class="modal-dialog modal-dialog-centered">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title text-center">리뷰 작성</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		        
		         <div class="form-group row">
		      		 <div class="input-group col-6">
					      <div class="input-group-prepend">
					        <span class="input-group-text">제품 코드 </span>
					      </div>
					      <input type="text" class="form-control input-sm" placeholder="제품 코드" name="goods_code">
					  </div>
					  
					  <div class="input-group col-6">
					      <div class="input-group-prepend">
					        <span class="input-group-text">제품 이름</span>
					      </div>
					      <input type="text" class="form-control input-sm" placeholder="제품 이름" name="goods_name">
					  </div>
		         </div>
		         
		         <div class="col-12">
		         	<div class="form-group">
					  <textarea class="form-control" rows="5" id="review_content" placeholder="리뷰 내용을 입력해주세요"></textarea>
					</div>
		         </div>
		         
		         <div class="form-group row">
		      		 <div class="input-group col-12">
						   별점 : 
						 <div>   
							<ul class="user_star_rating">
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
							</ul>
						</div> 
					  </div>
		        </div>

			         
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-success">등록하기</button>
		          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        </div>
		        
		      </div>
		    </div>
		  </div>
		  </div>
		  <!-- 리뷰하기 모달 끝 -->
		  
		  <!-- 문의하기 모달 시작 -->
        <!-- The Modal -->
        <div class="modal fade" id="question_modal">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">문의하기</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              
              <!-- Modal body -->
              <div class="modal-body">
                  <div class="form-group row">
                   <div class="input-group col-6">
                     <div class="input-group-prepend">
                       <span class="input-group-text">제품 코드 </span>
                     </div>
                     <input type="text" class="form-control input-sm" placeholder="제품 코드" name="goods_code" readonly>
                 </div>
                 
                 <div class="input-group col-6">
                     <div class="input-group-prepend">
                       <span class="input-group-text">제품 이름</span>
                     </div>
                     <input type="text" class="form-control input-sm" placeholder="제품 이름" id="goods_name" name="goods_name" readonly>
                 </div>
               </div>
               
            <div class="row">
               <div class="col-md-6"> 
                  <select class="form-control" id="qna_option" onchange="fn_selectbox();">
                  
                    <option value="1">상품 문의 </option>
                    <option value="2">교환/환불</option>              
                    <option value="3">반품</option>
                    <option value="4">기타</option>
                  </select>
                  
          
               </div>
           
           <div class="col-md-6">
                  <div class="form-group">
                <input type="text" class="form-control" placeholder="좌측 문의유형 선택 " id="board_name" name="board_name" readonly>
               </div>
               </div>
               
               </div>
               
               <div class="col-12">
                  <div class="form-group">
                 <textarea class="form-control" rows="5" id="review_content" placeholder="문의 내용을 입력해주세요"></textarea>
               </div>
               </div>
               
              </div>
              
              <!-- Modal footer -->
              <div class="modal-footer">
                <button type="button" class="btn btn-success">등록하기</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
              
            </div>
          </div>
        </div>
        <!-- 문의하기 모달 끝 -->
		  
		  </div>
	
</section>

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