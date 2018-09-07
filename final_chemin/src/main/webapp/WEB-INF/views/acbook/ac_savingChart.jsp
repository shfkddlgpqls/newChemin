<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!-- jQurery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- sideBar -->
<jsp:include page="/WEB-INF/views/acbook/sideBar.jsp" />

<!-- Main Start -->
<div class="col-md-10 col-sm-8 main-content">

	<!-- 여기서부터입력 -->
<!------ Include the above in your HEAD tag ---------->

<!-- details card section starts from here -->
<section class="details-card">
    <div class="container">
        <div class="row">


			<div class="container-fluid">
			<br><br>
            <div class = "row">
	             <div class="col-md-8">
	            	<div class="card-content">
	            		 <!-- 차트삽입 -->
				        <div id="saving_chart" class="card-desc">
							<br>
							<h3>박은별 님의 연간 저축 그래프</h3>
							<div id="graph" style="max-width: 100%;">
								<div>
									<canvas id="myChart_save"></canvas>
								</div>
							</div>
						</div>
	       				 <!-- 차트삽입 -->
	            	</div>
	            </div>
	            <div class="col-md-4">
	            </div>
			</div>
			</div>           
        </div>
    </div>
    <!-- 로우디아이브이 -->
</section>
<!-- details card section starts from here -->
	<!-- 여기서그만 -->
<!-- Main End -->
</div>
</div>
<!-- Side Bar Div End -->



<script>
var ctx = $("#myChart_save");
function drawLine(){
	$.ajax({
		url : "${pageContext.request.contextPath}/ajax/selectSaving.do",
		type : "get",
		dataType : "json",
		success : function(d) {
			console.log("load (ChartData_Saving) success");
			console.log(d);
			var addlabels=[];
			var adddata=[];
			$(d).each(function(){
				addlabels.push($(this).attr('ACDATE'));
				adddata.push($(this).attr('CUMAL_SAV'));
			});			
			var addlabels= addlabels;
			var adddata = adddata;
			var myLine = new Chart(ctx,{
				type : 'line',
				data :{
					labels : addlabels,
					datasets: [{
						fill: false,
						lineTension: 0.1,
						label: "저축",
						backgroundColor: "rgba(75,192,0,4)",
						borderColor: "rgba(75,192,192,1)",
						borderCapStyle: "butt",
						borderDash: [],
						borderDashOffset: 0.0,
						borderJoinStyle: 'miter',
						pointBorderColor: "rgba(75,192,192,1)",
						pointBackGroundColor: "#fff",
						pointBorderWidth: 1,
						pointHoverRadius: 5,
						pointHoverBackgroundColor: "rgba(75,192,192,1)",
						pointHoverBorderColor: "rgba(220,220,220,1)",
						pointHoverBorderWidth: 2,
						pointRadius: 1,
						pointHitRadius: 10,
						data: adddata,
						spanGaps: false,
					}]
				},
				options: {
					responsive:true,
			        legend: {
			            display: true,
			            fontSize: 10,
		            	position: 'left',
			            usePointStyle: true,
			            labels: {
			            	boxWidth: 10,
			            }
			        },

				}
			});
		},
		error : function(jqxhr, textStatus, errorThrown){
			console.log("error");
			console.log(jqxhr);
			console.log(textStatus);
			console.log(errorThrown);
		}	
	});
};
$(document).ready(function(){
	drawLine();
});
</script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
