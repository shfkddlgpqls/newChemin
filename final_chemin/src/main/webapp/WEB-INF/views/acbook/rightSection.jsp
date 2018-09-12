<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />

<!-- tabs -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<!-- jQurery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>	
<!-- chart -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>




<!-- Right Section -->
 		<div class='col-md-9'>
			<div class="container mt-3" >
				<br>
				<br>
				<br>
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"	data-toggle="tab" href="#monthly_calendar">Account Calendar</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#monthly_pattern">Weekly Pattern Graph</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#saving_chart">Monthly Saving Chart</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content"  style="padding: 5%;">
					<!-- Calendar -->
					<div id="monthly_calendar" class="container tab-pane active">
						<br>
						<div id='calendar'></div>
						<pre id="myPre"></pre>
					</div>
					<!-- Montly Compare -->
					<div id="monthly_pattern" class="container tab-pane fade">
						<br>
						<h3>월별 수입/지출 현황</h3>
						<div class = "row">
							<div class = 'col-md-6' id="graph1">
								<div id ='ex2'>
									<canvas id="myChart_in"></canvas>
								</div>
							</div>
							<div class = 'col-md-6' id="graph1_2">	
								<div id='ex235'>
									Lorem ipsum dolor sit amet, consectetur adipiscing elit. In dictum mattis purus a rhoncus. Aliquam sit amet venenatis dolor. Nulla blandit laoreet mauris, sit amet pretium sem bibendum ut. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc euismod ante nisi, quis vulputate sapien gravida a. Morbi ac tincidunt ante, blandit rutrum quam. Sed eu urna lectus. Suspendisse accumsan arcu quis imperdiet lacinia. Maecenas eu neque non dui tristique tincidunt nec cursus justo.
								</div>
							</div>
						</div>
						<hr>
						<div class = "row">
							<div class = 'col-md-6' id="graph2">
								<div id ='ex25' >
									<canvas id="myChart_ex"  style="margin-top: 5%;"></canvas>
								</div>
							</div>
							<div class = 'col-md-6' id="graph2_2" style="margin-top: 5%;">	
								<div id='ex23'>
									Lorem ipsum dolor sit amet, consectetur adipiscing elit. In dictum mattis purus a rhoncus. Aliquam sit amet venenatis dolor. Nulla blandit laoreet mauris, sit amet pretium sem bibendum ut. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc euismod ante nisi, quis vulputate sapien gravida a. Morbi ac tincidunt ante, blandit rutrum quam. Sed eu urna lectus. Suspendisse accumsan arcu quis imperdiet lacinia. Maecenas eu neque non dui tristique tincidunt nec cursus justo.
								</div>
							</div>
						</div>					
					</div>
					<!-- Saving Chart -->
					<div id="saving_chart" class="container tab-pane fade">
						<br>
						<h3>월별 저축현황</h3>
						<div id="graph" style="max-width: 70%;">
							<div>
								<canvas id="myChart_save"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- right section END-->
	</div>
</div>
<!-- Container End -->

<!-- Calendar -->
<script>
$('#calendar').fullCalendar({
	header : {
		left : 'prev,next today',
		center : 'title',
		right : 'month, basicWeek, basicDay'
	},
	defaultDate : new Date(),
	editable : false,
	allDay : true,
	eventLimit : true,
	events : function(start, end, timezone, callback) {
		$.ajax({
			url : "${pageContext.request.contextPath}/ajax/test.do",
			type : "get",
			dataType : "json",
			success : function(data) {
				console.log("load (CalData) success");
				var events = [];

				$(data).each(function() {
					var clue = $(this).attr('TYPE_NUM');
					switch (clue) {

					case 101:
						events.push({
							title : $(this).attr('COST'),
							start : $(this).attr('AC_DATE'),
							allDay : true,
							color : 'white',
							textColor : 'blue'
						});
						break;
					case 201:
						events.push({
							title : $(this).attr('COST'),
							start : $(this).attr('AC_DATE'),
							allDay : true,
							color : 'white',
							textColor : 'salmon'
						});
						break;
					}
				});
				callback(events);
			},
			error : function(jqxhr, textStatus, errorThrown){
				console.log("error");
				console.log(jqxhr);
				console.log(textStatus);
				console.log(errorThrown);
			}
		});
	}
});
</script>
<!-- Montly Pattern -->
<script>
var ctx1= $("#myChart_in");
var ctx2= $("#myChart_ex");

function drawDoughnut(){
	$.ajax({
		url:"${pageContext.request.contextPath}/ajax/selectInExPattern",
		type:"get",
		dataType:"json",
		success: function(d){
			console.log("load (ChartData_In_Ex_Pattern) success");
			var inLabels= []; //카테고리
			var inData= [];//돈
			var exLabels=[];
			var exData=[];
			$(d).each(function(){
				exLabels.push($(this).attr('CATE_NAME'));
				var clue = $(this).attr('CATE_NAME');
				
				switch(clue){
				case 'salary':
					inData.push($(this).attr('COST'));break;
				case 'pinmoney':
					inData.push($(this).attr('COST'));break;
				case 'inetc':
					inData.push($(this).attr('COST'));break;
				case 'eat':
					exData.push($(this).attr('COST'));break;
				case 'trans':
					exData.push($(this).attr('COST'));break;
				case 'joy':
					exData.push($(this).attr('COST'));break;
				case 'ness':
					exData.push($(this).attr('COST'));break;
				case 'cloth':
					exData.push($(this).attr('COST'));break;
				case 'beauty':
					exData.push($(this).attr('COST'));break;
				case 'health':
					exData.push($(this).attr('COST'));break;
				case 'edu':
					exData.push($(this).attr('COST'));break;
				case 'phone':
					exData.push($(this).attr('COST'));break;
				case 'famevent':
					exData.push($(this).attr('COST'));break;
				case 'utility':
					exData.push($(this).attr('COST'));break;
				case 'cardcost':
					exData.push($(this).attr('COST'));break;
				case 'saving':
					exData.push($(this).attr('COST'));break;
				case 'exetc':
					exData.push($(this).attr('COST'));break;
				};
								
			});
			
/* 					for(var i=0;i<addData.length;i++){
						addLabels.push($(d[i]).attr('CATE_NAME'));
					}; */
			var addLabels = inLabels;
			var addData = inData;
			var exLabels = exLabels;
			var exData = exData;
			var myDoughnut1 = new Chart(ctx1,{
				type: 'doughnut',
				data: {
					labels: ['월급','용돈','기타'],
					datasets:[{
						data: inData,
						label: "Type",
						backgroundColor:[
							'#2EB400',
							'#2BC8C9',
							'#666666',
						],
						hoverBackgroundColor: "rgba(75,192,192,1)",
/* 						borderColor: "rgba(75,192,192,1)", */
						borderWidth:2,
						
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
			        }
				}
			});
			var myDoughnut2 = new Chart(ctx2,{
				type: 'doughnut',
				data: {
					labels: exLabels,
					datasets:[{
						data: exData,
						backgroundColor:[
			              	"#949FB1",
			              	"#46BFBD",
			              	"#FDB45C",
			              	"#F7464A",
			              	"#4D5360",
							"#2EB400",
							"#2BC8C9",
							"#666666",
							"#4bb2c5",
							"#556439",
							"#FF8C00",
							"#F7464A",
			              	"#46BFBD",
			              	"#FDB45C",
						],
						hoverBackgroundColor: "rgba(75,192,192,1)",
/* 						borderColor: "rgba(75,192,192,1)", */
						borderWidth:2
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
/* 					title:{
						display:true,
						text:'ChartisDoughnut',
					}, */
				}
			});						
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("error");
			console.log(jqxhr);
			console.log(textStatus);
			console.log(errorThrown);
		}
	});
};
$(document).ready(function(){
	drawDoughnut();
});
</script>
<!-- <script>
var ctx = $("#myChart_inEx");
function drawDoughnut(){
	$.ajax({
		url:"${pageContext.request.contextPath}/ajax/selectInExPattern",
		type:"get",
		dataType:"json",
		success: function(d){
			console.log("load (ChartData_In_Ex_Pattern) success");
			console.log(d);
			var addLabels= []; //카테고리
			var addData= [];//돈
			$(d).each(function(){
				var clue = $(this).attr('CATE_NAME');
				switch(clue){
				case 'salary':
					addLabels.push($(this).attr('COST'));break;
				case 'pinmoney':
					addLabels.push($(this).attr('COST'));break;
				case 'inetc':
					addLabels.push($(this).attr('COST'));break;
				};				
			});
			var addLabels = addLabels;
			var addData = addData;
			var myDoughnut = new Chart(ctx,{
				type: 'doughnut',
				data: {
					datasets:[{
						data: addData,
						backgroundColor:[],
						label:"타입"
					}],
					labels: addLabels,
				},
				options:{
					responsive:true,
					legend:{
						position:top,
						},
					title:{
						display:true,
						text:'ChartisDoughnut',
					},
					animation:{
						animateScale:true,
						animateRotate:true
					}
				}
			});			
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("error");
			console.log(jqxhr);
			console.log(textStatus);
			console.log(errorThrown);
		}
	});
};
$(document).ready(function(){
	drawDoughnut();
});
</script> -->
<!-- Saving Chart -->
<script>
var ctx = $("#myChart_save");
function drawLine(){
	$.ajax({
		url : "${pageContext.request.contextPath}/ajax/selectSaving.do",
		type : "get",
		dataType : "json",
		success : function(d) {
			console.log("load (ChartData_Saving) success");			
			var addlabels=[];
			var adddata=[];
			$(d).each(function(){			
				addlabels.push($(this).attr('AC_MONTH'));
				adddata.push($(this).attr('SAVING'));
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
