<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" import="java.util.*,com.kh.chemin.acbook.model.vo.AcBook"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!-- Side Bar -->
<link rel="stylesheet" href="<c:url value= "/resources/acbook/fullcalendar/fullcalendar.css"/>">
<!-- Fullcalendar: ac_calenndar: ? -->
<link rel="stylesheet" 	href="<c:url value= "/resources/acbook/css/bootstrap-datetimepicker.css"/>">
<!--DatePicker: ac_inputIn-->
<link rel="stylesheet" 	href="<c:url value= "/resources/acbook/css/bootstrap-datetimepicker.min.css"/>">
<!--DatePicker: ac_inputIn-->
<link rel="stylesheet" 	href="<c:url value= "/resources/acbook/css/ac_calendar.css?var?3"/>">
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header1.jsp" />
<!-- sideBar -->
<jsp:include page="/WEB-INF/views/acbook/sideBar.jsp" />
<!-- Main Start -->
<div class="col-md-10 col-sm-8 main-content"  id="newMain">
<form name="imgForm" id="imgForm" action="acbook/download.do" method="post">
    <input type="hidden" id="imgData" name="imgData">
</form>
<!-- 여기서부터입력 -->
<!------ Include the above in your HEAD tag ---------->
<!-- details card section starts from here -->
	<input type="hidden" id="userId" name="userId" value="${memberLoggedIn.userId }">
      	<div class="row">
	           <div class="col-md-8">
	           	<div class="printDiv">
		          	<div class="card-content" id="calendarDiv">
						<div id="monthly_calendar" style="margin:3%;">
							<br>
							<div id='calendar'></div>
						</div>
					</div>
		          </div>
	          </div>
          <div class="col-md-4">
				<div class="card-content" id="calendarDiv" style="margin-top:6%;max-width:100%;height:auto;padding:3%;object-fit:contain;overflow:hidden;word-wrap:break-word;">			
					<div id="monthly_table">
						<table class="table table-hover" id="tbls" style="font-size:10px;max-width:100%;height:auto;padding:3%;">
								<tr>
									<th>날짜</th>
									<th>구분</th>
									<th>항목</th>
									<th>금액</th>
									<th>수정</th>
								</tr>
						</table>
						<table class="table table-hover" id="tbl-cal" style="font-size:10px;max-width:100%;">
						</table>
							<div id="pageBar"></div>
					</div>
				</div>
					<div class="printBtnZone" align="center" >
				        <a id="btnDown"><br><img src="${path}/resources/acbook/images/piggy.png"><h1 style="font-weight:bold">Save Money!</h1></a>
				    </div>
				</div>
			</div>
    	</div>			          
<!-- details card section starts from here -->

	<!-- 여기서그만 -->
<!-- Main End -->
</div>
</div>
<!-- Side Bar Div End -->
<!-- line modal -->
<div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
		<h3 class="modal-title" id="lineModalLabel">Free Fluri Account Profile</h3>
		</div>
		<div class="modal-body" style="text-align:left;align:center">
			
            <!-- content goes here -->
			<form id= 'acBookMemFrm' method='post' class="justify-content-center">
              <div class="form-group">
              	<label>날짜</label>
              		<input type="hidden" id="userId" name="userId" value="${memberLoggedIn.userId }">
              	   <input type="hidden" id="acNo" name="acNo">
			       <input type="text" id='acDate' name="acDate" readonly style="width:300px;">
				</div>
              <div class="form-group">              	
                <label>구분</label>
                <!-- <input type='text' id='typeNum' name='typeNum' readonly> -->
                <select id='typeNum' name='typeNum' required style="width:300px;">
				  <option value="101">수입</option>
				  <option value="201">지출</option>
                </select>
              </div>
              <div class="form-group">
              <label>항목</label>
                <select id='cateNum1' name='cateNum' style="width:300px;">
				  <option value=''>선택</option>
				  <option value="101_1" >월급 </option>
				  <option value="101_2" >용돈</option>
  				  <option value="101_3" >기타</option>
                </select>
                <select id='cateNum2' name='cateNum' style="width:300px;">
				  <option value=''>선택</option>
				  <option value="201_1" >식비</option>
				  <option value="201_2" >교통비</option>
  				  <option value="201_3" >문화생활</option>
   				  <option value="201_4" >생필품</option>
   				  <option value="201_5" >의류</option>
   				  <option value="201_6" >미용</option>
				  <option value="201_7" >의료건강</option>
  				  <option value="201_8" >교육</option>
   				  <option value="201_9" >전화요금</option>
   				  <option value="201_10" >경조사비</option>
				  <option value="201_11" >공과금</option>
  				  <option value="201_12" >카드대금</option>
   				  <option value="201_13" >저축</option>
   				  <option value="201_14" >기타</option>  				    				  
                </select>
              </div>
              <div id='form-group'>
              <label>금액</label>
              <input type='number' id='acCost' name='acCost' required > 				
 				<select id='exCode' name='exCode'>
				  <option value=''>선택</option>
				  <option value="M" >현금</option>
				  <option value="C" >카드</option>
				  <option value="-">해당없음</option>
				</select>
              </div>
              <div id='form-group'>
              <label>메모</label>
              <textarea id='memo' name='memo' cols=30, rows=3 style="width:300px;"></textarea>
              </div>
              	<div class="btn-group" role="group" style="margin-left:50px;">
					<button type="button" id="updateAcMem" class="btn btn-success">Update</button>
					<button type="button" id="deleteAcMem" class="btn btn-warning">Delete</button>
					<button type="button" class="btn btn-info" id="closeAcMem">Close</button>
				</div>
            </form>
		</div>
		<div class="modal-footer">
		</div>
		</div>
	</div>
  </div>
