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

<script>

$(function(){
	
	var idFlag=0;
	var pw1Flag=0;
	var pw2Flag=0;
	var emailFlag=0;
	var phoneFlag=0;
	var idCheck=/^[a-zA-Z0-9]{4,12}$/;	
	var passwordCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	var emailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	
	var userId = document.getElementById("userId");
    var password = document.getElementById("password");
    var email = document.getElementById("email");
    var phone = document.getElementById("phone");
 $("#userId_").on('keyup',function(){
	var inputUserId=$(this).val().trim();
	if(inputUserId.length<=4)
	{
		$('.guide').hide();
		$('#idDuplicateCheck').val(0);
		return;
	}
	
	$.ajax({
		url:"${pageContext.request.contextPath}/member/checkDuplicate.do",
		data:{userId:inputUserId},
		dataType:"json",
		success:function(data)
		{
			
			console.log(data);
			
		if(idCheck.test($("#userId").val()))
		{
			if(data>0)
			{
				$("#idResult").html("이미 존재하는 ID입니다").css("color","red");
				idFlag=0;
			}
			else
			{
					
				$("#idResult").html("사용 가능한 ID입니다").css("color","green");
				idFlag=1;
			}
		}
		},
		error:function(xhr,status,errormsg)
		
		{
			console.log(xhr);
			console.log(status);
			console.log(errormsg);
		}
		
	});
});
$("#password").keyup(function(){
	if(passwordCheck.test($("#password1").val()))
	{
		$("#pwd1Result").html("사용가능").css("color","green");
		pw1Flag=1;
	}
	else
	{
	$("#pwd1Result").html("사용불가").css("color","red");
	pw1Flag=0;
	}
});
$("#password2").keyup(function(){
	if($("#password1").val()!=$("#password2").val())
	{
		$("#pwd2Result").html("비밀번호 불일치").css("color","red");	
		pwd2Flag=0;
	}
	else
	{
		$("#pwd2Result").html("비밀번호 일치").css("color","green");
		pwd2Flag=1;
	}
});
$("#email").keyup(function()
{
	var inputEmail=$(this).val().trim();
	$.ajax({
		url:"${pageContext.request.contextPath}/member/checkEmail.do",
		data:{email:inputEmail},
		dataType:"json",
		success:function(data)
		{
			
			if(emailCheck.test($("#email").val()))
			{
				if(data>0)
				{
					$("#emailResult").html("이미 존재하는 이메일").css("color","red");
					emailFlag=0;
				}
				else
				{
					$("#emailResult").html("사용가능한 이메일").css("color","green");
					emailFlag=1;
				}
			}
		}
	});
});
$("#phone").keyup(function()
		{
			var inputPhone=$(this).val().trim();
			$.ajax({
				url:"${pageContext.request.contextPath}/member/checkPhone.do",
				data:{phone:inputPhone},
				dataType:"json",
				success:function(data)
				{
						if(data>0)
						{
							$("#phoneResult").html("이미 존재하는 핸드폰번호").css("color","red");
							phoneFlag=0;
						}
						else
						{
							$("#phoneResult").html("사용가능한 핸드폰번호").css("color","green");
							phoneFlag=1;
						}
					
				}
		});
	});
$("#memberEnroll").submit(function(event)
		{
	  		
	  		
	  		if(!(idFlag==1&&pwFlag==1&&nickFlag==1&&emailFlag==1))
	  		{
	  			if(idFlag==0)
		  		{
	  				event.preventDefault();
		  			alert("사용가능한 ID를 입력해주세요");
		  			$("#userId").focus();
		  			return;
		  		}
		  		else if(pw2Flag==0)
		  		{
		  			event.preventDefault();
		  			alert("비밀번호를 확인해주세요.");
		  			$("#password").focus();
		  			return;
		  		}
		  		else if(emailFlag==0)
		  		{
		  			event.preventDefault();
		  			alert("사용가능한 E-mail을 입력해주세요");
		  			$("#userEmail").focus();
		  			return;
		  		}
		  		else if(phoneFlag==0)
		  		{
		  			event.preventDefault();
		  			alert("사용가능한 핸드폰번호를 입력해주세요");
		  			$("#phone").focus();
		  			return;
		  		}
	  		}
	  		
	  	});
}); 



