<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!-- ProgressBar: ac_inputIn -->
<link rel="stylesheet" 	href="<c:url value= "/resources/acbook/css/acMain.css"/>">
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
<div class="col-md-10 col-sm-8 main-content">
<section class="details-card">
    <div class="container">
        <div class="row">

	<div class="innerpage-container">

		<div class="container sell-your-phone">
			<!-- MultiStep Form -->
			<!-- multistep form -->
				<h2 class="text-center">
					한눈에 파악해보는 나의  재정 현황!<br> 지금,만들어볼까요?
				</h2>
				<form id="msform" action="acbook/insertIncome.do" method="post">
				<!-- progressbar -->

				<ul id="progressbar">
					<li class="active">수입</li>
					<li>절차</li>
					<li>날짜</li>
					<li>항목</li>
					<li>금액</li>
					<li>메모</li>
					<li>확인</li>
					<li>저장</li>
				</ul>
				<!-- fieldsets -->
				
				<div class="clearfix">
							<!-- 테스트용 히든데이터!! -->
					<!-- <fieldset class="brand-section"> -->
					<fieldset class="brand-section">
						<h3>재정상태를  입력하여 내 지출 습관을 확인해봅시당</h3>
							<button type="button" class="next next-btn">Next</button>
					</fieldset>
					<fieldset>
						<h3>재미있겠죵</h3>
							<button type="button" class="next next-btn">Next</button>
					</fieldset>
					<fieldset>
						<h3>날짜를 입력하세요</h3>
							<div style="overflow:hidden;" class="container-fluid">
						        <div class="row">
						             <input type="text" id="dtp" name="acDate">
						        </div>
							</div>
							<button type="button" id="acdate" class="next next-btn">Next</button>
					</fieldset>
					<fieldset>
						<h3>항목을 입력하세요</h3>
						<button type="button" class="next phone-bx" id="cateNum" value="101_1">
							<img src="${path}/resources/vendor/acbook/images/101_1.png" width="80px" height="80px"><span class="myspan">월급</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="101_2">
							<img src="${path}/resources/vendor/acbook/images/101_2.png" width="80px" height="80px"><span>용돈</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="101_3">
							<img src="${path}/resources/vendor/acbook/images/101_3.png" width="80px" height="80px"><span>기타</span>
						</button>
					</fieldset>
					<fieldset>
						<h3>금액을 입력하세요</h3>
							<input type="number" name="acCost" placeholder="금액 입력" value="" required/>
							<button type="button" class="next next-btn">Next</button>
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
						<input type="hidden" id="userId" name = "userId" value="hello">
						
						<input type="hidden" name="typeNum" value="101">
 						<input type="hidden" name="exCode" value="-">
						<input type="hidden" id="cateNum" name="cateNum" value="홋">
						<input type="submit" id="testtest" class="next next-btn" />
					</fieldset>
				</form>
			<!-- /.MultiStep Form -->

		</div>
	</div>
	</div>
	</div>
	</section>
</div>
<!-- Main End -->
</div>
</div>
<!-- Side Bar Div End -->

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
/* 성공!!!!!!!!!!!!버튼 클릭시 밸류 값 받음 */
$(document).on('click','#cateNum', function () {
	var b= $('input:hidden[name=cateNum]').val($(this).attr("value"));
	arert(b.val());
	
/* 	alert(b.val()); */
	
});
</script>
<script>
$(document).on('click','#testtest',function(){
	var a = $('input:text[name=acDate]');
/* 	alert(a.val()); */
})
</script>
<script>
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches

$(".next").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	next_fs = $(this).parent().next();
	
	//activate next step on progressbar using the index of next_fs
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
	//show the next fieldset
	next_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale current_fs down to 80%
			scale = 1 - (1 - now) * 0.2;
			//2. bring next_fs from the right(50%)
			left = (now * 50)+"%";
			//3. increase opacity of next_fs to 1 as it moves in
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
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".previous").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale previous_fs from 80% to 100%
			scale = 0.8 + (1 - now) * 0.2;
			//2. take current_fs to the right(50%) - from 0%
			left = ((1-now) * 50)+"%";
			//3. increase opacity of previous_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});
</script>


<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
