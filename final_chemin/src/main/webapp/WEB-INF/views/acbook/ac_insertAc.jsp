<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />

<!-- ProgressBar: ac_inputIn -->
<link rel="stylesheet" 	href="<c:url value= "/resources/acbook/css/pgBar.css?var3"/>">
<!-- ProgressBar: ac_inputIn -->
<link rel="stylesheet" 	href="<c:url value= "/resources/acbook/css/ac_navBar.css"/>">
<!-- Fullcalendar: ac_calenndar: ? -->
<link rel="stylesheet" 	href="<c:url value= "/resources/acbook/css/bootstrap-datetimepicker.css"/>">
<!--DatePicker: ac_inputIn-->
<link rel="stylesheet" 	href="<c:url value= "/resources/acbook/css/bootstrap-datetimepicker.min.css"/>">
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- sideBar -->
<jsp:include page="/WEB-INF/views/acbook/sideBar.jsp" />

<!-- Main Start -->
<div class="col-md-10 col-sm-8 main-content" id='newMain'>
<br><br>
	<div class="innerpage-container-fluid">

		<div class="container sell-your-phone">
			<!-- MultiStep Form -->
			<!-- multistep form -->
				<h2 class="text-center">
					한눈에 파악해보는 나의  재정 현황! 플레리북이 함께합니다.<br> 지금,만들어볼까요?
				</h2>
				<form id="msform" action="acbook/insertAc.do" method="post">
				<!-- progressbar -->

				<ul id="progressbar">
					<li class="active">플레리북 입력</li>
					<li>날짜</li>
					<li>수입</li>
					<li>지출</li>
					<li>항목</li>
					<li>수단</li>
					<li>금액</li>
					<li>메모</li>
				</ul>
				<!-- fieldsets -->
				
				<div class="clearfix" style="width:100%;height:100%;display:block;object-fit:contain;">
					<fieldset>
						<h3>가계 타입을 선택하세요</h3>
						<button type="button" class="next phone-bx" id="typeNum" value="101">
							<img src="${path}/resources/acbook/images/101.png"><span>수입</span>
						</button>
						<button type="button" class="next phone-bx" id="typeNum" value="201">
							<img src="${path}/resources/acbook/images/201.png"><span>지출</span>
						</button>
					</fieldset>
					<fieldset>
						<h3>날짜를 입력하세요</h3>
							<div style="overflow:hidden;" class="container-fluid">
						        <div class="container-fluid">
						             <input type="text" id="dtp" name="acDate" style="line-height:5px;margin:0px;padding:0px;width:0px;"size="10px">
						        </div>
							</div>
							<button type="button" class="next next-btn">Next</button>
					</fieldset>										
					<fieldset id='cateNum1'>
						<h3>항목을 입력하세요</h3>
						<button type="button" class="next phone-bx" id="cateNum" value="101_1">
							<img src="${path}/resources/acbook/images/101_1.png"><span>월급</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="101_2">
							<img src="${path}/resources/acbook/images/101_2.png"><span>용돈</span>
						</button>
							<button type="button" class="next phone-bx" id="cateNum" value="101_3">
							<img src="${path}/resources/acbook/images/101_3.png"><span>기타</span>
						</button>
					</fieldset>
					<fieldset id='cateNum2'>
						<h3>항목을 입력하세요</h3>
						<button type="button" class="next phone-bx" id="cateNum" value="201_1">
							<img src="${path}/resources/acbook/images/201_1.png"><span>식비</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="201_2">
							<img src="${path}/resources/acbook/images/201_2.png"><span>교통비</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="201_3">
							<img src="${path}/resources/acbook/images/201_3.png"><span>문화생활</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="201_4">
							<img src="${path}/resources/acbook/images/201_4.png"><span>생필품</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="201_5">
							<img src="${path}/resources/acbook/images/201_5.png"><span>의류</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="201_6">
							<img src="${path}/resources/acbook/images/201_6.png"><span>미용</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="201_7">
							<img src="${path}/resources/acbook/images/201_7.png"><span>의료건강</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="201_8">
							<img src="${path}/resources/acbook/images/201_8.png"><span>교육</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="201_9">
							<img src="${path}/resources/acbook/images/201_9.png"><span>전화요금</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="201_10">
							<img src="${path}/resources/acbook/images/201_10.png"><span>경조사비</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="201_11">
							<img src="${path}/resources/acbook/images/201_11.png"><span>공과금</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="201_12">
							<img src="${path}/resources/acbook/images/201_12.png"><span>카드대금</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="201_13">
							<img src="${path}/resources/acbook/images/201_13.png"><span>저축</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="201_14">
							<img src="${path}/resources/acbook/images/201_14.png"><span>기타</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="201_15">
							<img src="${path}/resources/acbook/images/201_15.png"><span>기타</span>
						</button>				
					</fieldset>
					<fieldset>
						<h3>금액을 입력하세요</h3>
							<input type="number" name="acCost" placeholder="금액 입력(숫자만 입력 가능합니다)" value="" required style="line-height:30px;margin:0px;padding:0px;text-align:center;width=20px;font-size:30px;"/>
							<button type="button" class="next next-btn">Next</button>
					</fieldset>
					<fieldset id='exCode2'>
						<h3>결제수단을 입력하세요</h3>
						<button type="button" class="next phone-bx" id="exCode" value="M">
							<img src="${path}/resources/acbook/images/M1.png"><span>현금</span>
						</button>
						<button type="button" class="next phone-bx" id="exCode" value="C">
							<img src="${path}/resources/acbook/images/C.png"><span>카드</span>
						</button>
					</fieldset>
					<fieldset>
						<h3>함께 남길 메모를 입력하세요.</h3>
							<input type="text" name="memo" placeholder="ex) 돈주웠당" value=""/>
							<button type="button" class="next next-btn">Next</button>
					</fieldset>
					<fieldset>
						<h3>정보가 모두 입력되었습니다. 보내시겠습니까?</h3>
						<div id="testArea"></div>
						<!-- 테스트용 데이터 userId -->
						<input type="hidden" id="userId" name="userId" value="${memberLoggedIn.userId }">
						<input type="hidden" name="exCode" value="">
						<input type="hidden" name="typeNum" value="">
						<input type="hidden" name="cateNum" value="">
						<input type="submit" id="testtest" class="next next-btn" />
					</fieldset>
					</div>
				</form>
			<!-- /.MultiStep Form -->

		</div>
	</div>
</div>
<!-- Main End -->
</div>
</div>
<!-- Side Bar Div End -->
<!-- jQurery -->

<script type="text/javascript">

$('#dtp').datetimepicker(
		{
    inline: true,
    sideBySide: true,
    format: 'YYYY-MM-DD HH:mm:ss',
    }
		);

</script>
<script>
$(document).on('click','#typeNum', function () {
	
	var b= $('input:hidden[name=typeNum]').val($(this).attr("value"));
	
	if(b.val()=='101'){
		$("#cateNum2").remove();
		$("#exCode2").remove();
		var a = $('input:hidden[name=exCode]').val("-");	
	}else{
		$("#cateNum1").remove();
	}
});
$(document).on('click','#cateNum', function () {
	var b= $('input:hidden[name=cateNum]').val($(this).attr("value"));
});
$(document).on('click','#exCode',function(){
	
	var a = $('input:hidden[name=exCode]').val($(this).attr("value"));	
});
</script>

<script>
var current_fs, next_fs, previous_fs;
var left, opacity, scale;
var animating;

$(".next").click(function(){
		
		if(animating) return false;
		animating = true;

		current_fs = $(this).parent();
		next_fs = $(this).parent().next();

	
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
	next_fs.show(); 
	
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			
			scale = 1 - (1 - now) * 0.2;
			
			left = (now * 50)+"%";
		
			opacity = 1 - now;
			current_fs.css({
        'transform': 'scale('+scale+')',
        'position': 'absolute'
      });
			next_fs.css({'left': left, 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		easing: 'easeInOutBack'
	});
});

$(".previous").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	
	previous_fs.show(); 

	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			
			scale = 0.8 + (1 - now) * 0.2;
			
			left = ((1-now) * 50)+"%";
			
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		easing: 'easeInOutBack'
	});
});
</script>


<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
