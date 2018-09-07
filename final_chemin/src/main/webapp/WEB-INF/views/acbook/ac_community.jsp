<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!-- Jquery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- Community -->
<link rel="stylesheet" href="<c:url value= "/resources/acbook/css/ac_cummunity.css"/>">
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- sideBar -->
<jsp:include page="/WEB-INF/views/acbook/sideBar.jsp" />

<!-- Main Start -->
<div class="col-md-10 col-sm-8">
<!-- 삭제금지 -->
<div class="container-fluid"><br><br>
	<div class="row">	
		<section class="content">			
			<h1>Free-fleri Monthly Closing an Account</h1><hr>
				<!-- <div class="col-md-10 col-md-offset-2"> -->
				<div class="panel panal-default">
					<div class="panel-body">
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-info btn-filter" data-target="pagado">Female</button>
								<button type="button" class="btn btn-warning btn-filter" data-target="pendiente">Male</button>
								<button type="button" class="btn btn-default btn-filter" data-target="all">All</button>
							</div>
						</div>
						<div class="table-container">
							<table class="table table-filter" id="tbl-calist"></table>
							<div  id="pageBar"></div>
							<div id="totalCounts"></div>
						</div>
					</div>
				</div>
				<div class="content-footer">
					<p>
						Page © - 2018 <br>
						Powered By <a href="" target="_blank">Chemin_Fluri_Accountbook</a>
					</p>
				</div>
				<!-- </div> -->
		</section>
	</div>
</div>
<!-- 삭제금지 -->
</div>
<!-- Main End -->
</div>
</div>
<!-- Side Bar Div End -->

<script>
$(document).ready(function () {

	$('.star').on('click', function () {
      $(this).toggleClass('star-checked');
    });

    $('.ckbox label').on('click', function () {
      $(this).parents('tr').toggleClass('selected');
    });

    $('.btn-filter').on('click', function () {
      var $target = $(this).data('target');
      if ($target != 'all') {
        $('.table tr').css('display', 'none');
        $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
      } else {
        $('.table tr').css('display', 'none').fadeIn('slow');
      }
    });

 });
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
		success: function(data){
			console.log(data);
			console.log("load (BoardList) success");
			
			/* var html1=$("#totalCounts").html();
			var totalCounts= data.model.totalCounts;
			$("#totalCounts").html(html1+totalCounts).show(); */
			
			var html2=$("#pageBar").html();
			var pageBar= data.model.pageBar;
			$("#pageBar").html(pageBar).show();
			
			if(data!=null){
				var html3= $("#tbl-calist").html();
				var html;
				for(var i=0;i<data.model.list.length;i++){
					html+="<tbody>";
					html+="<tr data-status='pagado'>";
					html+="<td>";
					html+="<div class='ckbox'>";
					html+="<input type='checkbox' id='checkbox1'>";
					html+="<label for='checkbox1'></label>";
					html+="</div>";					
					html+="</td>";
					html+="<td><h4 class='accmt' id='accmt'>"+[i]+"</h4>";
					html+="</td>";
					html+="<td>";
					html+="<a href='javascript:;' class='star'>";
					html+="<i class='glyphicon glyphicon-star'></i>";
					html+="</a>";
					html+="</td>";
					html+="<td>";
					html+="<div class='media'>";
					html+="<a href='#' class='pull-left'>";
					html+="<img src='https://image.flaticon.com/icons/svg/138/138283.svg' class='media-photo'>";
					html+="</a>";
					html+="<div class='media-body'>";
					html+="<span class='media-meta pull-right'>"+data.model.list[i].ACDATE+"</span>";
					html+="<h4 class='title'>";
					html+=data.model.list[i].USERID;
					html+="<span class='pull-right pagado'>"+data.model.list[i].CATENAME+"</span>";
					html+="<span class='media-meta pull-right' style='color:salmon'>2</span><span class='media-meta pull-right'>10</span>"
					html+="</h4>";
					html+="<p class='summary'>"+data.model.list[i].MEMO+"</p>";
					html+="</div>";
					html+="</div>";
					html+="</td>";					
					html+="<td><h4 class='accmt' id='accmt'>0</h4>";
					html+="</td>";
					html+="</tr>";
					html+="</tbody>";
				}
				$("#tbl-calist").html(html).show();				
				}else{
					html="<tr><td>조회된 가계 데이터가 없습니다</td></tr>";
					$("#tbl-calist").html(html).show();
				}
		}
	})
}
</script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />