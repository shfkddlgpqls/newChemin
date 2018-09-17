<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- Sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<c:set value="${pageContext.request.contextPath }" var="path"/>
<script>

$(document).ready(function () {
	 swal({
		  text: "${msg}",
		  icon: "success",
		  button: "확인",
		}).then((willDelete) => {
	  		  if (willDelete) {
	  			 swal({
	  				  text: "등록을 요청중입니다. 마이페이지에서 확인하시겠습니까?",
	  				  icon: "info",
	  				  buttons: {
	  					    cancel: "NO",
	  					    catch: {
	  					      text: "YES",
	  					      value: "catch",
	  					    },
	  					  },

	  				}).then((value) => {
	  			  			  switch (value) {	 
	  					  		    case "catch":
	  					  		    location.href ="${path}/mypage/myPlaceList.do?plaStatus=N";
	  					  		      break;
	  					  		 
	  					  		    default:
	  					  		    location.href="${path}${loc}"
	  					  		    	
	  					  		  }

	  			    		});  

	  				}
	    			
	    		  }); 
	    		});  



	
 

	/* alert("${msg}"); 
	location.href="${path}${loc}"; */

	 
</script>