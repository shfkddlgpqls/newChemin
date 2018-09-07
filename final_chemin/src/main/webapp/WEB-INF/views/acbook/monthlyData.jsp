<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!-- chart -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<!-- jQurery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- BootStrap -->
<link rel="stylesheet"
	href="<c:url value= "/resources/vendor/bootstrap/css/bootstrap.css"/>">
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- sideBar -->
<jsp:include page="/WEB-INF/views/acbook/sideBar.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Main Start -->
<div class="col-md-10 col-sm-8 main-content">
	<div class="container-fluid">
<!-- 	여기서부터 내용 쓰면 됨 -->
<!-- START: WHOLE TEMPLATE SECTION -->
<!------ Include the above in your HEAD tag ---------->
<style>
/* 메인 배경색 */
#monthlyData{
	margin:0;
	padding:0;
}
#newMain {
	margin:0;
	background-color: rgba(236, 240, 241);
}
.aclayoutMD{
	border: 1px solid white;
	display:block;
	padding:0%;
	text-align:center;
	background-color:white;
	box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12);
	margin:0%;
	object-fit:contain;
	width: 100%;
	height: 50%;
}
#acid{
	border: 1px;
	width: 100%;
	heigth: 100%;
	margin: 0;
	margin-top:2%;
	box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12);
}
.about-heading > p{
	font-size:24px;
	font-weight:bold;
}

.about-txt > p{
	font-size:18px;
	text-align:center;
	
}
.about-content-box{
	padding-top:100px;
	padding-bottom:100px;
	padding-left:70px;
	padding-right:70px;
	color:#fff;
}

.about-bg-layer{
	background-color:rgba(62,207,182,0.70);
	height:100%;
	margin:0px;
}
</style>

<section id="monthlyData">
	<div class="container-fluid" id="newMain">    
       	<div class="row about-bg">
             <div class="col-md-6">
				<div class="aclayoutMD" id="acid">
					<canvas id="monthlyDataChart" style="width:100%;height:100%;"></canvas>
				</div>            
             </div>
	             <div class="col-md-6 col-sm-6 col-xs-12 about-bg-layer">
	               <div class="">
		             <div class="about-content-box">
			             <div class="">			             
			                 <h1>ABOUT</h1>
			                 <h2>Monthly Dispenditure</h2>
			                 <p>박은별님 의 한 달 소비패턴</p>
			             </div>
		                 <div class="about-txt">
							<p>이번 달 지출에서 가장 많은 비중을 차지하는 것은</p>
							<h1></h1>입니다<br>
		                 </div>
		              </div>	                
		                  <div style="float:right; color:#fff;">
		   				 		<h1></h1>
		   				</div>           
           			</div>
				</div>
       </div>       
    </div>
</section>

<!-- END: WHOLE TEMPLATE SECTION -->
	</div>
</div>
<!-- Main End -->
</div>
</div>
<!-- Side Bar Div End -->

<script>
Chart.plugins.register({
	  beforeDraw: function (chart) {
	    if (chart.config.options.elements.center) {
	       
	        var ctx = chart.chart.ctx;

	        var centerConfig = chart.config.options.elements.center;
	        var fontSize = centerConfig.fontSize || '50';
	        var fontStyle = centerConfig.fontStyle || 'Arial';
	        var txt = centerConfig.text;
	        var color = centerConfig.color || '#000';
	        var sidePadding = centerConfig.sidePadding || 20;
	        var sidePaddingCalculated = (sidePadding/100) * (chart.innerRadius * 2)

	        ctx.font = fontSize + "px " + fontStyle;

	        var stringWidth = ctx.measureText(txt).width;
	        var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

	        var widthRatio = elementWidth / stringWidth;
	        var newFontSize = Math.floor(30 * widthRatio);
	        var elementHeight = (chart.innerRadius * 0.7);
	 
	        var fontSizeToUse = Math.min(newFontSize, elementHeight);
	        
	        ctx.textAlign = 'center';
	        ctx.textBaseline = 'middle';
	        var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
	        var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
	        ctx.font = fontSizeToUse+"px " + fontStyle;
	        ctx.fillStyle = color;

	        ctx.fillText(txt, centerX, centerY);
	      }
	  }
	});
	
var ctx = $("#monthlyDataChart");

function drawDoughnut2() {
	$.ajax({
		url :  "${pageContext.request.contextPath}/ajax/monthlyDispenditure",
		type : "POST",
		dataType : "json",
		success : function(data){
			console.log("load Success Chart data");
			console.log(data);
			var vsLabels = [];
			var vsData = [];
			$(data).each(function(){
				vsLabels.push($(this).attr('CATENAME'));
				var clue = $(this).attr('CATENAME');
				switch(clue){
				case '식비':
				vsData.push($(this).attr('CATESUM'));
				break;
				case '교통비':
				vsData.push($(this).attr('CATESUM'));
				break;
				case '문화생활':
				vsData.push($(this).attr('CATESUM'));
				break;
				case '생필품':
				vsData.push($(this).attr('CATESUM'));
				break;
				case '의류':
				vsData.push($(this).attr('CATESUM'));
				break;
				case '미용':
				vsData.push($(this).attr('CATESUM'));
				break;
				case '의료건강':
				vsData.push($(this).attr('CATESUM'));
				break;
				case '교육':
				vsData.push($(this).attr('CATESUM'));
				break;
				case '전화요금':
				vsData.push($(this).attr('CATESUM'));
				break;
				case '경조사비':
				vsData.push($(this).attr('CATESUM'));
				break;
				case '공과금':
				vsData.push($(this).attr('CATESUM'));
				break;
				case '카드대금':
				vsData.push($(this).attr('CATESUM'));
				break;
				case '저축':
				vsData.push($(this).attr('CATESUM'));
				break;
				case '기타':
				vsData.push($(this).attr('CATESUM'));
				break;
				
				};
				
			});
	var myDoughnut12 = new Chart(
			ctx,
			{
				type : 'doughnut',
				data : {
						labels: vsLabels,	
					datasets : [ {
						data : vsData,
						backgroundColor : [ "#F94C45",
											"rgb(252,217,32)",
											"rgb(171,209,26)",
											"rgb(160,171,188)",
											"rgba(75,192,192,1)",
											"#F94C45",
											"rgb(252,217,32)",
											"rgb(171,209,26)",
											"rgb(160,171,188)",
											"rgba(75,192,192,1)",
											"#F94C45",
											"rgb(252,217,32)",
											"rgb(171,209,26)",
											"rgb(160,171,188)",
											],
						hoverBackgroundColor : "rgba(75,192,192,1)",
						/* 						borderColor: "rgba(75,192,192,1)", */
						borderWidth : 2
					} ]
				},
				options : {
					title:{
						display: false,
						text:'Monthly Dispenditure Lanking',
						fontSize: 15,
						position:'top'
						},
					responsive : true,
					cutoutPercentage: 70,
					legend : {
						display : true,
						fontSize : 10,
						position : 'bottom',
						usePointStyle : true,
						labels: {
			            	boxWidth: 10,
			            }
					},
					elements: {
						position:'center',
						center: {
							text: vsLabels[0] ,
					      	color: '#FF6384', 
					     	fontStyle: 'Arial', 
					      	sidePadding:5,
							}
					},
					animation: {
			            duration: 3000,
			        },
			        hover: {
			            animationDuration: 1000,
			        },
			        responsiveAnimationDuration: 2000,
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
	drawDoughnut2();
});
</script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />