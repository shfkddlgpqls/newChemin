<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
<link href="https://fonts.googleapis.com/css?family=Francois+One" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poor+Story" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- 마이페이지 css-->
<link rel="stylesheet" type="text/css" href="${path}/resources/base/css/mypage.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script>
	/* ajax 댓글 조회하기 */
	var i;
	function showComment(obj) {
		var communityno=$(obj).data("no");
/* 		alert(communityno); */
		$.ajax({
			type : 'GET',
			url : "${path}/community/commentList.do?community_no="+communityno,
			dataType : "json",
			success : function(data) {
				if(data.commentList.length > 0) {
					 for(var i=0;i<data.commentList.length;i++){
						var date=new Date(data.commentList[i].COMMENTDATE);
						var fmDate=date.toISOString().slice(0,10);
						
						$(obj).parents("tr").next("tr").find("div.comList").append("<br><div value='"+data.commentList[i].COMMENTNO+"'><div class='inComment' style='height:100px;'><p><br><br>"+data.commentList[i].WRITER+" / "+fmDate+"</p><p style='background-color:#E7E7E7;border:2px solid #E7E7E7;padding:10px;border-radius:30px;margin-left:1%;float:left;'>"+data.commentList[i].CONTENT+"</p>");
						
						if("${memberLoggedIn.userId}"==data.commentList[i].WRITER)  
					 	{ 	
							$(obj).parents("tr").next("tr").find("div.comList").append("<button class='btn btn-danger' style='float:right;' data-no='"+data.commentList[i].COMMENTNO+"' onclick='commentDelete(this)'>삭제</button><button class='btn btn-default' data-no='"+data.commentList[i].COMMENTNO+"' onclick='commentUpdate(this)' data-toggle='modal' data-target='#updateModal' style='float:right;'>수정</button></div></div>");
						 }
						
					 };   
				}
			
				else {
					alert("등록된 댓글이 없습니다.");
				}
			}
		});  
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
				      <strong><a class="nav-link mypageAtag" href="${path }/mypage/myCommunityList.do?userId=${memberLoggedIn.userId}">커뮤니티 관리</a></strong>
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
	

		<div style="width:100px;height:20px;margin-left:75%;">
			<button class="btn btn-primary float" type="button" onclick="location.href='${path }/community/communityWrite.do'">글쓰기 
		</div>
		<div class="container" style="font-family: 'Poor Story', cursive;">
			<c:forEach items="${list}" var="c"> 
			<input id="community_no" name="community_no" value="${c.COMMUNITYNO }">
			<br>
			<table class="post" border="1" bordercolor="white" style="width:100%;">
				<tr>
					<td rowspan="5" width="50%">
						<c:forEach items="${attList }" var="a">
							<c:if test="${c.COMMUNITYNO eq a.COMMUNITYNO}"> 
								<c:forTokens items="${a.RENAMEDFILENAME }" delims="." var="v" varStatus="status">
									<c:if test="${status.last }">
                                             <c:choose>
                                                 <c:when test="${v eq 'mp4'}">
                                                 <video controls="controls" width="566px" height="364px">
                                                     <source class="list_pic" style="position:relative;float:left;top:0.1%;" alt="${c.TITLE }" src="${path }/resources/upload/community/${a.RENAMEDFILENAME}"/>
                                                 </video>
                                                 </c:when>
                                                 <c:when test="${v eq 'jpg'}">
                                                     <img class="list_pic" style="position:relative;float:left;top:0.1%;" alt="${c.TITLE }" src="${path }/resources/upload/community/${a.RENAMEDFILENAME}"> 					
                                                 </c:when>
                                             </c:choose>
									</c:if>
								</c:forTokens>
							</c:if> 
                           </c:forEach>
					</td>
					<td height="12%" bgcolor="#b7bdc9">
						<img src="${path }/resources/community/image/report_icon.gif" style="margin-left:87%;"/>
						<c:if test="${memberLoggedIn.userId == c.WRITER}">
						<div class="dropdown">
							<img class="dropdown-toggle" data-toggle="dropdown" src="https://icongr.am/jam/more-f.svg?color=d5d5d5" style="float:right;padding-right:1%;">
							<ul class="dropdown-menu">
								<li><a style="color:black;" data-no="${c.COMMUNITYNO }" onclick="munityUpdate(this)">수정</li>
								<li><a style="color:black;" data-no="${c.COMMUNITYNO }" onclick="munityDelete(this)">삭제</li>
							</ul>
						</div>
						</c:if>
						<c:if test="${memberLoggedIn.userId == 'admin'}">
							<img src="https://icongr.am/clarity/times.svg" style="float:right" data-no="${c.COMMUNITYNO }" onclick="adminDelete(this)">
						</c:if>
						<p id="writer" name="writer" style="float:left;right:1%;color:white;font-size:22px;">${c.WRITER }<br>
						<fmt:formatDate value="${c.COMMUNITYDATE}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
					</td>
				</tr>
				<tr>
					<td rowspan="2">
						<h3>${c.TITLE }</h3><br>
					<span style="font-size:20px;color:#5d5d5d;">${c.CONTENT }</span>
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td height="12%">
					<c:forTokens items="${c.HASHTAG }" delims="," var="ht">
						&nbsp<a class="hashTag" name="hashTag" href="#hashTag" style="background-color:#d5d5d5;color:#5d5d5d;">${ht }</a>&nbsp
					</c:forTokens>
					</td>
				</tr>
				<tr>
					<td height="13%">
						<button type="button" class="showComment btn btn-outline-light" data-no="${c.COMMUNITYNO }" onclick="showComment(this)">
							<img class="post-img button" src="https://icongr.am/jam/message.svg" style="height:50px;width:50px;float:left;"/>
						</button>
						<button type="button" id="like" class="btn btn-outline-light" data-no="${c.COMMUNITYNO }" onclick="like(this)">
							<img class="post-img like_check" id="like_img" style="height:50px;width:50px;"src="https://icongr.am/jam/heart.svg?size=30">
						</button>
						<p class="post-likenumber" style="font-size:15px;float:right;">좋아요 <span id="like_cnt"></span>개<br>
						댓글 ${c.CCOUNT }개 </p>
					</td>
				</tr>
				<tr>
					<td colspan="2" >
						<div class="comment" style="height:auto;width:auto;">
						<form name="commentWriteFrm" action="${path }/community/commentWrite.do" method="post">
							<input type="hidden" class="communityno" name="communityno" value="${c.COMMUNITYNO }" >
							<input type="hidden" class="comWriter" name="comWriter" value="${memberLoggedIn.userId}"> 
							<input type="text" class="form-control commentContent" name="commentContent" placeholder="댓글을 입력하세요" style="width:85%;margin-left:5%;float:left;margin-bottom:2%;" requried>
							<input type="submit" class="commentWrite btn btn-primary" style="float:right;width:80px;margin-right:2%;" value="등록"></input>
						</form><br>
						<div class="comList" style="width:auto;height:auto;margin-left:2%;margin-right:2%;margin-bottom:2%;">
						
						</div>
					</td>
				</tr>
			</table><br>	
		</c:forEach>
	</div>
	
	<!-- 댓글 수정 Modal -->
  <div class="modal fade" id="updateModal" role="dialog" tabindex="-1" aria-labelledby="updateModalTitle" aria-hidden="true">
    <div class=" modal-dialog modal-dialog-centered">
    
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">댓글 수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <form id="commentUpdateFrm" action="${path }/community/commentUpdate.do" method="post" onsubmit="return comUpdate();">
        <div class="modal-body">
        	<input id="comment_no" name="comment_no" type="hidden"/> 
        	<div >
		       <div class="input-group-prepend modalPo" >
		      	<span class="input-group-text">작성자</span>
		      	<input name="writer" value="${memberLoggedIn.userId }" readonly>
		      </div>
	       </div><br>
    	  <span class="modalPo">내용</span><br>
	      <textarea type="text" row="2" class="modal_content modalPo" id="comContent" name="content" style="width:95%;"></textarea>
      	</div>
      	
      	<div class="modal-footer">
          <button type="submit" class="btn btn-primary">등록</button>
        </div>
         </form>
     </div>
   </div>
  </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>