/* function validate() {
	

	var idCheck=/^[a-zA-Z0-9]{4,12}$/;	
	var passwordCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	var emailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	var userId = document.getElementById("userId");
    var password = document.getElementById("password");
    var email = document.getElementById("email");
    
    if(!check(idCheck,userId,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(!check(password,password,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(join.password_.value != join.password2.value) {
        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
        join.password2.value = "";
        join.password2.focus();
        return false;
    }

    if(email.value=="") {
        alert("이메일을 입력해 주세요");
        email.focus();
        return false;
    }

    if(!check(emailCheck, email, "적합하지 않은 이메일 형식입니다.")) {
        return false;
    }

    if(join.userName.value=="") {
        alert("이름을 입력해 주세요");
        join.userName.focus();
        return false;
    }


} */
	
    
    
    /* $(function(){
    	
    	var idCheck=/^[a-zA-Z0-9]{4,12}$/;	
    	var passwordCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
    	var emailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	
    	var userId = document.getElementById("userId");
        var password = document.getElementById("password");
        var email = document.getElementById("email");
	
	 $("#userId_").on('keyup',function(){
		var inputUserId=$(this).val().trim();
		if(inputUserId.length<=4)
		{
			$('.guide').hide();
			$('#idDuplicateCheck').val(0);
			return;
		}
		
		$.ajax({
			url:"${pageContext.request.contextPath}/member/checkDuplicate.do",
			data:{userId:inputUserId},
			dataType:"json",
			success:function(data)
			{
				
				console.log(data);
				
			if(idCheck.test($("#userId").val()))
			{
				if(data==false)
				{
					$('.guide.error').hide();
					$('.guide.ok').show();
					$('#idDuplicateCheck').val(1);
					
				}
				else
				{
					$('.guide.error').show();
					$('.guide.ok').hide();
					$('#idDuplicateCheck').val(0);
					
				}
			}
			},
			error:function(xhr,status,errormsg)
			
			{
				console.log(xhr);
				console.log(status);
				console.log(errormsg);
			}
			
		});
	});
});    */

	 
		
</script>

