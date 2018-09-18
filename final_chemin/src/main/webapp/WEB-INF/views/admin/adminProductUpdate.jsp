<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/admin/adminMenuBar.jsp"/>

		<style>
            .imgClear {
                color: gray;
                text-decoration: none;
                float:right;
            }
            .imgClear:hover {
                color: #3f7ebd;
            }
            .imgpre{
            	background-size: cover;
            	background-repeat:no-repeat;
            }
        </style>

	<!-- admin css-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/base/css/adminPage.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/slick/slick.css">
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/util.css">
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/mall.css"> 
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/fileup.css"> 
    
	<section class="bgwhite p-b-60" style="padding-top:0">
		<div class="container">
			<div class="row justify-content-center">
                <div class="col-md-8 p-b-30" style="padding-right: 5%">
					<form class="leave-comment customfileinput" name="productFrm" action="${path }/admin/productUpdateEnd.do" enctype="multipart/form-data" method="post">
						<h4 class="m-text26 p-b-36 p-t-15 ">
                           	상품 수정
                        </h4>
                        <input type="hidden" id="pno" name="pno" value="${product.pno }"/>

						<table style="width: 100%;height: 100%;">
                            <colgroup>
                                <col style="width: 25%">
                                <col style="width: 75%">
                            </colgroup>
                            <tr>
                                <th>카테고리</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <select class="sizefull s-text7 p-l-22 p-r-22" name="cno" id="cno" required>
					                        <option value="" selected disabled>카테고리 선택</option>
					                        <c:forEach items="${cate }" var="c">
					                        	<option value="${c.CNO }" ${c.CNO==product.cno?"selected":"" }>${c.CNAME }</option>
					                        </c:forEach>
					                    </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>상품명</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="pName" id="pName" placeholder="등록할 상품명" required value="${product.pName }">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>상세설명</th>
                                <td>
                                    <div class="bo4 of-hidden m-b-20" style="height: 192px;">
                                    	<textarea class="sizefull s-text7 p-l-22 p-r-22 p-t-10 p-b-10" name="details" id="details" placeholder="상품의 상세 설명" style="width:100%;resize:none;" rows="8" required>${product.details }</textarea>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>대표 이미지</th>
                                <td>
	                                <div class="file_container" data-upload-id="imgUpLoad">
		                                <div class="bo4 of-hidden size15 m-b-20">
							                <label class="imgfileUp" >
							                    <input type="file" id="mainImg" name="mainImg" class="sizefull s-text7 p-l-22 p-r-22 imgInput" accept="image/*"/>
							                    <span class="imgControl">${product.reImg}</span>
							                </label>
						                </div>
						                <a href="javascript:void(0)" class="imgClear"><i class="fa fa-times"></i></a>
						                <div class="imgPreview"></div>
						                <div class="row justify-content-center" id="imgPre">
						                	<div class="imgpre" style="width: 280px;height: 250px;background-image: url('${path}/resources/upload/productImg/${product.reImg }')" ></div>
					                	</div>
					                </div>
                                </td>
                            </tr>
                            <tr>
                                <th>가격</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="number" name="price" id="price" min="0" placeholder="판매 가격" required value="${product.price }">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>재고</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="number" name="pCount" id="pCount" min="0" placeholder="현재 재고" required value="${product.pCount }">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                            	<td></td>
                            	<td style="float:right;padding-top: 20px">
	                            	<button class="btn bg1 bo-rad-23 hov1 s-text1 trans-0-4" type="submit">등록</button>&nbsp;
		                        	<button class="btn bg1 bo-rad-23 hov1 s-text1 trans-0-4" type="reset">취소</button>
                            	</td>
                            </tr>
                        </table>
                    </form>
				</div>
			</div>
		</div>
	</section>
     
     <div id="dropDownSelect2"></div>
	
	<script src="<c:url value="/resources/mall/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
    <!--===============================================================================================-->
    <script src="<c:url value="/resources/mall/vendor/bootstrap/js/popper.js"/>"></script>
    <script src="<c:url value="/resources/mall/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/mall/vendor/select2/select2.min.js"/>"></script>
    <script type="text/javascript">
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect2')
		});
	</script>
	<script type="text/javascript">
		$(".selection-1").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect2')
		});
	</script>
	
	<script src="<c:url value="/resources/mall/js/fileup.js"/>"></script>
	<script>
	    //First upload
	    var firstUpload = new FileUploadWithPreview('imgUpLoad');
    </script>
    
    <script>
		$('.imgPreview').hide();
	    $('input[name=mainImg]').change(function(ev) {
	        $('.imgPreview').show();
	        $('.imgpre').hide();
	        $('#imgPre').hide();
	    });
	    $('.imgClear').click(function(ev){
	    	$('#imgPre').hide();
	    });
    </script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  
