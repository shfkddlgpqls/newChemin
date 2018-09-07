<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- 상세보기 css-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/base/css/mall.css">
     <script src="<c:url value="/resources/base/js/productDetail.js" />"></script>

<!--  <script type="text/javascript">  
        $(document).ready(function(){
            $("#review tr:odd").addClass("odd");
            $("#review tr:not(.odd)").hide();
            $("#review tr:first-child").show();
            
            $("#review tr.odd").click(function(){
                $(this).next("tr").toggle();
                $(this).find(".arrow").toggleClass("up");
            });
            //$("#report").jExpand();
        });
    </script>        
 -->
 
 <script>
 
 // 상품 정보를 장바구니에 넘기기 위해서 해당 상품 정보 전달 
 $(function () 
{
	 fn_qna(1); 
	 fn_review(1);	
	 
    $(".cart").click(function(){
       var amount =  $("#quantity_value").text();  
       var pno = $("#pNo").val();
       var pName = $("#goodsName").text();
       var userId = $("input:hidden[name=userId]").val();
       
       $.ajax({
          type:"get",
          url:"${path}/mall/cartAdd.do",
          data:{pno:pno,amount:amount,userId:userId},
          datatype:"json",
          success:function(data){
             if(data==1){
                swal
                ({
                   title: "["+pName+"] 추가",
                    text: "장바구니에 상품이 담겼습니다. 확인하러 go?!",
                    icon: "success",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willDelete) => {
                   if (willDelete) {
                      location.href="${path}/mall/cartList.do"; 
                   } else {
                      return;
                   }
                });
             } else if(data==0){
                swal("["+pName+"] 추가 실패", "장바구니에 상품 추가를 실패하였습니다.(로그인 후 이용하세용)", "error");
             } else {
                /* 상품이 이미 들어있는 경우 */
                swal
                ({
                   title: "["+pName+"] 존재",
                    text: "장바구니에 상품이 이미 존재합니다. 확인하러 go?!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willDelete) => {
                   if (willDelete) {
                      location.href="${path}/mall/cartList.do"; 
                   } else {
                      return;
                   }
                });
             }
          },
             error:function(jxhr,textStatus,error){
                console.log("productDetail ajax 실패 : "+jxhr+" "+textStatus+" "+error);
             }
       });
    });   
 });
   
   //찜 alert
   function fn_wishList() 
   {
      alert("해당 상품이 마이페이지 - 찜 목록에 정상적으로 담겼습니다. ");   
   };
   
   function fn_pwCheck() 
   {
   		var dbPW = $("pNo").val();
   		alert(dbPW);
   };
   
   
   //문의하기 모달에 문의 유형 카테고리 값 받기
   function fn_selectbox()
   {
       var target = $("#qna_option option:selected").val();
       
       if(target==1)
      {
          $("#board_name").val("상품 문의 글입니다.");
      }
       else if(target==2)
      {
          $("#board_name").val("교환 문의 글입니다.");
      }
       else if(target==3)
      {
          $("#board_name").val("환불 문의 글입니다.");
      }
       else if(target==4)
       {
           $("#board_name").val("반품 문의 글입니다.");
       }
       else 
      {
          $("#board_name").val("기타 문의 글입니다.");
      } 
   };
   
   //글 작성시 설정한 비밀번호 확인 창 띄워주기(pno에서 비밀번호로 바꿔주기)
   function fn_inputPw() 
   {
	   var pno = $("#pNo").val();
	  
	  	$("#pwCheck").modal();
		$('#pw_db').val(pno);	   	   
   };
   
   //글 작성시 설정한 비밀번호와 사용자가 지금 입력한 비밀번호가 맞는지 확인하는 함수
   function fn_pwConfirm() 
   {
	   var db_pw = $("#pw_db").val().trim();
	   var user_pw = $("#board_pw").val().trim();
	   
	   //숫자만 가려내는 정규표현식
	   regNumber = /^[0-9]*$/;
	   
	   //숫자가 아닌 문자 입력했을시에
	   if(!regNumber.test(user_pw))
	    {
		   alert("숫자만 입력하세요");
	       return;
	    }
	   //비밀번호가 4글자 미만일 때 : 4 숫자 바꿔줘야한다
	   else if(user_pw.length<4)
		{
			 alert("비밀번호는 4자리입니다. 숫자 4자리를 입력해주세요.");
		}
	   else
		{
		   if(db_pw==user_pw)
	 	   {
				alert("비밀번호가 일치합니다.");  
		   }
		   else
		   {
			   alert("비밀번호가 틀렸습니다. 다시 입력해주세요"); return;
		   }	   
		}	      
   };
   
   //입력하기 모달창에 제품 정보 넣어주기
   function fn_insertDetails() 
   {
	   var pno = $("#pNo").val();
	   var pName = $("#pName").val();
		  
	  	$("#question_modal").modal();
		$('#goods_code').val(pno);	  
		$('#goods_name').val(pName);
   }
   
   function fn_checkUserPw() 
   {
	  
	   var user_content = $("#qna_content").val().trim();
	   var user_pw = $("#user_input_pw").val().trim();
	   var cate_name = $("#board_name").val().trim();
	  
	   //숫자만 가려내는 정규표현식
	   regNumber = /^[0-9]*$/;
	   
	   if(cate_name.length==0)
	   {
		  alert("좌측의 문의 유형을 선택해주세요.");
		  return;
	   }	  
	   else if(user_content.length==0)
	   {
			alert("문의 내용을 입력해주세요");	 
			return;
	   }
	   //숫자가 아닌 문자 입력했을시
	   else if(!regNumber.test(user_pw))
	    {
		   alert("숫자만 입력하세요");
	       return;
	    }
	   //비밀번호가 4글자 미만일 때 : 4 숫자 바꿔줘야한다
	   else if(user_pw.length<4)
		{
			 alert("비밀번호는 4자리입니다. 숫자 4자리를 입력해주세요.");
			 return;
		}
	   else
	   {
		  $("#qnaFrm").submit();
	   }   
   };
   
   function fn_qna(cPage) 
   {
		//pno > var로 받기 ajax 	
   }
   
   function fn_review(cPage)
   {
	
   }
  
 </script>
 
 


<section>
<div class="container single_product_container">
      <div class="row">
         <div class="col-lg-7">
            <div class="single_product_pics">
               <div class="row">
                  <div class="col-lg-9 image_col order-lg-2 order-1">
                     <div class="single_product_image">
                           
                        <img src="${path}/resources/upload/productImg/${product.reImg }">
                     </div>
                  </div>
               </div>
            </div>
         </div> 

         <div class="col-lg-5">
            <div class="product_details">
               <div class="product_details_title">
               
                  <h2 id="goodsName">${product.pName }</h2>
                  <p id="goodsDetails">${product.details }</p>
                  
               </div>
               
               <!-- fmt tag : 원화 표시로 바꿔주기 -->
               <c:set var='price' value='${product.price }' />

               <div id="goodsPrice" class="product_price">         
                  <fmt:formatNumber value="${price }" type="currency"/>      
                       
                  <input type="hidden" id="pNo" name="pNo" value="${product.pno } ">
                  <input type="hidden" id="pName" name="pName" value="${product.pName } ">

              
               </div>
               <!-- 포맷팅 끝 -->
               
               
               <!-- <ul class="star_rating">
                  <li><i class="fa fa-star" aria-hidden="true"></i></li>
                  <li><i class="fa fa-star" aria-hidden="true"></i></li>
                  <li><i class="fa fa-star" aria-hidden="true"></i></li>
                  <li><i class="fa fa-star" aria-hidden="true"></i></li>
                  <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
               </ul> -->

               <div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
                  <span>수량</span>
                  <div class="quantity_selector">
                     <span class="minus"><i class="fa fa-minus" aria-hidden="true"></i></span>
                     <span id="quantity_value">1</span>
                     <span class="plus"><i class="fa fa-plus" aria-hidden="true"></i></span>
                  </div>
               </div> 
               
                <div style="margin-top:5%">
                <span><h7>해당 상품은 1인당 최대 10개까지 구매 가능합니다.</h7></span>
                </div> 
                
               <div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
                  <span style="margin-right:20px">공유하기</span>
                     <div>
                        <i class="fa fa-2x fa-instagram"  style="margin-right:10px" aria-hidden="true"></i>
                        <i class="fa fa-2x fa-facebook-official"  style="margin-right:10px" aria-hidden="true"></i>
                     </div>
               </div>

               <div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
                   <div class="red_button add_to_cart_button"><a href="#" class="cart">장바구니</a></div> 
                   <div class="product_favorite d-flex flex-column align-items-center justify-content-center" onclick="fn_wishList();"></div>      
            
               </div>
            
            </div>
         </div>
      </div>
   </div>
   
   <div class="container">
   
      <div class="shadow-sm p-4 mb-4 bg-white">
      <h2>Review</h2>   
         <h7>실제로 이 제품을 구입한 고객님들의 후기입니다.</h7>
      </div>

         <div class="table-responsive">
                <table id="review" class="table">
                  <thead>
                    <tr>
                      <th>글 번호</th>
                      <th>제목</th>
                      <th>작성자(이름)</th>
                      <th>별점</th>
                      <th>등록일</th>
                      <th></th>
                    </tr>
                  </thead>
                  
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>너무 맛있어요</td>
                      <td>원숭이</td>
                      <td>

                      </td>
                      <td>2018-08-24</td>
                      <td><button type="button" class="btn btn-danger">삭제</button></td>   
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
        
        <hr>
        
     <div class="shadow-sm p-4 mb-4 bg-white">
      <h2>Q&A</h2>   
         <h7>상품에 대한 문의사항이 있다면 알려주세요.</h7><br>
          <h7>본인이 작성한 글의 제목을 클릭하면 작성한 내용을 볼 수 있습니다.</h7>
      </div>
      
         <div class="table-responsive">
                <table id="review" class="table">
                  <thead>
                  
                    <tr>
                      <th class="text-center">글 번호</th>
                      <th class="text-center">카테고리</th>
                      <th class="text-center">제목</th>
                      <th class="text-center">내용</th>     
                      <th class="text-center">관리자 답변</th>     
                      <th class="text-center">작성자(이름)</th>            
                      <th class="text-center">등록일</th>
                      <th class="text-center">답변 상태</th>
                      <th class="text-center"></th>
                    </tr>
                  </thead>
                  
                  <tbody>
                  
                   <c:forEach items="${qList }" var="q">
	                    <tr>
	                      <td class="text-center">${q.QNANO }</td>
	                      <td class="text-center">
	                      
	                      <c:set var="cate" value="${q.QNA_CATE_NO }" />
	                      
		                      <c:choose>        
		                      
		                      	<c:when test="${cate==1 }">
		                      		상품 문의
		                      	</c:when>
		                      	
		                      	<c:when test="${cate==2 }">
		                      		교환 문의
		                      	</c:when>
		                      	
		                      	<c:when test="${cate==3 }">
		                      		환불 문의
		                      	</c:when>
		                      	
		                      	<c:when test="${cate==4 }">
		                      		반품 문의
		                      	</c:when>
		                      	
		                      	<c:when test="${cate==5 }">
		                      		기타 문의
		                      	</c:when>
		                      
		                      </c:choose>
	                      
	                      </td>
	                      <td class="text-center"><a onclick="fn_inputPw(this); return false;" data-no="${product.pno }" >${q.QNATITLE }</a></td>
	                      <td class="text-center">${q.QNACONTENT }</td>
	                      <td class="text-center">${q.QNAREPLY }</td>
	                      <td class="text-center">${q.USERID }</td>           
	                      <td class="text-center">
	                                         	
	                      <fmt:formatDate type="date" value="${q.QNADATE }"/>	
	                      
	                      </td>
	                      <td class="text-center">               
	      
	      				 <c:set var="reply" value="${q.QNAREPLY }" />
	      				 
	                      <c:choose>	                      	
		                      	<c:when test="${!reply==null }">
		                      		<span class="badge badge-secondary">답변 완료</span>
		                      	</c:when>
		                      	
		                      	<c:when test="${reply==null }">
		                      		<span class="badge badge-light">답변 대기</span>
		                      	</c:when>	
	                      </c:choose>
                         
                      </td>
                      
                       <!--   만약에 아이디가 관리자라면 
                      <td class="text-center"><button type="button" class="btn btn-danger">삭제</button></td>    -->
                   
                    </tr>
                    </c:forEach>
             
                    
                 </tbody>
                 
                 
          </table>
          </div>
          
          <div class="text-center">
         
          <button type="button" class="btn btn-default" onclick="fn_insertDetails();" style="margin-left:90%">글 쓰기</button>
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
        
        
          <!-- 문의하기 비밀번호 입력창 -->
	<div class="modal fade" id="pwCheck">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
	              <div class="col-12">
					글 작성시 입력했던 비밀번호 4자리를 입력해주세요.
				  </div>
				  
				  <br>
					
					<div class="col-12">
					<input type="text" name="pw_db" id="pw_db" value=""/>
					 <input type="text" name="board_pw" id="board_pw" class="form-control" maxlength="4"/>
					</div>
        </div>    
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" onclick="fn_pwConfirm()" >hidden value 확인</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
        <!-- 비밀번호 입력 창 끝 -->
        

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
<form action="${path }/mall/insert.do" id="qnaFrm" name="qnaFrm">              
              <div class="modal-body">
                  <div class="form-group row">
                   <div class="input-group col-6">
                     <div class="input-group-prepend">
                    
                       <span class="input-group-text">제품 코드 </span>
                     </div>
                     <input type="text" class="form-control input-sm" placeholder="제품 코드" id="goods_code" name="goods_code" readonly>
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
                  <select class="form-control" id="qna_option" name="qna_option" onchange="fn_selectbox();">
        	        <option value="0" disabled selected>문의 유형 선택 </option>
                    <option value="1">상품 문의 </option>
                    <option value="2">교환 문의</option> 
                    <option value="3">환불 문의</option>             
                    <option value="4">반품 문의</option>
                    <option value="5">기타 문의 </option>
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
                 <textarea class="form-control" rows="5" id="qna_content" name="qna_content" placeholder="문의 내용을 입력해주세요" required></textarea>
               </div>
               </div>
               
               <div class="input-group col-12">
                     <div class="input-group-prepend">
                       <span class="input-group-text">비밀번호 설정(숫자 4자리)</span>
                     </div>
                     <input type="text" class="form-control input-sm" placeholder="비밀번호 4자리 입력" id="user_input_pw" name="user_input_pw" maxlength="4" />
                 </div>
               
               <!-- userId들어가는 부분 -->
			   <!-- <input type="hidden" name="userId" id="userId" value="user"/> -->
			    <input type="hidden" id="userId" name="userId" value="${memberLoggedIn.userId }"> 
                
              </div>
              
              <!-- Modal footer -->
              <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="fn_checkUserPw();">등록하기</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
</form>              
            </div>
          </div>
        </div>
        <!-- 문의하기 모달 끝 -->
        

   
</section>



    
 
 
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  
 