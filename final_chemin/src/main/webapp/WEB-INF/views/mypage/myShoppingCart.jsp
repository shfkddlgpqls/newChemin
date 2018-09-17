<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <jsp:include page="/WEB-INF/views/mypage/myMenuBar.jsp"/>

<script>
	function fn_delete() 
	{
		confirm("삭제하시겠습니까?");
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  