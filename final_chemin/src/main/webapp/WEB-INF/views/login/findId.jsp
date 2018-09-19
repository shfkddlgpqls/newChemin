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
	<div class="col-md-12">
		<br>
		<h4><img alt="id" src="${path }/resources/mall/img/id.png"/>&nbsp;&nbsp;아이디 찾기</h4>
		<table>
			<colgroup><col width="400px"><col width="100px"></colgroup>
			<tr>
				<th colspan="2"><label for="inputEmail3" class="col-sm-2 col-form-label">Name</label></th>
			</tr>
			<tr>
				<td colspan="2"><input type="text" class="form-control" id="userName" placeholder="가입한 이름을 입력하세요"></td>
			</tr>
			<tr>
				<th colspan="2"><label for="inputPassword3" class="col-sm-2 col-form-label">Email</label></th>
			</tr>
			<tr>
				<td colspan="2"><input type="email" class="form-control" id="userEmail" placeholder="가입한 메일을 입력하세요"></td>
			</tr>
			<tr>
				<td><img alt="로딩중" id="loading" style="display: none;float:right" src="${path }/resources/mall/vendor/slick/ajax-loader.gif"/></td>
				<td><div id="startEmail"><button class="btn btn-warning" id="pushEmail" onclick="fn_pushMail()">인증번호 받기</button></div></td>
			</tr>
			<tr>
				<td><div id="endEmail1" style="display: none"><input type="password" class="form-control" id="authNum" placeholder="인증번호를 입력하세요"></div></td>
				<td><div id="endEmail2" style="display: none"><button class="btn btn-warning" id="pushEmail" onclick="fn_authCk()">인증하기</button></div></td>
			</tr>
		</table>
	</div>
</div>

<script>
	var key="";
	var userId="";
	var userName="";
	var userEmail="";
	function fn_pushMail(){
		userName = $('#userName').val().trim();
		userEmail = $('#userEmail').val().trim();
		if($('#userName').val().trim()==''){
			$('#userName').focus();
			return false;
		}
		if($('#userEmail').val().trim()==''){
			$('#userEmail').focus();
			return false;
		}
		if(userName!='' && userEmail!=''){
	  	  	$('#loading').show();
			$.ajax({
		          type:"get",
		          url:"${path}/login/findIdMail.do",
		          data:{name:userName,email:userEmail},
		          datatype:"json",
		          success:function(data){
		        	  if(data[0]==0){
		        		  swal("ID 찾기 실패", "존재하지 않는 회원입니다.\n확인 후 재시도 바랍니다.", "warning");
		        		  $('#loading').hide();
		        	  } else if(data[0]==1){
		        		  $('#loading').hide();
		        		  $('#startEmail').hide();
		        		  $('#endEmail1').show();
		        		  $('#endEmail2').show();
		        		  key=data[1];
		        		  userId=data[2];
		        	  }
		          },
	             error:function(jxhr,textStatus,error){
	                 console.log("find Id ajax 실패 : "+jxhr+" "+textStatus+" "+error);
	              }
	        }); 
		}
	}
	function fn_authCk(){
		var inputKey = $('#authNum').val();
		if(inputKey==key){
			swal("인증 성공", userName+"님께서 찾으시는 ID는 [ "+userId+" ]입니다.\n해당 창은 7초 후 자동으로 꺼집니다.\n확인 후 로그인 바랍니다.", "success");
			setTimeout(function() {  
		        window.close();  
		    }, 7000);  
		} else {
			swal("인증 실패", "잘못된 인증 번호입니다.\n다시 시도하여 주세요", "error");
			$('#startEmail').show();
			$('#endEmail1').hide();
			$('#endEmail2').hide();
		}
	}
</script>