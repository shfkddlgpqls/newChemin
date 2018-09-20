<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/admin/adminMenuBar.jsp"/>
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
a {
    color: #DE5F89;
    text-decoration: none;
    background-color: transparent;
    -webkit-text-decoration-skip: objects;
}
.statusStyle{
text-align:center;
width:100%;
font-size:1.8rem;
margin-top:8%;
margin-bottom:8%;
color:#999;
}
.pagination a 
    {
       color: black;
       float: left;
       padding: 8px 16px;
       text-decoration: none;
   }
   
  
   
    .pagination a:hover
   {
      background-color : #ffd6f4; 
         color: white;
   }
   .pagination a:active 
   {
         background-color: #ffd6f4;
         color: white;
   }
   
    .pagination a:visited
   {
         background-color: #ffd6f4;
         color: white;
   }
   
div#select_box {
  position: relative;
  width: 200px;
  height: 32px;
  border-bottom:1px solid #DE5F89;
  
  /* 화살표 이미지 */
}
div#select_box label {
  position: absolute;
  font-size: 14px;
  color: #DE5F89;
  top: 7px;
  left: 12px;
  letter-spacing: 1px;
}
div#select_box select#color {
  width: 100%;
  height: 32px;
  min-height: 32px;
  line-height: 32px;
  padding: 0 10px;
  opacity: 0;
  filter: alpha(opacity=0);
  /* IE 8 */
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
	 
	 var date=new Date($(obj).data("date"));
	 var fmDate=date.toISOString().slice(0,10);
	 plaDate.innerHTML = fmDate; 
	 plaDate.innerHTML += '<input type="hidden" name="subNo" value='+plaNo+'>';
	 userId1.innerHTML = $(obj).data("user");  
	plaName.innerHTML = $(obj).data("name"); 	
 	plaPhone.innerHTML = $(obj).data("phone");
	plaArea.innerHTML = $(obj).data("area");
	
	plaCategory.innerHTML =$(obj).data("category"); 
	var keyword = $(obj).data("keyword").split(" ");
	var address = $(obj).data("address").split("/",2);
	var time = $(obj).data("time").split("/");
	
	
	//소개글 내용이 null일때를 비교
	if($(obj).data("content")!=null && $(obj).data("content")!="undefined"){
		plaContent.innerHTML = $(obj).data("content");
	}else{
		$("#contentTr").css("display", "none");
	}
	
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
			if(data.attachList.length>0){
			//상세보기 화면 캐러셀 사진 부분
			attachmain.innerHTML='<div class="carousel-item active" id="attachmentOne">';
			attachmentOne.innerHTML='<div class="row" id="subattachOne">';
		    for(i=0; i<data.attachList.length; i++){
		    	if(i==0){
		    		subattachOne.innerHTML=	
					 					'<div class="col-md-3">'+
				 						'<a href="#x" class="thumbnail">'+
				 						"<img style='width:150px;height:140px' src="+"${pageContext.request.contextPath }/resources/upload/place/attach/"+data.attachList[i].reImg + " class='img-thumbnail'>"+
				 						'</a>'+
				 						'</div>';
				 						
		    	}else if(i<4){
		    		subattachOne.innerHTML+=
		    			 '<div class="col-md-3">'+
 						'<a href="#x" class="thumbnail">'+
 						"<img style='width:150px;height:140px' src="+"${pageContext.request.contextPath }/resources/upload/place/attach/"+data.attachList[i].reImg + " class='img-thumbnail'>"+
 						'</a>'+
 						'</div>';
		    		}else if(i>3){
		    			attachmain.innerHTML+='<div class="carousel-item " id="attachmentTwo">';
		    			attachmentTwo.innerHTML='<div class="row" id="subattachTwo">';
		    			subattachTwo.innerHTML=	
		 					'<div class="col-md-3">'+
	 						'<a href="#x" class="thumbnail">'+
	 						"<img style='width:150px;height:140px' src="+"${pageContext.request.contextPath }/resources/upload/place/attach/"+data.attachList[i].reImg + " class='img-thumbnail'>"+
	 						'</a>'+
	 						'</div>';
		    		}
		    	
		 }
		    attachmentOne.innerHTML+='</div>';
	    	attachmain.innerHTML+='</div>';
	    	//상세보기 화면 캐러셀 사진 부분 끝	
			}else{
				$("#photoTr").css("display", "none");
				$("#photoSubTr").css("display", "none");
			}
		},
		error:function(jxhr,textStatus,error)
        {
            console.log("ajax실패!");
            console.log(jxhr);
            console.log(textStatus);
            console.log(error);
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
			  location.href = "${path}/admin/adminPlaceDelete.do?plaNo="+plaNo;
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
//거절메세지를 보낼때 실행되는 함수
function fn_send(){
	var plaNo = $('[name=subNo]').val();
	var plaReMsg = $('[name=reMsg]').val();
	 location.href = "${path}/admin/adminReMsg.do?plaNo="+plaNo+"&plaReMsg="+plaReMsg+"&plaStatus="+'R'; 	
}
/* 승인상태 변화에 따라 호출되는 함수 */
function fn_plaStatus(status){
	$('#category').text("카테고리 선택▼");
	$('[name=category]').val('전체');
	$('[name=plaStatus]').val(status);
	fn_status(1);
}
$(function(){
	//처음 장소내역을 눌렀을때 기본으로 승인대기의 값이 들어옴
	$('[name=plaStatus]').val('${plaStatus}');
	fn_status(1);
	
	 var select = $("select#color");
	  select.change(function() {
	    var select_name = $(this).children("option:selected").text();
	    $(this).siblings("label").text(select_name);
	  });
});
function fn_status(cPage){
	
	var plaStatus = $('[name=plaStatus]').val();
	var category = $('[name=category]').val();
	
	$.ajax({
		url:"${path}/admin/placeStatusList.do",
		data:{plaStatus:plaStatus,cPage:cPage,plaCategory:category},
		dataType:"json",
		success:function(data)
		{	
			
			var pageBar = data.pageBar;
			
			var status="";
			if(data.plaList.length>0){
			for(var i=0; i<data.plaList.length; i++){
				status+='<div class="card shadow gallery-item" style="width:30%;margin-right:3%;margin-bottom:3%">';
				status+='<div class="gallery-item-image">';
				status+='<img class="card-img-top scale" src="${path}/resources/upload/place/main/'+data.plaList[i].REIMG+'" alt="Card image" style="width:100%;height:100%">'; 
				status+='</div>';
				status+='<div class="gallery-item-description">';
				status+='<h4 class="card-title"><strong>'+data.plaList[i].PLANAME+'</strong></h4>';
				status+='<p class="card-text" style="margin-bottom:1%;word-wrap: break-word;font-size:0.9rem">';
				status+='<i class="fa fa-map-marker" style="color:#989898;"></i>';
			 	var addr = data.plaList[i].PLAADDR;
				var addrStr = addr.split("/");
				var addrSubStr = addrStr[0].split("(");
				status+=addrSubStr[0]+"<br>"+"&nbsp;&nbsp;&nbsp;("+addrSubStr[1];
				status+='</p>';
				status+='<p class="card-text" style="margin-bottom:8%;font-size:0.9rem">';
				status+='<i class="fa fa-phone" style="color:#989898;"></i>';
				status+=data.plaList[i].PLAPHONE;
				status+='</p>';
				status+=' <button type="button" class="btn btn-primary plaBtn" onclick="fn_modal(this)" data-no='+data.plaList[i].PLANO+' data-name='+"'"+data.plaList[i].PLANAME+"'"+' data-address='+"'"+data.plaList[i].PLAADDR+"'"+' data-date='+data.plaList[i].PLADATE+' data-category='+data.plaList[i].PLACATEGORY+' data-area='+data.plaList[i].PLAAREA+' data-phone='+data.plaList[i].PLAPHONE+' data-content='+"'"+data.plaList[i].PLACONTENT+"'"+' data-time='+"'"+data.plaList[i].PLATIME+"'"+' data-keyword='+"'"+data.plaList[i].PLAKEYWORD+"'"+' data-status='+data.plaList[i].PLASTATUS+' data-user='+data.plaList[i].USERID+' data-toggle="modal" data-target="#place_modal" style="float:right">상세보기</button>';
				if(data.plaList[i].PLASTATUS=='N'){
					status+='<button type="button" class="btn btn-info"  style="float:right;margin-right:1%">승인대기</button> ';
				}else if(data.plaList[i].PLASTATUS=='Y'){
					status+='<button type="button" class="btn btn-success"  style="float:right;margin-right:1%">승인완료</button> ';
				}else{
					status+='<button type="button" class="btn btn-danger"  style="float:right;margin-right:1%">승인거절</button>  ';
				}
				status+='</div>';
				status+='</div>';
				} 
			}else{
				
				if(plaStatus=='N')status+="<div class='statusStyle'>승인대기 내역이 없습니다<div>";
				if(plaStatus=='Y')status+="<div class='statusStyle'>승인완료 내역이 없습니다<div>";
				if(plaStatus=='R')status+="<div class='statusStyle'>승인거절 내역이 없습니다<div>";
			}	
			 $('#plaList').html(status); 
			 $('#pageBar').html(pageBar);
		},
		error:function(jxhr,textStatus,error)
	    {
	        console.log("ajax실패!");
	        console.log(jxhr);
	        console.log(textStatus);
	        console.log(error);
	     }
	})
}
</script>

	<section>
		<div class="container">
			<div  style="margin-left:auto; margin-right:auto; width:100%">	
			  	<div>
			  		<h3>장소 요청 내역</h3>
			  		<br>
			  	</div>	
			  	
			  	<!-- 승인상태 탭 -->	
			  	<input type="hidden" name="plaStatus" value=""/>
				  	<div style="margin-left:auto;margin-right:auto;width:95%;padding-right:4%">
				  	 <ul class="nav nav-tabs" role="tablist">
				        <li class="nav-item">
				           
				             <a class="nav-link active" href=""  data-toggle="tab" onclick="fn_plaStatus('N')" >승인대기</a> 
				        </li>
				        <li class="nav-item">
				            <a class="nav-link" href="" data-toggle="tab" onclick="fn_plaStatus('Y')">승인완료</a>
				        </li>
				        <li class="nav-item">
				            <a class="nav-link" href="" data-toggle="tab" onclick="fn_plaStatus('R')">승인거절</a>
				        </li>
				    </ul>
				  	</div>
	              
	              	<!-- 카테고리 선택 select box -->
		             <div style="float:right;margin-right:7%;margin-top:2%;margin-bottom:4%">
		          
							 <div id="select_box" style ="text-align:right">
							 
							  <label id="category" for="color">카테고리선택 <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▼</span>
							  </label>
							  <select id="color" name="category"  title="select color" onchange="fn_status(1)">
							    <option value="전체">전체</option>
							    <option value="식사">식사</option>
							    <option value="술">술</option>
							    <option value="노래방">노래방</option>
							    <option value="스포츠">스포츠</option>
							    <option value="영화/공연">영화/공연</option>
							  </select>
							</div> 
					</div>
	             </div>
	             
	             
	           <div>
			  	 <div class="row" id="plaList" style="margin-left:auto;margin-right:auto;width:95%">
		     		<!-- ajax 승인상태 출력 -->
	 			 </div>
	 			 
	 			  
		 		 <div class="row justify-content-center" id="pageBar">
		            	<!-- 페이지바 출력 -->
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
		        	   	  	<td id="userId1"></td>	
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
		        	   	  <tr id="contentTr">
		        	   	  	<td>소개글</td>
		        	   	  	<td>: </td>
		        	   	  	<td id="plaContent"></td>
		        	   	  </tr>
		        	   	  <tr id="photoTr">
		        	   	  	<td>사진</td>
		        	   	  	<td></td>
		        	   	  	<td></td>
		        	   	  </tr>
		        	   	  <tr id="photoSubTr">
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
		        	   	  <tr id="keywordTr">
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  