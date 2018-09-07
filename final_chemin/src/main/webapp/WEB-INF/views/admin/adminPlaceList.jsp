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

<style>
.gallery{
  width: 100%;
  max-width: 960px;
  margin: 2rem auto;
  
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  
  -webkit-flex-wrap: wrap;
      -ms-flex-wrap: wrap;
          flex-wrap: wrap;
  
  -webkit-box-pack: center;
  -webkit-justify-content: center;
      -ms-flex-pack: center;
          justify-content: center;
}

.gallery-item{
  box-shadow: 2px 2px 8px -1px #3498DB;
  width: 100%;
  height: 300px;
  background: #000;
  position: relative;
  cursor: pointer;
  overflow: hidden;
  border:0;
}

.gallery-item-image{
  position: absolute;
  width: 100%;
  height: 100%;
  z-index:20;
  -webkit-transition:all .5s ease;
  transition: all .5s ease;
  bottom:0;
  overflow: hidden;

}

.gallery-item:hover .gallery-item-image{
  bottom: 60%;
}

.gallery-item-description{
  color:black;
  font-size: .8rem;
  width: 100%;
  height: 60%;
  padding: .5rem .8rem;
  background: white;
  position: absolute;
  bottom:0;
}
/* td, tr{
border:1px solid black;
} */
tr{
height:50px;
}


</style>

<script>

function fn_modal(obj){	

	var plaNo = $(obj).data("no");
	var status = $(obj).data("status");
	 
	 //footer 버튼 승인상태에 따라 변화
	 if(status=='N'){
		 detailFooter.innerHTML='<input type="button" name="approve" class="btn btn-success" value="승인하기" onclick="fn_approve()"/>';
		 /* detailFooter.innerHTML+='<input type="button" name="reject" class="btn btn-danger" data-toggle="modal" data-target="#reMsg_modal" value="승인거절" />'; */
		 detailFooter.innerHTML+='<input type="button" name="reject" class="btn btn-danger"  value="승인거절" onclick="fn_reject()"/>';
		 detailFooter.innerHTML+='<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="fn_delete()">삭제</button>';
	 }else if(status=='Y'){
		 detailFooter.innerHTML='<input type="button" name="cancle" class="btn btn-warning" value="승인취소" onclick="fn_cancle()">';
		 detailFooter.innerHTML+='<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="fn_delete()">삭제</button>';
	 }else if(status=='R'){
		 detailFooter.innerHTML='<input type="button" name="cancle" class="btn btn-warning" value="승인거절취소" onclick="fn_cancle()">';
		 detailFooter.innerHTML+='<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="fn_delete()">삭제</button>';
	 }
	 
	 plaDate.innerHTML = $(obj).data("date"); 
	 plaDate.innerHTML += '<input type="hidden" name="subNo" value='+plaNo+'>';
	 userId.innerHTML = $(obj).data("userid");  
	plaName.innerHTML = $(obj).data("name"); 	
 	plaPhone.innerHTML = $(obj).data("phone");
	plaArea.innerHTML = $(obj).data("area");
	plaContent.innerHTML = $(obj).data("content"); 
	plaCategory.innerHTML =$(obj).data("category"); 
	var keyword = $(obj).data("keyword").split(" ");
	var address = $(obj).data("address").split("/",2);
	var time = $(obj).data("time").split("/");
	
	
		for ( var i in address ) {		
			if(i==0){
				plaAddr.innerHTML = '<span>' + address[i] + '</span>';
			}else{
				plaAddr.innerHTML+=' <span>' + address[i] +'(우편번호)'+ '</span>';
				
			}
	     }
	
		for ( var t in time ) {		
			if(t==0){
				plaTime.innerHTML = '<span>' + time[t] + '</span>';
			}else if(t==1){
				plaTime.innerHTML+=' <span>' + time[t] +' ~ '+ '</span>';				
			}else if(t==2){	
				plaTime.innerHTML+=' <span>' + time[t] + '</span>';	
			}else{
				plaTime.innerHTML+=' <span style="color:red">' + time[t] + '</span>';	
			}
	     }
		
		for ( var k in keyword ) {
			if(keyword[k]!=null && (keyword[k].length)>0){
				if(k==0){
					plaKeyword.innerHTML = '<span style="color:blue">' +' #'+ keyword[k] + '</span>' ;
				}else{
					plaKeyword.innerHTML += '<span style="color:blue">' +' #'+ keyword[k] + '</span>' ;			
				}	
			}
	     }

	
	
	$.ajax({
		url:"${path}/admin/adminPlaDetailList.do",
		data:{plaNo:plaNo},
		dataType:"json",
		success:function(data)
		{			
				
			//상세보기 화면 캐러셀 사진 부분
			attachmain.innerHTML='<div class="carousel-item active" id="attachmentOne">';
			attachmentOne.innerHTML='<div class="row" id="subattachOne">';
		    for(i=0; i<data.attachList.length; i++){
		    	if(i==0){
		    		subattachOne.innerHTML=	
					 					'<div class="col-md-3">'+
				 						'<a href="#x" class="thumbnail">'+
				 						"<img src="+"${pageContext.request.contextPath }/resources/upload/place/attach/"+data.attachList[i].reImg + " class='img-thumbnail'>"+
				 						'</a>'+
				 						'</div>';
				 						
		    	}else if(i<4){
		    		subattachOne.innerHTML+=
		    			 '<div class="col-md-3">'+
 						'<a href="#x" class="thumbnail">'+
 						"<img src="+"${pageContext.request.contextPath }/resources/upload/place/attach/"+data.attachList[i].reImg + " class='img-thumbnail'>"+
 						'</a>'+
 						'</div>';
		    		}else if(i>3){
		    			attachmain.innerHTML+='<div class="carousel-item " id="attachmentTwo">';
		    			attachmentTwo.innerHTML='<div class="row" id="subattachTwo">';
		    			subattachTwo.innerHTML=	
		 					'<div class="col-md-3">'+
	 						'<a href="#x" class="thumbnail">'+
	 						"<img src="+"${pageContext.request.contextPath }/resources/upload/place/attach/"+data.attachList[i].reImg + " class='img-thumbnail'>"+
	 						'</a>'+
	 						'</div>';
		    		}
		    	
		 }
		    attachmentOne.innerHTML+='</div>';
	    	attachmain.innerHTML+='</div>';
	    	//상세보기 화면 캐러셀 사진 부분 끝	
		}
		
	})

}

function fn_delete(){
	var plaNo = $('[name=subNo]').val();
	swal({
		  title: "정말로 삭제하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  location.href = "${path}/admin/adminPlaceDelete.do?plaNo="+plaNo+"&userId="+'${memberLoggedIn.userId}';
		  } else {
		    
		  }
		});
	
}

//승인버튼
function fn_approve(){
	var plaNo = $('[name=subNo]').val();
	swal({
		  title: "요청된 장소를 승인하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  location.href = "${path}/admin/adminPlaceStatus.do?plaNo="+plaNo+"&plaStatus="+'Y';
		  } else {
		    
		  }
		});
}

//승인취소버튼
function fn_cancle(){
	var plaNo = $('[name=subNo]').val();
	swal({
		  title: "승인 취소를 하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  location.href = "${path}/admin/adminPlaceStatus.do?plaNo="+plaNo+"&plaStatus="+'N';
		  } else {
		    
		  }
		});
}

//승인거절버튼
 function fn_reject(){
	var plaNo = $('[name=subNo]').val();
    
	 swal({
		  title: "승인을 거절 하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  $("#reMsg_modal").modal('show');
			  $('#place_modal').modal('hide');
			   /* location.href = "${path}/admin/adminPlaceStatus.do?plaNo="+plaNo+"&plaStatus="+'R'; */ 
		  } else {
		    
		  }
		}); 
} 


function fn_send(){
	var plaNo = $('[name=subNo]').val();
	var plaReMsg = $('[name=reMsg]').val();
	 location.href = "${path}/admin/adminReMsg.do?plaNo="+plaNo+"&plaReMsg="+plaReMsg+"&plaStatus="+'R'; 	
}

</script>
    
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
		<div class="row" style="margin-left:auto; margin-right:auto; width:100%">	
		  	<div>
		  		<h3>장소 요청 내역</h3>
		  		<br>
		  	</div>		
		  	
		  	 <div class="row" style="margin-left:auto;margin-right:auto;width:95%">
	         	<c:forEach items="${plaList}" var="p">
				<div class="card shadow gallery-item" style="width:30%;margin-right:3%">
				
				  
				    <div class="gallery-item-image">
				    <img class="card-img-top scale" src="${path}/resources/upload/place/main/${p.REIMG}" alt="Card image" style="width:100%"> 
				    
				    </div>
				    <div class="gallery-item-description">
				      <h4 class="card-title"><strong>${p.PLANAME}</strong></h4>
				      <p class="card-text" style="margin-bottom:0%">
				      	<i class="fa fa-map-marker" style="font-size:20px;color:#989898;"></i>
				      	<c:forTokens items="${p.PLAADDR}" delims="/" var="item" begin="0" end="0">
				      		${item}
				      	</c:forTokens>
				      </p>
				      <p class="card-text" style="margin-bottom:0%;margin-bottom:10%">
				      	<i class="fa fa-phone" style="font-size:20px;color:#989898;"></i>
				      	${p.PLAPHONE}
				      </p>
				      <!-- plaNo값에 해당되는 attach와 price 가격정보를 가져오기 위해 button name값에 장소번호를 넣어준다.-->
				      
				     <button type="button" class="btn btn-primary plaBtn" onclick="fn_modal(this)" data-no='${p.PLANO }' data-name='${p.PLANAME}' data-address='${p.PLAADDR }' data-date='${p.PLADATE}'
				     data-category='${p.PLACATEGORY}' data-area='${p.PLAAREA}'	data-phone='${p.PLAPHONE }' data-content='${p.PLACONTENT}' data-time='${p.PLATIME}' data-keyword='${p.PLAKEYWORD}'
				     data-status='${p.PLASTATUS}' data-userid='${p.USERID}' data-toggle="modal" data-target="#place_modal" style="float:right">상세보기</button>
				     <c:if test="${p.PLASTATUS == 'N'}">
				     <button type="button" class="btn btn-info"  style="float:right;margin-right:1%">승인대기</button>  
				     </c:if>
				      <c:if test="${p.PLASTATUS == 'Y'}">
				     <button type="button" class="btn btn-success"  style="float:right;margin-right:1%">승인완료</button>  
				     </c:if>
				     <c:if test="${p.PLASTATUS == 'R'}">
				     <button type="button" class="btn btn-danger"  style="float:right;margin-right:1%">승인거절</button>  
				     </c:if>
				    </div>
				</div>
				</c:forEach>
 			 </div>
		  </div>	  	
		</div> 	
		
		<!-- 장소 상세보기 모달 -->
		 <!-- The Modal -->
		  <div class="modal fade" id="place_modal">
		    <div class="modal-dialog modal-dialog-centered modal-lg">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title text-center">상세보기</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		          <div class="row">
		           <div class="col-md-1"></div>
		        	<div class="col-md-10">
		        	   <table style="width:100%">
		        	   	  <tr>
		        	   	  	<td style="width:15%">등록일</td>
		        	   	  	<td>: </td>
		        	   	  	<td id="plaDate"></td>	
		        	   	  </tr>
		        	   	  <tr>
		        	   	  	<td style="width:15%">등록자</td>
		        	   	  	<td>: </td>
		        	   	  	<td id="userId"></td>	
		        	   	  </tr>
		        	   	  <tr>
		        	   	  	<td style="width:15%">업체명</td>
		        	   	  	<td>: </td>
		        	   	  	<td id="plaName"></td>	
		        	   	  </tr>
		        	   	  <tr>
		        	   	  	<td>카테고리</td>
		        	   	  	<td>: </td>
		        	   	  	<td id="plaCategory"></td>
		        	   	  </tr>
		        	   	  <tr>
		        	   	  	<td>지역</td>
		        	   	  	<td>: &nbsp;&nbsp;</td>
		        	   	  	<td id="plaArea"></td>
		        	   	  </tr>
		        	   	  <tr>
		        	   	  	<td>주소</td>
		        	   	  	<td>: </td>
		        	   	  	<td id="plaAddr"></td>
		        	   	  </tr>
		        	   	  <tr>
		        	   	  	<td>전화번호</td>
		        	   	  	<td>: </td>
		        	   	  	<td id="plaPhone"></td>
		        	   	  </tr>
		        	   	   <tr>
		        	   	  	<td>영업시간</td>
		        	   	  	<td>: </td>
		        	   	  	<td id="plaTime"></td>
		        	   	  </tr>
		        	   	   <tr>
		        	   	  	<td>가격정보</td>
		        	   	  	<td>: </td>
		        	   	  	<td id="plaPrice">아메리카노 2500원</td>
		        	   	  </tr>
		        	   	  <tr>
		        	   	  	<td>소개글</td>
		        	   	  	<td>: </td>
		        	   	  	<td id="plaContent"></td>
		        	   	  </tr>
		        	   	  <tr>
		        	   	  	<td>사진</td>
		        	   	  	<td></td>
		        	   	  	<td></td>
		        	   	  </tr>
		        	   	  <tr>
		        	   	  	<td colspan="3"  align ="center">
		        	   	  		 <div id="ThumbnailCarousel" class="carousel slide col-xs-12" data-ride="carousel">
			  <div class="carousel-inner" id="attachmain">
			   
			  </div>
			  
			  <a class="carousel-control-prev "  href="#ThumbnailCarousel" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon " aria-hidden="true"></span>
			    <span class="sr-only ">Previous</span>
			  </a>
			  
			  <a class="carousel-control-next" href="#ThumbnailCarousel" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
		</div>
		        	   	  	</td>
		        	   	  </tr>
		        	   	  <tr>
		        	   	  	<td>대표키워드</td>
		        	   	  	<td>: </td>
		        	   	  	<td id="plaKeyword"></td>
		        	   	  </tr>
		        	   </table>
		        	</div>
		     		<div class="col-md-1"></div>
				  </div>
			    </div>
		        <!-- Modal footer -->
		        <div class="modal-footer" id="detailFooter">
		      
		        </div>
		    </div>
		  </div>
		  </div>
		  <!-- 장소 상세보기 모달 끝 -->
		  
		  
		  
		  <!-- 승인 거절 메세지 모달 -->
		 <!-- The Modal -->
		  <div class="modal fade" id="reMsg_modal">
		    <div class="modal-dialog modal-dialog-centered">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title text-center">승인 거절 이유</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		          <div class="row">
		           <div class="col-md-1"></div>
		        	<div class="col-md-10">
		        	   <textarea class="form-control" id="message-text" name="reMsg" style="width:100%; height:200px"></textarea>
		        	</div>
		     		<div class="col-md-1"></div>
				  </div>
			    </div>
		        <!-- Modal footer -->
		        <div class="modal-footer" id="footer">
		      		<input type="button" name="send" class="btn btn-success" value="보내기" onclick="fn_send()">
		      		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		        </div>
		    </div>
		  </div>
		  </div>
		  <!-- 승인 거절 메세지 모달 끝 -->
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