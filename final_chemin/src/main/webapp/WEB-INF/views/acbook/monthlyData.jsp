<%@ page language="java" contentType="text/html; charset=UTF-8"	import="java.util.*" pageEncoding="UTF-8"%>
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
<link rel="stylesheet"	href="<c:url value= "/resources/vendor/bootstrap/css/bootstrap.css"/>">
<link rel="stylesheet"	href="<c:url value= "/resources/acbook/css/monthlyData.css?var9"/>">
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
<!-- <div class="container-fluid"><span style="font-size:60px;margin-top:0;">Monthly Expenditure Pattern</span></div> -->
<div class="col-md-6">
<div class="printDiv">
	<div class="content" id="newMain">             
       	<div class="about-content-box">
		 <div class="comparison">
		  <table>
		    <thead>
		      <tr>
		        <th class="product" style="background:#69C7F1; border-top-left-radius: 5px; border-left:0px;">2018</th>
		        <th class="product" style="background:#69C7F1; border-top-left-radius: 5px; border-left:0px;">Jul.</th>
		        <th class="product" style="background:#69C7F1;">Aug.</th>
		        <th class="product" style="border-top-right-radius: 5px; border-right:0px; background:#69C7F1;">Sept.</th>
		      </tr>
		      <tr>
		        <th>
		        	<div class="printBtnZone" align="right" >
				        <a id="btnDown"><img src="${path}/resources/acbook/images/201_13.png" style="width:80px;text-align:left">.</a>
				    </div>
		        </th>
		        <th class="price-info">
		          <div class="price-now"><span>${prePreMonthlySumAvg[0].ALLCOST}</span><br>
		            <p>${prePreMonthlySumAvg[0].AVGCOST}원/ day</p>
		          </div>
		        </th>
		        <th class="price-info">
		          <div class="price-now"><span>${preMonthlySumAvg[0].ALLCOST}</span><br>
		            <p>${preMonthlySumAvg[0].AVGCOST}원/ day</p>
		          </div>
		        </th>
		        <th class="price-info">
		          <div class="price-now"><span>${monthlySumAvg[0].ALLCOST}</span><br>
		            <p>${monthlySumAvg[0].AVGCOST}원/ day</p>
		          </div>
		        </th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		        <td></td>
		        <td colspan="3">item_1</td>
		      </tr>
		      <tr class="compare-row">
		        <td style="width:50px">식비</td>
		        <td>
					<c:forEach items="${prePreMonthlyData}" var ="pp">
		        		<c:if test="${pp.CATENAME eq '식비'}">${pp.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
		        	<c:forEach items="${preMonthlyData}" var ="p">
		        		<c:if test="${p.CATENAME eq '식비'}">${p.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
			        <c:forEach items="${monthlyExpenditure}" var="m">        		
				        <c:if test="${m.CATENAME eq '식비'}">${m.CATESUM }</c:if>			        
			        </c:forEach>
		        </td>
		      </tr>
		      <tr>
		        <td></td>
		      </tr>
		      <tr>
		        <td>교통비</td>
		        <td>
					<c:forEach items="${prePreMonthlyData}" var ="pp">
		        		<c:if test="${pp.CATENAME eq '교통비'}">${pp.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
		        	<c:forEach items="${preMonthlyData}" var ="p">
		        		<c:if test="${p.CATENAME eq '교통비' }">${p.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
			        <c:forEach items="${monthlyExpenditure}" var="m" varStatus="status">        		
				        <c:if test="${m.CATENAME eq '교통비'}">${m.CATESUM }</c:if>			        
			        </c:forEach>
		        </td>
		      </tr>
		      <tr>
		        <td></td>
		      </tr>
		      <tr class="compare-row">
		        <td>문화생활</td>
		        <td>
					<c:forEach items="${prePreMonthlyData}" var ="pp">
		        		<c:if test="${pp.CATENAME eq '문화생활'}">${pp.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
		        	<c:forEach items="${preMonthlyData}" var ="p">
		        		<c:if test="${p.CATENAME eq '문화생활'}">${p.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
		        	<c:forEach items="${monthlyExpenditure}" var="m" varStatus="status">        		
				        <c:if test="${m.CATENAME eq '문화생활'}">${m.CATESUM }</c:if>			        
			        </c:forEach>
		        </td>
		      </tr>
		      <tr>
		        <td></td>
		      </tr>
		      <tr>
		        <td>생필품</td>
		        <td>
					<c:forEach items="${prePreMonthlyData}" var ="pp">
		        		<c:if test="${pp.CATENAME eq '생필품'}">${pp.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
		        	<c:forEach items="${preMonthlyData}" var ="p">
		        		<c:if test="${p.CATENAME eq '생필품'}">${p.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
			        <c:forEach items="${monthlyExpenditure}" var="m" varStatus="status">        		
				        <c:if test="${m.CATENAME eq '생필품'}">${m.CATESUM }</c:if>			        
			        </c:forEach>
		        </td>
		      </tr>
		      <tr>
		        <td></td>
		      </tr>
		      <tr class="compare-row">
		        <td>의류</td>
		        <td>
					<c:forEach items="${prePreMonthlyData}" var ="pp">
		        		<c:if test="${pp.CATENAME eq '의류'}">${pp.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
		        	<c:forEach items="${preMonthlyData}" var ="p">
		        		<c:if test="${p.CATENAME eq '의류'}">${p.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
			        <c:forEach items="${monthlyExpenditure}" var="m" varStatus="status">        		
				        <c:if test="${m.CATENAME eq '의류'}">${m.CATESUM }</c:if>			        
			        </c:forEach>
		        </td>
		      </tr>
		      <tr>
		        <td></td>
		      </tr>
		      <tr>
		        <td>미용</td>
	 	       <td>
					<c:forEach items="${prePreMonthlyData}" var ="pp">
		        		<c:if test="${pp.CATENAME eq '미용'}">${pp.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
		        	<c:forEach items="${preMonthlyData}" var ="p">
		        		<c:if test="${p.CATENAME eq '미용'}">${p.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
			        <c:forEach items="${monthlyExpenditure}" var="m" varStatus="status">        		
				        <c:if test="${m.CATENAME eq '미용'}">${m.CATESUM }</c:if>			        
			        </c:forEach>
		        </td>
		      </tr>
		      <tr>
		        <td></td>
		      </tr>
		      <tr class="compare-row">
		        <td>의료/건강</td>
	 	       <td>
					<c:forEach items="${prePreMonthlyData}" var ="pp">
		        		<c:if test="${pp.CATENAME eq '의료/건강'}">${pp.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
		        	<c:forEach items="${preMonthlyData}" var ="p">
		        		<c:if test="${p.CATENAME eq '의료/건강'}">${p.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
			        <c:forEach items="${monthlyExpenditure}" var="m" varStatus="status">        		
				        <c:if test="${m.CATENAME eq '의료/건강'}">${m.CATESUM }</c:if>			        
			        </c:forEach>
		        </td>
		      </tr>
		      <tr>
		        <td></td>
		      </tr>
		      <tr>
		        <td>교육</td>
	 	       <td>
					<c:forEach items="${prePreMonthlyData}" var ="pp">
		        		<c:if test="${pp.CATENAME eq '교육'}">${pp.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
		        	<c:forEach items="${preMonthlyData}" var ="p">
		        		<c:if test="${p.CATENAME eq '교육'}">${p.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		       	<td>
			       	<c:forEach items="${monthlyExpenditure}" var="m" varStatus="status">        		
				        <c:if test="${m.CATENAME eq '교육'}">${m.CATESUM }</c:if>			        
			        </c:forEach>
		       	</td>
		      </tr>
		      <tr>
		        <td></td>
		      </tr>
		      <tr class="compare-row">
		        <td>전화요금</td>
	 	        <td>
					<c:forEach items="${prePreMonthlyData}" var ="pp">
		        		<c:if test="${pp.CATENAME eq '휴대폰요금'}">${pp.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
		        	<c:forEach items="${preMonthlyData}" var ="p">
		        		<c:if test="${p.CATENAME eq '휴대폰요금'}">${p.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
			        <c:forEach items="${monthlyExpenditure}" var="m" varStatus="status">        		
				        <c:if test="${m.CATENAME eq '휴대폰요금'}">${m.CATESUM }</c:if>			        
			        </c:forEach>
		        </td>
		      </tr>
		      <tr>
		        <td></td>
		      </tr>
		      <tr>
		        <td>경조사</td>
	 	        <td>
					<c:forEach items="${prePreMonthlyData}" var ="pp">
		        		<c:if test="${pp.CATENAME eq '경조사비'}">${pp.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
		        	<c:forEach items="${preMonthlyData}" var ="p">
		        		<c:if test="${p.CATENAME eq '경조사비'}">${p.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
			        <c:forEach items="${monthlyExpenditure}" var="m" varStatus="status">        		
				        <c:if test="${m.CATENAME eq '경조사비'}">${m.CATESUM }</c:if>			        
			        </c:forEach>
		        </td>
		      </tr>
		      <tr>
		        <td></td>
		      </tr>
		      <tr class="compare-row">
		        <td>공과금</td>
	 	        <td>
					<c:forEach items="${prePreMonthlyData}" var ="pp">
		        		<c:if test="${pp.CATENAME eq '공과금'}">${pp.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
		        	<c:forEach items="${preMonthlyData}" var ="p">
		        		<c:if test="${p.CATENAME eq '공과금'}">${p.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
			        <c:forEach items="${monthlyExpenditure}" var="m" varStatus="status">        		
				        <c:if test="${m.CATENAME eq '공과금'}">${m.CATESUM }</c:if>			        
			        </c:forEach>
		        </td>
		      </tr>
		      <tr>
		        <td></td>
		      </tr>
		      <tr>
		        <td>카드대금</td>
	 	        <td>
					<c:forEach items="${prePreMonthlyData}" var ="pp">
		        		<c:if test="${pp.CATENAME eq '카드대금'}">${pp.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
		        	<c:forEach items="${preMonthlyData}" var ="p">
		        		<c:if test="${p.CATENAME eq '카드대금'}">${p.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
			        <c:forEach items="${monthlyExpenditure}" var="m" varStatus="status">        		
				        <c:if test="${m.CATENAME eq '카드대금'}">${m.CATESUM }</c:if>			        
			        </c:forEach>
		        </td>
		      </tr>
		      <tr>
		        <td></td>
		      </tr>
		      <tr class="compare-row">
		        <td>저축</td>
	 	        <td>
					<c:forEach items="${prePreMonthlyData}" var ="pp">
		        		<c:if test="${pp.CATENAME eq '카드대금'}">${pp.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
		        	<c:forEach items="${preMonthlyData}" var ="p">
		        		<c:if test="${p.CATENAME eq '카드대금'}">${p.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
			        <c:forEach items="${monthlyExpenditure}" var="m" varStatus="status">        		
				        <c:if test="${m.CATENAME eq '저축'}">${m.CATESUM }</c:if>			        
			        </c:forEach>
		        </td>
		      </tr>
		      <tr>
		        <td></td>
		      </tr>
		      <tr>
		        <td>기타</td>
	 	        <td>
					<c:forEach items="${prePreMonthlyData}" var ="pp">
		        		<c:if test="${pp.CATENAME eq '기타'}">${pp.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		        <td>
		        	<c:forEach items="${preMonthlyData}" var ="p">
		        		<c:if test="${p.CATENAME eq '기타'}">${p.CATESUM }</c:if>
		        	</c:forEach>
		        </td>
		       	<td>
			       	<c:forEach items="${monthlyExpenditure}" var="m" varStatus="status">        		
				        <c:if test="${m.CATENAME eq '기타'}">${m.CATESUM }</c:if>			        
			        </c:forEach>
		       	</td>
		      </tr>
		      <tr>
		        <td></td>
		      </tr>
		    </tbody>
		  </table>				
		</div>	   
	</div>			 
   </div> 
</div>
</div>
<form name="imgForm" id="imgForm" action="acbook/download.do" method="post">
    <input type="hidden" id="imgData" name="imgData">
</form>
<div class="col-md-6">
<!--***************** 	여기서부터 내용 쓰면 됨 -->
		<div class='' id="graph1">
			<%-- <div id='ex2'>
				<canvas id="myChart_in"></canvas>
			</div> --%>
			<div id="graph" style="max-width: 100%;margin:0%;padding:0;">
				<div>
					<canvas id="myChart_save"></canvas>
				</div>
			</div>
		</div>
	<hr style="margin:0;">
		<div class="row">
		<div class='' id="graph2_2">
			<div id='ex23' style="text-align:left">
				<div><span style="font-size:45px;margin:0;background-color:Coral;color:white;">Monthly Expenditure Pattern,&nbsp;</span></div>
				&nbsp;&nbsp;<p>${memberLoggedIn.userId }님 의 이번달 지출은 현재까지 ${monthlySumAvg[0].ALLCOST}원 입니다.<br>
				수입은 ""원 이며, "이미 지출한계를 초과했습니다." 앞으로  매일 "0"원씩 사용해야 지출임계점을 넘지 않을 수 있습니다.<br>
				"그러나", 지출비율중 "저축"의 비율이 "60%"로 "매우 높은 편입니다." 저축하는 좋은 습관을 기르고 있습니다.<br>
				저번달 대비 "35,800"원을 더 지출하였으며 일평균 지출은 "3,560"원 더 높습니다.<br></p>
				"21~24"시 사이에 가장 빈번한 지출이 이루어 지고 있습니다. 이 시간대는 주로 "식비"로 많이 지출합니다.<br>
				혹시 "노랑통닭"을 주문하시나요? 오늘은 한 번 쉬어가는것을 권유드립니다.<br>
				이번달은 "13"일에 가장 많은 지출이 이루어졌습니다. 지출한 항목은 "저축"입니다.<br>
				현재 플레리북의 소비등급은 "2"등급입니다. 전달대비 "1"등급 순위 "상승"이 있었습니다. "대단합니다. 룰륭한 소비습관으로 나아가고 있습니다."<br>
				도표 왼쪽 상단의 꿀이를 눌러주세요. 지표가 저장됩니다. 저장된 파일을 결산커뮤니티에 올려 친구들과 공유해보세요.<br>
				
			</div>
		</div>
		</div>
	<!--**************Caution*********************** 이 아래 Div 건드리지말것 -->
</div>
<!-- END: WHOLE TEMPLATE SECTION -->
</div>
</div>
<!-- Main End -->
</div>
</div>
<!-- Side Bar Div End -->
<script>
    $(function(){
        /** btnDown 버튼 클릭 **/
        $('#btnDown').click(function() {
            html2canvas($('.printDiv'), {
                onrendered: function(canvas) {
                    if (typeof FlashCanvas != "undefined") {
                        FlashCanvas.initElement(canvas);
                    }
                    var image = canvas.toDataURL("image/png"); 
                    $("#imgData").val(image);
                    $("#imgForm").submit();
                }
            });
        });
    });
</script>
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
			var addData1=[];
			$(d.model.list1).each(function(){
				addlabels.push($(this).attr('ACDATE'));
				addData1.push($(this).attr('CUMAL_SUM'));
			});	
			var addData2=[];
			$(d.model.list2).each(function(){
				addlabels.push($(this).attr('ACDATE'));
				addData2.push($(this).attr('CUMAL_SUM'));
			});
			var addData3=[];
			$(d.model.list3).each(function(){
				addlabels.push($(this).attr('ACDATE'));
				addData3.push($(this).attr('CUMAL_SUM'));
			});	
			var addlabels= addlabels;
			var addData1 = addData1;
			var addData2 = addData2;
			var addData3 = addData3;
			var myLine = new Chart(ctx,{
				type : 'line',
				data :{
					labels : [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31],
					 datasets: [
					        {
					            label: "My First dataset",
					            fillColor: "#ffc107",
					            strokeColor: "#ffc107",
					            pointColor: "#ffc107",
					            pointStrokeColor: "#ffc107",
					            pointHighlightFill: "#ffc107",
					            pointHighlightStroke: "#ffc107",
					            data: addData1
					        },
					        {
					            label: "My Second dataset",
					            fillColor: "rgba(151,187,205,0.2)",
					            strokeColor: "rgba(151,187,205,1)",
					            pointColor: "rgba(151,187,205,1)",
					            pointStrokeColor: "#fff",
					            pointHighlightFill: "#fff",
					            pointHighlightStroke: "rgba(151,187,205,1)",
					            data: addData2
					        },
					        {
					            label: "My Second dataset",
					            fillColor: "rgba(151,187,205,0.2)",
					            strokeColor: "rgba(151,187,205,1)",
					            pointColor: "rgba(151,187,205,1)",
					            pointStrokeColor: "#fff",
					            pointHighlightFill: "#fff",
					            pointHighlightStroke: "rgba(151,187,205,1)",
					            data: addData3
					        }
					    ]
				},
				options: {
					responsive:true,
			        legend: {
			            display: false,
			            fontSize: 10,
		            	position: 'bottom',
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
<!-- <script>
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
	
var ctx = $("#myChart_ex");

function drawDoughnut2() {
	$.ajax({
		url :  "${pageContext.request.contextPath}/ajax/monthlyExpenditure",
		type : "get",
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
</script> -->
<!-- jpg modify -->
<script src="<c:url value="/resources/acbook/js/html2canvas.js" />"></script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />