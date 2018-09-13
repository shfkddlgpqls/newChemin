<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*,com.kh.chemin.community.model.vo.Attachment'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath }" var="path"/>
<link href="https://fonts.googleapis.com/css?family=Francois+One" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poor+Story" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>  
<style>
table tr td img#list_icon{top:1.6%;left:2.4%;height:30px;width:30px;}
table.post div#comList > div#inComment {width:100%;height:100px;}
.float{float:right;}
a{color:#5d5d5d;}
.modalPo{margin-left:2%;}
</style>

<script type="text/javascript">

	/* 좋아요 작동안됨 */
	$(function(){
		$("#heart").click(function(){
			$(this).attr("src","https://icongr.am/jam/heart-f.svg?size=30&color=red");
	
		});
	});
	
	 function like(obj) {
		var communityno=$(obj).data("no");
		console.log("communityno:"+communityno);
		
		$.ajax({
			type : 'POST',
			url : "${path}/community/like.do?community_no="+communityno,
			dataType : "json",
			success : function(data) {
				alert('하이');
				var msg='';
				var like_img='';
				msg += data.msg;
				alert(msg);
				
				if(data.like_check==0)
				{
					like_img="https://icongr.am/jam/heart.svg?size=30";
				}
				else
				{
					like_img="https://icongr.am/jam/heart-f.svg?size=30&color=ff4848";
				}
				$('#like_img',frm_read).attr('src',like_img);
				$('#like_cnt').html(data.like_cnt);
				
			}
		});
		
	} 
	
	
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
	
	/* 게시물 수정 */
	function munityUpdate(obj) {
		var communityno=$(obj).data("no");
		location.href="${path}/community/communityUpdate.do?community_no="+communityno; 
	}
	
	/* 게시물 삭제 */
	function munityDelete(obj) {
		var communityno=$(obj).data("no");
		location.href="${path}/community/communityDelete.do?community_no="+communityno;
	}
	
	/* 관리자 게시물 삭제 */
	function adminDelete(obj) {
		var communityno=$(obj).data("no");
		location.href="${path}/community/adminDelete.do?community_no="+communityno;
	}
	
	/* 작성자의 댓글 삭제 */
	function commentDelete(obj) {
		var commentno=$(obj).data("no");
		location.href="${path}/community/commentDelete.do?comment_no="+commentno;
	}
	
	/* 작성자의 댓글 수정, 댓글 번호 보내기 */
	function commentUpdate(obj) {
		var commentno=$(obj).data("no");
		$('#updateModal').modal();
		$('#comment_no').val(commentno);
	}
	

	/* 댓글 수정 유효성검사 */
	function comUpdate() {
		var comCon=$('#comContent').val().trim();
		if(comCon==null||comCon=="") {
			alert('내용을 입력하세요.');
			return false;
		}
	}
	/* 카테고리별 게시물 분류 */
	
</script>
<div style="background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);width:100%;height:30%;">
	<p class="text-center" style="font-family: 'Francois One', sans-serif;font-size:70px;padding-top:5%;color:white;text-shadow:2px 2px 4px gray;">GOOD TIP</p>
</div>
<section>
	<div class="community_list" style="position:relative; height:auto; visibility: visible;width:59%;margin-left:20%;">
		<ul class="nav" style="width:50%;float:left;">
               <li class="nav-item">
                 <a class="nav-link" href="#all">전체보기</a>
               </li>
               <li class="nav-item">
                 <a class="nav-link" id="inter" href="#">인테리어</a>
               </li>
               <li class="nav-item">
                 <a class="nav-link" id="repair" href="#">집수리</a>
               </li>
               <li class="nav-item">
                 <a class="nav-link" id="security" href="#">보안</a>
               </li>
               <li class="nav-item">
                 <a class="nav-link" id="cook" href="#">1인레시피</a>
               </li>
               <li class="nav-item">
                 <a class="nav-link" id="cleaning" href="#">청소</a>
               </li>
          	 </ul>
          	  <form name="communitySearchFrm" id="search" action="${path }/community/communitySearch.do" method="post">
              	<div class="float" style="right:20%;">
	   				<input id="searchValue" name="searchValue" type="text" placeholder="해시태그 검색" style="border:none;outline:none;border-bottom: 1px solid gray;">
                 	<button type="submit" class="size4 bg7 bo-rad-15 hov1 s-text14 trans-0-4" style="border:none;outline: none;">
                          search
                     </button>
		  		</div>
			</form>
		</div>	
		<div>
			<button class="btn btn-primary float" type="button" style ="margin-right:2%;" onclick="location.href='${path }/community/communityWrite.do'">글쓰기 
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
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
