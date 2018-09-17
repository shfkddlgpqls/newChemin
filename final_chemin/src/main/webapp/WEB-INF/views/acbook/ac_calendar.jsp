<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" import="java.util.*,com.kh.chemin.acbook.model.vo.AcBook"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!-- fullCalendar -->
<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- sideBar -->
<jsp:include page="/WEB-INF/views/acbook/sideBar.jsp" />
<!-- Side Bar -->
<link rel="stylesheet" href="<c:url value= "/resources/acbook/css/bootstrap.min.css"/>">
<!-- Side Bar -->
<link rel="stylesheet" href="<c:url value= "/resources/acbook/css/fullcalendar.css"/>">
<!-- Side Bar -->
<link rel="stylesheet" href="<c:url value= "/resources/acbook/css/fullcalendar.print.css"/>">
<!-- Fullcalendar: ac_calendar: ? -->
<link rel="stylesheet" 	href="<c:url value= "/resources/acbook/css/ac_calendar.css"/>">

<style>
#calendar {
	max-width: 70%;
	margin: 0 auto;
}
</style>
<!-- 모달테스트 -->
<style>
.center {
    margin-top:50px;   
}

.modal-header {
	padding-bottom: 5px;
}

.modal-footer {
    	padding: 0;
	}
    
.modal-footer .btn-group button {
	height:40px;
	border-top-left-radius : 0;
	border-top-right-radius : 0;
	border: none;
	border-right: 1px solid #ddd;
}
	
.modal-footer .btn-group:last-child > button {
	border-right: 0;
}
</style>
<style>
body {
    padding-top: 50px;
}
.dropdown.dropdown-lg .dropdown-menu {
    margin-top: -1px;
    padding: 6px 20px;
}
.input-group-btn .btn-group {
    display: flex !important;
}
.btn-group .btn {
    border-radius: 0;
    margin-left: -1px;
}
.btn-group .btn:last-child {
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
}
.btn-group .form-horizontal .btn[type="submit"] {
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.form-horizontal .form-group {
    margin-left: 0;
    margin-right: 0;
}
.form-group .form-control:last-child {
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
}

@media screen and (min-width: 768px) {
    #adv-search {
        width: 500px;
        margin: 0 auto;
    }
    .dropdown.dropdown-lg {
        position: static !important;
    }
    .dropdown.dropdown-lg .dropdown-menu {
        min-width: 500px;
    }
}
</style>

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
						<div id="monthly_calendar" class="card-desc">
							<br>
							<div id='calendar'></div>
						</div>
	            	</div>
	            </div>
	            <div class="col-md-4">
	            <div class="container">
					<div class="row">
					<div class="card-content">			
					<table class="table table-hover" id="tbls" style="font-size:10px">
							<tr>
								<th>No</th>
								<th>날짜</th>
								<th>구분</th>
								<th>항목</th>
								<th>금액</th>
								<th>수정</th>
							</tr>
					</table>
					<table class="table table-hover" id="tbl-cal" style="font-size:10px">
					</table>
					<div id="pageBar"></div>
					</div>
					</div>
				</div>
						<div class="center"><button data-toggle="modal" data-target="#squarespaceModal" class="btn btn-primary center-block" onclick="modal_view">상세창</button></div>			
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

<!-- 날짜검색시 리스트 출력 -->
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
			//totalCounts ->제대로 나와요
			var html1 = $("#totalCounts").html();
			var totalCounts = data.model.totalCounts;
			$("#totalCounts").html(html1+totalCounts).show();
			
			//pageBar
			var html2 = $("#pageBar").html();
			var pageBar = data.model.pageBar;
	/* 		console.log("paging"+htms); */	
			$("#pageBar").html(pageBar).show();
			
			
			//acBookList ->제대로 나와요
			if(data!=null){
				var html3= $("#tbl-cal").html();
				var html;			
				for(var i=0;i<data.model.list.length;i++){
	 				html+="<tr><td>"+[i]+"</td>";
					html+="<td>"+data.model.list[i].ACDATE+"</td>";
					html+="<td>"+data.model.list[i].TYPENAME+"</td>";
					html+="<td>"+data.model.list[i].CATENAME+"</td>";
					html+="<td>"+data.model.list[i].ACCOST+"</td>";
					html+="<td><button data-toggle='modal' data-target='#squarespaceModal' class='btn btn-primary center-block' onclick='modal_view'>상세창</button></td></tr>";
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
<!-- <script>
		$.ajax({
			url: "${pageContext.request.contextPath}/acbook/acSelectList.do",
			type: "get",
			dataType:"json",
			success: function(data){
				console.log("load (ListData) success");
				console.log(data);
				
				
				var html;
				var orihtml= $("#tbl-cal").html();
/* 				var ac_date = $(this).attr("AC_DATE");
				var type_num = $(this).attr("TYPE_NUM");
				var cate_name = $(this).attr("CATE_NAME");
				var ac_extype = $(this).attr("AC_EXTYPE");
				var cost = $(this).attr("AC_COST"); */
				
				if(data!=null){
				for(var i=0;i<data.length;i++){
					html+="<tr><td>"+data[i].AC_DATE+"</td>";
					html+="<td>"+data[i].TYPE_NUM+"</td>";
					html+="<td>"+data[i].CATE_NAME+"</td>";
					html+="<td>"+data[i].AC_EXTYPE+"</td>";
					html+="<td>"+data[i].AC_COST+"</td></tr>";
				}
				$("#tbl-cal").html(orihtml+html).show();
				}else{
					html+="<tr><td>조회된 가계부 정보가 없습니다.</td></tr>";
					$("#tbl-cal").html(html).show();
				}
			}
		});
</script>
Calendar
-->
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
				console.log(data);
				var events = [];

				$(data).each(function() {
					var clue = $(this).attr('TYPENUM');
					switch (clue) {

					case 101:
						events.push({
							title : $(this).attr('ACALL'),
							start : $(this).attr('ACDATE'),
							allDay : true,
							color : 'white',
							textColor : 'blue',
							fontSize : '5px'
						});
						break;
					case 201:
						events.push({
							title : $(this).attr('ACALL'),
							start : $(this).attr('ACDATE'),
							allDay : true,
							color : 'white',
							textColor : "rgb(160,171,188)",
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
	}
});
</script>
<!-- acMain.js -->
<script src="<c:url value="/resources/acbook/js/fullcalendar.min.js" />"></script>
<!-- FullCalendar -->
<script src="<c:url value="/resources/acbook/js/jquery-ui.min.js" />"></script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />