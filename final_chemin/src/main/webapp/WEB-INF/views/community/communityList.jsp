<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*,com.kh.chemin.community.model.vo.Attachment'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath }" var="path"/>
<link href="https://fonts.googleapis.com/css?family=Francois+One" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poor+Story" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>  
<style>
table tr td img#list_icon{top:1.6%;left:2.4%;height:30px;width:30px;}
table.post div#comList > div#inComment {width:100%;height:100px;}
.float{float:right;}
a{color:#5d5d5d;}
.modalPo{margin-left:2%;}
input[type="radio"] {display:none;}
.cphoto {
	width: 47px; height: 47px;
    object-fit: cover;
    border-radius: 50%;
}
</style>

<script type="text/javascript">
	
	/* ajax 댓글 조회하기 */
	var i;
	function showComment(obj) {
		var communityno=$(obj).data("no");
/* 		alert(communityno); */
		
		var commentCheck=$(obj).attr('alt');
		if(commentCheck=='false')
		{
			$.ajax({
				type : 'GET',
				url : "${path}/community/commentList.do?community_no="+communityno,
				dataType : "json",
				success : function(data) {
					if(data.commentList.length > 0) {
						 for(var i=0;i<data.commentList.length;i++){
							var date=new Date(data.commentList[i].COMMENTDATE);
							var fmDate=date.toISOString().slice(0,10);
							$(obj).parents("tr").next("tr").find("div.comList").append("<div style='float:left;margin-right:1%;'></div>");
							$(obj).parents("tr").next("tr").find("div.comList").append("<br><div value='"+data.commentList[i].COMMENTNO+"'><div class='inComment' style='height:60px;'><p class='warning'><br><br>"+data.commentList[i].WRITER+" / "+fmDate);
							
							if("${memberLoggedIn.userId}" != data.commentList[i].WRITER)
							{
								$(obj).parents("tr").next("tr").find("div.comList").append("<img style='float:right;' data-no='"+data.commentList[i].WRITER+"' data-toggle='modal' data-target='#reportModal' onclick='fn_report(this)' src='${path}/resources/community/image/alarm(2).png'>");
							}
							4
							$(obj).parents("tr").next("tr").find("div.comList").append("</p><p style='background-color:#E7E7E7;border:2px solid #E7E7E7;padding:10px;border-radius:30px;margin-left:1%;float:left;'>"+data.commentList[i].CONTENT+"</p>");
							
							if("${memberLoggedIn.userId}"==data.commentList[i].WRITER || "${memberLoggedIn.userId}"=='admin')  
						 	{ 	
								$(obj).parents("tr").next("tr").find("div.comList").append("<button class='btn btn-danger' style='float:right;' data-no='"+data.commentList[i].COMMENTNO+"' onclick='commentDelete(this)'>삭제</button>");
							 }
							if("${memberLoggedIn.userId}"==data.commentList[i].WRITER)
							{
								$(obj).parents("tr").next("tr").find("div.comList").append("<button class='btn btn-default' data-no='"+data.commentList[i].COMMENTNO+"' onclick='commentUpdate(this)' data-toggle='modal' data-target='#updateModal' style='float:right;'>수정</button></div></div>");
							}
						 };   
					}
				
					else {
						swal({
							text :"등록된 내용이 없습니다.",
							icon : "error",
							button : "확인"
						});
					}
					$(obj).attr('alt','true');
				}
			});  
		}
		else 
		{
			$(obj).parents("tr").next("tr").find("div.comList").empty();
		}
		$(obj).attr('alt','false');
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
			swal({
				text :"내용을 입력하세요",
				icon : "warning",
				button : "확인"
			});
			return false;
		}
		return true;
	}
	
	
	/* 내 글만 보기 */
	function myPage(obj) {
		var userId=$(obj).data("no");
		
		location.href="${path}/community/myCommunityList.do?userId="+userId;
	}
	
	/* 카테고리별 게시물 분류 */
	function list_cg() {
		var category=$('input[name="gorys"]:checked').val();
		location.href="${path}/community/categoryFind.do?community_category="+category;
	}
	
	/* 신고하기 모달창 */
	
	function fn_report(obj) {
		var rp_name=$(obj).data("no");
		$('#reportModal').modal();
		$('#report_name').val(rp_name);
	}
	
	/* 해시태그 유호성검사 */
	
	function fn_blank(){
		var value=$('#searchht').val();
		if(value==null||value=='')
		{
			swal({
				text :"검색하실 해시태그를 입력하세요",
				icon : "warning",
				button : "확인"
			});
			return false;
		}
		return true;
	}
	
	/* 댓글 추가 유효성검사 */
	function comment_blank() {
		var comment=$('#commentContent').val();
		if(comment==null||comment=='')
		{
			swal({
				text :"추가하실 댓글을 입력하세요",
				icon : "warning",
				button : "확인"
			});
			return false;
		}
		return true;
	}
	
	/* 신고하기 유효성검사 */
	function report_blank() {
		var re=$('input[name="content"]').val();
		console.log(re);
		if(re==null||re=='')
		{
			swal({
				text :"신고할 내용을 입력하세요",
				icon : "warning",
				button : "확인"
			});
			return false;
		}
		return true;
	}
	
	
	</script>
