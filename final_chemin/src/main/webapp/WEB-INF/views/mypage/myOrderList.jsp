<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/mypage/myMenuBar.jsp"/>

<!-- 마이페이지 css-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/base/css/mypage.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
   
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/mall.css">

   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

   <script src="${path}/resources/base/js/jquery-1.11.3.min.js"></script>
   <script src="${path}/resources/base/js/star.js"></script>
   
   <style>
   .image-preview-input 
    {
         position: relative;
            overflow: hidden;
          margin: 0px;    
          color: #333;
           background-color: #fff;
          border-color: #ccc;    
   }
   .image-preview-input input[type=file] 
   {
      position: absolute;
      top: 0;
         right: 0;
      margin: 0;
      padding: 0;
      font-size: 20px;
      cursor: pointer;
      opacity: 0;
      filter: alpha(opacity=0);
   }
   .image-preview-input-title 
   {
       margin-left:2px;
   }
   </style>
               
   <script>
   //파일 업로드
    $(document).on('click', '#close-preview', function()
       { 
           $('.image-preview').popover('hide');
           // Hover befor close the preview
           $('.image-preview').hover(
               function () {
                  $('.image-preview').popover('show');
               }, 
                function () {
                  $('.image-preview').popover('hide');
               }
           );    
       });
       $(function() {
          
           // Create the close button
           var closebtn = $('<button/>', {
               type:"button",
               text: 'x',
               id: 'close-preview',
               style: 'font-size: initial;',
           });
           closebtn.attr("class","close pull-right");
           // Set the popover default content
           $('.image-preview').popover({
               trigger:'manual',
               html:true,
               title: "<strong>미리보기</strong>"+$(closebtn)[0].outerHTML,
               content: "선택된 이미지 없음",
               placement:'bottom'
           });
           // Clear event
           $('.image-preview-clear').click(function(){
               $('.image-preview').attr("data-content","").popover('hide');
               $('.image-preview-filename').val("");
               $('.image-preview-clear').hide();
               $('.image-preview-input input:file').val("");
               $(".image-preview-input-title").text("찾아보기"); 
           }); 
           // Create the preview image
           $(".image-preview-input input:file").change(function (){     
               var img = $('<img/>', {
                   id: 'dynamic',
                   width:250,
                   height:200
               });      
               var file = this.files[0];
               var reader = new FileReader();
               // Set preview image into the popover data-content
               reader.onload = function (e) {
                   $(".image-preview-input-title").text("변경하기");
                   $(".image-preview-clear").show();
                   $(".image-preview-filename").val(file.name);            
                   img.attr('src', e.target.result);
                   $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
               }        
               reader.readAsDataURL(file);
           });  
       });
      
   
     function review_validate() 
    {
        // 제품 번호, 제품 이름 > 오더리스트에서 받아서 넣어주기
       var pno = $("#pno").val();
       var userId = $("#userId").val();
       
        var content = $("#reContent").val().trim();
        var star =  $('input[name="star-input"]:checked').val();
        
        //별점을 input에다가 넣기
        $('#stars').val(별); 
        
       
       //리뷰 내용에 아무것도 안 적었을 때
       if(content.length==0)
       {
          alert("내용을 입력해주세요.");
          
          return false;
       }   
       else
       {
           $("#reviewFrm").submit(); 
          return true;
       }   
       
     } 
     
     function fn_review(no) { 
  	   var modal_input = $("#goods_name").val(no);
  	}
     
   </script>            

    <style>
		.orderList {display:none;}
		.orderNo {display:table-row;}
		#orderNo {color:gray;}
		a{color:black;}
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
              <h3>주문 내역 확인</h3>
              <br>
              <div class="test">
                  </div>
           </div>      
              <div class="table-responsive">
                <table id="review" class="table">
                	<colgroup>
                		<col width="18%">
                		<col width="14%">
                		<col width="40%">
                		<col width="13%">
                		<col width="15%">
                	</colgroup>
                  <thead>
                    <tr>
                      <th>주문 상세 번호</th>
                      <th>수령자</th>
                      <th>배송지 주소</th>
                      <th>결제액</th>
                      <th>주문일</th>
                    </tr>
                  </thead>

                 <tbody>
                 	<c:forEach items="${list }" var="od">
	                 	
	                    <tr class="orderNo">
	                       <td><a id="orderNo" href="#">${od.ORDERNO }</a></td>
	                       <td>${od.ORDERNAME }</td>
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
							       	<td><button class="btn btn-sm btn-warning" onclick="fn_review(${d.PNO })" data-toggle="modal" data-target="#review_modal">리뷰 작성</button></td>
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
		<form action="${path }/mypage/review.do" id="reviewFrm" name="reviewFrm" method="post" enctype="multipart/form-data">              
              <div class="modal-body">
               <div class="form-group row">
                   <div class="input-group col-6">
                     <div class="input-group-prepend">
                       <span class="input-group-text">제품 코드 </span>
                     </div>
                     <input type="text" class="form-control input-sm" placeholder="제품 코드" name="goods_code" id="goods_code">
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
                  <input type="hidden" id="userId" name="userId" value="${memberLoggedIn.userId }"> 
               
               <!-- 주문 번호 생성되면 이거 바꿔주기 -->
               <input type="hidden" id="pno" name="pno" value="101"> 
               <input type="hidden" id="pName" name="pName" value="침대"> 
               
               <textarea class="form-control" rows="5" id="reContent" name="reContent" placeholder="리뷰 내용을 입력해주세요"></textarea>
               </div>
               </div>
               
               <div class="col-12" style="margin-bottom:5%;">
                 
                  <span class="star-input">
                     <span class="input">
                         <input type="radio" name="star-input" value="1" id="p1">
                         <label for="p1">1</label>
                         <input type="radio" name="star-input" value="2" id="p2">
                         <label for="p2">2</label>
                         <input type="radio" name="star-input" value="3" id="p3">
                         <label for="p3">3</label>
                         <input type="radio" name="star-input" value="4" id="p4">
                         <label for="p4">4</label>
                         <input type="radio" name="star-input" value="5" id="p5" checked>
                         <label for="p5">5</label>
                       </span>            
                  </span>
                  <input type="hidden" id="stars" name="stars" > 
               
                
              </div>
                  
                   <div class="col-12">
                   
                   <p> ▼ 리뷰에 올릴 이미지를 첨부해주세요 ▼ </p>
                     <div class="input-group image-preview">
                         <input type="text" class="form-control image-preview-filename" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
                         <span class="input-group-btn">
                             <!-- image-preview-clear button -->
                             <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                                 <span class="glyphsicon glyphicon-remove"></span> 지우기
                             </button>
                             <!-- image-preview-input -->
                             <div class="btn btn-default image-preview-input">
                                 <span class="glyphicon glyphicon-folder-open"></span>
                                 <span class="image-preview-input-title">찾아보기</span>
                                 <input type="file" accept="image/png, image/jpeg, image/gif" id="review_file" name="review_file"/> <!-- rename it -->
                             </div>
                         </span>
                     </div><!-- /input-group image-preview [TO HERE]--> 
                  </div>
                  
                  


                      
           </div>
                  
              <!-- Modal footer -->
              <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="review_validate();">등록하기</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
</form>              
            </div>
          </div>
        </div>
        </div>
        <!-- 리뷰하기 모달 끝 -->

        
      
</section>
        
        

        
   
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  