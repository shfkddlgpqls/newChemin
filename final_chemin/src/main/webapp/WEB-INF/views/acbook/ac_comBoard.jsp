<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<div class="col-md-10 col-sm-8 main-content justify-content-center"  id="newMain">
	<div class="container-fluid justify-content-center">
<!-- 	여기서부터 내용 쓰면 됨 -->
<!-- START: WHOLE TEMPLATE SECTION -->
<br><br>
<div class="container-fluid justify-content-center">
<div class="row justify-content-center">
<div class="col-md-10 justify-content-center">
<div class="card justify-content-center" >
<header class="card-header">
	<h4 class="card-title mt-2">Share FluriBook, Write your finance!</h4>
</header>
<article class="card-body justify-content-center">
<form action="acbook/insertBoard.do" method="post" id="insertBoardFrm" enctype="multipart/form-data">
<input type="hidden" name="userId" value="${memberLoggedIn.userId }">
<input type="hidden" name="birthDay" value="${memberLoggedIn.birthDay }">
	<div class="form-row">
	<div class="col form-group col-md-1">
		<label>Title</label>
	</div>
	<div class="col form-group col-md-11 ">
		<input type="text" class="form-control" name="accTitle" placeholder="20대 취준생의 9월 결산">
	</div> <!-- form-group end.// -->
	</div>
	<div class="form-group justify-content-center">
		<textarea name="editor" id="editor" style="width: 600px; height: 300px;object-fit:contain;word-wrap:break-word;text-align:center;"></textarea>
	</div> <!-- form-group end.// -->

    <div class="form-group">
 		<button type="button" class="btn btn-info" id="insertBoard">Send</button>
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
<!-- END: WHOLE TEMPLATE SECTION -->
	</div>
</div>
<!-- Main End -->
</div>
</div>
<!-- Side Bar Div End -->

<script>
$(function(){
    //전역변수선언
    var obj=[];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder: "editor",
        sSkinURI: "${pageContext.request.contextPath}/resources/acbook/editor/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTfn_updateWriteML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
        }
    });
     
    $("#insertBoard").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
        //폼 submit
        $("#insertBoardFrm").submit();
    });
})

</script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />