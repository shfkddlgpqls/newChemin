<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*,com.kh.chemin.community.model.vo.Attachment'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath }" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>  
<style>
table tr td img#list_icon{top:1.6%;left:2.4%;height:30px;width:30px;}
table.post div#comList > div#inComment {width:100%;height:100px;}
</style>

<script type="text/javascript">

/* 좋아요 작동안됨 */
$(function(){
	$("#heart").click(function(){
		$(this).attr("src","https://icongr.am/jam/heart-f.svg?size=30&color=red");

	});
});


/* ajax 댓글 조회하기 */

var i;
function showComment(obj) {
	var communityno=$(obj).data("no");
	alert(communityno);
	$.ajax({
		type : 'GET',
		url : "${path}/community/commentList.do?community_no="+communityno,
		dataType : "json",
		success : function(data) {
			if(data.commentList.length > 0) {
				 for(var i=0;i<data.commentList.length;i++){
					 alert(data);
					 $(".showComment").parents("tr").next("tr").find("div.comList").append("<div class='inComment'><p style='margin-left:1%;'><br>"+data.commentList[i].WRITER+" "+data.commentList[i].COMMUNITYDATE+"</p><p style='background-color:#E7E7E7;border:2px solid #E7E7E7;padding:10px;border-radius:30px;margin-left:1%;'>"+data.commentList[i].CONTENT+"</p></div></div><br>"); 
				 	
				 };   
			}
		
			else {
				alert("등록된 댓글이 없습니다.");
			}
		}
	});  
}


/* function writeComment(code) {

	alert("ajax 전::"+code);
	$.ajax({
		type : 'POST',
		url : "${path}/community/commentWrite.do",
		data : $('#commentFrm').serialize(),
		dataType : "json",
		success : function(data) {
			
			if(data=="success") {
				showComment();
				$('#comWrite').val('');
			}
		}
		
	});
} */


function commentWrite(obj) {
	var no=$(obj).data("no");
	var content=$('.content').val();
	var insertData="no="+no+"&content="+content;
	alert(insertData);
	$.ajax({
		url : "${path}/community/commentWrite.do",
		type : 'post',
		data : insertData,
		sucess:function(data) {
			if(data==1) {
				showComment();
				$('$content').val('');
			}
		}
	});
}

</script>
<div class="main-menu"></div>
<section>
		<div class="community_list" style="position:relative; height:100%; visibility: visible;width:59%;margin-left:20%;">
			<div>
				<ul class="nav">
                <li class="nav-item">
                  <a class="nav-link" href="#top">전체보기</a>
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
                 <input id="search" class="form-control" style="width:20%;">
                 <button class="btn"><i class="fa fa-search"></i></button>
                <button class="btn btn-outline-success" type="button" onclick="location.href='${path }/community/communityWrite.do'">글쓰기 
             </ul>
			</div>	
			<div class="container">
				<c:forEach items="${list}" var="c"> 
				<input id="community_no" name="community_no" value="${c.COMMUNITYNO }">
				<table class="post" border="1" bordercolor="black">
					<tr>
						<td rowspan="5" width="50%">
							<c:forEach items="${attList }" var="a">
								<c:if test="${c.COMMUNITYNO eq a.COMMUNITYNO}"> 
								 <%--   <c:forEach items="${fileCount }" var="fc">  
								   		<c:if test="${fc.COMMUNITYNO eq a.COMMUNITYNO}">
											<c:if test="${fc.COUNT > 1}">  
									  			<img src="https://icongr.am/jam/pictures.svg?size=30&color=black">
											</c:if>  
										</c:if>
									</c:forEach>  --%>
									<c:forTokens items="${a.RENAMEDFILENAME }" delims="." var="v" varStatus="status">
										<c:if test="${status.last }">
                                              <c:choose>
                                                  <c:when test="${v eq 'mp4'}">
                                                  <video controls="controls" width="560px" height="auto">
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
						<td height="12%">
							<img src="${path }/resources/community/image/report_icon.gif" style="margin-left:87%;"/>
							<p>${c.WRITER }<br>
							<fmt:formatDate value="${c.COMMUNITYDATE}" pattern="yyyy년  MM월  dd일"/></p>
						</td>
					</tr>
					<tr>
						<td rowspan="2">
							<h3>${c.TITLE }</h3><br>
						<span style="font-size:20px;color:#8C8C8C;">${c.CONTENT }</span>
						</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td height="12%">
						<c:forTokens items="${c.HASHTAG }" delims="," var="ht">
							&nbsp<a class="hashTag" name="hashTag" href="#hashTag">${ht }</a>&nbsp
						</c:forTokens>
						</td>
					</tr>
					<tr>
						<td height="13%">
							<button type="button" class="showComment" class="btn btn-outline-light" data-no="${c.COMMUNITYNO }" onclick="showComment(this)">
								<img class="post-img button" src="https://icongr.am/jam/message.svg" style="height:50px;width:50px;float:left;"/>
							</button>
							<button type="button" class="like btn btn-outline-light" onclick="like()">
								<img class="post-img like_check" style="height:50px;width:50px;" src="https://icongr.am/jam/heart.svg?size=30">
							</buttons>
							<p class="post-thenumber" style="font-size:15px;float:right;">좋아요 ${c.LIKECOUNT}개</p><br>
						</td>
					</tr>
					<tr>
						<td colspan="2" >
							<div class="comment" style="height:90px;width:auto;">
								<%-- <input type="hidden" id="communityno" name="communityno" value="${c.COMMUNITYNO }" > --%>
								<%-- <input type="hidden" id="comWriter" name="comWriter" value="${memberLoggedIn.userId}"> --%>
								<input type="text" class="form-control" id="content" name="content" placeholder="댓글을 입력하세요" style="width:85%;margin-top:3%;margin-left:5%;float:left;">
								<a class="btn btn-primary" id="commentWrite" data-no="${c.COMMUNITYNO }" onclick="commentWrite(this)" style="float:right;margin-top:3%;margin-right:2%;">등록</a>
				
						<%-- <c:forEach items="${commentList }" var="cl">
							<c:if test="${cl.COMMUNITYNO eq c.COMMUNITYNO }"> --%>
							<div class="comList" style="width:90%;height:auto;margin-left:5%;margin-right:2%;margin-bottom:2%;">
								
							</div>
							<%-- </c:if>
						</c:forEach> --%>
						</div>
						</td>
					</tr>
				</table><br><br>	
				</c:forEach>
		
		
		<!-- plus botton -->
		<!-- <div class="row" style="text-align:center;">
			<button id="more-btn" class="btn btn-primary btn-lg" onclick="moreList()">더보기</button>
		</div>  -->
		</div>
</section>