<style type="text/css">
	body {
		color: #fff;
		background: hsl(277, 74%, 92%);
		font-family: 'Roboto', sans-serif;
	}
    .form-control {
		min-height: 41px;
		box-shadow: none;
		border-color: #ddd;
	}
	 .form-control {
	 	display:inline;
		min-height: 41px;
		box-shadow: none;
		border-color: #ddd;
	}
	.form-control, .btn {        
        border-radius: 3px;
    }
	.signup-form {
		width: 390px;
		margin: 0 auto;
		 padding: 30px 0; 
	}
	.signup-form form {
		color: #999;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
        width: 140%;
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
		margin-bottom: 20px;
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
		width:200px;
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
	div#userId-container{position:relative; padding:0px;}
	div#userId-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
    div#userId-container span.ok{color:green;}
    div#userId-container span.error{color:red;}
</style>
</head>
<body>
<br><br><br>
<div class="signup-form">                                                            
    <form name="memberEnrollFrm" action="${pageContext.request.contextPath }/member/memberEnrollEnd.do" method="post" id="memberEnroll" enctype="multipart/form-data" onsubmit="return validate();">
		<h2>회원가입</h2>
		<p>Please fill in this form to create an account!</p>
		<hr>
		
			<label>Userid</label><label id="idResult" class="float-right"></label>
		 	<!-- <div id="userId-container">
					<input type="text" class="form-control" name="userId" id="userId_" onsubmit="return fn_enroll_validate();" placeholder="영문대소문자+숫자로 이루어진 4~12글자" required>
							<span class="guide ok">사용가능한 ID입니다.</span>
							<span class="guide error">이미 존재하는 ID입니다.</span>
							<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value='0'/>
						</div> -->
						<div id="userId-container">
					<input type="text" class="form-control" name="userId" id="userId_" placeholder="영문대소문자+숫자로 이루어진 4~12글자" required>
							<span class="guide ok" id="idResult"></span>
							<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value='0'/>
						</div>
		 <!-- <div class="form-group">
	            <label for="userId">ID</label><span> *</span><label id="idResult" class="float-right"></label>
	            <input type="text" class="form-control" id="userId" name="userId" placeholder="영문대소문자+숫자로 이루어진 4~12글자" required>
	          </div> -->
        <div class="form-group">
	            <label for="userPw">비밀번호</label><span> *</span><label id="pwd1Result" class="float-right"></label>
	            <input type="password" class="form-control" id="password1" name="password" placeholder="8글자이상 16글자이하의 영문,숫자,특수문자조합" required>
	          </div>
	          <div class="form-group">
	            <label for="userPw2">비밀번호확인</label><span> *</span><label id="pwd2Result" class="float-right"></label>
	            <input type="password" class="form-control" id="password2"  placeholder="비밀번호를 한번더 입력하세요" required>
	          </div>
		<!-- <div class="form-group">
			<label>Password</label><label id="pwd1Result" class="float-right"></label>
            <input type="password" class="form-control" name="password" id="password_" placeholder="8글자이상 16글자이하의 영문,숫자,특수문자조합" required="required">  	
        </div>
		<div class="form-group">
			<label>Confirm Password</label><label id="pwd2Result" class="float-right"></label>
            <input type="password" class="form-control" id="password2"  required="required">
        </div>   -->      
        <div class="form-group">
			<label>Username</label>
        	<input type="text" class="form-control" name="userName" id="userName" required="required">
        </div>
        <div class="form-group">
			<label>gender</label><br>
            	<select class="form-control" name='gender' >
            		<option value="">성별선택</option>
            		<option value="M" id="gender0" >남</option>
            		<option value="F" id="gender1" >여</option>
            	</select>
        </div>  
         <div class="form-group" >
			<label>Birthday</label>
        	<input type="date"  class="form-control" id="birthDay" name="birthDay" required="required">
        </div>
       <!--  <div class="form-group">
			<label>Email Address</label><label id="emailResult" class="float-right"></label>
        	<input type="email" class="form-control" id="email" name="email" required="required">
        </div> -->
        <div class="form-group">
	            <label for="userEmail" class="mb-0">E-Mail</label><span> *</span><label id="emailResult" class="float-right"></label>
		        <input type="email" class="form-control" id="email" name="email" required>
	          </div>
         <!-- <div class="form-group">
			<label>Phone</label>
        	<input type="tel" class="form-control" id="phone" name="phone" maxlength="11" required="required">
        </div> -->
        <div class="form-group">
	            <label for="phone" class="mb-0">Phone</label><span> *</span><label id="phoneResult" class="float-right"></label>
		        <input type="tel" class="form-control" id="phone" name="phone" maxlength="11" required>
	          </div>
        <div>
            <div class="form-group"> 
                <label for="type">address</label> 
	                <div class="row m-0" name="address">
	                    <input type="text" onclick="address()" class="form-control col-md-4" name ="address1" id="address1" placeholder="우편번호" required="required"> &nbsp;
	                    <input type="button" onclick="address()" value="우편번호 찾기" class="btn btn-danger" ><br>
                	</div>
	                 <input type="text" onclick="address()" class="form-control col-md-12" name ="address2" id="address2" placeholder="주소"  required="required">
	                 <input type="text" class="form-control col-md-12" name ="address3" id="address3" placeholder="상세주소"required="required">
            </div>
        </div>  
         <div class="form-group">
			<span style="padding: 10px">
			취미1<input class="checkbox-inline" type="checkbox" name="hobby" id="hobby0" value="운동"></span>
			취미2<input class="checkbox-inline" type="checkbox"name="hobby" id="hobby1" value="운동">
			취미3<input class="checkbox-inline" type="checkbox" name="hobby" id="hobby2" value="운동">
			취미4<input class="checkbox-inline" type="checkbox" name="hobby" id="hobby3" value="운동">
			취미5<input class="checkbox-inline" type="checkbox" name="hobby" id="hobby4" value="운동">
			취미6<input class="checkbox-inline" type="checkbox" name="hobby" id="hobby5" value="운동">
		</div>
		  <div class="input-group mb-3" style="padding:0px;">
                <div class="input-group-prepend" style="padding:0px;">
                    <span class="input-group-text">첨부파일1</span>
                </div>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="originalImg" id="upFile1"><!-- multiple="multiple" -->
                    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
                </div>
            </div>
       
		<div class="form-group">
            &emsp;&nbsp;<button type="submit" value="저장" class="btn btn-primary btn-lg" >Sign Up</button>
            <button type="reset" class="btn btn-primary btn-lg">Cancel</button>
        </div>
    </form>
	<script>
			/* $(function(){
				$("#password2").blur(function(){
					var p1=$("#password_").val();
					var p2=$("#password2").val();
					if(p1!=p2)
					{
						alert("비밀번호가 일치하지 않습니다.");
						$("#password_").val("");
						$("#password2").val("");
						$("#password_").focus();
					}
				})
			});
			function fn_enroll_validate()
			{
				var userId=$("#userId_");
				if(userId.val().trim().length>4)
				{
					return true;	
				}
				else
				{
					alert("아이디는 4글자 이상");
					userId.val("");
					userId.focus();
					return false;
				}
					
			} */
			</script>
			
			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

			<script>

			   

			    function address() {
              new daum.Postcode({
                  oncomplete: function(data) {
                     
                      var fullAddr = ''; // 주소 변수
                      var extraAddr = ''; 
      
                     
                      if (data.userSelectedType === 'R') { // 도로명
                          fullAddr = data.roadAddress;
      
                      } else { // 지번
                          fullAddr = data.jibunAddress;
                      }
      
                      
                      if(data.userSelectedType === 'R'){
                          //법정동명
                          if(data.bname !== ''){
                              extraAddr += data.bname;
                          }
                          // 건물명
                          if(data.buildingName !== ''){
                              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                          }
                          
                          fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                      }
                      
                      
                        
                        document.getElementById('address1').value = data.zonecode; //5자리 새우편번호 사용
                        document.getElementById('address2').value = fullAddr;

                        
                        document.getElementById('address3').focus();    
                      
                  }
              }).open();
          }
			</script>
		
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

