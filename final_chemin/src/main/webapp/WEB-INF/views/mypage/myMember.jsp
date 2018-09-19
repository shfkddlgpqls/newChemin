<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.chemin.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/mypage/myMenuBar.jsp"/>
<!-- 마이페이지 css-->
<link rel="stylesheet" type="text/css" href="${path}/resources/base/css/mypage.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>   
.alert {
    padding: 20px;
    width:55%;
    margin-left:25%;
}
.closebtn {
    margin-left: 15px;
    font-weight: bold;
    float: right;
    font-size: 22px;
    line-height: 20px;
    cursor: pointer;
    transition: 0.3s;
}
.closebtn:hover {
    color: black;
} 


.input--file {
  position: relative;
  color: #7f7f7f;
}

.input--file input[type="file"] {
  position: absolute;
  top: 0;
  left: 0;
  opacity: 0;
}
#marginR{
margin-right:2%
}

</style>
<script>
/* 	$(window).load(function(){
		fn_warningMsg();
	});
	function fn_warningMsg() {
		var userid="${memberLoggedIn.userId}";
		console.log(userid);
		$.ajax({
			type : "GET",
			dataType : "json",
			url : "${path}/mypage/warningMsg.do?userId="+userid,
			success : function(data) {
				console.log(data.warnNum);
				var value='';
				if(data.warnNum==1)
				{
					value+="<div class='alert alert-danger alert-dismissible'>";
					value+=" <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
					value+="<strong>Warning!</strong> &nbsp 꿀팁 커뮤니티에서 올리신 글로 신고 당하셨습니다. &nbsp 3번이상 신고당하실 경우, 관리자의 권한으로 강제 탈퇴되실 수 있습니다.</div>";
					
				}
				$('#warningMsg').html(value);  
			}
		});
	} */
</script> 


<script>
var pw1Flag=0;
var pw2Flag=0;
var emailFlag=0;
var phoneFlag=0;
//수정하기 버튼
function  fn_infoChange(){
	 swal({
			  text: "정보를 수정하시겠습니까?",
			  icon: "info",
			  buttons: {
				    cancel: "NO",
				    catch: {
				      text: "YES",
				      value: "catch",
				    },
				  },

			}).then((value) => {
		  			  switch (value) {	 
				  		    case "catch":
				  		    	$("#password").attr("readonly" ,false);
				  		    	$("#passwordCo").attr("readonly" ,false);
				  		    	$("#email").attr("readonly" ,false);
				  		    	$("#phone").attr("readonly" ,false);
				  		    	$("#address3").attr("readonly" ,false);
				  		    	$("#addrBtn").attr("disabled" ,false);
				  		    	$("[name=hobby]").attr("disabled" ,false);
				  		    	$("#file").attr("disabled" ,false);
				  		    	$('#perfect').show();
				  		    	$('#update').hide();
				  		      break;
				  		 
				  		    default:
		  
				  		    	
				  		  }
		    		});  
}



   $(document).ready(function() {
	   
	 	var phone = '${member.USERPHONE}';
	 	
		//주소 값 넣기
		var addrString = '${member.USERADDR}';
	    var addrSplit = addrString.split('/');
	    for(var i in addrSplit){
	    	if(i==0) $('[name=address1]').val(addrSplit[i]);
	    	if(i==1) $('[name=address2]').val(addrSplit[i]);
	    	if(i==2) $('[name=address3]').val(addrSplit[i]);
	    }
	    
	    var hobby = '${member.USERHOBBY}';
	    var hobbySplit = hobby.split(',');
	    for(var i in hobbySplit){
	    	 if(hobbySplit[i]=="영화") document.getElementById("hobby0").checked = true;
	    	if(hobbySplit[i]=="운동") document.getElementById("hobby1").checked = true;
	    	if(hobbySplit[i]=="등산") document.getElementById("hobby2").checked = true;
	    	if(hobbySplit[i]=="독서") document.getElementById("hobby3").checked = true;
	    	if(hobbySplit[i]=="쇼핑") document.getElementById("hobby4").checked = true;
	    	if(hobbySplit[i]=="여행") document.getElementById("hobby5").checked = true; 
	    }
	    
	   //사진 read 
       var readURL = function(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();
             
               reader.onload = function (e) {
                   $('.avatar').attr('src', e.target.result);
               }
       
               reader.readAsDataURL(input.files[0]);
               $('[name=orImg]').val(input.files[0].name);
           }
          
       }
       
   
       $(".file-upload").on('change', function(){
           readURL(this);
       });
   });   
   $(function(){
		
		
		var passwordRules = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		var emailRules = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	 	$("#phone").keyup(function(event)
				{	
					event = event || window.event;
			        var _val = this.value.trim();
			        this.value = autoHypenPhone(_val) ;
					
				/* 	$.ajax({
						url:"${pageContext.request.contextPath}/member/checkPhone.do",
						type:"post",
						data:{"phone":$("#phone").val().trim()},
						success:function(data)
						{
							console.log(data);
							
						
								if(data.trim()=='true')
								{
									$("#phoneResult").html("*이미 존재하는 번호입니다").css("color","red");
									phoneFlag=0;
								}
								else
								
								{
									$("#phoneResult").html("*사용 가능한 번호입니다").css("color","green");
									phoneFlag=1;
								}
							
						}
					}); */
				});
	/*	$("#email").keyup(function()
				{	
					
					$.ajax({
						url:"${pageContext.request.contextPath}/member/checkEmail.do",
						type:"post",
						data:{"email":$("#email").val().trim()},
						success:function(data)
						{
							console.log(data);
						 	
							 if(emailRules.test($("#email").val()))
							{	
								if(data.trim()=='true')
								{
									$("#emailResult").html("*이미 존재하는 e-mail 입니다").css("color","red");
									emailFlag=0;
								}
								else
								
								{
								$("#emailResult").html("*사용 가능한 e-mail 입니다").css("color","green");
								emailFlag=1;
								}
							} 
						}
					});
				}); */
		$("#password").keyup(function(){
			if(passwordRules.test($("#password").val()))
			{
				$("#pwd1Result").html("*사용가능한 비밀번호입니다").css("color","green");
		
		        pw1Flag=1;
			}
			else
			{
				$("#pwd1Result").html("*사용불가능한 비밀번호입니다").css("color","red");
		        pw1Flag=0;
			}
		});
    $("#passwordCo").keyup(function()
    {   
    	
      if($("#password").val()!=$("#passwordCo").val())
      {
          $("#pwd2Result").html("*비밀번호 일치하지 않습니다").css("color","red");
          pw2Flag=0;
      }
      else
      {
          $("#pwd2Result").html("*비밀번호 일치합니다").css("color","green");
          pw2Flag=1;
      }
    });

   });

   function autoHypenPhone(str){
       str = str.replace(/[^0-9]/g, '');
       var tmp = '';
       if( str.length < 4){
           return str;
       }else if(str.length < 7){
           tmp += str.substr(0, 3);
           tmp += '-';
           tmp += str.substr(3);
           return tmp;
       }else if(str.length < 11){
           tmp += str.substr(0, 3);
           tmp += '-';
           tmp += str.substr(3, 3);
           tmp += '-';
           tmp += str.substr(6);
           return tmp;
       }else{              
           tmp += str.substr(0, 3);
           tmp += '-';
           tmp += str.substr(3, 4);
           tmp += '-';
           tmp += str.substr(7);
           return tmp;
       }
       return str;
   }

 



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
			    
   function fn_confirm(){
	   var phone = $('[name=phone]').val();
	   
	   if(pw1Flag==0)
 		{
 			event.preventDefault();
 			swal({
				  text: "비밀번호를 확인해주세요",
				  icon: "warning",
				  button: "확인",
				});
 			
 			$("#password").focus();
 			return false;
 		}else if(phone.length!=13){
 			console.log(length)
 			swal({
				  text: "전화번호 13자리 모두 입력해주세요",
				  icon: "warning",
				  button: "확인",
				});
			
			$("#phone").focus();
			return false;
 		}else {
 			return true;
 		}
	
 			
 		   /* else if(emailFlag==0)
 	 		{
 	 			event.preventDefault();
 	 			alert("사용가능한 E-mail을 입력해주세요");
 	 			$("#email").focus();
 	 			return false;
 	 		}else if(phoneFlag==0)
 	 		{
 	 			event.preventDefault();
 	 			alert("사용가능한 핸드폰번호를 입력해주세요");
 	 			$("#phone").focus();
 	 			return false;
 	 		} */
 	 		
   }
   
   function fn_withdraw(userId){
	   location.href = "${path}/member/memberWithdraw?userId="+userId;
   }
			   
</script>   

		<!-- 신고 제재 메시지 -->
		<div id="warningMsg">
		
		<div>
		<!-- 회원정보 수정 폼란 -->
<section>
<div class="container bootstrap snippet">
  
  		<div>
		  	<h3>회원정보</h3>
		  	<br>
		  </div>	
    	

      <div class="text-center" style="margin-left:auto; margin-right:auto; width:70%">
        <form class="form" action="${path}/member/memberInfoUpdate" method="post" onsubmit="return fn_confirm()">
       <img src="${path}/resources/upload/member/${member.RENAMEIMAGE}" class="avatar img-circle img-thumbnail" alt="avatar" style="border-radius: 100px;width:205px;height:205px">
        <h5>${member.USERID}님</h5>
        <div class="input--file " style="width:5%;margin-left:auto; margin-right:auto;">
			  <span>
			    <svg  xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
			      <circle cx="12" cy="12" r="3.2"/>
			      <path d="M9 2l-1.83 2h-3.17c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2v-12c0-1.1-.9-2-2-2h-3.17l-1.83-2h-6zm3 15c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5z"/>
			      <path d="M0 0h24v24h-24z" fill="none"/>
			    </svg>
			  </span>
			  <input type="file" class="text-center center-block file-upload" id="file" name="file" value="" disabled="true"/>
				<input type="hidden" class="upload-name" name="originalImg" value="" >
			</div>
      </div></hr><br>


    	<div style="margin-left:auto; margin-right:auto; width:70%">
          <div class="tab-content">
            <div class="tab-pane active" id="home">
                <hr>
                  
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="first_name"><h5>Name</h5></label>
                              <input type="text" class="form-control" name="first_name" id="first_name" placeholder="first name" value="${member.USERNAME}" readonly>
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                          
                            <label ><h5>Password</h5></label> <label id="pwd1Result" class="float-right" style="font-size:0.8rem"></label>
                              <input type="password" class="form-control" name="password" id="password" placeholder="8글자이상 16글자이하의 영문,숫자,특수문자조합"  readonly="true">
                          </div>
                      </div>
          
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label ><h5>Password Confirm</h5></label> <label id="pwd2Result" class="float-right" style="font-size:0.8rem"></label>
                              <input type="password" class="form-control" name="passwordCo" id="passwordCo" placeholder="비밀번호를 한번더 입력하세요"   readonly="true">
                          </div>
                      </div>
          
                    
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="email"><h5>Email</h5></label><label id="emailResult" class="float-right" style="font-size:0.8rem"></label>
                              <input type="email" class="form-control" name="email" id="email" placeholder="ex) you@email.com" value="${member.USEREMAIL}" readonly> 
                          </div>
                      </div>
                      
                        <div class="form-group">
                          <div class="col-xs-6">
                             <label for="mobile"><h5>Phone</h5></label><label id="phoneResult" class="float-right" style="font-size:0.8rem"></label>
                             <div class="form-inline">	

			   				<input type="text" class="form-control" name="phone" id="phone" placeholder="전화번호를 입력하세요" value="${member.USERPHONE}" maxlength="13" style="width:100%" readonly> 
			   				</div>	
                          </div>
                      </div>
                      
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="address"><h5>Address</h5></label>
                              <div class="row m-0" name="address">
			                    <input type="text" style="margin-bottom:0.2rem" class="form-control col-md-4" name ="address1" id="address1" value="" placeholder="우편번호" required="required" readonly>&nbsp;&nbsp; 
			                    <input type="button" style="margin-bottom:0.2rem" onclick="address()" value="우편번호 찾기" id="addrBtn" class="btn btn-primary" disabled><br>
		                	</div>
			                 <input type="text" style="margin-bottom:0.2rem"  class="form-control col-md-12"  name ="address2" id="address2" value="" placeholder="도로명주소"  required="required" readonly>
			                 <input type="text" class="form-control col-md-12" name ="address3" id="address3" value="" placeholder="상세주소" required="required" readonly>
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="password"><h5>Hobby</h5></label>
                              <div style="padding: 10px">
                             
								영화 <input class="checkbox-inline" type="checkbox" name="hobby" id="hobby0" value="영화" style="margin-right:2%" disabled="ture">
								운동 <input class="checkbox-inline" type="checkbox"name="hobby" id="hobby1" value="운동" style="margin-right:2%" disabled="ture">
								등산 <input class="checkbox-inline" type="checkbox" name="hobby" id="hobby2" value="등산" style="margin-right:2%" disabled="ture">
								독서 <input class="checkbox-inline" type="checkbox" name="hobby" id="hobby3" value="독서" style="margin-right:2%" disabled="ture">
								쇼핑 <input class="checkbox-inline" type="checkbox" name="hobby" id="hobby4" value="쇼핑" style="margin-right:2%" disabled="ture">
								여행 <input class="checkbox-inline" type="checkbox" name="hobby" id="hobby5" value="여행" disabled="ture">
								</div>
                          </div>
                      </div>
                      
                      <div class="form-group" style="float:right">
                           <div class="col-xs-12">
              
                              	<button class="btn btn-success" type="submit" id="perfect"  style="display:none"><i class="glyphicon glyphicon-ok-sign"></i> 수정완료</button>
                              	<button class="btn" onclick="fn_ withdraw(${memberLoggedIn.userId})"><i class="glyphicon glyphicon-repeat"></i> 탈퇴하기</button>
                            </div>
                      </div>
                       <input type="hidden" name="userId" value="${memberLoggedIn.userId}">
              	</form>
              		<div style="float:right">
              			<button class="btn btn-primary" onclick="fn_infoChange()" id="update">수정하기</button>
                      
           		</div>
 
               
              </div><!--/tab-pane-->
          </div><!--/tab-content-->

        </div><!--/col-9-->
    </div><!--/row-->
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  