<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*, com.kh.chemin.acbook.model.vo.AcCom"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!-- jQurery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!--smarteditor -->
<script	src="<c:url value="/resources/acbook/editor/js/HuskyEZCreator.js"/>"></script>

<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/acbook/sideBar.jsp" />

<!-- Main Start -->
<div class="col-md-10 col-sm-8 main-content">
	<div class="container-fluid">
<!-- 	여기서부터 내용 쓰면 됨 -->
<!-- test -->
<br><br>
<div class="container-fluid">
<div class="row justify-content-center">
<div class="col-md-8">
<div class="card">
<header class="card-header">
	<h4 class="card-title mt-2">Share FluriBook, Write your finance!</h4>
</header>
<article class="card-body">
<form>
	<div class="form-row">
		<div class="col form-group col-md-1">
			<label>Date</label>
		</div>
		<div class="col form-group col-md-5">
		  	<input type="text" class="form-control" placeholder="${acc.accDate }" readonly="readonly" style="background-color:white;">
		</div> <!-- form-group end.// -->
		<div class="col form-group col-md-1">
			<label>Id</label>
		</div>
		<div class="col form-group col-md-5">
		  	<input type="text" class="form-control" placeholder="${acc.userId}" readonly="readonly" style="background-color:white;">
		</div> <!-- form-group end.// -->
	</div> <!-- form-row end.// -->
	<div class="form-row">
		<div class="form-group col-md-1">
		  <label>Gen</label>
		 </div>
 		<div class="col form-group col-md-5">
		  <select id="inputState" class="form-control" style="background-color:white;">
		    <option>Female</option>
		      <option>Male</option>
		  </select>
		</div> <!-- form-group end.// -->
		<div class="form-group col-md-1">
		  <label>Age</label>
		</div>
		<div class="col form-group col-md-5">
		  <select id="inputState" class="form-control" style="background-color:white;">
		    <option>10's</option>
		      <option>20's</option>
		      <option>30's</option>
		      <option>40's</option>
		      <option>50's</option>
		      <option>60's~</option>
		  </select>
		</div> <!-- form-group end.// -->
	</div> <!-- form-row.// -->
	<div class="form-row">
	<div class="col form-group col-md-1">
		<label>Title</label>
	</div>
	<div class="col form-group col-md-11">
		<input type="text" class="form-control" placeholder="${acc.accTitle }" readonly="readonly" style="background-color:white;">
	</div> <!-- form-group end.// -->
	</div>
	<div class="form-group">
		<div class="form-control" readonly="readonly" style="background-color:white;">${acc.editor }</div>
	</div> <!-- form-group end.// -->

    <div class="form-group">
		<div class="btn-group">
			<button type="button" class="btn btn-info btn-filter" data-target="pagado">Con</button>
			<button type="button" class="btn btn-warning btn-filter" data-target="pendiente">Edt</button>
			<button type="button" class="btn btn-default btn-filter" data-target="all">Del</button>
		</div>
    </div> <!-- form-group// -->      
    <small class="text-muted">moragoSsuyahalzi..<br>zol-lyu zookgetDDa!</small>                                          
</form>
</article> <!-- card-body end .// -->
<div class="border-top card-body text-center"><small class="form-text text-muted">noonE numoo gam gi nun de, jamyun angde..</small></div>
</div> <!-- card.// -->
</div> <!-- col.//-->
</div> <!-- row.//-->
</div> 
<!--container end.//-->

	</div>
</div>
<!-- Main End -->
</div>
</div>
<!-- Side Bar Div End -->
<script>

</script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />