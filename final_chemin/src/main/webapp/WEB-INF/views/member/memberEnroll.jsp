<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="회원등록" name="pageTitle" />
</jsp:include>

<script>
   /* 엔터키 막기 */
   $('input[type="text"]').keydown(function() {
          if (event.keyCode === 13) {
              event.preventDefault();
          }
      });
</script>

<script>


var idFlag=0;
var nameFlag=0;
var pw2Flag=0;
var emailFlag=0;
var pw1Flag=0;
var phoneFlag=0;
var birthDayFlag=0;
var idRules=/^[a-zA-Z0-9]{4,12}$/;
var passwordRules = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
var phoneRules = /^[0-9][0-9][0-9]{8,11}$/;
var emailRules = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var nameRules= /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;


$(function(){
      
   
      $("#userId").keyup(function()
      {   
         
         $.ajax({
            url:"${pageContext.request.contextPath}/member/checkDuplicate.do",
            type:"post",
            data:{"userId":$("#userId").val().trim()},
            success:function(data)
            {
                  console.log(data);
            
               if(idRules.test($("#userId").val()))
               {
                  if(data.trim()=='true')
                    {
                       $("#idResult").html("이미 존재하는 ID").css("color","red");
                       idFlag=0;
                    }
                    else
                  {
                       
                       $("#idResult").html("사용 가능한 ID").css("color","green");
                       idFlag=1;
                  }
               }
               else
               {
                  $("#idResult").html("ID는 영문대소문자+숫자 4~12글자 입니다.").css("color","red");
                 idFlag=0;
               }          
            }
            
         });
      });
      
      $("#phone").keyup(function()
      {   
         
         $.ajax({
            url:"${pageContext.request.contextPath}/member/checkPhone.do",
            type:"post",
            data:{"phone":$("#phone").val().trim()},
            success:function(data)
            {
               console.log(data);
               
               if(phoneRules.test($("#phone").val()))
               {
                  if(data.trim()=='true')
                  {
                     $("#phoneResult").html("이미 존재하는 번호").css("color","red");
                     phoneFlag=0;
                  }
                  else
                  
                  {
                     $("#phoneResult").html("사용 가능한 번호").css("color","green");
                     phoneFlag=1;
                  }
               }
            }
         });
      });
      $("#email").keyup(function()
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
                     $("#emailResult").html("이미 존재하는 e-mail").css("color","red");
                     emailFlag=0;
                  }
                  else
                  
                  {
                  $("#emailResult").html("사용 가능한 e-mail").css("color","green");
                  emailFlag=1;
                  }
               }
            }
         });
      });
      $("#userPw").keyup(function(){
         if(passwordRules.test($("#userPw").val()))
         {
            $("#pwd1Result").html("사용가능한 비밀번호입니다").css("color","green");
              pw1Flag=1;
         }
         else
         {
            $("#pwd1Result").html("사용불가능한 비밀번호입니다").css("color","red");
              pw1Flag=0;
         }
      });
    $("#userPw2").keyup(function()
    {   
       
      if($("#userPw").val()!=$("#userPw2").val())
      {
          $("#pwd2Result").html("비밀번호 불일치").css("color","red");
          pw2Flag=0;
      }
      else
      {
          $("#pwd2Result").html("비밀번호 일치").css("color","green");
          pw2Flag=1;
      }
    });
    });
    
function validate(){
    
   if(idFlag==0 || $('#userId').val().trim()=='')
   {
       swal({
           text: "사용가능한 ID를 입력해주세요",
           icon: "warning",
           button: "확인",
         })
      $("#userId").focus();
      return false;
   }
   
   else if(pw1Flag==0 || $('#userPw').val().trim()=='')
   {
       swal({
              text: "비밀번호를 확인해주세요.",
              icon: "warning",
              button: "확인",
            })
   
      $("#userPw").focus();
      return false;
   }
   else if(pw2Flag==0 || $('#userPw2').val().trim()=='')
   {
       swal({
              text: "비밀번호를 한번 더 해주세요.",
              icon: "warning",
              button: "확인",
            })
   
      $("#userPw2").focus();
      return false;
   }
   else if($('#userName').val().trim()=='')
   {
       swal({
              text: "이름을 입력해주세요.",
              icon: "warning",
              button: "확인",
            })
   
      $("#userName").focus();
      return false;
   }
   else if($('#gender').val().trim()=='')
   {
       swal({
              text: "성별을 입력해주세요.",
              icon: "warning",
              button: "확인",
            })
   
      $("#gender").focus();
      return false;
   }
   else if($('#birthDay').val().trim()=='')
   {
       swal({
              text: "생년월일을 입력해주세요.",
              icon: "warning",
              button: "확인",
            })
   
      $("#birthDay").focus();
      return false;
   }
   
   else if(emailFlag==0)
   {
       swal({
              text: "사용가능한 E-mail을 입력해주세요",
              icon: "warning",
              button: "확인",
            })
   
      $("#eamil").focus();
      return false;
   }
   else if(phoneFlag==0)
   {
      swal({
           text: "사용가능한 핸드폰번호를 입력해주세요",
           icon: "warning",
           button: "확인",
         })
      $("#phone").focus();
      return false;
   
   }
   else if($('#address1').val().trim()=='')
   {
      swal({
           text: "주소를 입력해주세요",
           icon: "warning",
           button: "확인",
         })
      $("#address1").focus();
      return false;
   
   }
   else if($('#address2').val().trim()=='')
   {
      swal({
           text: "주소를 입력해주세요",
           icon: "warning",
           button: "확인",
         })
      $("#address2").focus();
      return false;
   
   }
   
   
   else if($('#originalImg').val().trim()=='')
   {
      swal({
           text: "프로필 사진을 등록해주세요",
           icon: "warning",
           button: "확인",
         })
      $("#originalImg").focus();
      return false;
   
   }
   
   else{
      
      /* $("#memberEnrollFrm").attr("action","${path}/member/memberEnrollEnd.do"); */
      $("#memberEnrollFrm").submit();
      return true;
   }

return false;
}
   /* 핸드폰번호 숫자만 입력가능 */
function showNumber(event) {
   event = event || window.event;
   var keyID = (event.which) ? event.which : event.keyCode;
   if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )

   {
      return;
   }
   else
   {
      return false;
   }
}
/* function fn_submit()
{
   
      $("#memberEnroll").attr("action","${path}/member/memberEnrollEnd.do");
      $("#memberEnroll").submit();

} */

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
    <form name="memberEnrollFrm"  method="post" id="memberEnrollFrm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/member/memberEnrollEnd.do" >
      <h2>회원가입</h2>
      <p>Please fill in this form to create an account!</p>
      <hr>
       <div class="form-group">
               <label for="userId">ID</label><span> *</span><label id="idResult" class="float-right" ></label>
               <input type="text" class="form-control" id="userId" name="userId" placeholder="영문대소문자+숫자로 이루어진 4~12글자"  maxlength="12" >
             </div>
             <div class="form-group">
               <label for="userPw">비밀번호</label><span> *</span><label id="pwd1Result" class="float-right"></label>
               <input type="password" class="form-control" id="userPw" name="password" placeholder="8글자이상 16글자이하의 영문,숫자,특수문자조합"  >
             </div>
             <div class="form-group">
               <label for="userPw2">비밀번호확인</label><span> *</span><label id="pwd2Result" class="float-right"></label>
               <input type="password" class="form-control" id="userPw2" name="password2" placeholder="비밀번호를 한번더 입력하세요"  >
             </div>
        <div class="form-group">
               <label for="userName">이름</label><span> *</span><label id="nameResult" class="float-right"></label>
               <input type="text" class="form-control" id="userName" name="userName"  >
             </div>
        <div class="form-group">
         <label>성별</label><br>
               <select class="form-control" name='gender' >
                  <option value="">성별선택</option>
                  <option value="M" id="gender0" >남</option>
                  <option value="F" id="gender1" >여</option>
               </select>
        </div>  
         <div class="form-group" >
         <label>생년월일</label>
           <input type="Date"  class="form-control" id="birthDay" name="birthDay" >
        </div>
       
        <div class="form-group">
               <label for="email" class="mb-0">E-Mail</label><span> *</span><label id="emailResult" class="float-right" ></label>
              <input type="email" class="form-control" id="email" name="email"  >
             </div>
        
        <div class="form-group" >
               <label for="phone" class="mb-0">핸드폰 번호</label><span> *</span><label id="phoneResult" class="float-right"></label>
              <input type="tel" class="form-control" id="phone" name="phone" maxlength="11" onkeydown="return showNumber(event)">
              
             <!--  <label for="phone" class="mb-0">Phone</label><span> *</span><label id="phoneResult" class="float-right"></label><br>
               <select name="phone" id="ddlMobileTel1" class="form-control" title="휴대폰 앞자리 선택" style="width:140px;">
                  <option value="휴대폰 번호 선택">휴대폰 번호 선택</option>
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="018">018</option>
                  <option value="019">019</option>
               </select>
               <input type="text" id="mobile_tel1_temp" style="width:123px; display:none" title="선택된 휴대폰 앞자리" />
               <span class="dash">-</span> 
               <input name="phone1" type="text" id="mobile_tel2" style="width:130px;" maxlength="4" title="휴대폰 중간자리 입력" class="form-control" /> <span class="dash">-</span> 
               <input name="phone2" type="text" id="mobile_tel3" style="width:130px;" maxlength="4" title="휴대폰 뒷자리 입력" class="form-control" />
            </span> -->
             </div>
        <div>
            <div class="form-group"> 
                <label for="type">주소</label> 
                   <div class="row m-0" name="address">
                       <input type="text" onclick="address()" class="form-control col-md-4" name ="address1" id="address1" placeholder="우편번호"> &nbsp;
                       <input type="button" onclick="address()" value="우편번호 찾기" class="btn btn-danger" ><br>
                   </div>
                    <input type="text" onclick="address()" class="form-control col-md-12" name ="address2" id="address2" placeholder="주소">
                    <input type="text" class="form-control col-md-12" name ="address3" id="address3" placeholder="상세주소">
            </div>
        </div>  
         <div class="form-group">
         <div style="padding: 10px" hidden="hidden">
         축구<input class="checkbox-inline" type="checkbox" name="축구" id="축구" value="축구" checked="checked">
         야구<input class="checkbox-inline" type="checkbox"name="야구" id="야구" value="야구">
         농구<input class="checkbox-inline" type="checkbox" name="농구" id="농구" value="농구">
         경기관람<input class="checkbox-inline" type="checkbox" name="경기관람" id="경기관람" value="경기관람">
         등산<input class="checkbox-inline" type="checkbox" name="등산" id="등산" value="등산">
         게임<input class="checkbox-inline" type="checkbox" name="게임" id="게임" value="게임">
         </div>
      </div>
        <div class="input-group mb-3" style="padding:0px;">
                <div class="input-group-prepend" style="padding:0px;">
                    <span class="input-group-text">첨부파일1</span>
                </div>
                 <div class="custom-file">
                    <input type="file" class="custom-file-input" name="originalImg" id="upFile1" alt="avatar">
                    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
                </div>
                
            </div>
           
       
      <div class="form-group" align="center">
           <button value="저장" class="btn btn-primary btn-lg" onclick="return validate();" id="submit_">Sign Up</button>
           <button type="reset" class="btn btn-primary btn-lg">Cancel</button>
        </div>
    </form>
   </div>
         
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