</div>

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
$('#updateAcMem').click(function(){
	$("#acBookMemFrm").attr("action", "${pageContext.request.contextPath}/acbook/updateAcBook.do");
	$("#acBookMemFrm").submit();
	swal({
		  title: "Confirm",
		  text: "데이터가 수정되었어요",
		  icon: "success",
	});
})
</script>
<script>
$('#deleteAcMem').click(function(){
	$("#acBookMemFrm").attr("action", "${pageContext.request.contextPath}/acbook/deleteAcBook.do");
	$("#acBookMemFrm").submit();
	swal({
		  title: "Confirm",
		  text: "데이터가 삭제되었어요",
		  icon: "success",
	});
})
</script>
<script>
$('#closeAcMem').click(function(){
	$("#acBookMemFrm").attr("action", "${pageContext.request.contextPath}/ac_calendar.do");
	$("#acBookMemFrm").submit();
})
</script>
<script>
function modal_view(acNo){
	$('#squarespaceModal').on('hidden.bs.modal', function () {
        $(this).removeData('bs.modal');
});
	$.ajax({
		url:"${pageContext.request.contextPath}/acbook/acSelectOne.do",
		data:{acNo:acNo},
		type:"get",
		dataType:"json",
		success:function(data){
			console.log("success (MemData) onload")
			console.log(data);
			console.log(acNo+"acNo");
			if(data!=null){			
				$('#cateNum1').show();
				$('#cateNum2').show();
				$('#exCode').show();
			$('#acDate').val(data.ACDATE);
			$('#typeNum').val(data.TYPENUM);
			$("#typeNum option").not(":selected").attr("disabled", "disabled");
			
			$('#acNo').val(acNo);

			if(data.TYPENUM=='101'){
				
 				$('#cateNum2').remove();
 				$('#exCode').hide();
				
				$('#cateNum1').val(data.CATENUM);
				$('#exCode').val(data.EXCODE);
				$('#acCost').val(data.ACCOST);
				$('#memo').text(data.MEMO);
			}else{
				$('#cateNum1').remove();
				
				$('#cateNum2').val(data.CATENUM);
				$('#exCode').val(data.EXCODE);
				$('#acCost').val(data.ACCOST);
				$('#memo').text(data.MEMO);	
			}

		}	
	
		}
	})
}
</script>
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
$(function(){
	fn_list(1);
});
function fn_list(cPage){
	$.ajax({
		url:"${pageContext.request.contextPath}/acbook/acSelectPageList.do",
		data:{cPage:cPage},
		type:"get",
		dataType:"json",
		success:function(data){
			console.log(data)
			console.log("load (PageData) success");
			//totalCounts
			var html1 = $("#totalCounts").html();
			var totalCounts = data.model.totalCounts;
			
			$("#totalCounts").html(html1+totalCounts).show();
			
			//pageBar
			var html2 = $("#pageBar").html();
			var pageBar = data.model.pageBar;
			$("#pageBar").html(pageBar).show();
			
			
			//acBookList
			if(data!=null){
				var html3= $("#tbl-cal").html();
				var html;			
/* 				for(var i=0;i<totalCounts<i++){
					html7+="<td>"+((-i)+(totalCounts))+"</td>";
				} */
				for(var i=0;i<data.model.list.length;i++){
 					html+="<tr><td>"+data.model.list[i].ACDATE+"</td>";
					html+="<td>"+data.model.list[i].TYPENAME+"</td>";
					html+="<td>"+data.model.list[i].CATENAME+"</td>";
					html+="<td>"+data.model.list[i].ACCOST+"</td>";
					html+="<td><button data-toggle='modal' data-target='#squarespaceModal' class='btn btn-warning' onclick='modal_view("+data.model.list[i].ACNO+");'style='font-size:10px;color:white'>click</button></td></tr>";
				}
				$("#tbl-cal").html(html).show();
				
				}else{
					html+="<tr><td>조회된 가계부 정보가 없습니다.</td></tr>";
					$("#tbl-cal").html(html).show();
				}
			
		}
	});
}

</script>
 <script>
$('#calendar').fullCalendar({
	themeSystem: 'bootstrap4',
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
				console.log(data);
				var events = [];

				$(data).each(function() {
					var clue = $(this).attr('TYPENUM');
					switch (clue) {

					case 101:
						events.push({
							title : 'In:'+$(this).attr('ACALL'),
							start : $(this).attr('ACDATE'),
							allDay : true,
							color : 'powderblue',
							textColor : 'blue',
							fontSize : '5px'
						});
						break;
					case 201:
						events.push({
							title : 'Ex:'+$(this).attr('ACALL'),
							start : $(this).attr('ACDATE'),
							allDay : true,
							color : 'white',
							textColor : "salmon",
							fontSize : '5px'
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
	},
});
</script>
<!-- acMain.js -->
<script src="<c:url value="/resources/acbook/fullcalendar/jquery.min.js" />"></script>
<script src="<c:url value="/resources/acbook/fullcalendar/moment.min.js" />"></script>
<script src="<c:url value="/resources/acbook/fullcalendar/fullcalendar.js" />"></script>
<!-- FullCalendar -->
<script src="<c:url value="/resources/acbook/js/jquery-ui.min.js" />"></script>
<!-- jpg modify -->
<script src="<c:url value="/resources/acbook/js/html2canvas.js" />"></script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />