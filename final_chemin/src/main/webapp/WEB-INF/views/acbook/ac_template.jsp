<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!-- fullCalendar -->
<link rel="stylesheet"
	href="<c:url value= "/resources/vendor/fullcalendar/fullcalendar.css"/>">
<link rel="stylesheet" media="print"href="<c:url value= "/resources/vendor/fullcalendar/fullcalendar.print.min.css"/>">
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
<!-- 	여기서부터 내용 쓰면 됨 -->
<!-- START: WHOLE TEMPLATE SECTION -->
<!-- END: WHOLE TEMPLATE SECTION -->
	</div>
</div>
<!-- Main End -->
</div>
</div>
<!-- Side Bar Div End -->


<!-- jQurery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- fullcalendar -->
<script src="<c:url value="/resources/vendor/fullcalendar/lib/moment.min.js"/>"></script>
<script	src="<c:url value="/resources/vendor/fullcalendar/fullcalendar.min.js"/>"></script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />