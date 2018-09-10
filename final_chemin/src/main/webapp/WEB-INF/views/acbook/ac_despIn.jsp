<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />

<!-- BootStrap -->
<link rel="stylesheet" href="<c:url value= "/resources/vendor/bootstrap/css/bootstrap.css"/>">
<!-- DatetimePicker -->
<link rel="stylesheet" href="<c:url value="/resources/vendor/acbook/css/bootstrap-datetimepicker.min.css" />">
<!-- acMain -->
<link rel="stylesheet" href="<c:url value= "/resources/vendor/acbook/css/acMain.css"/>">
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- sideBar -->
<jsp:include page="/WEB-INF/views/acbook/sideBar.jsp" />

<!-- Main Start -->
<div class="col-md-10 col-sm-8 main-content">
	<div class="innerpage-container">

		<div class="container sell-your-phone">
			<!-- MultiStep Form -->
			<!-- multistep form -->
				<h2 class="text-center">
					한눈에 파악해보는 나의  재정 현황!<br> 지금,만들어볼까요?
				</h2>
				<form id="msform" action="acbook/insertExpenditure.do" method="post">
				<!-- progressbar -->

				<ul id="progressbar">
					<li class="active">지출</li>
					<li>날짜</li>
					<li>수단</li>
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
						<h3>지출을 입력하여 편하게 확인해봅시당</h3>
							<button type="button" class="next next-btn">Next</button>
					</fieldset>
					<fieldset>
						<h3>날짜를 입력하세요</h3>
							<div style="overflow:hidden;" class="container-fluid">
						        <div class="row">
						             <input type="text" id="dtp" name="acDate">
						        </div>
							</div>
							<button type="button" class="next next-btn">Next</button>
					</fieldset>
					<fieldset>
						<h3>결제수단을 입력하세요</h3>
						<button type="button" class="next phone-bx" id="exCode" value="M">
							<img src="${path}/resources/vendor/acbook/images/M.png" width="80px" height="80px"><span>현금</span>
						</button>
						<button type="button" class="next phone-bx" id="exCode" value="C">
							<img src="${path}/resources/vendor/acbook/images/C.png" width="80px" height="80px"><span>카드</span>
						</button>
					</fieldset>
					<fieldset>
						<h3>항목을 입력하세요</h3>
						<button type="button" class="next phone-bx" id="cateNum" value="201_1">
							<img src="${path}/resources/vendor/acbook/images/101_1.png" width="80px" height="80px"><span>식비</span>
						</button>
					<button type="button" class="next phone-bx" id="cateNum" value="201_2">
							<img src="${path}/resources/vendor/acbook/images/101_1.png" width="80px" height="80px"><span>교통비</span>
						</button>
					<button type="button" class="next phone-bx" id="cateNum" value="201_3">
							<img src="${path}/resources/vendor/acbook/images/101_1.png" width="80px" height="80px"><span>문화생활</span>
						</button>
					<button type="button" class="next phone-bx" id="cateNum" value="201_4">
							<img src="${path}/resources/vendor/acbook/images/101_1.png" width="80px" height="80px"><span>생필품</span>
						</button>
					<button type="button" class="next phone-bx" id="cateNum" value="201_5">
							<img src="${path}/resources/vendor/acbook/images/101_1.png" width="80px" height="80px"><span>의류</span>
						</button>

						<button type="button" class="next phone-bx" id="cateNum" value="201_6">
							<img src="${path}/resources/vendor/acbook/images/101_2.png" width="80px" height="80px"><span>미용</span>
						</button>
						<button type="button" class="next phone-bx" id="cateNum" value="201_7">
							<img src="${path}/resources/vendor/acbook/images/101_3.png" width="80px" height="80px"><span>의료건강</span>
						</button>
					<button type="button" class="next phone-bx" id="cateNum" value="201_8">
							<img src="${path}/resources/vendor/acbook/images/101_1.png" width="80px" height="80px"><span>교육</span>
						</button>
					<button type="button" class="next phone-bx" id="cateNum" value="201_9">
							<img src="${path}/resources/vendor/acbook/images/101_1.png" width="80px" height="80px"><span>전화요금</span>
						</button>
					<button type="button" class="next phone-bx" id="cateNum" value="201_10">
							<img src="${path}/resources/vendor/acbook/images/101_1.png" width="80px" height="80px"><span>경조사비</span>
						</button>
					<button type="button" class="next phone-bx" id="cateNum" value="201_11">
							<img src="${path}/resources/vendor/acbook/images/101_1.png" width="80px" height="80px"><span>공과금</span>
						</button>
					<button type="button" class="next phone-bx" id="cateNum" value="201_12">
							<img src="${path}/resources/vendor/acbook/images/101_1.png" width="80px" height="80px"><span>카드대금</span>
						</button>
					<button type="button" class="next phone-bx" id="cateNum" value="201_13">
							<img src="${path}/resources/vendor/acbook/images/101_1.png" width="80px" height="80px"><span>저축</span>
						</button>
					<button type="button" class="next phone-bx" id="cateNum" value="201_14">
							<img src="${path}/resources/vendor/acbook/images/101_1.png" width="80px" height="80px"><span>기타</span>
						</button>
					<button type="button" class="next phone-bx" id="cateNum" value="201_15">
							<img src="${path}/resources/vendor/acbook/images/101_1.png" width="80px" height="80px"><span>기타</span>
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
						<input type="hidden" id="exCode" name="exCode">
						<input type="hidden" name="typeNum" value="201">
						<input type="hidden" id="cateNum" name="cateNum">
						<input type="submit" id="testtest" class="next next-btn" />
					</fieldset>
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
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value="/resources/vendor/acbook/js/moment.js"/>"></script>
<script src="<c:url value="/resources/vendor/acbook/js/transition.js"/>"></script>
<script src="<c:url value="/resources/vendor/acbook/js/collapse.js"/>"></script>
<script src="<c:url value="/resources/vendor/acbook/js/bootstrap-datetimepicker.min.js"/>"></script>
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
$(document).on('click','#exCode',function(){
	var a = $('input:hidden[name=exCode]').val($(this).attr("value"));
})
$(document).on('click','#cateNum', function () {
	var b= $('input:hidden[name=cateNum]').val($(this).attr("value"));
/* 	alert(b.val()); */	
});
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
