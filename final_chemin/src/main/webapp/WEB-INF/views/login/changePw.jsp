<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/base/css/main.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Custom fonts for this template -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700"
	type='text/css' rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Pacifico"
	type='text/css' rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=M+PLUS+Rounded+1c"
	type='text/css' rel="stylesheet">
<style>
	.btn{
		outline: none;
		border: none;
	}
</style>
<div class="container">
	<div class="col-md-6">
		<br>
		<h4><img alt="id" src="${path }/resources/mall/img/updatePw.png"/>&nbsp;&nbsp;비밀번호 변경하기</h4>
		<table>
			<colgroup><col width="400px"><col width="100px"></colgroup>
			<tr>
				<th><label for="inputEmail3" class="col-sm-2 col-form-label">새로운 비밀번호</label></th>
				<td><label id="pw1res" style="float:fight"></label></td>
			</tr>
			<tr>
				<td colspan="2"><input type="password" class="form-control" id="password1" name="password" placeholder="변경할 비밀번호(8~16글자의 영문,숫자,특수문자조합)"></td>
			</tr>
			<tr>
				<th><label for="inputEmail3" class="col-sm-2 col-form-label">비밀번호 재입력</label></th>
				<td><label id="pw2res" style="float:fight"></label></td>
			</tr>
			<tr>
				<td colspan="2"><input type="password" class="form-control" id="password2" placeholder="비밀번호 확인"></td>
			</tr>
			<tr>
				<td></td>
				<td><button class="btn btn-primary" id="pushEmail" onclick="fn_updatePw()">비밀번호 변경</button></td>
			</tr>
			<tr>
				<td><div id="endEmail1" style="display: none"><input type="password" class="form-control" id="authNum" placeholder="인증번호를 입력하세요"></div></td>
				<td><div id="endEmail2" style="display: none"><button class="btn btn-warning" id="pushEmail" onclick="fn_authCk()">인증하기</button></div></td>
			</tr>
		</table>
		<input type="hidden" id="userId" value="${userId }"/>
	</div>
</div>

<script>
	var userId=$('#userId').val();
	
	var pw1Flag=0;
	var pw2Flag=0;
	var passwordCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	$(document).ready(function(){
		$("#password1").keyup(function(){
			if(passwordCheck.test($("#password1").val())) {
				$("#pw1res").html("사용가능").css("color","green");
				pw1Flag=1;
			}
			else {
				$("#pw1res").html("사용불가").css("color","red");
				pw1Flag=0;
			}
		});
		$("#password2").keyup(function(){
			if($("#password1").val()!=$("#password2").val()) {
				$("#pw2res").html("비밀번호 불일치").css("color","red");	
				pw2Flag=0;
			}
			else {
				$("#pw2res").html("비밀번호 일치").css("color","green");
				pw2Flag=1;
			}
		});
	});
	
	function fn_updatePw(){
		if($('#password1').val().trim()==''){
			$('#password1').focus();
			return false;
		}
		if($('#password2').val().trim()==''){
			$('#password2').focus();
			return false;
		}
		var pw=$('#password1').val();
		if(pw1Flag==1 && pw2Flag==1){
			$.ajax({
		          type:"post",
		          url:"${path}/login/updatePw.do",
		          data:{userId:userId,pw:pw},
		          datatype:"json",
		          success:function(data){
		        	  if(data!=null){
		        		  swal("비밀번호 변경 완료", userId+"님의 비밀번호가 변경되었습니다.\n해당 창은 3초 후 자동으로 꺼집니다.\n다시 로그인 바랍니다.", "success");
		      			 setTimeout(function() {  
		      		        window.close();  
		      		    }, 3000);
		        	  }
		          },
	             error:function(jxhr,textStatus,error){
	                 console.log("update Pw ajax 실패 : "+jxhr+" "+textStatus+" "+error);
	              }
	        }); 
		}
	}
</script>