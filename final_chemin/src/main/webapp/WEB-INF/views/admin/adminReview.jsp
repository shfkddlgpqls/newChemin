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
	                    	view += "<div class='col-md-2'><img src='${path}/resources/upload/review/"+data.list[i].reImg+"' class='img img-rounded img-fluid'/></div>";          	
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
	                    		
	                    	view += "<span class='float-right'>"+data.list[i].reDate+"</p><div class='clearfix'>";
	                    	view += "<p>"+data.list[i].reContent+"</p><span class='float-right'>"+data.list[i].pno+"</span></div></div></div></div></div></div>";
	                    
	                    }
	                    else//값이 2이상일 때 값들 삽입
	                    {
	                    	view += "<div class='card'> <div class='card-body'>  <div class='row'>";
	                    	view += "<div class='col-md-2'><img src='${path}/resources/upload/review/"+data.list[i].reImg+"' class='img img-rounded img-fluid'/></div>";          	
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
	                    	
	                    	view += "<span class='float-right'>"+data.list[i].reDate+"</p><div class='clearfix'>";
	                    	view += "<p>"+data.list[i].reContent+"</p><span class='float-right'>"+data.list[i].pno+"</span></div></div></div></div></div></div>";
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

	
	</script>
    

		
	
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
	               			<img src='${path}/resources/upload/review/${r.reImg}' class='img img-rounded img-fluid'/>
	               		</div>          	
	                   	<div class='col-md-10'>
	                   		<p><strong>${r.userId}</strong>님 </p>${r.stars}
	                   		
	                   		<c:set var="star" value="${r.stars}"></c:set>
	                   		
	                   		<span style="margin-left : 5%"> 		
	                   		<c:choose>
	                   			<c:when test="$(star==1)">
	                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			</c:when>	
	                   			
	                   			<c:when test="$(star==2)">
	                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			</c:when>	
	                   			
	                   			<c:when test="$(star==3)">
	                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			</c:when>	
	                   			
	                   			<c:when test="$(star==4)">
	                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			   <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			</c:when>	
	                   			
	                   			<c:when test="$(star==5)">
	                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    
	                   			</c:when>	
	                   		</c:choose>
	                   		
	                   		</span>
	                   		
	                   		<span class='float-right'>${r.reDate}</span>
		                   	<div class='clearfix'>
		                   		<p>${r.reContent}</p>
		                   		
		                   		<span class='float-right'>${r.pno }</span>
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
		</div>
	
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  
    