<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!-- Side Bar -->
<link rel="stylesheet" href="<c:url value= "/resources/acbook/css/sideBar.css"/>">	
<!-- ProgressBar: ac_inputIn -->
<link rel="stylesheet" 	href="<c:url value= "/resources/acbook/css/ac_navBar.css"/>">
<!-- ProgressBar: ac_inputIn -->
<link rel="stylesheet" type="text/css" href="${path}/resources/acbook/css/acMain.css?var3"/>


<!------ Include the above in your HEAD tag ---------->

<div class="container-fluid">
    <div class="row">
    	<!-- Left Section Start-->
        <div class="col-md-2 col-sm-4 sidebar1">
            <div class="logo넣으면">
                <img src="" class="" alt="">
            </div>
            <br>
            <div class="left-navigation">
             	<ul class="list">
                    <h5><strong>Main</strong></h5>
                    <li><a class="a_tags" href="${path}/ac_main.do">AcBook</a></li>
                </ul>
                <br>
                <ul class="list">
                    <h5><strong>My FluriBook</strong></h5>
                    <li><a class="a_tags" href="${path}/ac_insertAc.do">Do Fluri</a></li>
                    <li><a class="a_tags" href="${path}/ac_calendar.do">See Fluri</a></li>
                </ul>

                <br>
                <ul class="list">
                    <h5><strong>Menu</strong></h5>
                    <li><a class="a_tags" href="${path}/ac_monthlyData.do">MontlyData</a></li>
                    <li><a class="a_tags" href="${path}/ac_community.do">ShareFluriBook</a></li>
                     <li><a class="a_tags" href="${path}/testhyebeen.do">테스트혜빈</a></li>
                </ul>
            </div>
        </div>
<!-- jQurery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- acMain.js -->
<script src="<c:url value="/resources/acbook/js/acMain.js" />"></script>
<!-- FullCalendar -->
<script src="<c:url value="/resources/acbook/js/moment.js" />"></script>
<!-- acMain.js -->
<script src="<c:url value="/resources/acbook/js/bootstrap-datetimepicker.js" />"></script>
<!-- acMain.js -->
<script src="<c:url value="/resources/acbook/js/collapse.js" />"></script>
<!-- acMain.js -->
<script src="<c:url value="/resources/acbook/js/counter.js" />"></script>
<!-- TimePicker -->
<script src="<c:url value="/resources/acbook/js/transition.js" />"></script>

<!-- chart -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<!-- acMain.js -->
<script src="<c:url value="/resources/acbook/js/fullcalendar.min.js" />"></script>
<!-- FullCalendar -->
<script src="<c:url value="/resources/acbook/js/jquery-ui.min.js" />"></script>
<!-- TimePicker -->
<script src="<c:url value="/resources/acbook/js/bootstrap-datetimepicker.min.js" />"></script>           