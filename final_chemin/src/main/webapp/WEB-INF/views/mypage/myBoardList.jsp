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

	//카테고리 번호를 카테고리 한글로 바꿔주기
	function fn_cate(cate) 
	{
	   var name = "";
	   
	   if(cate==1)
	   {
		   name +="상품 문의";
	   } 	   
	   else if(cate==2)
	   {
		   name +="교환 문의";
	   }
	   else if(cate==3)
	   {
		   name +="환불 문의";
	   }
	   else if(cate==4)
	   {
		   name +="반품 문의";
	   }
	   else if(cate==5)
	   {
		   name +="기타 문의";
	   }
	   
		return name;
	}

	function fn_toggle(no) 
    {
   		 $("."+no).toggle();
	 }



	function fn_delete() 
	{
		confirm("삭제하시겠습니까?");
	}
	
	function fn_qna(cPage)
    {     
       $.ajax
       ({
           url:"${path}/mypage/myQna.do",
           data:{cPage:cPage},
           dataType:"json",    
           success : function(data) 
           {
	         	var view = "";	
	          	console.log(data);
	          	
             if(data!=null)
             {
                var num = data.length-1;
                var qnaPageBar = data.qnaPageBar; 
               
                                
                for(var i=0; i<data.list.length;i++)
                {
                   //화면 추가해주기
                   if(i==0) 
                   {
                	   
                	  view += "<tr><td class='text-center'>"+data.list[i].pno+"</td>";
                  	  view += "<td class='text-center'>"+data.list[i].qnaNo+"</td>";
               		  view +="<td class='text-center'>"+fn_cate(data.list[i].qna_cate_no)+"</td>";
               		  view += "<td class='text-center'><a onclick='fn_toggle("+data.list[i].qnaNo+",this)'  >"+data.list[i].qnaTitle+"</a></td>";  
               		  view += "<td class='text-center'>"+data.list[i].qnaDate+"</td>";
               		  
               		  if(data.list[i].qnaState=='답변대기')
                      {
                      	view += "<td class='text-center'><span class='badge badge-warning'>답변대기</span></td>";
                      }	   
                      else view += "<td class='text-center'><span class='badge badge-primary'>답변완료</span></td>";
               		  
                      view +="<td class='text-center'><button class='btn btn-default' onclick='fn_qnaEdit(${q.qnaNo},this);'>수정하기</button><button class='btn btn-default' onclick='fn_qnaDel(${q.qnaNo},this);'>삭제하기</button></td></tr>";
               		 
               		                   
               		  view += "<tr><td class='"+data.list[i].qnaNo+"' colspan='7' class='text-center' style='display:none;'>";
               		  view+="<div><p class='text-center'><br>"+data.list[i].qnaContent+"</p><hr></div>"; 
                     	  
                     	  if(data.list[i].reply_content==null)
                     	  {
                     		 view+= "<div><p class='text-center'><br> 아직 답변이 작성되지 않았습니다. 조금만 기다려주세요! <br></p></div></td></tr>";
                     	  }	  
                     	  else
                     	  {
                     		  view+= "<div><p class='text-center'><br>안녕하세요,고객님. Free Fleuri의 스탭 영지니주리입니다 ^^ <br>"+data.list[i].reply_content+"</p></div></td></tr>";
                     	  }	
                     
                   }
                   else
                   {
                	      view += "<tr><td class='text-center'>"+data.list[i].pno+"</td>";
                   	      view += "<td class='text-center'>"+data.list[i].qnaNo+"</td>";
                		  view +="<td class='text-center'>"+fn_cate(data.list[i].qna_cate_no)+"</td>";
                		  view += "<td class='text-center'><a onclick='fn_toggle("+data.list[i].qnaNo+",this)'  >"+data.list[i].qnaTitle+"</a></td>";  
                		  view += "<td class='text-center'>"+data.list[i].qnaDate+"</td>";
                		  
                		  if(data.list[i].qnaState=='답변대기')
	                      {
	                       	view += "<td class='text-center'><span class='badge badge-warning'>답변대기</span></td>";
	                      }	   
                       	  else view += "<td class='text-center'><span class='badge badge-primary'>답변완료</span></td>";
                		  
                          view +="<td class='text-center'><button class='btn btn-default' onclick='fn_qnaEdit(${q.qnaNo},this);'>수정하기</button><button class='btn btn-default' onclick='fn_qnaDel(${q.qnaNo},this);'>삭제하기</button></td></tr>";
                		 
                		                   
                		  view += "<tr><td class='"+data.list[i].qnaNo+"' colspan='7' class='text-center' style='display:none;'>";
                		  view+="<div><p class='text-center'><br>"+data.list[i].qnaContent+"</p><hr></div>"; 
                      	  
                      	  if(data.list[i].reply_content==null)
                      	  {
                      		 view+= "<div><p class='text-center'><br> 아직 답변이 작성되지 않았습니다. 조금만 기다려주세요! <br></p></div></td></tr>";
                      	  }	  
                      	  else
                      	  {
                      		  view+= "<div><p class='text-center'><br>안녕하세요,고객님. Free Fleuri의 스탭 영지니주리입니다 ^^ <br>"+data.list[i].reply_content+"</p></div></td></tr>";
                      	  }	
                   }
                }   
            
             }
             else
             {
             	qnaList.innerHTML += "<td class='text-center'>아무것도 없어요</td>";
             }   
             
             $("#qnaList").html(view);
             $("#qnaPageBar").html(qnaPageBar);   
             
           },
           
           error:function(jxhr,textStatus,error)
           {
               console.log("mainMall ajax 실패 : "+jxhr+" "+textStatus+" "+error); 
          }         
       });
    }
	
	function fn_review(cPage)
	   {
	        
	        $.ajax
	        ({
	            url:"${path}/mypage/myReview.do",
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
	                    	view += "<p>"+data.list[i].reContent+"</p></div></div></div></div></div></div>";
	                    
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
	                    	else if (data.list[i].stars==1)
	                    	{
	                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
	                    	}
	                    	
	                    	view += "<span class='float-right'>"+data.list[i].reDate+"</p><div class='clearfix'>";
	                    	view += "<p>"+data.list[i].reContent+"</p></div></div></div></div></div></div>";
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
<<<<<<< HEAD
=======

		
>>>>>>> branch 'master' of https://github.com/shfkddlgpqls/newChemin.git
		
	<section>
		<div class="container">
			<div class="row">
	
		  	<div class="col-md-12">
		  	
		  	<div>
		  		<h3>게시글 관리</h3>
		  		<br>
		  	</div>		
		  	
		  	<div class="shadow-sm p-4 mb-4 bg-white">
				<h2>Q&A</h2>	
			</div>
		  	
 		  		<div class="table">
			        <table>
			                  <thead>      
			                    <tr>
			                   	  <th class="text-center" style="width: 10%">상품코드</th>
			                      <th class="text-center" style="width: 10%">글 번호</th>
			                      <th class="text-center " style="width: 15%">카테고리</th>
			                      <th class="text-center " style="width: 20%">제목</th>           
			                      <th class="text-center "style="width: 20%">등록일</th>
			                      <th class="text-center " style="width: 15%">답변 상태</th>
			                      <th class="text-center " style="width: 10%"></th>
			                    </tr>
			                  </thead>
			                  
			                  <tbody id="qnaList">
			                  <c:forEach items="${qlist }" var="q">
			                 <tr>
			            	     <td class='text-center'>
                     				${q.pno}
                     			</td>
			                 
                     			<td class='text-center'>
                     				${q.qnaNo}
                     			</td>
                     			
		                    	<c:choose>
		  							<c:when test="${q.qna_cate_no==1 }">
		  						 		<td class='text-center'>상품문의</td>
		  							</c:when>
		  						
		  							<c:when test="${q.qna_cate_no==2 }">
		  						 		<td class='text-center'>교환문의</td>
		  							</c:when>
		  						
		  							<c:when test="${q.qna_cate_no==3 }">
		  						 		<td class='text-center'>환불문의</td>
		  							</c:when>
		  						
		  							<c:when test="${q.qna_cate_no==4 }">
		  						 		<td class='text-center'>반품문의</td>
		  							</c:when>
		  					
		  							<c:when test="${q.qna_cate_no==5 }">
		  								 <td class='text-center'>기타문의</td>
		  							</c:when>
  								</c:choose>
  					
                          		<td class='text-center'>
                          			<a onclick='fn_toggle("${q.qnaNo}")' >${q.qnaTitle}</a>
                          		</td> 
                          
                          		<td class='text-center'>
                          	  		${q.qnaDate}
                        	   </td>
                          
                          		<td class='text-center'>		
                      	    		<c:choose>
			  							<c:when test="${q.qnaState=='답변대기'}">
			  						 		<span class="badge badge-warning">답변대기</span>
			  							</c:when>
			  						
			  						<c:otherwise> 	
			  							<span class="badge badge-primary">답변완료</span>
			  						</c:otherwise>
			  						
		  							</c:choose>
                          		</td> 
                          		
                          		<td class='text-center'>
			  						<button class="btn btn-default" onclick="fn_qnaEdit(${q.qnaNo},this);">수정하기</button>
			  						<button class="btn btn-default" onclick="fn_qnaDel(${q.qnaNo},this);">삭제하기</button>
                          		</td>          
                    		</tr>
                    	          
                         	<tr>
                         		<td class='${q.qnaNo}' colspan='7' class='text-center' style='display:none;'>
                          			<div>
                          				<p class='text-center'><br>${q.qnaContent}</p><hr>
                          			</div>
                          			
                          			<div>                       				
                          				<c:choose>
				  							<c:when test="${q.reply_content==null}">
				  								<p class='text-center'><br>아직 답변이 작성되지 않았습니다. 조금만 기다려주세요! <br></p> 	
				  							</c:when>
				  						
				  							<c:otherwise> 		
				  								<p class='text-center'><br>안녕하세요, 고객님. Free Fleuri의 스탭 영지니주리입니다 ^^  <br>${q.reply_content}</p> 	
				  							</c:otherwise>
			  						
		  							    </c:choose>
                          			</div>
                          		</td>
                           </tr>                 
                    	 </c:forEach> 
                    	 
		      	    	</tbody>        
		      	    	      
		  			 </table>
    			  </div>  	
		   		 
		   		 <!-- qna 페이지바 -->
		   		<div class="row justify-content-center" id="qnaPageBar">
			       	<c:if test="${not empty qnaPageBar }">
			          	${qnaPageBar }
			        </c:if>
			     </div> 
		   		 
		  <div class="shadow-sm p-4 mb-4 bg-white">
				<h2>Review</h2>	
			</div>
		  	
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
				                   	</div>
			                   	</div>
			                 </div>
			             </div>
		           	</div>
		           	</c:forEach>
		    	</div>
		   		 <br>
		   		 
		   		  <!-- 페이지바 -->   	
		   		  <div class="row justify-content-center" id="reviewPageBar">
					<c:if test="${not empty reviewbar }">
		          		${reviewbar }
		          	</c:if>
			      </div>
		   		  
		   		  	 
		</div>
	</div> 	
	</div>

<!-- 문의하기 모달 시작 -->
		  <!-- The Modal -->
        <div class="modal fade" id="q_a_edit">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">문의 글 수정</h4>
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
    