<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*, com.kh.chemin.acbook.model.vo.AcCom"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!-- jQurery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!--smarteditor -->
<script	src="<c:url value="/resources/acbook/editor/js/HuskyEZCreator.js"/>"></script>

<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/acbook/sideBar.jsp" />
<style>
.comment{
	text-align:left;
}
.panel-shadow {
    box-shadow: rgba(0, 0, 0, 0.3) 7px 7px 7px;
}
.panel-white {
  border: 1px solid #dddddd;
}
.panel-white  .panel-heading {
  color: #333;
  background-color: #fff;
  border-color: #ddd;
}
.panel-white  .panel-footer {
  background-color: #fff;
  border-color: #ddd;
}

.post .post-heading {
  height: 95px;
  padding: 20px 15px;
}
.post .post-heading .avatar {
  width: 60px;
  height: 60px;
  display: block;
  margin-right: 15px;
}
.post .post-heading .meta .title {
  margin-bottom: 0;
}
.post .post-heading .meta .title a {
  color: black;
}
.post .post-heading .meta .title a:hover {
  color: #aaaaaa;
}
.post .post-heading .meta .time {
  margin-top: 8px;
  color: #999;
  text-align:left;

}
.post .post-image .image {
  width: 100%;
  height: auto;
}
.post .post-description {
  padding: 15px;
}
.post .post-description p {
  font-size: 14px;
}
.post .post-description .stats {
  margin-top: 20px;
}
.post .post-description .stats .stat-item {
  display: inline-block;
  margin-right: 15px;
}
.post .post-description .stats .stat-item .icon {
  margin-right: 8px;
}
.post .post-footer {
  border-top: 1px solid #ddd;
  padding: 15px;
}
.post .post-footer .input-group-addon a {
  color: #454545;
}
.post .post-footer .comments-list {
  padding: 0;
  margin-top: 20px;
  list-style-type: none;
}
.post .post-footer .comments-list .comment {
  display: block;
  width: 100%;
  margin: 20px 0;
}
.post .post-footer .comments-list .comment .avatar {
  width: 35px;
  height: 35px;
}
.post .post-footer .comments-list .comment .comment-heading {
  display: block;
  width: 100%;
}
.post .post-footer .comments-list .comment .comment-heading .user {
  font-size: 14px;
  font-weight: bold;
  display: inline;
  margin-top: 0;
  margin-right: 10px;
}
.post .post-footer .comments-list .comment .comment-heading .time {
  font-size: 12px;
  color: #aaa;
  margin-top: 0;
  display: inline;
}
.post .post-footer .comments-list .comment .comment-body {
  margin-left: 50px;
}
.post .post-footer .comments-list .comment > .comments-list {
  margin-left: 50px;
}
</style>
<!-- Main Start -->
<div class="col-md-10 col-sm-8 main-content" id="newMain">
	<div class="container-fluid">
<!-- 	여기서부터 내용 쓰면 됨 -->
<!-- test2 -->
<br><br>
<div class="row justify-content-center">
    <div class="col-sm-12">
        <div class="panel panel-white post panel-shadow" style="background-color:white;">
		    	<div class='pull-right'>
		    	<button class='btn btn-primary' id='updateWrite'>글수정</button>
		    	<button class='btn btn-primary' id='deleteWrite'>글삭제</button>
		    	</div>
            <div class="post-heading">
                <div class="pull-left image">
                    <img src="https://image.flaticon.com/icons/svg/138/138283.svg" class="img-circle avatar" alt="user profile image">
                </div>
                <div class="pull-left meta">
                    <div class="title h5">
                        <a href="#"><b>${acc.userId }</b></a>
                        <span>${acc.accTitle }</span>
                    </div>
                    <h6 class="text-muted time">${acc.accDate }</h6>
                </div>
            </div> 
            <hr>
            <div class="post-description"> 
                <div>${acc.editor}</div>
                <div class="stats">
                    <a href="#" class="btn btn-default stat-item">
                        <i class="fa fa-thumbs-up icon"></i>2
                    </a>
                    <a href="#" class="btn btn-default stat-item">
                        <i class="fa fa-share icon"></i>12
                    </a>
                </div>
            </div>
            <div class="post-footer">
                <form>
                <div class="input-group">
                 	<input type="hidden" id="rDate" name="rDate">
