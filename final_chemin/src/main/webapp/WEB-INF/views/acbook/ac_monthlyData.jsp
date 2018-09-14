<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!-- BootStrap -->
<link rel="stylesheet"
	href="<c:url value= "/resources/vendor/bootstrap/css/bootstrap.css"/>">
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- sideBar -->
<jsp:include page="/WEB-INF/views/acbook/sideBar.jsp" />

<!-- Main Start -->
<div class="col-md-10 col-sm-8 main-content">
	<div class="container-fluid">
		<br>
		<!--***************** 	여기서부터 내용 쓰면 됨 -->
		<div class='col-md-6' id="graph1">
			<div id='ex2'>
				<canvas id="myChart_in"></canvas>
			</div>
		</div>
		<div class='col-md-6' id="graph1_2">
			<div id='ex235'>
				<h3><strong>'8'</strong>월의 수입 패턴</h3>
				Lorem ipsum dolor sit amet, consectetur
				adipiscing elit. In dictum mattis purus a rhoncus. Aliquam sit amet
				venenatis dolor. Nulla blandit laoreet mauris, sit amet pretium sem
				bibendum ut. Interdum et malesuada fames ac ante ipsum primis in
				faucibus. Nunc euismod ante nisi, quis vulputate sapien gravida a.
				Morbi ac tincidunt ante, blandit rutrum quam. Sed eu urna lectus.
				Suspendisse accumsan arcu quis imperdiet lacinia. Maecenas eu neque
				non dui tristique tincidunt nec cursus justo.</div>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class='col-md-6' id="graph2">
			<div id='ex25'>
				<canvas id="myChart_ex" style="margin-top: 0%;"></canvas>
			</div>
		</div>
		<div class='col-md-6' id="graph2_2" style="margin-top: 5%;">
			<div id='ex23'>
				<h3><strong>'8'</strong>월의 지출 패턴</h3>
				Lorem ipsum dolor sit amet, consectetur
				adipiscing elit. In dictum mattis purus a rhoncus. Aliquam sit amet
				venenatis dolor. Nulla blandit laoreet mauris, sit amet pretium sem
				bibendum ut. Interdum et malesuada fames ac ante ipsum primis in
				faucibus. Nunc euismod ante nisi, quis vulputate sapien gravida a.
				Morbi ac tincidunt ante, blandit rutrum quam. Sed eu urna lectus.
				Suspendisse accumsan arcu quis imperdiet lacinia. Maecenas eu neque
				non dui tristique tincidunt nec cursus justo.</div>
		</div>
	</div>
	<!--**************Caution*********************** 이 아래 Div 건드리지말것 -->
</div>
</div>
<!-- Main End -->
</div>
</div>
<!-- Side Bar Div End -->


<!-- jQurery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- chart -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>

<!-- Montly Pattern -->
<script>
	var ctx1 = $("#myChart_in");
	var ctx2 = $("#myChart_ex");

	function drawDoughnut() {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/ajax/selectInExPattern",
					type : "get",
					dataType : "json",
					success : function(d) {
						console.log("load (ChartData_In_Ex_Pattern) success");
						var inLabels = []; //카테고리
						var inData = [];//돈
						var exLabels = [];
						var exData = [];
						$(d).each(function() {
							exLabels.push($(this).attr('CATE_NAME'));
							var clue = $(this).attr('CATE_NAME');

							switch (clue) {
							case 'salary':
								inData.push($(this).attr('COST'));
								break;
							case 'pinmoney':
								inData.push($(this).attr('COST'));
								break;
							case 'inetc':
								inData.push($(this).attr('COST'));
								break;
							case 'eat':
								exData.push($(this).attr('COST'));
								break;
							case 'trans':
								exData.push($(this).attr('COST'));
								break;
							case 'joy':
								exData.push($(this).attr('COST'));
								break;
							case 'ness':
								exData.push($(this).attr('COST'));
								break;
							case 'cloth':
								exData.push($(this).attr('COST'));
								break;
							case 'beauty':
								exData.push($(this).attr('COST'));
								break;
							case 'health':
								exData.push($(this).attr('COST'));
								break;
							case 'edu':
								exData.push($(this).attr('COST'));
								break;
							case 'phone':
								exData.push($(this).attr('COST'));
								break;
							case 'famevent':
								exData.push($(this).attr('COST'));
								break;
							case 'utility':
								exData.push($(this).attr('COST'));
								break;
							case 'cardcost':
								exData.push($(this).attr('COST'));
								break;
							case 'saving':
								exData.push($(this).attr('COST'));
								break;
							case 'exetc':
								exData.push($(this).attr('COST'));
								break;
							}
							;

						});

						/* 					for(var i=0;i<addData.length;i++){
						 addLabels.push($(d[i]).attr('CATE_NAME'));
						 }; */
						var addLabels = inLabels;
						var addData = inData;
						var exLabels = exLabels;
						var exData = exData;
						var myDoughnut1 = new Chart(
								ctx1,
								{
									type : 'doughnut',
									data : {
										labels : [ '월급', '용돈', '기타' ],
										datasets : [ {
											data : inData,
											label : "Type",
											backgroundColor : [ '#2EB400',
													'#2BC8C9', '#666666', ],
											hoverBackgroundColor : "rgba(75,192,192,1)",
											/* 						borderColor: "rgba(75,192,192,1)", */
											borderWidth : 2,

										} ]
									},
									options : {
										responsive : true,
										legend : {
											display : true,
											fontSize : 10,
											position : 'left',
											usePointStyle : true,
											labels : {
												boxWidth : 10,
											}
										}
									}
								});
						var myDoughnut2 = new Chart(
								ctx2,
								{
									type : 'doughnut',
									data : {
										labels : exLabels,
										datasets : [ {
											data : exData,
											backgroundColor : [ "#949FB1",
													"#46BFBD", "#FDB45C",
													"#F7464A", "#4D5360",
													"#2EB400", "#2BC8C9",
													"#666666", "#4bb2c5",
													"#556439", "#FF8C00",
													"#F7464A", "#46BFBD",
													"#FDB45C", ],
											hoverBackgroundColor : "rgba(75,192,192,1)",
											/* 						borderColor: "rgba(75,192,192,1)", */
											borderWidth : 2
										} ]
									},
									options : {
										responsive : true,
										legend : {
											display : true,
											fontSize : 10,
											position : 'left',
											usePointStyle : true,
											labels : {
												boxWidth : 10,
											}
										},
									}
								});
					},
					error : function(jqxhr, textStatus, errorThrown) {
						console.log("error");
						console.log(jqxhr);
						console.log(textStatus);
						console.log(errorThrown);
					}
				});
	};
	$(document).ready(function() {
		drawDoughnut();
	});
</script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />