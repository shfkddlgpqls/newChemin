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

    <!-- Title Page -->
    <section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(${path}/resources/mall/img/food.jpg);">
        <h2 class="l-text2 t-center">
            Order
        </h2>
    </section>
<!--  -->
    <!-- 구매할 상품 리스트 (수량은 1~20개 : mall.js에서 변경) -->
    <!-- Cart -->
	<section class="cart bgwhite p-t-70 p-b-100">
        <div class="container">
            <!-- Cart item -->
            <h4 class="m-text26 p-b-36 p-t-15">
               	주문상품 정보
            </h4>
            <div class="container-table-cart pos-relative">
                <div class="wrap-table-shopping-cart bgwhite">
                    <table class="table-shopping-cart">
                        <tr class="table-head">
                            <th class="column-1"></th>
                            <th class="column-2">Product</th>
                            <th class="column-3">Price</th>
                            <th class="column-4">Quantity</th>
                            <th class="cloumn-6">Total</th>
                        </tr>

                        <tr class="table-row">
                            <td class="column-1">
                                <div class="cart-img-product b-rad-4 o-f-hidden">
                                    <img src="${path}/resources/mall/img/room1.jpg" alt="IMG-PRODUCT" draggable="false">
                                </div>
                            </td>
                            <td class="column-2">Men Tshirt</td>
                            <td class="column-3">$36.00</td>
                            <td class="column-4">2</td>
                            <td class="column-6">$36.00</td>
                        </tr>

                    </table>
                </div>
            </div>
       	</div>
     </section>

            <!-- content page -->
	<section class="bgwhite p-b-60" style="padding-top:0">
		<div class="container">
			<div class="row">
                <div class="col-md-6 p-b-30" style="padding-right: 5%">
					<form class="leave-comment">
						<h4 class="m-text26 p-b-36 p-t-15">
                           	주문자 정보
                        </h4>

						<table style="width: 100%;height: 100%;">
                            <colgroup>
                                <col style="width: 20%">
                                <col style="width: 80%">
                            </colgroup>
                            <tr>
                                <th>이름</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="name" placeholder="주문자명">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="phone-number" placeholder="(-) 제외하고 입력">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="email" name="email" placeholder="ex) 아이디@gmail.com">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <div class="of-hidden size15 m-b-20">
                                        <p style="">* 입력된 메일주소로 주문확인 메일을 발송해드립니다.</p>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>

				</div>
				<div class="col-md-6 p-b-30">
					<form class="leave-comment">
                        
						<h4 class="m-text26 p-b-36 p-t-15">
							배송지 정보
							<span style="float:right;">
								<table>
									<tr style="width:120%;float:right;">
										<td><input type="checkbox" id="same" style="width:20px;height:20px;"/></td>
										<td style="width:120%"><label class="agree" for="same">&nbsp;주문자 정보와 동일</label></td>
									</tr>
								</table>
							</span>
                        </h4>

						<table style="width: 100%;height: 100%;">
                            <colgroup>
                                <col style="width: 20%">
                                <col style="width: 80%">
                            </colgroup>
                            <tr>
                                <th>이름</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="name" placeholder="Full Name">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="phone-number" placeholder="Phone Number">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="email" placeholder="Email Address">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="address" placeholder="Home Address" style="width:60%" readonly>
                                        <a href="#" class="m-text22 p-l-30" style="width:40%" draggable="false">우편번호 검색</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="address" placeholder="Home Address">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="address" placeholder="Home Address">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>배송메시지</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="name" placeholder="ex) 부재시 경비실">
                                    </div>
                                </td>
                            </tr>   
                        </table>

					</form>
				</div>
			</div>

            <!-- Total -->
            <div class="row bo5">

                <div class="p-l-40 p-r-40 p-t-30 p-b-38 m-t-30 m-r-0 p-lr-15-sm col-md-6">
                    <h4 class="m-text26 p-b-36">
                    	결제 금액
                    </h4>
                    
                    <!--  -->
                    <div class="flex-w flex-sb-m p-b-12">
                        <span class="s-text18 w-size19 w-full-sm">
                           	총 상품금액 :
                        </span>
    
                        <span class="m-text21 w-size20 w-full-sm">
                            $39.00
                        </span>
                    </div>
    
                    <!--  -->
                    <div class="flex-w flex-sb p-t-15 p-b-20">
                        <span class="s-text18 w-size19 w-full-sm">
                           	배송비 :
                        </span>
    
                        <span class="m-text21 w-size20 w-full-sm">
                            $39.00
                        </span>
                    </div>
    
                    <!--  -->
                    <div class="flex-w flex-sb-m p-t-26 p-b-30 bo10">
                        <span class="m-text22 w-size19 w-full-sm">
                           	최종결제금액 :
                        </span>
    
                        <span class="m-text21 w-size20 w-full-sm">
                            $39.00
                        </span>
                    </div>
    
                </div>

                <div class="p-l-40 p-r-40 p-t-30 p-b-38 m-t-30 m-r-0 p-lr-15-sm col-md-6">
    				<h4 class="m-text26">
                    	주문자 동의
                    </h4>
                    <div class="flex-w flex-sb p-t-30 p-b-30">
                        <input type="checkbox" id="agree" style="width:20px;height:20px"><label class="agree" for="agree" style="color: black">결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
                        <br><br>
                        <ul style="list-style-type: circle;font-size: 15px;color: gray">
                            <li>구매조건 확인 및 결제 진행 동의</li>
                            <li>개인정보 수집 이용 및 제3자 정보 제공 동의</li>
                            <li>결제대행서비스 이용약관 동의</li>
                        </ul>
                    </div>
    
                    <div class="size15 trans-0-4">
                        <!-- Button -->
                        <button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" style="border:none;outline: none;">
                           	결제하기
                        </button>
                    </div>
                </div>

            </div>
            

        </div>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>