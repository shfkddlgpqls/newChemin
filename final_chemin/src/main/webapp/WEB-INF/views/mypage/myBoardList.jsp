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
		  		<h3>게시글 관리</h3>
		  		<br>
		  	</div>		
		  	
		  	<div class="shadow-sm p-4 mb-4 bg-white">
				<h2>Q&A</h2>	
			</div>
		  	
		  		<div class="table-responsive">
	   			 <table id="q_a" class="table">
				      <thead>
				        <tr>
				          <th>글 번호</th>
				          <th>제목</th>
				          <th>작성일</th>
				          <th></th>
				         
				        </tr>
				      </thead>
				      
				      <tbody>
				        <tr>
				        	<td>1</td>
				        	<td>이 바나나 족보가 어떻게 되나요 어디 바 씨인가요</td>
				        	<td>2018.09.01</td>
				        	<td>
				        		<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#q_a_edit">수정</button>
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
		   		 
		  <div class="shadow-sm p-4 mb-4 bg-white">
				<h2>Review</h2>	
			</div>
		  	
		  		<div class="table-responsive">
	   			 <table id="review" class="table">
				      <thead>
				        <tr>
				          <th>글 번호</th>
				          <th>제목</th>
				          <th>작성일</th>
				          <th></th> 
				        </tr>
				      </thead>
				      
				      <tbody>
				        <tr>
				        	<td>1</td>
				        	<td>너무 맛있어요!! 노란색이 선명하네요.</td>
				        	<td>2018.09.01</td>
				        	<td>
				        		<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#edit">수정</button>
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
		  
	
		<!-- 리뷰 수정 하기 모달 -->
		 <!-- The Modal -->
		  <div class="modal fade" id="edit">
		    <div class="modal-dialog modal-dialog-centered">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title text-center">리뷰 수정</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		   
			          <div class="form-group row">
			      		 <div class="input-group col-12">
						      <div class="input-group-prepend">
						        <span class="input-group-text">글 제목 </span>
						      </div>
						      <input type="text" class="form-control " placeholder="글 제목" name="board_title">
						      <br>
						  </div>
						  </div>
			         
			         <div class="col-12">
			         	<div class="form-group">
						  <textarea class="form-control" rows="5" id="board_content" placeholder="글 내용"></textarea>
						</div>
			         </div>
			         
			         <!-- 만약에 카테고리가 리뷰면 이게 띄워지게 -->
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
			         
			         </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-success">등록하기</button>
		          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        </div>
		        
		      </div>
		   
		  </div>
		  </div>

		  
		  <!-- 수정 하기 모달 끝 -->
		  
		  	
</section>


 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  
    