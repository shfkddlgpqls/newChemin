<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/admin/adminMenuBar.jsp"/>

<!-- admin css-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/base/css/adminPage.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/slick/slick.css">
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/util.css">
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/mall.css">
    
	<div class="row p-t-50 justify-content-center">
	    <!-- filter 조건 -->
	    <div class="flex-sb-m flex-w p-t-10">
	    	<div class="rs2-select2 of-hidden w-size12" style="width:150px">
	            <select class="selection-1" name="cate" id="cate">
	                <option value="0" selected>전체</option>
	                <option value="1">가구</option>
	                <option value="2">침대</option>
	                <option value="3">방범</option>
	            </select>
	        </div>
	        <div class="rs2-select2 of-hidden w-size12" style="width:150px">
	            <select class="selection-2" name="order" id="order">
	                <option value="new" selected>최신순</option>
	                <option value="sales">매출순</option>
	                <option value="stock">재고순</option>
	            </select>
	        </div>
	        <input id="searchData" name="searchData" list="autoComplete" type="text" class="m-r-20 s-text2" placeholder="검색할 상품명" style="border:none;outline:none;border-bottom: 1px solid gray;">
	        <datalist id="autoComplete"></datalist>
	    </div>
           
        <div class="flex-sb-m flex-w p-t-10">
            <div class="w-size11">
                <button onclick="fn_product_list();return false;" class="size4 bg7 bo-rad-15 hov1 s-text14 trans-0-4" style="border:none;outline: none;">
                    search
                </button>
            </div>
        </div>
    </div>
    
    
    <div class="container">
    	<div class="flex-w flex-sb-m p-t-25 p-l-35 p-r-60">
	        <div class="flex-w flex-m w-full-sm"></div>
	
	        <div class="size10 trans-0-4 m-t-10">
	            <!-- Button -->
	            <a class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" href="${path }/admin/adminProductView.do" style="color:white">
	              	 상품 등록하기
	            </a>
	        </div>
        </div>
    </div>
 
    
	<section class="cart bgwhite p-t-70 p-b-100">
        <div class="container">
            <div class="container-table-cart pos-relative">
                <div class="wrap-table-shopping-cart bgwhite">
                    <table class="table-shopping-cart" style="overflow: hidden;">
                    
                    <colgroup>
                    	<col><col width="15%"><col width="25%"><col width="15%"><col width="10%"><col width="10%"><col width="10%">
                    </colgroup>
                    
                        <tr class="table-head">
                            <th class="column-1"></th>
                            <th>Category</th>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Stock</th>
                            <th>Sales</th>
                            <th></th>
                        </tr>

						<tbody id="productList"></tbody>

                    </table>
                </div>
            </div>
            <div class="row justify-content-center" id="pageBar"></div>
       	</div>
     </section>
     
     <div id="dropDownSelect2"></div>
	
	<script>
	$(function(){
    	fn_product_list(1);
    	
    	$('#searchData').keyup(function(){
    		var searchData = $('#searchData').val();
			$.ajax({
				url:"${path}/admin/productAuto.do",
				type:"get",
				data:{search:searchData},
				dataType:'html',
				success:function(data){
					console.log(data);
					var nameArr = data.split(",");
					var html="";
					for(var i=0;i<nameArr.length;i++){
						html+="<option>"+nameArr[i]+"</option>";
					}
					$('#autoComplete').html(html);
				}
			});
		});
    });
	
	function fn_product_list(cPage){
		var searchCate = $('#cate').val();
		var searchOrder = $('#order').val();
		var searchData = $('#searchData').val();
		$.ajax({
			type:"get",
			url:"${path}/admin/adminProductData.do",
			data:{cPage:cPage,searchCate:searchCate,searchOrder:searchOrder,searchData:searchData},
			datatype:"json",
			success:function(data){
				var view="";
				var pageBar=data[1];
				if(data!=null){
					for(var i=0;i<data[0].length;i++){
						view+='<tr class="table-row">';
						view+='<td class="column-1">';
						view+='<div class="cart-img-product b-rad-4 o-f-hidden">';
						view+='<img src="${path}/resources/upload/productImg/'+data[0][i].REIMG+'" alt="IMG-PRODUCT" draggable="false">';
	                    view+='</div></td>';
	                    view+='<td>'+data[0][i].CNAME+'</td>';
	                    view+='<td>'+data[0][i].PNAME+'</td>';
	                    view+='<td>\\'+data[0][i].PRICE+'</td>';
	                    view+='<td>'+data[0][i].PCOUNT+'</td>';
	                    view+='<td>'+data[0][i].SALES+'</td>';
	                    view+='<td>';
	                    view+='<a href="#" onclick="product_update('+data[0][i].PNO+')" class="color1 flex-2 fa-2x"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;&nbsp;';
	                    view+='<a href="#" onclick="product_delete('+data[0][i].PNO+')" class="color1 flex-2 fa-2x" draggable="false"><i class="fa fa-times-circle"></i></a>';
	                    view+='</td>';
	                    view+='</tr>';
					}
					if(data.length==1){
						view+="<h5 class='p-b-30'>상품이 존재하지 않습니다</h5>";
					}
				}
				$('#productList').html(view);
				$('#pageBar').html(pageBar);
				$('#searchData').val('');
			},
			error:function(jxhr,textStatus,error){
				console.log("mainMall ajax 실패 : "+jxhr+" "+textStatus+" "+error);
			}
		});
   	}
	
	function product_update(pno){
		location.href="${path}/admin/productUpdate.do?pno="+pno;
	}
	
	function product_delete(no){
		swal("정말로 상품을 삭제하시겠습니까?")
		.then((value) => {
			$.ajax({
				type:"get",
				url:'${path}/admin/productDelete.do',
				data:{pno:no},
				datatype:"json",
				success:function(data){
					swal("상품이 정상적으로 삭제되었습니다.");
					fn_product_list(1);
				},
				error:function(jxhr,textStatus,error){
					console.log("상품 삭제 ajax 실패 : "+jxhr+" "+textStatus+" "+error);
				}
			});
		});
	}
	</script>
	
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
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  