`                	<input type="hidden" id="rNo" name="rNo" value="0">
                	<input type="hidden" id="accNo" name="accNo" value="${acc.accNo }">
                	<input type="hidden" id="userId" name="userId" value="${memberLoggedIn.userId }"> 
                    <input class="form-control" placeholder="댓글 입력" type="text" id="rContent" name="rContent">
                    <span class="input-group-addon">
                        <button class="btn btn-info" type="button" id="callAjax">*</button>  
                    </span>
                </div>
                </form>
                <table id="tbl-reply">
                </table>
            </div>
        </div>
    </div>
</div>
<!-- test2 -->
	</div>
</div>
<!-- Main End -->
</div>
</div>
<!-- Side Bar Div End -->
<script>
$('#updateWrite').on('click',function(){
	if('${acc.userId}'=='${memberLoggedIn.userId}'){

		location.href="${pageContext.request.contextPath}/acbook/updateWrite?accNo="+${acc.accNo};
		
	}else{
		swal("작성자만 수정이 가능해요.");
	}
})
</script>
<script>
$('#deleteWrite').on('click',function(){
	if('${acc.userId}'=='${memberLoggedIn.userId}'){
		location.href="${pageContext.request.contextPath}/acbook/deleteWrite?accNo="+${acc.accNo};
	}else{
		swal("작성자만 삭제가 가능해요.");
	}
})
</script>
<script>

$("#callAjax").click(function(){
	if($("#rContent").val().trim() === ""){
		swal("댓글을 입력하세요.");
		$("#rContent").val("").focus();
	}else{
		$.ajax({
			url: "${path}/acbook/ReplyWrite.do?",
            type: "POST",
            data: {
                accNo : $("#accNo").val(),
                userId : $("#userId").val(),
                rContent : $("#rContent").val(),
            	rDate :$("#rDate").val(),
            	rNo : $("#rNo").val()
            },
            success: function () {
            	swal("댓글이 등록되었습니다.");
            	$("#rContent").val("");
             	getReply();
            },
		})
	}
})
</script>
<script>
$.ajax({
	url: "${path}/acbook/GetReply.do",
    type: "POST",
    data: {	accNo : ${acc.accNo} },
    success: function(data){    	
   		if(data!=null){
   			var html1=$("#tbl-reply").html();
   			var html;
   			for(var i=0;i<data.model.rpList.length;i++){
   				html+="<tr class='comments-list'>";
                html+="<td class='comment'>";
                html+="<a class='pull-left' href='#'>";
                html+="<img class='avatar' src='https://image.flaticon.com/icons/svg/138/138283.svg' alt='avatar'>";
                html+="</a>";
                html+="<div class='comment-body'>";
                html+="<div class='comment-heading'>";
                html+="<h4 class='user'>"+data.model.rpList[i].USERID+"</h4>";
                html+="<h5 class='time'>"+data.model.rpList[i].RDATE+"</h5>";
                html+="</div>";
                html+="<p id="+data.model.rpList[i].RNO+" class='changeRP'>"+data.model.rpList[i].RCONTENT+"</p>";
                html+="</div>";                
                html+="</td>";
            	html+="<td class='pull right'><button type='button' class='btn btn-warning btnComment' onclick=updateR("+data.model.rpList[i].RNO+")>수정</td>"
            	html+="</tr>";
   			}
   			$("#tbl-reply").html(html).show();
   			
   		}else{
			html="<tr><td>댓글이 없습니다.</td></tr>";
			$("#tbl-reply").html(html).show();
		}
   	}
   		
});
</script>
<script>
function getReply(){
	$.ajax({
		url: "${path}/acbook/GetReply.do",
        type: "POST",
        data: {	accNo : ${acc.accNo } },
        success: function(data){
        	
       		if(data!=null){
       			var html1=$("#tbl-reply").html();
       			var html;
       			for(var i=0;i<data.model.rpList.length;i++){
       				html+="<tr class='comments-list'>";
                    html+="<td class='comment'>";
                    html+="<a class='pull-left' href='#'>";
                    html+="<img class='avatar' src='https://image.flaticon.com/icons/svg/138/138283.svg' alt='avatar'>";
                    html+="</a>";
                    html+="<div class='comment-body'>";
                    html+="<div class='comment-heading'>";
                    html+="<h4 class='user' id='rpUserId'>"+data.model.rpList[i].USERID+"</h4>";
                    html+="<h5 class='time'>"+data.model.rpList[i].RDATE+"</h5>";
                    html+="</div>";
                    html+="<div class='changeRP' id="+data.model.rpList[i].RNO+">"+data.model.rpList[i].RCONTENT+"</div>";
                    html+="</div>";                
                    html+="</td>";
                	html+="<td class='pull right'><button type='button' class='btn btn-warning btnComment' onclick=updateR("+data.model.rpList[i].RNO+")>수정</td>"
                	html+="</tr>";
       			}
       			$("#tbl-reply").html(html).show();
       			
       			
       		}else{
				html="<tr><td>댓글이 없습니다.</td></tr>";
				$("#tbl-reply").html(html).show();
			};
       		}
       		
        })
};
</script>
<script>
function updateR(no){
	$("button").hide();
	/* console.log($("#"+no)); */
	var value=$("#"+no).html();
	$("#"+no).html("<form id='replyAc' action='/chemin/acbook/updateReply.do' method='post'><input type='hidden' name='rNo' value="+no+"><input type='text' id='rContents' name='rContent' value='' placeholder="+value+"><input type='button' value='upd'class='btn btn-info upup' onclick='upup(event);'/><button type='button' id='delRP' class='btn btn-danger' onclick=fnfn("+no+")>del</button></form>");	

}
</script>
<script>
function upup(event){
		/* console.log($(event.target).parent().parent().prev().find('.user').html()); */
		var user=$(event.target).parent().parent().prev().find('.user').html();
		if(user=='${memberLoggedIn.userId}'){	
			
			if($("#rContents").val().trim() === ""){
				swal("댓글을 입력하세요.");
				$("#rContents").val("").focus();
				return false;
			}
			else{				
				$("#replyAc").submit();
				swal("수정되었습니다!");  				  
			}
		}else{
			swal("작성자만 수정이 가능해요.");
		}
	}	
	

</script>
<script>
function fnfn(rNo){
	var user=$(event.target).parent().parent().prev().find('.user').html();
	if(user=='${memberLoggedIn.userId}'){		
		location.href="${path}/acbook/deleteRP?rNo="+rNo;
		swal("삭제되었습니다!")
	}else{
		swal("작성자만 삭제가 가능해요.");
	}
}
</script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />