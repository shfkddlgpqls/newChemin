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
    
   function fn_ad_qna(cPage)
    {     
	    
	   
       $.ajax
       ({
           url:"${path}/admin/adminBoard.do",
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
                       view +="<td class='text-center'><a onclick='fn_toggle("+data.list[i].qnaNo+")' >"+data.list[i].qnaTitle+"</a></td>";  
                       view += "<td class='text-center'>"+data.list[i].userId+"</td>";
                       view += "<td class='text-center'>"+data.list[i].qnaDate+"</td>";
                     
                       if(data.list[i].qnaState=='답변대기')
                       {
                    		view += "<td class='text-center'><span class='badge badge-warning'>답변대기</span></td>";
                       }	   
                       else view += "<td class='text-center'><span class='badge badge-primary'>답변완료</span></td>";
  
  
                  		if(data.list[i].qnaState=='답변대기')
                  		{
                  			view+= "<td class='text-center'>"+"<button class='btn btn-default' onclick='fn_modal("+data.list[i].qnaNo+",this);' value='"+data.list[i].pno+"'>답변하기</button>";
                  			view+="<button class='btn btn-default' onclick='fn_modalDel("+data.list[i].qnaNo+");'>삭제하기</button></td></tr>"
                  		}
                  		else view+="<td class='text-center'><button class='btn btn-default' onclick='fn_modalDel("+data.list[i].qnaNo+");'>삭제하기</button></td></tr>" ;
                  		
                  	  view+="<tr><td class='"+data.list[i].qnaNo+"' colspan='8' class='text-center' style='display:none;'>";
                  	  view+="<div><p class='text-center'><br>"+data.list[i].qnaContent+"</p><hr></div>"; 
                  	  
                  	  if(data.list[i].reply_content==null)
                  	  {
                  		 view+= "<div><p class='text-center'><br> 답변이 작성되지 않았습니다. 작성해주세요.<br></p></div></td></tr>";
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
                       view +="<td class='text-center'><a onclick='fn_toggle("+data.list[i].qnaNo+")' >"+data.list[i].qnaTitle+"</a></td>";  
                       view += "<td class='text-center'>"+data.list[i].userId+"</td>";
                       view += "<td class='text-center'>"+data.list[i].qnaDate+"</td>";
                                              
                       if(data.list[i].qnaState=='답변대기')
                       {
                    		view += "<td class='text-center'><span class='badge badge-warning'>답변대기</span></td>";
                       }	   
                       else view += "<td class='text-center'><span class='badge badge-primary'>답변완료</span></td>";
  
                  		if(data.list[i].qnaState=='답변대기')
                  		{
                  			view+= "<td class='text-center'>"+"<button class='btn btn-default' onclick='fn_modal("+data.list[i].qnaNo+",this);' value='"+data.list[i].pno+"'>답변하기</button>";
                  			view+="<button class='btn btn-default' onclick='fn_modalDel("+data.list[i].qnaNo+");'>삭제하기</button></td></tr>"
                  		}
                  		else view+="<td class='text-center'><button class='btn btn-default' onclick='fn_modalDel("+data.list[i].qnaNo+");'>삭제하기</button></td></tr>" ;
                  		
                  	  view+="<tr><td class='"+data.list[i].qnaNo+"' colspan='8' class='text-center' style='display:none;'>";
                  	  view+="<div><p class='text-center'><br>"+data.list[i].qnaContent+"</p><hr></div>";      
                  	  
                  		if(data.list[i].reply_content==null)
                	  {
                		 view+= "<div><p class='text-center'><br> 답변이 작성되지 않았습니다. 작성해주세요.<br></p></div></td></tr>";
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
             	view += "<td class='text-center'>아무것도 없어요</td>";
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
     
     function fn_toggle(no) 
     {
    	 $("."+no).toggle();
	 }
    
     function fn_adminFrmCheck() 
    {
		var emptyCheck = $("#admin_content").val().trim();
		
		if(emptyCheck.length==0)
		{
			alert("답변 내용을 입력해주세요.");
			
			return false;
		}
		else if (emptyCheck.length<10)
		{
			alert("답변은 10자 이상 작성해야합니다.");
			return false;
		}
		else
		{
			$("#adminQnaFrm").submit();		
		}	
	
	}
     
     function fn_modal(qnaNo,obj) 
     {
 //   	alert(qnaNo);
    	var pno = $(obj).attr('value');
 //   	alert(pno);
    	 
		$("#board_num").val(qnaNo);
		$("#goods_code").val(pno);
		$("#answer_modal").modal();
		
   	 }
     
     //삭제하기
     function fn_modalDel(qno) 
     {
		$("#modal_qno").val(qno);
		
		$("#adminQnaDel").modal();
		
	 }
     
     function fn_adminQnaDelConfirm() 
     {
		$("#adminQnaDelFrm").submit();
     }
    
     
    
    </script>
    
    

	
<section>
		<div class="container">
			<div class="row">

			  	<div class="col-md-12">
			  	
				  	<div>
				  		<h3>문의 게시글 관리</h3>
				  		<br>
				  	</div>	
				  	
				  	<!-- <div style='margin-left:65%'>
				
			               <div class="input-group col-12">
		                     <div class="input-group-prepend">   
		                      
		                       		<select class="form-control" id="search_option" name="search_option">
					                   <option value="0" disabled selected>검색 조건 </option>
					                    <option value="code">상품 코드 </option>
					                    <option value="bNo">글 번호</option> 
					                    <option value="writer">작성자</option>             
					                  </select>
		                     </div>
		                     <input type="text" class="form-control input-sm" placeholder="검색어 입력" name="searchText" id="searchText">
		                  	 <button class="btn btn-default searchBtn" onclick='fn_search();' style='border-radius:0'>검색</button>
		                  	</div>
              		 </div> -->
					<br>
							
				  	
						<div class="table">
			                <table>
			                  <thead>      
			                    <tr>
			                   	  <th class="text-center" style="width: 10%">상품코드</th>
			                      <th class="text-center" style="width: 10%">글 번호</th>
			                      <th class="text-center " style="width: 10%">카테고리</th>
			                      <th class="text-center " style="width: 20%">제목</th>
			                      <th class="text-center " style="width: 10%">작성자</th>            
			                      <th class="text-center "style="width: 20%">등록일</th>
			                      <th class="text-center " style="width: 10%">답변 상태</th>
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
                        	  		${q.userId}
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
                      	    		<c:choose>
			  							<c:when test="${q.qnaState=='답변대기'}">
			  						 		<button class="btn btn-default" onclick="fn_modal(${q.qnaNo},this);" value="${q.pno}">답변하기</button>
			  						 		<button class="btn btn-default" onclick="fn_modalDel(${q.qnaNo});">삭제하기</button>
			  							</c:when>
			  						
			  						<c:otherwise> 		
			  							<button class="btn btn-default" onclick="fn_modalDel(${q.qnaNo});" >삭제하기</button>
			  						</c:otherwise>
			  						
		  							</c:choose>
                          		</td>          
                    		</tr>
                    	          
                         	<tr>
                         		<td class='${q.qnaNo}' colspan='8' class='text-center' style='display:none;'>
                          			<div>
                          				<p class='text-center'><br>${q.qnaContent}</p><hr>
                          			</div>
                          			
                          			<div>                       				
                          				<c:choose>
				  							<c:when test="${q.reply_content==null}">
				  								<p class='text-center'><br>답변이 작성되지 않았습니다. 작성해주세요.<br></p> 	
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
	 			</div>
			</div> 	<!-- div : row -->
			
			<!-- 페이징바 -->
			     <div class="row justify-content-center" id="qnaPageBar">
			       	<c:if test="${not empty qnaPageBar }">
			          	${qnaPageBar }
			        </c:if>
			     </div>
		</div>
		
	 <!-- 답변하기 모달 시작 -->
        <!-- The Modal -->
        <div class="modal fade" id="answer_modal">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">문의하기</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              
              <!-- Modal body -->
<form action="${path }/admin/qnainsert.do" id="adminQnaFrm" name="adminQnaFrm">              
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
                       <span class="input-group-text">글 번호</span>
                     </div>
                     <input type="text" class="form-control input-sm" placeholder="글 번호" id="board_num" name="board_num" readonly>
                 </div>
               </div>
               
               <div class="col-12">
                  <div class="form-group">
                 <textarea class="form-control" rows="5" id="admin_content" name="admin_content" placeholder="문의 답변을 입력해주세요" required></textarea>
               	  </div>
               </div>
                
              </div>
              
              <!-- Modal footer -->
              <div class="modal-footer">
                <button class="btn btn-success" onclick="return fn_adminFrmCheck();">등록하기</button>
                <button class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
</form>              
            </div>
          </div>
        </div>
        <!-- 답변 하기 모달 끝 -->
        
<!-- 문의 글삭제하기 -->       
   <div class="modal fade" id="adminQnaDel">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">문의글 삭제</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        	
        <!-- Modal body -->
        <div class="modal-body">
             <div class="col-12">
          		<p class="text-center">해당 글을 삭제하시겠습니까? <br>삭제한 글은 복구되지 않습니다. </p> 
          		
          		<form action="${path }/admin/adminQNADel.do" id="adminQnaDelFrm" name="adminQnaDelFrm">  
          		<input type="hidden" name="modal_qno" id="modal_qno" value=""/> 
          		</form>
          		  
              </div>
     
        </div>    
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button class="btn btn-primary" onclick="fn_adminQnaDelConfirm()" >삭제하기</button>
          <button class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
        <!-- 삭제하기 끝 --> 
        
		
		
</section>		
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  
    