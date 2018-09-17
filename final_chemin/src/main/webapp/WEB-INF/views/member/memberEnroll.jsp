<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원등록" name="pageTitle"/>
</jsp:include>    

<script>
	$(function(){
		$("#userId_").on('keyup',function(){
			var inputUserId=$(this).val().trim();
			if(inputUserId.length<4)
			{
				$('.guide').hide();
				$('#idDuplicateCheck').val(0);
				return;
			}
</script>

<style>
		div#enroll-container{width:400px; margin:0 auto; text-align:center;}
		div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
		div#enroll-container table th{text-align: right; padding-right:10px;}
		div#enroll-container table td{text-align: left;}
		</style>
		<div id="enroll-container" >
		<br><br>
		<h3>회원가입</h3>
		<br><br>
			<form name="memberEnrollFrm" action="${pageContext.request.contextPath}/memberEnrollEnd.do" method="post" onsubmit="return fn_enroll_validate();" >
				<table>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" class="form-control" placeholder="아이디" name="userId" id="userId_" required>
						</td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td>
							<input type="password" class="form-control" placeholder="영문, 숫자" name="password" id="password_" required>
						</td>
					</tr>
					<tr>
						<th>패스워드확인</th>
						<td>	
							<input type="password" class="form-control" id="password2" required>
						</td>
					</tr>  
					<tr>
						<th>이름</th>
						<td>	
						<input type="text" class="form-control" name="userName" id="userName" required>
						</td>
					</tr>
					<tr>
						<th>성별 </th>
						<td>
							<div class="form-check form-check-inline">
								<input type="radio" class="form-check-input" name="gender" id="gender0" value="M" checked>
								<label for="gender0">남</label>
								<input type="radio" class="form-check-input" name="gender" id="gender1" value="F">
								<label for="gender1">여</label>
							</div>
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>	
						<input type="#" class="form-control" name="#" id="#">
						</td>
					</tr> 
					<tr>
						<th>이메일</th>
						<td>	
							<input type="email" class="form-control" placeholder="abc@xyz.com" name="email" id="email">
						</td>
					</tr>
					<tr>
						<th>휴대폰</th>
						<td>	
							<input type="tel" class="form-control" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required>
						</td>
					</tr>
					<tr>
						<th>취미</th>
						<td>	
							<input type="text" class="form-control" placeholder="" name="hobby" id="hobby">
						</td>
					</tr>
					
				</table>
				<input type="submit" value="가입" >
				<input type="reset" value="취소">
			</form>
		</div>
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
=======
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원등록" name="pageTitle" />
</jsp:include>

<script>
	/* 	$(function(){
	 $("#userId_").on('keyup',function(){
	 var inputUserId=$(this).val().trim();
	 if(inputUserId.length<4)
	 {
	 $('.guide').hide();
	 $('#idDuplicateCheck').val(0);
	 return;
	 } */
</script>

<style type="text/css">
body {
	color: #fff;
	background: hsl(277, 74%, 92%);
	font-family: 'Roboto', sans-serif;
}

.form-control {
	display: inline-block;
	min-height: 41px;
	box-shadow: none;
	border-color: #ddd;
}

.form-control, .btn {
	border-radius: 3px;
}

.signup-form {
	width: 50%;
	margin: 20px auto 0;
	padding: 30px 0;
	/* margin-top: 20px; */
	
}

.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.signup-form h2 {
	color: #333;
	font-weight: bold;
	margin-top: 0;
}

.signup-form hr {
	margin: 0 -30px 20px;
}

.signup-form .form-group {
	margin-bottom: 10pxs;
}

.signup-form label {
	font-weight: normal;
	font-size: 13px;
}

.signup-form input[type="checkbox"] {
	margin-top: 2px;
}

.signup-form .btn {
	font-size: 16px;
	font-weight: bold;
	background: #3598dc;
	border: none;
	min-width: 140px;
}

.signup-form .btn:hover, .signup-form .btn:active {
	background: #2389cd;
	outline: none !important;
}

.signup-form a {
	color: #fff;
	text-decoration: underline;
}

.signup-form a:hover {
	text-decoration: none;
}

.signup-form form a {
	color: #3598dc;
	text-decoration: none;
}

.signup-form form a:hover {
	text-decoration: underline;
}


</style>
</head>
<body>

<br>	
	<div class="signup-form">
		<form name="memberEnrollFrm"
			action="${pageContext.request.contextPath}/memberEnrollEnd.do"
			 method="post">
			 <br>
			<h2>회원가입</h2>
			<!-- <p>Please fill in this form to create an account!</p> -->
			
			<table>
					<div class="form-group">
				<tr>
					<th>아이디</th>
					<br>
						<td><input type="text" class="form-control" name="userid"
							required="required">
					</td>
					 </div>
				</tr>
				<tr>
					<th>비밀번호</th>
					<div class="form-group">
						<td><input type="password" class="form-control"
							name="password" required="required">
					</td>
					</div>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<<div class="form-group">
						<td><input type="password" class="form-control"
							name="confirm_password" required="required">
					</div> 
					</td>
				</tr>
				<tr>
					
					<div class="form-group">
							<td>이름
						<!-- </div> -->
						</td>
						<td><input type="text" class="form-control" name="username"
								required="required"></td>
				</tr>
				<tr>
						<td>성별<select class="form-control" id="gender" style="width: 90px">
							<option>성별</option>
							<option value="M">남</option>
							<option value="F">여</option>
						</select><td> 
				</tr>
				<tr>
				<td style="position:absolute; float:left;">
					<!-- <div class="form-group"> -->
						<input type="datetime-local" id="dtl" placeholder="생년월일"
							class="form-control" maxlength="4" style="width: 70px;">
						 
					</div>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
				<!-- <div class="form-group"> -->
					<td><input type="email" class="form-control"name="email" required="required">
				<!-- </div> -->
				</td>
				</tr>
				<tr>
					<td>핸드폰 번호</td>
				<!-- <div class="form-group"> -->
					<td><input type="tel" class="form-control"name="tel" required="required">
				<!-- </div> -->
				</td>
				</tr>
				<tr>
					<th>취미</th> 
				 <div class="form-group">
					<td><input type="text" class="form-control"name="text" required="required">
				</div></td>
				</tr>
				<!-- 이미지 넣을곳 -->
				<tr>
				<div class="form-group" style="padding: 0px;">
					<div class="input-group-prepend" style="padding: 0px;">
					<td>	<span class="input-group-text">첨부파일1</span>
					</div></td>
					<!-- <div class="custom-file"> -->
						<td><input type="file" class="form-control" name="upFile" id="upFile1">
						</td>
					</div>
				</div>
				</tr>
				<tr>
				<div class="form-group" style="padding: 0px;">
					<div class="input-group-prepend" style="padding: 0px;">
					<td>	<span class="input-group-text">첨부파일2</span>
					</div></td>
					<!-- <div class="custom-file"> -->
						<td><input type="file" class="form-control" name="upFile" id="upFile2">
						</td>
					 </div>
				</div>
				</tr>
			</table>

			<!-- <div class="form-group">
				<label class="checkbox-inline"><input type="checkbox"
					required="required"> I accept the <a href="#">Terms of
						Use</a> &amp; <a href="#">Privacy Policy</a></label>
			</div> -->
			<div class="form-group">
				
					<button type="submit" class="btn btn-primary btn-lg">회원가입</button>
					<button type="reset" class="btn btn-primary btn-lg">취소</button>
				
			</div>
		</form>
		<!-- <div class="text-center">
			Already have an account? <a href="#">Login here</a>
		</div> -->
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원등록" name="pageTitle"/>
</jsp:include>    

<script>
	$(function(){
		$("#userId_").on('keyup',function(){
			var inputUserId=$(this).val().trim();
			if(inputUserId.length<4)
			{
				$('.guide').hide();
				$('#idDuplicateCheck').val(0);
				return;
			}
</script>

<style>
		div#enroll-container{width:400px; margin:0 auto; text-align:center;}
		div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
		div#enroll-container table th{text-align: right; padding-right:10px;}
		div#enroll-container table td{text-align: left;}
		</style>
		<div id="enroll-container" >
		<br><br>
		<h3>회원가입</h3>
		<br><br>
			<form name="memberEnrollFrm" action="${pageContext.request.contextPath}/memberEnrollEnd.do" method="post" onsubmit="return fn_enroll_validate();" >
				<table>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" class="form-control" placeholder="아이디" name="userId" id="userId_" required>
						</td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td>
							<input type="password" class="form-control" placeholder="영문, 숫자" name="password" id="password_" required>
						</td>
					</tr>
					<tr>
						<th>패스워드확인</th>
						<td>	
							<input type="password" class="form-control" id="password2" required>
						</td>
					</tr>  
					<tr>
						<th>이름</th>
						<td>	
						<input type="text" class="form-control" name="userName" id="userName" required>
						</td>
					</tr>
					<tr>
						<th>성별 </th>
						<td>
							<div class="form-check form-check-inline">
								<input type="radio" class="form-check-input" name="gender" id="gender0" value="M" checked>
								<label for="gender0">남</label>
								<input type="radio" class="form-check-input" name="gender" id="gender1" value="F">
								<label for="gender1">여</label>
							</div>
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>	
						<input type="#" class="form-control" name="#" id="#">
						</td>
					</tr> 
					<tr>
						<th>이메일</th>
						<td>	
							<input type="email" class="form-control" placeholder="abc@xyz.com" name="email" id="email">
						</td>
					</tr>
					<tr>
						<th>휴대폰</th>
						<td>	
							<input type="tel" class="form-control" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required>
						</td>
					</tr>
					<tr>
						<th>취미</th>
						<td>	
							<input type="text" class="form-control" placeholder="" name="hobby" id="hobby">
						</td>
					</tr>
					
				</table>
				<input type="submit" value="가입" >
				<input type="reset" value="취소">
			</form>
		</div>
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
>>>>>>> branch 'master' of https://github.com/shfkddlgpqls/chemin.git
>>>>>>> branch 'master' of https://github.com/shfkddlgpqls/chemin.git
