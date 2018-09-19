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
    
    <!-- 우편번호 -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <!-- 결제 -->
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

    <!-- Title Page -->
    <section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(${path}/resources/mall/img/food.jpg);">
        <h2 class="l-text2 t-center">
            Order
        </h2>
    </section>

    <!-- 구매할 상품 리스트 -->
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

						<c:forEach items="${list }" var="c">
	                        <tr class="table-row">
	                            <td class="column-1">
	                                <div class="cart-img-product b-rad-4 o-f-hidden">
	                                    <img src="${path}/resources/upload/productImg/${c.REIMG}" alt="IMG-PRODUCT" draggable="false">
	                                </div>
	                            </td>
	                            <td class="column-2">${c.PNAME }</td>
	                            <td class="column-3"><fmt:formatNumber value="${c.PRICE }" type="currency"/></td>
	                            <td class="column-4">${c.AMOUNT }</td>
	                            <td class="column-6"><fmt:formatNumber value="${c.TOTALPRICE }" type="currency"/></td>
	                        </tr>
	                        <input type="hidden" value="${c.ORDERNO }" id="orderNo"/>
	                        <input type="hidden" value="${c.PNAME }" id="pName"/>
                        </c:forEach>
                        <input type="hidden" value="${memberLoggedIn.userId }" id="userId"/>

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
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="name" id="name" placeholder="주문자명" value="${member.USERNAME }">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="phone-number" id="phone" placeholder="(-) 제외하고 입력" value="${member.USERPHONE }">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="email" name="email" id="email" placeholder="ex) 아이디@gmail.com" value="${member.USEREMAIL }">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <div class="of-hidden size15 m-b-20">
                                        <p>* 입력된 메일주소로 주문확인 메일을 발송해드립니다</p>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>

				</div>
				<div class="col-md-6 p-b-30">
					<form class="leave-comment" name="orderData">
                        
						<h4 class="m-text26 p-b-36 p-t-15">
							배송지 정보
							<span style="float:right;">
								<table>
									<tr style="width:120%;float:right;">
										<td><input type="checkbox" id="sameInfo" name="sameInfo" style="width:20px;height:20px;"/></td>
										<td style="width:120%"><label class="agree" for="sameInfo">&nbsp;주문자 정보와 동일</label></td>
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
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="name" id="orderName" placeholder="Full Name" required="required">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="phone-number" id="orderPhone" placeholder="Phone Number" required="required">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="email" id="orderEmail" placeholder="Email Address" required="required">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="address" id="postcode" placeholder="우편번호" style="width:60%" readonly required="required">
                                        <a href="#;return false;" onclick="fn_postcode()" class="m-text22 p-l-30" style="width:40%" draggable="false">우편번호 검색</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="address" id="address1" placeholder="주소 입력" required="required" readonly="readonly">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="address" id="address2" placeholder="상세주소 입력" required="required">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>배송메시지</th>
                                <td>
                                    <div class="bo4 of-hidden size15 m-b-20">
                                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="name" id="orderNote" placeholder="ex) 부재시 경비실">
                                    </div>
                                </td>
                            </tr>   
                        </table>

					</form>
				</div>
			</div>

            <!-- Total -->
            <div class="row bo5 m-l-1 m-r-1">

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
                            <fmt:formatNumber value="${pay.total }" type="currency"/>
                        </span>
                    </div>
    
                    <!--  -->
                    <div class="flex-w flex-sb p-t-15 p-b-20">
                        <span class="s-text18 w-size19 w-full-sm">
                           	배송비 :
                        </span>
    
                        <span class="m-text21 w-size20 w-full-sm">
                            <fmt:formatNumber value="${pay.delivery }" type="currency"/>
                        </span>
                    </div>
    
                    <!--  -->
                    <div class="flex-w flex-sb-m p-t-26 p-b-30 bo10">
                        <span class="m-text22 w-size19 w-full-sm">
                           	최종결제금액 :
                        </span>
    
                        <span class="m-text21 w-size20 w-full-sm">
                            <fmt:formatNumber value="${pay.all }" type="currency"/>
                        </span>
                        <input type="hidden" value="${pay.all }" id="all"/>
                    </div>
    
                </div>

                <div class="p-l-40 p-r-40 p-t-30 p-b-38 m-t-30 m-r-0 p-lr-15-sm col-md-6">
    				<h4 class="m-text26">
                    	주문자 동의
                    </h4>
                    <div class="flex-w flex-sb p-t-30 p-b-30">
                        <input type="checkbox" id="agree" name="agreePay" style="width:20px;height:20px">
                        <label class="agree" for="agree" style="color: black">결제정보를 확인하였으며, 구매진행에 동의합니다</label>
                        <br><br>
                        <ul style="list-style-type: circle;font-size: 15px;color: gray">
                            <li>구매조건 확인 및 결제 진행 동의</li>
                            <li>개인정보 수집 이용 및 제3자 정보 제공 동의</li>
                            <li>결제대행서비스 이용약관 동의</li>
                        </ul>
                    </div>
    
                    <div class="size15 trans-0-4">
                        <!-- Button -->
                        <button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" onclick="fn_payment()" style="border: none;outline: none;">
                           	결제하기
                        </button>
                    </div>
                </div>

            </div>
            

        </div>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
	$(document).ready(function(){
		// 결제 포트
		IMP.init('imp03138552');
		
		$('input:checkbox[name=sameInfo]').on('click',function(){
			if($(this).prop('checked')){
				$('#orderName').val('${member.USERNAME}');
				$('#orderPhone').val('${member.USERPHONE}');
				$('#orderEmail').val('${member.USEREMAIL}');
			} else {
				$('#orderName').val('');
				$('#orderPhone').val('');
				$('#orderEmail').val('');
			}
		});
	});
	
	function fn_postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
    }
	
	function fn_payment(){
		var userId = $('#userId').val();
		var orderNo = $('#orderNo').val();
		var pName = $('#pName').val();
		var name = $('#orderName').val();
		var phone = $('#orderPhone').val();
		var email = $('#orderEmail').val();
		var postcode = $('#postcode').val();
		var addr1 = $('#address1').val();
		var addr2 = $('#address2').val();
		var note = $('#orderNote').val();
		var all = $('#all').val();
		var cartCount = $('#cartCount').text();
		
		if(name=='') {
			$('#orderName').focus();
			return false;
		}
		if(phone=='') {
			$('#orderPhone').focus();
			return false;
		}
		if(email=='') {
			$('#orderEmail').focus();
			return false;
		}
		if(postcode=='' || addr1=='' || addr2=='') {
			$('#address2').focus();
			return false;
		}
			
		if($('input:checkbox[name=agreePay]').prop('checked')){
			var address = addr1+" "+addr2;
			
			IMP.request_pay({
				merchant_uid : orderNo,
			    name : cartCount==1?pName:pName+" 외 "+(cartCount-1)+"개",
			    amount : all,
			    buyer_email : email,
			    buyer_name : name,
			    buyer_tel : phone,
			    buyer_addr : address,
			    buyer_postcode : postcode,
			}, function(rsp) {
				//결제 후 호출되는 callback함수
				if ( rsp.success ) { //결제 성공
					var msg="상품이 성공적으로 주문되었습니다\n";
					msg += '주문번호 : ' + rsp.merchant_uid + '\n';
					msg += '결제 금액 : ' + rsp.paid_amount + '원\n';
					msg += '카드 승인번호 : ' + rsp.apply_num;
					swal("결제 완료", msg, "success")
					.then((value) => {
						location.href= "<c:url value='/mall/orderConfirm.do?userId="+userId+"&orderNo="+rsp.merchant_uid+"&orderName="+name+"&orderPhone="+phone+"&zipcode="+postcode+"&orderAddr="+address+"&payment="+rsp.apply_num+"&allPrice="+all+"&orderNote="+note+"'/>";
					});
				    
				} else {
					swal("결제 실패", rsp.error_msg, "error");
				}
			})
		} else {
			swal("잠시만요!", "구매조건 확인 및 결제 진행에 동의해 주시기 바랍니다.", "warning");
		}
	}
</script>