<div style="background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);width:100%;height:30%;">
	<p class="text-center" style="font-family: 'Francois One', sans-serif;font-size:60px;padding-top:6%;color:white;text-shadow:2px 2px 4px gray;">GOOD TIP</p>
</div>
<section>
	<div class="community_list myBtnContainer" style="position:relative; height:auto; visibility: visible;margin-left:2%;">
		<ul class="nav" style="width:50%;float:left;">
               <li class="nav-item">
                  <a class="nav-link" style="" href="${path }/community/communityList.do">
                  	<img src="${path }/resources/community/image/category.JPG">
                  </a>
               </li>
               <li class="nav-item">
              	 <input id="gory2" class="goryinput" type="radio" name="gorys" checked onclick="list_cg()" value="인테리어">
              	 	<label for="gory2">
              	 		<img src="${path }/resources/community/image/category2.JPG">
              	 	</label>
               </li>
               <li class="nav-item">
               	<input id="gory3" class="goryinput" type="radio" name="gorys" checked onclick="list_cg()" value="보안">
               	 <label for="gory3">
               	 	<img src="${path }/resources/community/image/category3.JPG">
               	 </label>
               </li>
               <li class="nav-item">
              	 <input id="gory4" class="goryinput" type="radio" name="gorys" checked onclick="list_cg()" value="1인레시피">
              	  <label for="gory4">
              	  	<img src="${path }/resources/community/image/category4.JPG">
              	  </label>
               </li>
               <li class="nav-item">
               	<input id="gory5" class="goryinput" type="radio" name="gorys" checked onclick="list_cg()" value="청소">
               		<label for="gory5">
               			<img src="${path }/resources/community/image/category5.JPG">
               		</label>
               </li>
          	 </ul>
          	  <form name="communitySearchFrm" id="search" action="${path }/community/communitySearch.do" method="post" onsubmit="return fn_blank();">
              	<div class="float" style="right:20%;margin-right:5%;">
	   				<input id="searchht" name="searchValue" type="text" placeholder="해시태그 검색" style="border:none;outline:none;border-bottom: 1px solid gray;">
                 	<button type="submit" id="hashSearch" class="size4 bg7 bo-rad-15 hov1 s-text14 trans-0-4" style="border:none;outline: none;">
                          search
                     </button>
		  		</div>
			</form>
		</div>	
		<div>
			<button class="btn btn-primary" type="button" style ="margin-right:2%;float:right;" onclick="location.href='${path }/community/communityWrite.do'">글쓰기 
			<button class="btn btn-default" data-no="${memberLoggedIn.userId }" style="float:right;" onclick="myPage(this)">내글만 보기</button>
		</div>
		<div class="container" style="font-family: 'Poor Story', cursive;">
		<c:if test="${list.size() eq 0}">
				<div class="text-center" style="width:100%;margin-top:6%;">
					<span style="font-size:25px;font-family: 'Noto Sans KR', sans-serif;"> 해당되는 게시물이 존재하지않습니다.</span>
				</div>
		</c:if>
			<c:forEach items="${list}" var="c"> 
			<input type="hidden" id="community_no" name="community_no" value="${c.COMMUNITYNO }">
			<br>
			<table class="post" border="1" bordercolor="white" style="width:100%;">
				<tr>
					<td rowspan="5" width="50%">
						<c:forEach items="${attList }" var="a">
							<c:if test="${c.COMMUNITYNO eq a.COMMUNITYNO}"> 
								<c:forTokens items="${a.RENAMEDFILENAME }" delims="." var="v" varStatus="status">
									<c:if test="${status.last }">
                                             <c:choose>
                                                 <c:when test="${v eq 'mp4' or v eq 'MP4'}">
                                                 <video controls="controls" width="460px" height="366px">
                                                     <source class="list_pic" style="position:relative;float:left;top:0.1%;" src="${path }/resources/upload/community/${a.RENAMEDFILENAME}"/>
                                                 </video>
                                                 </c:when>
                                                 <c:when test="${v eq 'jpg' or v eq 'png' or v eq 'JPG' or v eq 'PNG'}">
                                                     <img style="width:460px;height:366px;" class="list_pic" style="position:relative;float:left;top:0.1%;" src="${path }/resources/upload/community/${a.RENAMEDFILENAME}"> 					
                                                 </c:when>
                                             </c:choose>
									</c:if>
								</c:forTokens>
							</c:if> 
                           </c:forEach>
					</td>
					<td height="12%" bgcolor="#b7bdc9">
						<c:if test="${memberLoggedIn.userId ne c.WRITER and memberLoggedIn.userId ne 'admin'}">
							<img src="${path }/resources/community/image/report_icon.gif" style="margin-left:87%;" data-no="${c.WRITER }" data-toggle='modal' data-target='#reportModal' onclick="fn_report(this)"/>
						</c:if>
						<c:if test="${memberLoggedIn.userId == c.WRITER}">
						<div class="dropdown">
							<img class="dropdown-toggle" data-toggle="dropdown" src="${path }/resources/community/image/dots (3).png" style="float:right;padding-right:1%;">
							<ul class="dropdown-menu">
								<li><a style="color:black;" data-no="${c.COMMUNITYNO }" onclick="munityUpdate(this)">수정</li>
								<li><a style="color:black;" data-no="${c.COMMUNITYNO }" onclick="munityDelete(this)">삭제</li>
							</ul>
						</div>
						</c:if>
						<c:if test="${memberLoggedIn.userId == 'admin'}">
							<img src="${path }/resources/community/image/close.png" style="float:right;width:20px;height:20px;" data-no="${c.COMMUNITYNO }" onclick="adminDelete(this)">
						</c:if>
						<div style="float:left;margin-right:1%;"><img class="cphoto" src="${path}/resources/upload/member/${memberLoggedIn.renameImage}"></div>
						<p id="writer" name="writer" style="float:left;right:1%;color:white;font-size:22px;">
							<span name="writer_1"> ${c.WRITER }<span><br>
							<fmt:formatDate value="${c.COMMUNITYDATE}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</p>
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
						<button type="button" id="showComment" class="showComment btn btn-outline-light" alt="false" data-no="${c.COMMUNITYNO }" onclick="showComment(this)">
							<img class="post-img button" src="${path }/resources/community/image/speech-bubble.png" style="height:50px;width:50px;float:left;"/>
						</button>
						<p class="post-likenumber" style="font-size:20px;margin-top:2%;float:right;">
						댓글 ${c.CCOUNT }개 </p>
					</td>
				</tr>
				<tr>
					<td colspan="2" >
						<div class="comment" style="height:auto;width:auto;">
						<form name="commentWriteFrm" action="${path }/community/commentWrite.do" method="post" onsubmit="return comment_blank();">
							<input type="hidden" class="communityno" name="communityno" value="${c.COMMUNITYNO }" >
							<input type="hidden" class="comWriter" name="comWriter" value="${memberLoggedIn.userId}"> 
							<input type="text" id="commentContent" class="form-control commentContent" name="commentContent" placeholder="댓글을 입력하세요" style="width:80%;margin-left:5%;float:left;margin-bottom:2%;" requried>
							<input  type="submit" class="commentWrite btn btn-primary" style="float:right;width:80px;margin-right:2%;" value="등록"></input>
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
  
  <!-- 신고하기 Modal -->
  <div class="modal fade" id="reportModal" role="dialog" tabindex="-1" aria-labelledby="reportModalTitle" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
         	<img style="width:30px;hieght:30px;" src="${path }/resources/community/image/warning.png"/>
       		<h4 class="modal-title">회원 신고</h4>
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <form name="reportFrm" action="${path }/community/reportWrite.do" method="post" onsubmit="return report_blank();">
        <div class="modal-body">
        	<span>거짓 신고를 하실 경우, 회원님께서 제재를 받으실 수 있습니다.<br> 신중한 신고 부탁드립니다.</span>
	        <div class="input-group-prepend modalPo" style="float:left;width:95%;margin-top:3%;">
	        	<select class="form-control smallSzie"  name="category" style="width:60%;float:right;">
	               <option value="광고">광고</option>
	               <option value="욕설">욕설</option>
	               <option value="음란물">음란물</option>
	               <option value="비방글">비방글</option>
	            </select> &nbsp&nbsp&nbsp
			    <span class="input-group-text">신고할 회원</span>
	        	<input id="report_name" name="rwriter" value="${c.WRITER }" type="text" style="width:40%;" readonly>
	        </div>
	     	<br><br>
            <span class="modalPo">내용</span><br>
	      <!-- <textarea type="text" row="2" class="modal_content modalPo" id="comContent" name="content" style="width:95%;"></textarea> -->
	      <input type="text" class="modal_content modalPo" id="comContent" name="content" style="width:95%;height:50px;"/>
       	<div class="modal-footer">
          <button type="submit" class="btn btn-danger">신고하기</button>
        </div>
      </div>
      </form>
    </div>
  </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

