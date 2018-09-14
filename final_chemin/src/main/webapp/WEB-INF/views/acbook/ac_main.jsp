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
<!-- ProgressBar: ac_inputIn -->
<link rel="stylesheet" 	href="<c:url value= "/resources/acbook/css/acMain.css?var4"/>">
<!-- Main Start -->
<div class="col-md-10 col-sm-8 main-content">

	<!-- 여기서부터입력 -->
<!------ Include the above in your HEAD tag ---------->
<div class="container-fluid" id="newMain">
<br><br>
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
					<div class="acTop1" id="yesan">
						<p class="font1">Budget</p><hr>
						<h2 class="timer count-title count-number" data-to="${list[0].ALLCOST}" data-speed="2500"></h2>
					</div>
				</div>
				<div class="col-md-3">
					<div class="acTop1" id="income">
						<p class="font1">Income</p><hr> 
						<h2 class="timer count-title count-number" data-to="${list[0].ALLCOST}" data-speed="2000">$</h2>
					</div>
				</div>
				<div class="col-md-3">
					<div class="acTop1" id="dispenditure">
						<p class="font1">Expenditure</p><hr> 
						<h2 class="timer count-title count-number" data-to="${list[1].ALLCOST }" data-speed="1500">$</h2>
					</div>
				</div>

				<div class="col-md-3">
					<div class="acTop1" id="settings">
						<p class="font1">Settings</p><hr> 
						<h2 class="timer count-title count-number" data-to="${lastDay }" data-speed="1000">$</h2>
					</div>
<!-- 					<script>
					var a = ${list[0].ALLCOST}/${lastDay}
					return a;
					</script> -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-9">
					<div class="row">
						<div class="col-md-8">
							<div class="aclayout" id="acid">
								<div class="card-img">
						 			<canvas id="dailyExChart" style="max-width:100%;padding:1%;"></canvas>
								</div>
								<div class="card-desc">
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="aclayout" id="acid" >
								<div class="canvas_container"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="aclayout" id="acid">
						<div class="card-img">
							<canvas id="gradeSearch"></canvas>
						</div>
						<div class="card-desc">
							<h4>연간소비등급</h4><hr>
							<h6><span style="color:black;font-weight:bold">${memberLoggedIn.userId}</span>님의 소비등급은<br>
							현재 <span class="grades" style="color:red;font-weight:bold;"></span>등급으로
							<span class="acCons" style="font-weight:bold;"></span> 단계예요.<br>
							<span class="acDetails"></span>				
							</h6>
		
						</div>			
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="aclayout" id="acid">
							<canvas id="cateLank" style="width:100%;height:100%;"></canvas>
					</div>
				</div>
				<div class="col-md-3">
					<div class="aclayout" id="acid">
							<canvas id="horizentals" style="width:100%;height:100%;"></canvas>
					</div>
				</div>
				<div class="col-md-3">
					<div class="aclayout" id="acid">
						<div class="card-img">
	                        <img src="https://placeimg.com/380/230/animals" alt="">
	                    </div>
						<div class="card-desc">
							<h3>${memberLoggedIn.userId }님</h3>자산관리 확인<br><br><br>
							<a href="#" class="btn-card" >search my dp</a>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<!-- 타임라인 -->
  <div class="aclayout" id="timeline">
            <ul class="timeline" style="margin:0%;">
            <li class="event" data-date="2015/Present">
              <h6>18-09-03 12:00:25</h6>
              <h6>18000원: 노랑통닭 모란점</h6>
            </li>
           <li class="event" data-date="2015/Present">
              <h6>18-09-03 12:00:25</h6>
              <h6>18000원: 노랑통닭 모란점</h6>
            </li>
            <li class="event" data-date="2015/Present">
              <h6>18-09-03 12:00:25</h6>
              <h6>18000원: 노랑통닭 모란점</h6>
            </li>
  </div>
					<!-- 타임라인 -->
				</div>
			</div>
		</div>
	</div>
</div>

	<!-- 여기서그만 -->
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
var ctx1 = $("#gradeSearch");

function drawDoughnut() {
	$.ajax({
			url : "${pageContext.request.contextPath}/ajax/selectExGrade",
			type : "get",
			dataType : "json",
			success : function(d) {
				console.log("load (VSData) success");
				var vsLabels = [];//TYPENUM
				var vsData = [];//VSCOST
				var acGrade = "";
				var acCons="";
				var acDetails = "";
				$(d).each(function() {
					vsLabels.push($(this).attr('TYPENUM'));
					vsData.push($(this).attr('VSCOST'));
					var clue = $(this).attr('TYPENUM');
					switch (clue) {
					case '101':
						vsData.push($(this).attr('VSCOST'));
						break;
					case '201':
						vsData.push($(this).attr('VSCOST'));
						break;
					};
				});
				console.log(vsData[0]/vsData[1]);
				
				if(vsData[0]/vsData[1]>1.5){
					console.log("1등급")
					acGrade = "1"
					acCons = "최상"
					acDetails = "훌륭한 소비습관입니다!"
				}else if(vsData[0]/vsData[1]>1){
					console.log("2등급")
					acGrade = "2"
					acCons = "안심"
					acDetails = "1등급이 멀지 않았어요!"
				}else if(vsData[0]/vsData[1]>0.5){
					console.log("3등급")
					acGrade = "3"
					acCons = "걱정"
					acDetails = "현명한 소비습관이 필요합니다."
				}else if(vsData[0]/vsData[1]>0){
					console.log("4등급")
					acGrade = "4"
					acCons = "심각"
					acDetails = "더이상의 지출은 No!"
				}else{
					console.log("5등급")
					acGrade = "5"
					acCons = "재정파탄"
					acDetails = "아이고..."
				}
				
				var htmlG=$(".grades").html();
				$(".grades").html(htmlG+acGrade).show();
				
				var htmlC=$(".acCons").html();
				$(".acCons").html(htmlC+acCons).show();			

				var htmlD=$(".acDetails").html();
				$(".acDetails").html(htmlD+acDetails).show();		
				
	var myDoughnut1 = new Chart(
			ctx1,
			{
				type : 'doughnut',
				data : {
						labels: ["수입","지출"],	
						datasets : [ {
							data : vsData,
							backgroundColor : [ 'rgba(75,192,192,1)',
												'#e83e8c', ],
							hoverBackgroundColor : "rgba(75,192,192,1)",
							borderWidth : 0.5,
						} ]
						},
						options : {
						cutoutPercentage: 70,
						rotation: 1 * Math.PI,
						circumference: 1 * Math.PI,
						elements: {
							center: {
								text: acGrade,
						      	color: '#FF6384', 
						     	fontStyle: 'Arial',
						     	fontSize:20,
						      	sidePadding: 10,
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
	drawDoughnut();
});


</script>

<script>
var ctx = $("#dailyExChart");
function drawLine(){
	$.ajax({
		url : "${pageContext.request.contextPath}/ajax/selectDailySum.do",
		type : "get",
		dataType : "json",
		success : function(d) {
			console.log("load (ChartData_sum(plus)) success");
			console.log(d);
			
			var addlabels=[];
			var adddata=[];
			$(d).each(function(){			
				addlabels.push($(this).attr('ACDATE'));
				adddata.push($(this).attr('CUMAL_SUM'));
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
						label: "일별 누적 지출",
						backgroundColor: "rgba(75,192,0,4)",
						borderColor: "rgba(75,192,192,1)",
						borderCapStyle: "butt",
						borderDash: [],
						borderWidth:1,
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
					title:{
						display: true,
						text:'Daily Cumulative Dispenditure',
						fontSize: 17,
					},
					responsive:true,
			        legend: {
			            display: false,
			            fontSize: 10,
		            	position: 'bottom',
			            usePointStyle: true,
			            labels: false,
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

<script>
var ctxs1 = $("#cateLank");

function drawDoughnut2() {

	$.ajax({
		url : "${pageContext.request.contextPath}/ajax/monthlyExpenditure",
		type : "get",
		dataType : "json",
		success : function(d) {
			console.log("load (VSData) success");
			var vsLabels = [];//CATENAME
			var vsData = [];//CATESUM
			var acGrade = "";
			$(d).each(function() {
				vsLabels.push($(this).attr('CATENAME'));
				var clue = $(this).attr('CATENAME');
				switch (clue) {
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
				case '의료/건강':
					vsData.push($(this).attr('CATESUM'));
					break;
				case '휴대폰요금':
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
				}
			});
	var myDoughnut12 = new Chart(
			ctxs1,
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
											"rgb(160,171,188)",
											"rgba(75,192,192,1)",
											"rgb(160,171,188)",
											"rgba(75,192,192,1)",
											"rgb(160,171,188)",
											"rgba(75,192,192,1)",
											"rgb(160,171,188)",
											"rgba(75,192,192,1)",
											"rgb(160,171,188)"
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
							text: vsLabels[0],
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
				}//옵션
			})//씨알티
		}
	})

};
$(document).ready(function() {
	drawDoughnut2();
});
</script>

<script>

var ctxHo = $("#horizentals");

function drawHo(){
	
	var horizentals = new Chart(
			ctxHo,
			{
				type: 'horizontalBar',
			    data: { 
			    	labels: [
			        "노랑통닭",
			        "네네치킨",
			        "편의점털기",
			        "데일리먼데이",
			        "준구동물병원",
			        "교촌치킨",
			        "저축"
				    ],
				    datasets: [
				        {
/* 				            label:[
				            	
						        ], */

				            data: [100300,75020,83300,10280,53800,22200,44500],
				            backgroundColor: ["#669911","#119966","#F94C45","rgb(252,217,32)","rgb(171,209,26)",
								"rgb(160,171,188)","rgba(75,192,192,1)"],
				            hoverBackgroundColor: ["#66A2EB", "#FCCE56","#F94C45","rgb(252,217,32)","rgb(171,209,26)",
				            	"rgb(160,171,188)","rgba(75,192,192,1)"]
				        }]
				},
			    options: {
			        scales: {
			            xAxes: [{
			                ticks: {
			                	min: 60,
			                	max:100300,
			                	beginAtZero: true,
			                },
			                gridLines: {
			                    display: true,
			                    color: "lightgray"
			                 }
			            }],
			            yAxes: [{
			                stacked: true,
                            display: false,
                            gridLines: {
                            	display:true,
                            	color:"lightgray",
                            	borderDash: [2, 5],
                            	borderTention:1
                              },
			                }]
			        },
			        title:{
						display: true,
						position:'top',
						text:'memo lanking',
						fontSize: 15,
						},
					responsive : true,
					legend : {
						display : false,
						fontSize : 5,
						position : 'bottom',
						usePointStyle : true,
						labels: {
							display:false,
							fontSize:5,
			            	boxWidth: 10,
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

};
$(document).ready(function() {
	drawHo();
});
</script>

<script>
function DataObject(data) {
	  this.data = data;
	}

	DataObject.prototype.randomizeData = function() {
	  let dataLength = this.data.length;
	  
	  for(let n = 0; n < dataLength; n++) {
	    this.data[n] = Math.ceil((Math.random() * 20));
	  }
	}


	function chartUpdate(chart, dataObjects) {
	  dataObjects.forEach(function(dataObject) {
	    dataObject.randomizeData();
	  });

	  chart.update();
	}


	const canvas = document.createElement('canvas'),
	      canvasContainer = document.getElementsByClassName('canvas_container')[0];

	canvas.setAttribute('height', 400);
	canvas.setAttribute('width', 400);
	canvasContainer.appendChild(canvas);

	let ctxp = canvas.getContext('2d');
	    
	let dataObject1 = new DataObject([10, 5, 10, 20, 15]);


	let chartSettings = {
	  type: 'polarArea',
	  data: {
	    labels: ["0", "1", "2", "3", "4"],
	    datasets: [
	      {
	        backgroundColor: ['rgba(255, 159, 64, 0.7)',
	                          'rgba(255, 99, 132, 0.7)',
	                          'rgba(75, 192, 192, 0.7)',
	                          'rgba(255, 205, 86, 0.7)',
	                          'rgba(54, 162, 235, 0.7)'],
	        borderColor: ['#FF9F40',
	                      '#FF6384',
	                      '#4BC0C0',
	                      '#FFCD56',
	                      '#36A2EB'],
	        borderWidth: 1,
	        data: dataObject1.data,
	        hoverBackgroundColor: ['#FF9F40',
	                               '#FF6384',
	                               '#4BC0C0',
	                               '#FFCD56',
	                               '#36A2EB'],
	        label: 'Label - example1'
	      }
	    ]
	  },
	  options: {
	    startAngle: (Math.PI * -1),
	    legend:{
	    	labels:{boxWidth:10}
	    },
	    animation: {
            duration: 3000,
        },
        hover: {
            animationDuration: 1000,
        },
        responsiveAnimationDuration: 2000,
	  }
	};

	let chart = new Chart(ctxp, chartSettings);

	setInterval(function() {
	 chartUpdate(chart, [dataObject1])
	}, 3000);
</script>
<!-- Counter -->
<script src="<c:url value="/resources/acbook/js/counter.js" />"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />