<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />

<!-- tabs -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<!-- fullCalendar -->
<link rel="stylesheet" href="<c:url value= "/resources/vendor/fullcalendar/fullcalendar.css"/>">
<link rel="stylesheet" media="print" href="<c:url value= "/resources/vendor/fullcalendar/fullcalendar.print.min.css"/>">
<!-- jQurery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>	
<!-- BootStrap -->
<link rel="stylesheet" href="<c:url value= "/resources/vendor/bootstrap/css/bootstrap.css"/>">
<!-- fullcalendar -->
<script src="<c:url value="/resources/vendor/fullcalendar/lib/moment.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fullcalendar/fullcalendar.min.js"/>"></script>	
<!-- chart -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- sideBar -->
<jsp:include page="/WEB-INF/views/acbook/sideBar.jsp"/>

<style>
#calendar {
	max-width: 70%;
	margin: 0;
}
</style>
<!-- 		세미기간 7/23~2주 -->
<div class="container-fluid">
	<div class="row">
		 <!--Left Section -->
		 <div class='col-md-3' >
			<div class="container mt-3">
			<br>
			<br>
			<br>
				<!-- Nav Tabs -->
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"	data-toggle="tab" href="#income">Income</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#expenditure">Expenditure</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="modal" href="#myModal">수입입력</a></li>
				</ul>
				<!-- Tabs -->
				<div class="tab-content"  style="padding: 5%;margin-left: 30%;">
					<div id="income" class="container tab-pane active">
						<br>
						<h3>Insert Income Form</h3>
						<div class="income-container">
							<!-- <form name="income" action="acbook/insertIncome.do" method="post">
							테스트용 히든데이터
							<input type="hidden" name="type_num" value="101" />
							<input type="hidden" name="mem_id" value="stella226" />
								<table>
									<tr>
										<th>날짜</th>
										<td><input type="date" class="form-control" name="ac_date" required></td>
									</tr>
									<tr>
										<th>항목</th>
										<td><select name="cate_name" class="form-control" required>
												<option value="salary">월급</option>
												<option value="pinmoney">용돈</option>
												<option value="inetc">기타</option>
										</select></td>
									</tr>
									<tr>
										<th>금액</th>
										<td><input type="number" class="form-control" name="ac_cost"required></td>
									</tr>
									<tr>
										<th>메모</th>
										<td><input type="text" class="form-control"	name="ac_memo"></td>
									</tr>
								</table>
								<input type="submit" value="입력"><input type="reset" value="초기화">
							</form> -->
						</div>	
					</div>
								
					<div id="expenditure" class="container tab-pane fade" >
						<!-- 지출입력폼 시작 -->
						<div class="expendeture-container">
						<br>
						<h3>Insert Expedt Form</h3>
							<form name="expenditure" action="acbook/insertExpenditure.do" method="post">
								<!-- 테스트용 히든데이터 -->
								<input type="hidden" name="type_num" value="201" />
								<input type="hidden" name="mem_id" value="stella226" />
								<table>
									<tr>
										<th>날짜</th>
										<td><input type="date" class="form-control"	name="ac_date" required></td>
									</tr>
									<tr>
										<th>항목</th>
										<td><select name="cate_name" class="form-control" required>
												<option value="eat">식비</option>
												<option value="trans">교통비</option>
												<option value="joy">문화생활</option>
												<option value="ness">생필품</option>
												<option value="cloth">의류</option>
												<option value="beauty">미용</option>
												<option value="health">의료/건강</option>
												<option value="edu">교육</option>
												<option value="phone">통신비</option>
												<option value="famevent">경조사</option>
												<option value="utility">공과금</option>
												<option value="cardcost">카드대금</option>
												<option value="saving">저축</option>
												<option value="exetc">기타</option>
										</select></td>
									</tr>
									<tr>
										<th>지불방식</th>
										<td><select name="ac_extype" class="form-control" required>
												<option value="cash">현금</option>
												<option value="credit">카드</option>
										</select></td>
									</tr>
									<tr>
										<th>금액</th>
										<td><input type="number" class="form-control" name="ac_cost"required></td>
									</tr>
									<tr>
										<th>메모</th>
										<td><input type="text" class="form-control"	name="ac_memo"></td>
									</tr>
								</table>
								<input type="submit" value="입력"><input type="reset" value="초기화">
							</form>
						</div>
					</div>				
				</div>
			</div>
		</div>
		<!-- Left Section END -->
		
		<!-- MODAL -->
		<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" >
			<div class ="modal-dialog">
				<div class="modal-content">
						<!--Form with header-->
						<form id='income' action="acbook/insertIncome.do" method="post">
							<!-- 테스트용 히든데이터!! -->
							<input type="hidden" name="type_num" value="101" />
							<input type="hidden" name="mem_id" value="stella226" />

							<div class="card border-primary rounded-0">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">x</span>
				</button>
								<div class="card-header p-0">
									<div class="bg-info text-white text-center py-2">
										<h3><i class="fa fa-envelope"></i>Income</h3>
										<p class="m-0">수입을 입력하세요</p>
									</div>
								</div>
								<div class="card-body p-4">
	
									<!--Body-->
									<div class="form-group">
										<div class="input-group mb-2">
											<div class="input-group-prepend">
												<div class="input-group-text">
													<i class="fa fa-user text-info"></i>
												</div>
											</div>
											<input type="date" class="form-control" id="ac_date" name="ac_date" required>
										</div>
									</div>
									<div class="form-group">
										<div class="input-group mb-2">
											<div class="input-group-prepend">
												<div class="input-group-text">
													<i class="fa fa-envelope text-info"></i>
												</div>
											</div>
											<select name="cate_name" class="form-control" required>
												<option value="salary">월급</option>
												<option value="pinmoney">용돈</option>
												<option value="inetc">기타</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<div class="input-group mb-2">
											<div class="input-group-prepend">
												<div class="input-group-text">
													<i class="fa fa-user text-info"></i>
												</div>
											</div>
											<input type="number" class="form-control" name="ac_cost"required>
										</div>
									</div>
									<div class="form-group">
										<div class="input-group mb-2">
											<div class="input-group-prepend">
												<div class="input-group-text">
													<i class="fa fa-comment text-info"></i>
												</div>
											</div>
											<!-- <textarea class="form-control"
												name="ac_memo" placeholder="ex) 돈주웠당" required></textarea> -->
												<input type="button" id="ac_memo" value="넘어가니1"/>
												<input type="button" id="ac_memo" value="넘어가니2"/>
												<input type="button" id="ac_memo" value="넘어가니3"/>
												<input type="hidden" id = "myField" name="ac_memo"/>
										</div>
									</div>
									<div class="text-center">
										<input type="submit" value="입력"
											class="btn btn-info btn-block rounded-0 py-2">
										<input type="reset" value="초기화"
											class="btn btn-info btn-block rounded-0 py-2">
									</div>
								</div>
	
							</div>
						</form>
						<!--Form with header-->
					</div>
				</div>
			</div>
		<!-- MODAL END -->
<script>
/* 성공!!!!!!!!!!!!버튼 클릭시 밸류 값 받음 */
$(document).on('click','#ac_memo', function () {
	var a = value;
	$('input:hidden[name=ac_memo]').val($(this).attr("value"));
});
</script>		
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
