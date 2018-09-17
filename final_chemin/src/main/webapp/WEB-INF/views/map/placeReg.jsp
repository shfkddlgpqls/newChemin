<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   


<c:set value="${pageContext.request.contextPath }" var="path"/>
  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <style>
  	.container{
  		width:50%;
  	}
	.box {
        min-height: 150px;
         margin-left:auto;
  		margin-right:auto;
  		width:80%;
      }
  	.col-md-10{
  		height:100%;
  		
  	}
 	/* .col-md-10 hr{
 		border:solid 1px #BCBCBC
 	} */
 	.info{
 	    backgroud:#FDFDFD;
 		/* border:solid 1px #E5E8E8; */
 	}
	.col-md-2 {
		 text-align: left;
	}
	span{
		margin-left:10%;
		font-size:16px;
	}
	 .frist{
		margin-top:4%;
		margin-bottom:5%
	}
	.margin-bottom{
		margin-bottom:5%
	} 
	.margin-bottom-sub{
		margin-bottom:1%
	}
	.margin-top{
		margin-top:4%
	}
	#phone{
		width:15%;
		margin-right:2%
	}
	.middleSize{
		width:76%;
	}
	.addr{
		width:25%;
		margin-right:2%
	} 
	.smallSzie{
		width:15%
	}
	#center{
		width:100%;
		height:50%;
		margin-left:auto;
		margin-right:auto;
	}
	#time{
	width:15%;
	margin-right:2%;
	}
  </style>
<!--   <script>
$ (document) .on ( "ready", function () {
    $ ( "# input-700"). fileinput ({
        uploadUrl : "/ file-upload-single / 1",
        maxFileCount : 5
    });
});
</script> -->

<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('roadAddress').value = fullRoadAddr;
            document.getElementById('jibunAddress').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
  
}

//추가버튼 클릭시 가격정보 추가되는 부분
function add_item(){
    var div = document.createElement('div');
    div.innerHTML = document.getElementById('pre_set').innerHTML;
    div.setAttribute('class', 'form-inline margin-bottom-sub');
    document.getElementById('field').appendChild(div);
}

function remove_item(obj){
	 document.getElementById('field').removeChild(obj.parentNode);
}

$(function() {
    $('#content').keyup(function (e){
        var content = $(this).val();
        /* $(this).height(((content.split('\n').length + 1) * 1.5) + 'em'); */
        $('#counter').html(content.length + '/2000');
    });
    $('#content').keyup();
});

function validate(){
	var plaName =$('[name=plaName]').val();
	var mainImg =$('[name=mainImg]').val();
	var phoneMiddle =$('[name=phoneMiddle]').val();
	var phoneEnd =$('[name=phoneEnd]').val();

		if(plaName.trim().length==0){
			swal({
				  text: "업체명을 입력해주세요",
				  icon: "warning",
				  button: "확인",
				});
			return false;
		}else if(mainImg.trim()==0){
			swal({
				  text: "대표 사진을 등록해주세요",
				  icon: "warning",
				  button: "확인",
				});
			return false;
		}else if(phoneMiddle.trim==0||phoneEnd.trim==0){
			swal({
				  text: "번호를 입력해주세요",
				  icon: "warning",
				  button: "확인",
				});
			return false;
		}else if(menuName==0||menuName==null){
			swal({
				  text: "메뉴명을 입력해주세요.",
				  icon: "warning",
				  button: "확인",
				});
			return false;
		}else if(menuPrice==0||menuPrice==null){
			swal({
				  text: "메뉴 가격을 입력해주세요.",
				  icon: "warning",
				  button: "확인",
				});
			return false;
		}
		return true;	
	}


/* $(function(){
	$("#check_all").click(function(){
		var chk = $(this).is(":checked");//.attr('checked');
		if(chk) $("[name=menuCheck]").val('Y');
		else  
	});
}); */

</script>

<section>
	<div class="container" style=" box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
		<div class="row" style="margin-top:55px">
			<form action="${path}/map/placeInsert.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
		    	 <h1 class="text-uppercase nanumFont">
		    		<i class="fa fa-edit"></i> 장소 등록
		    	</h1>
		    	<hr/>
		    	<div class="info col-md-12">
		    		<div class="row frist">
			    		<div class="col-md-2">
			    			<span>지역선택</span>
			    		</div>
			    		<div class="col-md-10">
			    			 <select class="form-control smallSzie"  name="plaArea">
			   						<option value="마포구">마포구</option>
			   						<option value="강남구">강남구</option>
			   						<option value="서초구">서초구</option>
			   						<option value="송파구">송파구</option>
			   					</select> 
			    		</div>
		    		</div>
		    		
		    		
		    		<div class="row margin-bottom">
		    			<div class="col-md-2">
			    			<span>업종</span>
			    		</div>
			    		<div class="col-md-10">
			    			 <select class="form-control smallSzie"  name="plaCategory">
			   						<option value="식사">식사</option>
			   						<option value="술">술</option>
			   						<option value="노래방">노래방</option>
			   						<option value="스포츠">스포츠</option>
			   						<option value="영화/공연">영화/공연</option>
			   					</select> 
			    		</div>
		    		</div>
		    		
	
		    		<div class="row margin-bottom">
			    		<div class="col-md-2">
			    			<span>업체명</span>
			    		</div>
			    		<div class="col-md-10">	    		
							<input class="form-control" style="width:50%" name="plaName"  type="text"  placeholder="업체명을 입력해주세요 ">
			    		</div>
		    		</div>
		    		
		    		
		    		<div class="row margin-bottom">
			    		<div class="col-md-2">
			    			<span>대표이미지</span>
			    		</div>
			    		<div class="col-md-10">
				                 <div class="custom-file" >
				                    <input style="width:50%" type="file" class="custom-file-input" name="mainImg" id="mainImg1">
				                    <label style="width:50%" class="custom-file-label" for="mainImg1">파일을 선택하세요</label>
				                </div>        
           			 		 
			    		</div>
		    		</div>

		    		<div class="row margin-bottom">
			    		<div class="col-md-2">
			    			<span>전화번호</span>
			    		</div>
			    		<div class="col-md-10">
			    			<div class="form-inline">	
							 <select class="form-control" id="phone" name="phoneFirst">
			   						<option value="02">02</option>
			   						<option value="031">031</option>
			   						<option value="032">032</option>
			   						<option value="010">010</option>
			   						<option value="011">011</option>
			   						<option value="070">070</option>
			   						<option value="1577">1577</option>
			   					</select> 
			   			  
			   				<input class="form-control " id="phone" name="phoneMiddle" type="text" >
			   				<input class="form-control " id="phone" name="phoneEnd" type="text" > 
			   				
			   				</div>	
			    		</div>
		    		</div>
		    		
		    		<div class="row margin-bottom">
			    		<div class="col-md-2">
			    			<span>주소</span>
			    		</div>
			    		<div class="col-md-10">
			    			<div class="form-inline">	
				    			<input class="form-control addr" type="text" id='postcode' name="postCode" placeholder="우편번호" readonly>
				    			<input class="btn btn-primary" type="button" value="우편번호 찾기" onclick="execDaumPostcode()">
							</div>
							<div class="form-inline" style="margin-top:2%">	
								<input class="form-control" style="width:50%" type="text" name="roadAddr" id="roadAddress" placeholder="도로명주소" readonly>
								<input class="form-control " style="width:25%; margin-left:1% " name="jibunAddr" type="text" id="jibunAddress" placeholder="지번주소" readonly>
								<span id="guide" style="color:#999"></span>
							</div>
			    		</div>
		    		</div>
		    		
		    		<div class="row margin-bottom">
			    		<div class="col-md-2">
			    			<span>이용시간</span>
			    		</div>
			    		<div class="col-md-10 form-inline" >
				    			 <select class="form-control" id="time"  name="day">
			   						<option value="매일">매일</option>
			   						<option value="평일">평일</option>
			   						<option value="주말">주말</option>
			   					</select> 
			   					 <select class="form-control" id="time"  name="startTime">
			   						<option value="00:00">00:00</option>
			   						<option value="01:00">01:00</option>
			   						<option value="02:00">02:00</option>
			   						<option value="03:00">03:00</option>
			   						<option value="04:00">04:00</option>
			   						<option value="05:00">05:00</option>
			   						<option value="06:00">06:00</option>
			   						<option value="07:00">07:00</option>
			   						<option value="08:00">08:00</option>
			   						<option value="09:00">09:00</option>
			   						<option value="06:00">10:00</option>
			   						<option value="07:00">11:00</option>
			   						<option value="08:00">12:00</option>
			   						<option value="09:00">13:00</option>
			   					</select>
			   					<select class="form-control" id="time"  name="endTime">
			   						<option value="00:00">00:00</option>
			   						<option value="01:00">01:00</option>
			   						<option value="02:00">02:00</option>
			   						<option value="03:00">03:00</option>
			   						<option value="04:00">04:00</option>
			   						<option value="05:00">05:00</option>
			   						<option value="06:00">06:00</option>
			   						<option value="07:00">07:00</option>
			   						<option value="08:00">08:00</option>
			   						<option value="09:00">09:00</option>
			   						<option value="06:00">10:00</option>
			   						<option value="07:00">11:00</option>
			   						<option value="08:00">12:00</option>
			   						<option value="09:00">13:00</option>
			   					</select>
			   					<input class="form-control" style="width:25%" name="subContent" type="text" placeholder="ex)1월 1일 휴무"/>
							</div>			    		
		    		</div>
		    		
		    		
		    		<div class="row margin-bottom-sub">
			    		<div class="col-md-2">
			    			<span>가격정보</span>
			    		</div>
			    		<div class="col-md-10 form-inline" >
			   					<input class="form-control addr menuName"  name="menuName" type="text" placeholder="ex)아메리카노"/>
			   					<input class="form-control addr menuPrice"  name="menuPrice"  type="text" placeholder="ex)2500원"/>
			   					<input type="button" class="btn btn-primary" value="추가" onclick="add_item()"/>
			   					<!--  <label style="padding:0%;width:12%"><input id="check_all" type="checkbox" name="menuCheck">대표</label> -->
			    		</div>
		    		</div>
		    		
		    		<!-- 추가버튼 클릭시 추가되는 div -->
		    		<div class="row margin-bottom-sub">
		    			<div class="col-md-2"></div>
			    		<div class="col-md-10" id="field">
			    			
			    	</div>
			    	
		    		</div>
					<!-- 추가 되는 div 내용물 -->		    		
						<div id="pre_set" style="display:none">
		   					<input class="form-control addr" name="menuName"  type="text" placeholder="ex)아메리카노"/>
		   					<input class="form-control addr"  name="menuPrice" type="text" placeholder="ex)2500원"/>
		   					<input type="button" class="btn btn-primary" value="삭제" onclick="remove_item(this)"/>
		   					<!--  <label style="padding:0%;width:12%"><input id="check_all" type="checkbox" name="menuCheck">대표</label> -->
						</div>		    		
			    	
			  
			     	<div class="row margin-bottom margin-top">
			    		<div class="col-md-2">
			    			<span>소개글</span>
			    		</div>
			    		<div class="col-md-10 " >
			    			<div class="middleSize">
			   					 <textarea class="form-control" name="plaContent" rows="6" id="content" maxlength="2000"></textarea>	
			   					 <span id="counter" style="margin-left:89%">###</span>		   					  
			   				</div>
			   				
			    		</div>
		    		</div>
		    		
		    		 <div class="row margin-bottom">
			    		<div class="col-md-2">
			    			<span>사진등록</span>
			    		</div>
			    		<div class="col-md-10">
			    			 <div class="form-group middleSize">
									 <input id="input-ru" type="file" class="file btn-sm" name="file" multiple="multiple" data-preview-file-type="any">
							</div> 
		
			    		</div>
		    		</div> 
		    		
		    		 <div class="row margin-bottom">
			    		<div class="col-md-2">
			    			<span>대표키워드</span>
			    		</div>
			    		<div class="col-md-10 form-inline">
			    			<input class="form-control" id="time" name="keyword1" type="text" placeholder="ex)홍대맛집"/>
			    			<input class="form-control" id="time" name="keyword2" type="text" />
							<input class="form-control" id="time" name="keyword3" type="text" />
							<input class="form-control" id="time" name="keyword4" type="text" />
							<input class="form-control" id="time" name="keyword5" type="text" />
			    		</div>
		    		</div> 
		    		
		    		 <div class="margin-bottom" id="center">
		    		 	<div style="width:30%;margin-left:auto;margin-right:auto;height:100%">
			    			<input style="width:100%;height:100%" class="btn btn-primary" type="submit" value="등록하기"/>
			    		</div>
		    		</div> 
		    	</div>
		    </form>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
