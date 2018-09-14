<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<c:set value="${pageContext.request.contextPath }" var="path"/>
<script>
/*  swal({
	  text: "${msg}",
	  icon: "success",
	  button: "확인",
	}); */ 

	alert("${msg}"); 
	location.href="${path}${loc}";

	 
</script>