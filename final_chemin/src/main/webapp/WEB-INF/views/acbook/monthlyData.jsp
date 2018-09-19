<%@ page language="java" contentType="text/html; charset=UTF-8"   import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!-- chart -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<script   src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<!-- jQurery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- BootStrap -->
<link rel="stylesheet"   href="<c:url value= "/resources/vendor/bootstrap/css/bootstrap.css"/>">
<link rel="stylesheet"   href="<c:url value= "/resources/acbook/css/monthlyData.css?var9"/>">
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- sideBar -->
<jsp:include page="/WEB-INF/views/acbook/sideBar.jsp" />
<!-- Main Start -->
<div class="col-md-10 col-sm-8 main-content"  id="newMain">
<br><br>
   <div class="container-fluid">
<!--    여기서부터 내용 쓰면 됨 -->
<!-- START: WHOLE TEMPLATE SECTION -->
<!------ Include the above in your HEAD tag ---------->
<!-- <div class="container-fluid"><span style="font-size:60px;margin-top:0;">Monthly Expenditure Pattern</span></div> -->
<style>
html { font-size: 60.5%; } 
body { font-size: 1em;} 

@media (max-width: 300px) { 
    html { font-size: 70%; } 
} 

@media (min-width: 500px) { 
    html { font-size: 80%; } 
} 

@media (min-width: 700px) { 
    html { font-size: 80%; } 
} 

@media (min-width: 1200px) { 
    html { font-size: 100%; } 
}
</style>
<form name="imgForm" id="imgForm" action="acbook/download.do" method="post">
    <input type="hidden" id="imgData" name="imgData">
</form>
<div class="row">
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
                 <c:forEach items="${thisMonthlyData}" var="m">              
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
                 <c:forEach items="${thisMonthlyData}" var="m" varStatus="status">              
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
                 <c:forEach items="${thisMonthlyData}" var="m" varStatus="status">              
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
                 <c:forEach items="${thisMonthlyData}" var="m" varStatus="status">              
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
                 <c:forEach items="${thisMonthlyData}" var="m" varStatus="status">              
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
                 <c:forEach items="${thisMonthlyData}" var="m" varStatus="status">              
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
                 <c:forEach items="${thisMonthlyData}" var="m" varStatus="status">              
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
                   <c:forEach items="${thisMonthlyData}" var="m" varStatus="status">              
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
                 <c:forEach items="${thisMonthlyData}" var="m" varStatus="status">              
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
                 <c:forEach items="${thisMonthlyData}" var="m" varStatus="status">              
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
                 <c:forEach items="${thisMonthlyData}" var="m" varStatus="status">              
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
                 <c:forEach items="${thisMonthlyData}" var="m" varStatus="status">              
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
                    <c:if test="${pp.CATENAME eq '저축'}">${pp.CATESUM }</c:if>
                 </c:forEach>
              </td>
              <td>
                 <c:forEach items="${preMonthlyData}" var ="p">
                    <c:if test="${p.CATENAME eq '저축'}">${p.CATESUM }</c:if>
                 </c:forEach>
              </td>
              <td>
                 <c:forEach items="${thisMonthlyData}" var="m" varStatus="status">              
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
                   <c:forEach items="${thisMonthlyData}" var="m" varStatus="status">              
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
<div class="col-md-6">
<!--*****************    여기서부터 내용 쓰면 됨 -->
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
      <div class='' id="graph2_2">
         <div id='ex23' style="text-align:left;font-size:12px;">
            <div style="margin:0;background-color:Coral;text-align:center"><span style="font-size:20px;margin:0;color:white;">Monthly Expenditure Pattern,&nbsp;</span></div>
            &nbsp;<span style="color:blue;">${memberLoggedIn.userId }</span>님의
            이번 달 수입은  <span style="color:blue;">${inexCost[0].ALLCOST}원</span>이며,
            지출은 <span style="color:blue;">${inexCost[1].ALLCOST }원</span>입니다.
            이전 달의 일 평균 지출 비용은<span style="color:blue;" class="preSum"></span>원 이었으며,
            이번 달 일 평균 지출 비용은<span style="color:blue;" class="daySum"></span>원 입니다.
            이번 달 일수는<span style="color:blue;">${lastDay }</span>일 까지 있으므로,
            매일 <span style="color:blue;"class='nmg'></span>원 씩 사용해야 수입 대비 지출임계점을 넘지 않을 수 있겠죠?<br>
            &nbsp;이번달 지출비용 1순위는 <span style="color:blue;">${thisMonthlyData[0].CATENAME}</span>(이)가 차지했어요.
            현재 총 <span style="color:blue;">${thisMonthlyData[0].CATESUM }원</span>을 
            <span style="color:blue;">${thisMonthlyData[0].CATENAME}</span>에 소비했습니다.<br>
            &nbsp;두 번째로 많이 소비한 항목은 <span style="color:blue;">${thisMonthlyData[1].CATENAME}</span>입니다. 현재 총
            <span style="color:blue;">${thisMonthlyData[1].CATESUM }원</span>을 
            <span style="color:blue;">${thisMonthlyData[1].CATENAME}</span>에 소비했군요.<br>
            &nbsp;이번 달의 수입에서 현재 지출을 제하고 나면 <span style="color:blue;" class="cha"></span>원이 남습니다.<br>
            &nbsp;지출을 많이 한 시간대를 찾아볼까요? <span style="color:blue;" class="monTime"></span>시 입니다! 해당 전후 한 시간동안 사용한 금액은 총
            <span style="color:blue;" class="monTimeM"></span>원 입니다..대단해요..!<br>
            혹시 <span style="color:blue;" class="memo1"></span>에 소비하셨나요?
            아니면.. 혹시 <span style="color:blue;" class="memo2"></span>에 소비하셨나요? 해당 시간대를 참고하시어 지출을 줄여봅시다.<br>
            &nbsp;가장 많은 금액을 소비한 날짜는 <span style="color:blue;" class="monDay"></span>일 입니다.
            이 날 하루동안 소비한 금액은<span style="color:blue;" class="monDayC"></span>원 입니다. 이 날 무슨 일이 일어났던걸까요? 많이 소비하는 시간과 날짜를 체크해보면,
            나의 소비 패턴을 더 확실히 잡아줄 수 있을지 몰라요!<br>
            꾸준한 플레리북 사용은 합리적인 소비를 도와줄 수 있습니다. 매일 매일의 사소한 체크습관이 <span style="color:blue;"> ${memberLoggedIn.userId }</span>님의 소비등급을 올립니다.<br>
            도표 왼쪽 상단의 꿀이를 눌러주세요. 지표가 저장됩니다. 안심하세요! 민감한 수입은 제외된 지표가 저장된답니다:) 저장된 파일을 결산커뮤니티에 올려 친구들과 공유해보세요.<br>
            
         </div>
      </div>
   </div>
   <!--**************Caution*********************** 이 아래 Div 건드리지말것 -->
</div>
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
         
         
         
         var myColors = ["rgba(220,220,220,0.2)"]
         var myLine = new Chart(ctx,{
            type : 'line',
            title : '누적건수',
            data :{
                labels : [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50],
                datasets: [
                       {
                           label: "이번달",
                           fillColor: "rgba(220,220,220,0.2)",
                           borderColor: myColors,
                           strokeColor: "rgba(220,220,220,0.2)",
                           pointColor: "rgba(220,220,220,0.2)",
                           pointStrokeColor: "rgba(220,220,220,0.2)",
                           pointHighlightFill: "rgba(220,220,220,0.2)",
                           pointHighlightStroke: "rgba(220,220,220,0.2)",
                           data: addData1
                       },
                       {
                           label: "전달",
                           fillColor: "rgba(151,187,205,0.2)",
                           strokeColor: "rgba(151,187,205,1)",
                           pointColor: "rgba(151,187,205,1)",
                           pointStrokeColor: "#fff",
                           pointHighlightFill: "#fff",
                           pointHighlightStroke: "rgba(151,187,205,1)",
                           data: addData2
                       },
                       {
                           label: "전전달",
                           fillColor: "rgba(220,220,220,0.2)",
                           strokeColor: "rgba(220,220,220,0.2)",
                           pointColor: "rgba(220,220,220,0.2)",
                           pointStrokeColor: "#fff",
                           pointHighlightFill: "#fff",
                           pointHighlightStroke: "rgba(220,220,220,0.2)",
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
                 tooltips: {
                       yAlign: 'bottom',
                       callbacks: {
                           labelColor: function(tooltipItem, chart) {
                               return {
                                   backgroundColor: 'rgb(255, 0, 0)'
                               }
                           },
                       },
               backgroundColor: '#227799'
                   }

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
$.ajax({

      url : "${pageContext.request.contextPath}/acbook/selectFullData.do",
      type : "get",
      dataType : "json",
      success : function(d) {
         
         var daySum= d.model.monAvg[0]==null?0:d.model.monAvg[0].AVGCOST;
         var preSum= d.model.preAvg[0]==null?0:d.model.preAvg[0].AVGCOST;
         var memo1= d.model.monMemo[0]==null?0:d.model.monMemo[0].MEMO;
         var memo2= d.model.monMemo[1]==null?0:d.model.monMemo[1].MEMO;
         var monDay = d.model.monDay[0]==null?0:d.model.monDay[0].ACDAY;
         var monDayC = d.model.monDay[0]==null?0:d.model.monDay[0].ACSUM;
         var monTime =d.model.monTime[0]==null?0:d.model.monTime[0].ACTIME;
         var monTimeM = d.model.monTime[0]==null?0:d.model.monTime[0].ACSUM;
         var lastDay = d.model.lastDay;
         var cha= d.model.monAvg[0]==null?0:((d.model.monInEx[0].ALLCOST-d.model.monInEx[1].ALLCOST));
         var nmg=d.model.monAvg[0]==null?0:(cha/d.model.lastDay);

         
         var htmlG=$(".cha").html();
         $(".cha").html(htmlG+cha).show();
         
         var htmlC=$(".memo1").html();
         $(".memo1").html(htmlC+memo1).show();         

         var htmlD=$(".memo2").html();
         $(".memo2").html(htmlD+memo2).show();
         
         var htmlA=$(".monTime").html();
         $(".monTime").html(htmlA+monTime).show();
         
         var htmlB=$(".monTimeM").html();
         $(".monTimeM").html(htmlB+monTimeM).show();
         
         var htmlE=$(".monDay").html();
         $(".monDay").html(htmlE+monDay).show();
         
         var htmlF=$(".monDayC").html();
         $(".monDayC").html(htmlF+monDayC).show();
         
         var htmlH=$(".nmg").html();
         $(".nmg").html(htmlH+nmg).show();
      
         var htmlI=$(".daySum").html();
         $(".daySum").html(htmlI+daySum).show();
         
         var htmlJ=$(".preSum").html();
         $(".preSum").html(htmlJ+preSum).show();
      }
      
   
})
</script>
<!-- jpg modify -->
<script src="<c:url value="/resources/acbook/js/html2canvas.js" />"></script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />