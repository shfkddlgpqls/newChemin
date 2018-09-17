<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- 마이페이지 css-->
<link rel="stylesheet" type="text/css" href="${path}/resources/base/css/mypage.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<style>   
.alert {
    padding: 20px;
    width:55%;
    margin-left:25%;

}

.closebtn {
    margin-left: 15px;

    font-weight: bold;
    float: right;
    font-size: 22px;
    line-height: 20px;
    cursor: pointer;
    transition: 0.3s;
}

.closebtn:hover {
    color: black;
} 
</style>
<script>
	$(window).load(function(){
		fn_warningMsg();
	});

	function fn_warningMsg() {
		var userid="${memberLoggedIn.userId}";
		console.log(userid);
		$.ajax({
			type : "GET",
			dataType : "json",
			url : "${path}/mypage/warningMsg.do?userId="+userid,
			success : function(data) {
				console.log(data.warnNum);
				var value='';
				if(data.warnNum==1)
				{
					value+="<div class='alert alert-danger alert-dismissible'>";
					value+=" <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
					value+="<strong>Warning!</strong> &nbsp 꿀팁 커뮤니티에서 올리신 글로 신고 당하셨습니다. &nbsp 3번이상 신고당하실 경우, 관리자의 권한으로 강제 탈퇴되실 수 있습니다.</div>";
					
				}
				$('#warningMsg').html(value);  
			}
		});
	}

</script>   
	<div class="mypage">
		<h2 class="text-center">마이페이지 입니당</h2>
	</div>
		
	
	<div class="container">
		<div class="row">
			
				<div class="col-md-12">
					<hr>
						<ul class="nav justify-content-center">
							<li class="nav-item">
						      <strong><a class="nav-link mypageAtag" href="${path }/mypage/myMember.do?userId=${memberLoggedIn.userId}">회원 정보	</a></strong>
						    </li>
						    <li class="nav-item">
						      <strong><a class="nav-link mypageAtag" href="${path }/mypage/myOrderList.do">주문 목록	</a></strong>
						    </li>
						    <li class="nav-item">
						      <strong><a class="nav-link mypageAtag" href="${path }/mypage/myBoardList.do">게시글 관리</a></strong>
						    </li>
						    <li class="nav-item">
						      <strong><a class="nav-link mypageAtag" href="${path }/mypage/myShoppingCart.do">장바구니</a></strong>
						    </li>
						    <li class="nav-item">
						   		<strong><a class="nav-link mypageAtag" href="${path }/mypage/myWishList.do">찜 목록</a></strong>
						    </li>
						    <li class="nav-item">
						   		<strong><a class="nav-link mypageAtag" href="${path }/mypage/myPlaceList.do?userId=hyebeen">장소 등록 내역</a></strong>
						    </li>
						  </ul>
					 <hr>
				</div>
			</div>	
		</div>
		<!-- 신고 제재 메시지 -->
		<div id="warningMsg">
			<!-- <div class="alert alert-danger">
			  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
			  <strong>Warning!</strong> &nbsp 꿀팁 커뮤니티에 광고글로 신고 당하셨습니다. &nbsp 3번이상 신고당하실 경우, 관리자의 권한으로 강제 탈퇴되실 수 있습니다.
			</div> -->
		<div>
		<!-- 회원정보 수정 폼란 -->
		<section>
		</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  