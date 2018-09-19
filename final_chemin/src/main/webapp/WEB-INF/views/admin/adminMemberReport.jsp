<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
  
<jsp:include page="/WEB-INF/views/common/header1.jsp"/>
<jsp:include page="/WEB-INF/views/admin/adminMenuBar.jsp"/>
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/util.css">
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/mall.css"> 
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/fileup.css"> 
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<script>
	/* function reportContentDelete()
	{
		var rno=$('p#delete').parents("tr").children('#rno').val();
		console.log(rno);
	} */
</script>
<section class="bgwhite p-b-60" style="padding-top:0">
		<div class="container">
			<div class="row justify-content-center">
                <div class="col-md-8 p-b-30" style="padding-right: 5%;font-family: 'Noto Sans KR', sans-serif;">
					<h4 class="m-text26 p-b-36 p-t-15 text-center">
                          <strong>${reportId }님의 신고내용</strong>
                     </h4>
					<c:forEach items="${rpList }" var="rp">
					<table style="width: 100%;height: 100px;border:1px solid #eaeaea;background:#eaeaea;float:left;margin-right:3%;margin-bottom:3%;">
                    	<tr style="border-right:6px solid #5A5A5A;">
                    		<%-- <input id="rno" name="rno" value="${rp.RNO }"> --%>
                    		<td colspan="2" style="font-size:25px;width:30%;text-align:center;">${rp.CATEGORY }</td>
                    		<td colspan="2" style="float:right;text-align:center;margin-top:9%;margin-right:8%;">${rp.CONTENT }
                    			<!-- <p id="delete" style="float:right;font-size:12px;margin-left:5%;color:white;" onclick="reportContentDelete();">삭제</p> -->
                    		</td>
                    	</tr>       
                    </table>
                    </c:forEach>
				</div>
			</div>
		</div>
	</section>











>>>>>>> branch 'master' of https://github.com/shfkddlgpqls/newChemin.git
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  