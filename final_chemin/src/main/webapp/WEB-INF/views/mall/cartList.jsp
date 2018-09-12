<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
 
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- mall css -->
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/animate/animate.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/slick/slick.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/noui/nouislider.min.css">
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/util.css">
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/mall.css">
    <link rel="stylesheet" type="text/css" href="${path}/resources/base/css/mall.css">
    
    <style>
    	#updownbtn {
    		border: none;
    		outline: none;
    	}
    </style>

<!-- Title Page -->
    <section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(${path}/resources/mall/img/food.jpg);">
        <h2 class="l-text2 t-center">
            Cart
        </h2>
    </section>

	<input type="hidden" id="userId" name="userId" value="${memberLoggedIn.userId }">

    <!-- 구매할 상품 리스트 (수량은 1~20개 : mall.js에서 변경) -->
    <!-- Cart -->
	<section class="cart bgwhite p-t-70 p-b-100">
        <div class="container">
			<h4 class="m-text26 p-b-36 p-t-15">
	           	장바구니 상품&nbsp;&nbsp;<small><sub>- 장바구니에 담겨있는 상품은 최대 7일간 보관됩니다</sub></small>
	        </h4>
            <!-- Cart item -->
            <div class="container-table-cart pos-relative">
                <div class="wrap-table-shopping-cart bgwhite">
                    <table class="table-shopping-cart">
	                    <thead>
	                        <tr class="table-head">
	                            <th class="column-1"></th>
	                            <th class="column-2">Product</th>
	                            <th class="column-3">Price</th>
	                            <th class="column-4">Quantity</th>
	                            <th class="column-5"></th>
	                            <th class="cloumn-6">Total</th>
	                            <th class="column-7"></th>
	                        </tr>
						</thead>
						
						<tbody id="cart_list">
							<!-- ajax로 장바구니 꽂힘 -->
							
							<%-- <tr class="table-row" id="cart_list">
	                            <td class="column-1">
	                                <div class="cart-img-product b-rad-4 o-f-hidden">
	                                    <img src="${path}/resources/mall/img/vase.jpg" alt="IMG-PRODUCT" draggable="false">
	                                </div>
	                            </td>
	                            <td class="column-2">Men Tshirt</td>
	                            <td class="column-3">$36.00</td>
	                            <td class="column-4">
	                                <div class="flex-w bo5 of-hidden w-size17">
	                                    <button class="btn-num-product-down color1 flex-c-m size7 bg8 eff2">
	                                        <i class="fs-12 fa fa-minus" aria-hidden="true"></i>
	                                    </button>
	
	                                    <input class="size8 m-text18 t-center num-product" type="number" name="num-product1" value='1' readonly>
	
	                                    <button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2">
	                                        <i class="fs-12 fa fa-plus" aria-hidden="true"></i>
	                                    </button>
	                                </div>
	                            </td>
	                            <td class="column-4">
	               					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center" style="margin:0 0">
	                                    <div class="quantity_selector" style="margin:0 0">
						                     <span class="minus"><i class="fa fa-minus" aria-hidden="true"></i></span>
						                     <span id="amount">1</span>
						                     <span class="plus"><i class="fa fa-plus" aria-hidden="true"></i></span>
						                </div>
						            </div>
	                            </td>
	                            <td class="column-5">
	                                <a href="#" class="color1 flex-2">변경</a>
	                            </td>
	                            <td class="column-6">$36.00</td>
	                            <td class="column-7">
									<a href="#" class="color1 flex-2" draggable="false"><i class="fa fa-times"></i></a>
								</td>
	                        </tr>  --%>
	                        
						</tbody>

                    </table>
                </div>
            </div>

            <div class="flex-w flex-sb-m p-t-25 p-b-25 bo8 p-l-35 p-r-60 p-lr-15-sm">
                <div class="flex-w flex-m w-full-sm">
                    
                </div>

                <div class="size10 trans-0-4 m-t-10 m-b-10">
                    <!-- Button -->
                    <a class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" style="color:white" href="${path }/mall/mainMall.do">
                      	 쇼핑 계속하기
                    </a>
                </div>
            </div>

            <!-- Total -->
            <div class="bo9 w-size18 p-l-40 p-r-40 p-t-30 p-b-38 m-t-30 m-r-0 m-l-auto p-lr-15-sm" id="cart_total">
                <h4 class="m-text26 p-b-30 p-t-15">
                   	결제 예정 금액
                </h4>

                <div class="flex-w flex-sb-m p-b-12">
                    <span class="s-text18 w-size19 w-full-sm">
                       	총 상품금액 :
                    </span>

                    <span class="m-text21 w-size20 w-full-sm" id="cart_total_1"></span>
                </div>

                <!--  -->
                <div class="flex-w flex-sb p-t-15 p-b-20">
                    <span class="s-text18 w-size19 w-full-sm">
                       	 배송비 :
                    </span>

                    <span class="m-text21 w-size20 w-full-sm" id="cart_total_2"></span>
                </div>

                <div class="of-hidden size15">
                    <p>* 5만원 이상 구매시 무료배송입니다</p>
                </div>
                
                <!--  -->
                <div class="flex-w flex-sb-m p-t-26 p-b-30 bo10">
                    <span class="m-text22 w-size19 w-full-sm">
                       	총 금액 :
                    </span>

                    <span class="m-text21 w-size20 w-full-sm"  id="cart_total_3"></span>
                </div>

                <div class="size15 trans-0-4 m-t-20">
                	<input type="hidden" name="userId" id="userId" value="${memberLoggedIn.userId }"/>
                	<input type="hidden" name="allPrice" id="allPrice"/>
                    <!-- Button -->
                    <button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" onclick="fn_cart_order()" style="border:none;outline: none;">
                       	전체상품주문
                    </button>
                </div>
            </div>
        </div>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script>
	$(function(){
		cart_ck();
	});

	function cart_ck(){
		var userId = $("input:hidden[name=userId]").val();
		$.ajax({
			type:"get",
			url:"${path}/mall/cartProduct.do",
			data:{userId:userId},
			datatype:"json",
			success:function(data){
				var totalprice=0;
				var cart="";
				var total="0";
				var delivery="0";
				var all="0";
				if(data!=null){
					for(var i=0;i<data[0].length;i++){
						totalprice = data[0][i].PRICE * data[0][i].AMOUNT;
						cart+='<tr class="table-row" id="cart_list">';
						cart+='<td class="column-1">';
						cart+='<div class="cart-img-product b-rad-4 o-f-hidden">';
						cart+='<img src="${path}/resources/upload/productImg/'+data[0][i].REIMG+'" alt="IMG-PRODUCT" draggable="false">';
						cart+='</div>';
						cart+='</td>';
						cart+='<td class="column-2"><a href="${path}/mall/detail.do?no='+data[0][i].PNO+'" class="color2 flex-2">'+data[0][i].PNAME+'</a></td>';
						cart+='<td class="column-3">\\'+numberComma(data[0][i].PRICE)+'</td>';
						cart+='<td class="column-4">';
						cart+='<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center" style="margin:0 0">';
						cart+='<div class="quantity_selector" style="margin:0 0">';
						cart+='<button id="updownbtn" class="btn-num-product-down color1 flex-c-m size7 bg8 eff2" onclick="down_ck(this)"><i class="fs-12 fa fa-minus" aria-hidden="true"></i></button>';
						cart+='<input class="size8 m-text18 t-center num-product" id="num-product" type="number" name="num-product" value='+data[0][i].AMOUNT+' readonly>';
                        cart+='<button id="updownbtn" class="btn-num-product-up color1 flex-c-m size7 bg8 eff2" onclick="up_ck(this)"><i class="fs-12 fa fa-plus" aria-hidden="true"></i></button>';
						cart+='</div>';
						cart+='</div>';
						cart+='</td>';
						cart+='<td class="column-5">';
						cart+='<a href="#" onclick="fn_updateCart('+data[0][i].PNO+',this)" class="color1 flex-2">변경</a>';
						cart+='</td>';
						cart+='<td class="column-6">\\'+numberComma(totalprice)+'</td>';
						cart+='<td class="column-7">';
						cart+='<a href="#" onclick="fn_deleteCart('+data[0][i].PNO+',this)" class="color1 flex-2" draggable="false"><i class="fa fa-times"></i></a>';
						cart+='</td>';
						cart+='</tr>';
						cartCount++;
						total=Number(total)+Number(totalprice);
					}
					if(total<50000) delivery=3000;
					all = Number(total)+Number(delivery);
					
					if(data[0].length==0){
						cart+='<tr class="table-row" id="cart_list">';
						cart+='<td colspan="7" style="text-align:center">장바구니에 담긴 상품이 없습니다.</td>';
						cart+='</tr>';
					}
				}
				$('#cart_list').html(cart);
				$('#cart_total_1').html("\\"+numberComma(total));
				$('#cart_total_2').html("\\"+numberComma(delivery));
				$('#cart_total_3').html("\\"+numberComma(all));
				$('#allPrice').val(all);
			},
			error:function(jxhr,textStatus,error){
				console.log("cartList ajax 실패 : "+jxhr+" "+textStatus+" "+error);
			}
		});
	}
	
	// 수량 클릭 이벤트
	function down_ck(obj){
		var num=$(obj).next().val();
	    if(num > 1) $(obj).next().val(--num);
	}
	function up_ck(obj){
		var num=$(obj).prev().val();
	    if(num < 10) $(obj).prev().val(++num);
	}
	
	// 통화로 변경(세자리 콤마)
	function numberComma(price){
	    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// 주문 페이지 이동
	function fn_cart_order(){
		var userId = $('#userId').val();
		var allPrice = $('#allPrice').val();
		if(allPrice>3000){
			// 재고 확인
			$.ajax({
				type:"get",
				url:'${path}/mall/productCount.do',
				data:{userId:userId},
				datatype:"json",
				success:function(data){
					console.log(data);
					var name="";
					var err=0;
					for(var i=0;i<data[0].length;i++){
						if(data[0][i].PCOUNT<data[0][i].AMOUNT){
							cnt=data[0][i].PCOUNT;
							swal("["+data[0][i].PNAME+"] 부족", "해당 상품의 재고가 부족해 주문이 불가합니다.\n현재 주문가능 개수는 "+cnt+"개 입니다.", "warning");
							err++;
						}
					}
					if(err==0)
						location.href='${path}/mall/orderForm.do?userId='+userId;
				},
				error:function(jxhr,textStatus,error){
					console.log("재고 확인 ajax 실패 : "+jxhr+" "+textStatus+" "+error);
				}
			});
		} else {
			swal("장바구니 텅텅", "장바구니에 담긴 상품이 없습니다.\n상품을 하나 이상 구매해주세요.", "warning");
		}
	}
	
	// 수량 변경
	function fn_updateCart(pno,obj){
		var userId = $('#userId').val();
		var amount=$(obj).parent().prev().children().children().children().next().val();
		var pName=$(obj).parent().prev().prev().prev().text();
		$.ajax({
			type:"get",
			url:'${path}/mall/updateAmount.do',
			data:{userId:userId,pno:pno,amount:amount},
			datatype:"json",
			success:function(data){
				swal("["+pName+"]", "수량이 "+amount+"개로 변경되었습니다", "success");
				cart_ck();
			},
			error:function(jxhr,textStatus,error){
				console.log("수량 변경 ajax 실패 : "+jxhr+" "+textStatus+" "+error);
			}
		});
	}
	
	// 장바구니 상품 삭제
	function fn_deleteCart(pno,obj){
		var userId = $('#userId').val();
		var pName=$(obj).parent().prev().prev().prev().prev().prev().text();
		$.ajax({
			type:"get",
			url:'${path}/mall/deleteCart.do',
			data:{userId:userId,pno:pno},
			datatype:"json",
			success:function(data){
				swal("["+pName+"]", "장바구니의 상품이 삭제되었습니다", "error");
				cart_ck();
				fn_cartCount();
			},
			error:function(jxhr,textStatus,error){
				console.log("장바구니 삭제 ajax 실패 : "+jxhr+" "+textStatus+" "+error);
			}
		});
	}
</script>


