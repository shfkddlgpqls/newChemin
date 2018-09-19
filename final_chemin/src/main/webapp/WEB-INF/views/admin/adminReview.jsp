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
	
	<!-- 이미지팝업 -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.4.1/jquery.fancybox.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.4.1/jquery.fancybox.min.js"></script>


   <style>
    .pagination a 
    {
	    color: black;
	    float: left;
	    padding: 8px 16px;
	    text-decoration: none;
	}

	.pagination a:active 
	{
   		background-color: #ffd6f4; !important;
  	    color: white;
	}
	
	.pagination a:hover
	{
		background-color : #ffd6f4; !important;
  	    color: white;
	}
	
	.cardAtag
	{
		color : hotpink;
	}
	.cardAtag:hover
	{
		background-color : white; 
		color : #ffd6f4;
	}
	</style>   
	
	<script>
	
	function fn_review(cPage)
	   {
	        
	        $.ajax
	        ({
	            url:"${path}/admin/adminReview.do",
	            data:{cPage:cPage},
	            dataType:"json",    
	            success : function(data) 
	            {
		          	var view = "";
		           	console.log(data);
		           	console.log(data.list[0].reNO);
		           	
	              if(data!=null)
	              {
	                 var num = data.length-1;
	                 var reviewPageBar = data.pageBar; 
	                
	                 //alert(qnaPageBar); undefined
	                 console.log(reviewPageBar);
	                                 
	                 for(var i=0; i<data.list.length;i++)
	                 {
	                    //화면 추가해주기
	                    if(i==0)//맨 처음에 값 삽입
	                    {
	                    	view += "<div class='card'> <div class='card-body'>  <div class='row'>";
	                    	view += "<div class='col-md-2'>";
	                    	
	                    	if(data.list[i].orImg != null && data.list[i].reImg != null)
	                    	{
//	                    		view+= "<img src='${path}/resources/upload/review/"+data.list[i].reImg+"' class='img img-rounded img-fluid'/></div>";          

	                    		view+="<a data-fancybox='gallery' href='${path}/resources/upload/review/"+data.list[i].reImg+" '>";
	                    		view+="<img src='${path}/resources/upload/review/"+data.list[i].reImg+"' class='img img-rounded img-fluid'/></a></div>";
	                    	}
	                    	else view+="<img src='${path}/resources/base/img/noImg.png' class='img img-rounded img-fluid'/></div>";
	                    	
	                    	view += "<div class='col-md-10'><p><strong>"+data.list[i].userId+"</strong>님";
	                    	                    	
	                    	if(data.list[i].stars==5)
	                    	{
	                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/></span>";
	                    	}
	                    	else if(data.list[i].stars==4)
	                    	{
	                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
	                    	}
	                    	else if(data.list[i].stars==3)
	                    	{
	                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
	                    	}
	                    	else if(data.list[i].stars==2)
	                    	{
	                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
	                    	}
	                    	else if(data.list[i].stars==1)
	                    	{
	                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
	                    	}
	                    		
	                    	view += "<span class='float-right'>"+data.list[i].reDate+"</p><span><div class='clearfix'>";
	                    	view += "<p>"+data.list[i].reContent+"</p><span class='float-right'><a class='cardAtag' href='${path }/mall/detail.do?no="+data.list[i].pno+"'><strong>>> 상품 코드 : "+data.list[i].pno+" / 상품 명 : "+ data.list[i].pname+"</strong></a></span></div>";
		                   	view += "<div class='clearfix float-right'><br><button class='btn btn-default' onclick='fn_reviewDel("+data.list[i].reNO+")' value='"+data.list[i].reNo+"'>삭제</button></div>"		
							view += "</div></div></div></div></div>";
	                    
	                    }
	                    else//값이 2이상일 때 값들 삽입
	                    {
	                    	view += "<div class='card'> <div class='card-body'>  <div class='row'>";
	                    	view += "<div class='col-md-2'>";
	                    	
	                    	if(data.list[i].orImg != null && data.list[i].reImg != null)
	                    	{
	//                    		view+= "<img src='${path}/resources/upload/review/"+data.list[i].reImg+"' class='img img-rounded img-fluid'/></div>";          	
	                    
	                    		view+="<a data-fancybox='gallery' href='${path}/resources/upload/review/"+data.list[i].reImg+" '>";
	                    		view+="<img src='${path}/resources/upload/review/"+data.list[i].reImg+"' class='img img-rounded img-fluid'/></a></div>";
	                    	}
	                    	else view+="<img src='${path}/resources/base/img/noImg.png' class='img img-rounded img-fluid'/></div>";
	                    	
	                    	view += "<div class='col-md-10'><p><strong>"+data.list[i].userId+"</strong>님";
	                    	                    	
	                    	if(data.list[i].stars==5)
	                    	{
	                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/></span>";
	                    	}
	                    	else if(data.list[i].stars==4)
	                    	{
	                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
	                    	}
	                    	else if(data.list[i].stars==3)
	                    	{
	                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
	                    	}
	                    	else if(data.list[i].stars==2)
	                    	{
	                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
	                    	}
	                    	else if(data.list[i].stars==1)
	                    	{
	                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
	                    	}
	                    		
	                    	view += "<span class='float-right'>"+data.list[i].reDate+"</p><span><div class='clearfix'>";
	                    	view += "<p>"+data.list[i].reContent+"</p><span class='float-right'><a class='cardAtag' href='${path }/mall/detail.do?no="+data.list[i].pno+"'><strong>>> 상품 코드 : "+data.list[i].pno+" / 상품 명 : "+ data.list[i].pname+"</strong></a></span></div>";
		                   	view += "<div class='clearfix float-right'><br><button class='btn btn-default' onclick='fn_reviewDel("+data.list[i].reNO+")' value='"+data.list[i].reNO+"'>삭제</button></div>"		
							view += "</div></div></div></div></div>";
	                    }
	                 }   
	             
	              }
	              else
	              {
	            	  reviewCard.innerHTML += "<td class='text-center'>아무것도 없어요</td>";
	              }   
	              
	              $("#reviewCard").html(view);   
	              $("#reviewPageBar").html(reviewPageBar);   
	              
	            },
	            
	            error:function(jxhr,textStatus,error)
	            {
	                console.log("mainMall ajax 실패 : "+jxhr+" "+textStatus+" "+error); 
	           }         
	        });
	   } 

	
	function fn_reviewDel(reNo) 
	{
		$("#modal_rno").val(reNo);	
		$("#adminReviewDel").modal();
	}
	
	function fn_adminReviewDelConfirm() 
	{
		$("#adminReviewDelFrm").submit();
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
						      <strong><a class="nav-link adminAtag" href="${path }/admin/adminBoard.do">게시글 관리</a></strong>
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
		
	
	<div class="container">
   
      <div class="shadow-sm p-4 mb-4 bg-white">
      <h2>Review</h2>     
      </div>
      <hr>
      
      <div id="reviewCard">
      	<c:forEach items="${rlist}" var="r">
          	<div class='card'> 
          		<div class='card-body'>  
	            	<div class='row'>
	               		<div class='col-md-2'>
	               			<c:set var="picRe" value="${r.reImg}"></c:set>
	               			<c:set var="picOr" value="${r.orImg}"></c:set>
			               		
			               		<c:choose>
			               			<c:when test="${not empty picRe && not empty picOr}">
			               				<%-- <img src='${path}/resources/upload/review/${r.reImg}' class='img img-rounded img-fluid'/> --%>
			               			
			               				<a data-fancybox="gallery" href="${path}/resources/upload/review/${r.reImg}">
					               			<img src='${path}/resources/upload/review/${r.reImg}' class='img img-rounded img-fluid'/>
					               		</a>
			               			</c:when>
			               			
			               			<c:otherwise>
			               				<img src='${path}/resources/base/img/noImg.png' class='img img-rounded img-fluid'/>
			               			</c:otherwise>
			               		</c:choose>	
	               		</div>          	
	               		
	                   	<div class='col-md-10'>
	                   		<p><strong>${r.userId}</strong>님 
	                   		
	                   		<span style="margin-left : 5%"> 		
	                   	 
	                   	 		<c:set var="star" value="${r.stars}"></c:set>
				                   			
				                   		<c:choose>
				                   			<c:when test="${ star==1}">
				                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			</c:when>	
				                   			
				                   			<c:when test="${ star==2}">
				                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			</c:when>	
				                   			
				                   			<c:when test="${ star==3}">
				                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			</c:when>	
				                   			
				                   			<c:when test="${ star==4}">
				                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			   <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			</c:when>	
				                   			
				                   			<c:otherwise>
				                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    
				                   			</c:otherwise>	
				                   		</c:choose>    		
	                   		</span>
	                   		
	                   		<span class='float-right'>
	                   			${r.reDate} </p>
	                   		</span>
	                   		
		                   	<div class='clearfix'>
		                   		<p>${r.reContent}</p>
		                   		
		                   		<span class='float-right'>
		                   		<a class='cardAtag' href='${path }/mall/detail.do?no=${r.pno }'><strong>>> 상품 코드 : ${r.pno } / 상품 명 :  ${r.pname }</strong></a>
		                   		</span>
		                   	</div>
		                   	
		                   	<div class='clearfix float-right'>
				                   	<br>
				                   <button class="btn btn-default" onclick="fn_reviewDel(${r.reNO})" value="${r.reNO}">삭제</button>
				           </div>
				           
	                   	</div>
	                 </div>
	             </div>
           	</div>
           	</c:forEach>
    	</div>
              
          <br>
          
          <!-- 페이징바 -->
	      <div class="row justify-content-center" id="reviewPageBar">
			<c:if test="${not empty reviewPageBar }">
          		${reviewPageBar }
          	</c:if>
	      </div>	
	      
<!-- 리뷰 삭제하기 -->       
   <div class="modal fade" id="adminReviewDel">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">리뷰 삭제</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        	
        <!-- Modal body -->
        <div class="modal-body">
             <div class="col-12">
          		<p class="text-center">리뷰 글을 삭제하시겠습니까? <br>삭제한 글은 복구되지 않습니다. </p> 
          		
          		<form action="${path }/admin/AdminreviewDel.do" id="adminReviewDelFrm" name="adminReviewDelFrm">  
          		<input type="text" name="modal_rno" id="modal_rno" value=""/> 
          		</form>
          		  
              </div>
     
        </div>    
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" onclick="fn_adminReviewDelConfirm()" >삭제하기</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
<!-- 리뷰 삭제하기 끝 -->
		</div>
	
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  
    