<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

 <!-- 마이페이지 css-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/base/css/mypage.css">
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/mall.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    
    <style>
    	a {
    		color:gray;
    	}
    </style>
  
	
   <div class="mypage">
      <h2 class="text-center">마이페이지 입니당</h2>
   </div>
      
   
   <div class="container">
      <div class="row">
         
            <div class="col-md-12">
               <hr>
                  <ul class="nav justify-content-center">
                      <li class="nav-item">
                        <strong><a class="nav-link mypageAtag" href="${path }/mypage/myOrderList.do">주문 목록</a></strong>
                      </li>
                      <li class="nav-item">
                        <strong><a class="nav-link mypageAtag" href="${path }/mypage/myBoardList.do">게시글 관리</a></strong>
                      </li>
                      <li class="nav-item">
                           <strong><a class="nav-link mypageAtag" href="${path }/mypage/myWishList.do">찜 목록</a></strong>
                      </li>
                      <li class="nav-item">
                           <strong><a class="nav-link mypageAtag" href="${path }/mypage/myPlaceList.do?userId=hyebeen">장소 등록 내역</a></strong>
                      </li>
                    </ul>
                    <hr>
            </div>
         </div>   
      </div>
      
<section>
		<div class="container">
		<div class="row">
		  
		  <div class="col-md-1"></div>
		  
	
		  	<div class="col-md-10">
		  	
		  	<div>
		  		<h3>찜 목록</h3>
		  		<br>
		  	</div>		
		  		<div class="table-responsive">
	   			 <table id="review" class="table">
		   			 <colgroup>
		   			 	<col width="20%">
		   			 	<col width="30%">
		   			 	<col width="20%">
		   			 	<col width="20%">
		   			 	<col width="10%">
		   			 </colgroup>
				      <thead>
				        <tr class="table-head">
				          <th></th>
				          <th>상품명</th>
				          <th>금액</th>
				         <th></th>
				         <th></th>
				        </tr>
				      </thead>
				      
				      <tbody id="wish_table">
				        <!-- <tr>
				        	<td></td>
				        	<td>바나나</td>
				        	<td>8,000원</td>
				        	<td>
				        		<button type="button" class="btn btn-sm btn-success">장바구니에 추가</button>
				        		<button type="button" class="btn btn-sm btn-danger"  onclick="fn_delete();">삭제</button>
				        	</td>
				        </tr>  -->   
				     </tbody>
				  </table>
		   		 </div>
		   		 
		  	  <div class="col-md-1"></div>  
		</div> 	
		</div>
		</section> 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  

<script>
	$(function(){
		fn_wishList();
	});
	function fn_wishList(){
		$.ajax({
			type:"get",
			url:"${path}/mypage/wishListData.do",
			datatype:"json",
			success:function(data){
				console.log(data);
				var view="";
				if(data!=null){
					for(var i=0;i<data[0].length;i++){
						view+='<tr>';
						view+='<td>';
						view+='<div class="cart-img-product b-rad-4 o-f-hidden">';
						view+='<img src="${path}/resources/upload/productImg/'+data[0][i].REIMG+'" alt="IMG-PRODUCT" draggable="false">';
						view+='</div>';
						view+='</td>';
						view+='<td><a href="${path}/mall/detail.do?no='+data[0][i].PNO+'" class="color2 flex-2">'+data[0][i].PNAME+'</a></td>';
						view+='<td>'+numberComma(data[0][i].PRICE)+'원</td>';
						view+='<td><button type="button" class="btn btn-sm btn-info" onclick="fn_cartAdd('+data[0][i].PNO+')">장바구니에 추가</button>';
						view+='</td>';
						view+='<td>';
						view+='<a href="#" onclick="fn_deleteWish('+data[0][i].PNO+')" class="color1 flex-2" draggable="false"><i class="fa fa-times"></i></a>';
						view+='</td>';
						view+='</tr>';
					}
					if(data[0].length==0){
						view+='<tr class="table-row" id="cart_list">';
						view+='<td colspan="5" style="text-align:center">찜한 상품이 없습니다.</td>';
						view+='</tr>';
					}
				}
				$('#wish_table').html(view);
			},
			error:function(jxhr,textStatus,error){
				console.log("wishList ajax 실패 : "+jxhr+" "+textStatus+" "+error);
			}
		});
	}
	// 통화로 변경(세자리 콤마)
	function numberComma(price){
	    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function fn_deleteWish(no){
		$.ajax({
			type:"get",
			url:'${path}/mall/wishList.do',
			data:{pno:no},
			datatype:"json",
			success:function(data){
				if(data==-1){
					swal("찜 취소", "찜한 상품을 취소하였습니다", "error");
				}
				fn_wishList();
			},
			error:function(jxhr,textStatus,error){
				console.log("wish 삭제 ajax 실패 : "+jxhr+" "+textStatus+" "+error);
			}
		});
	}
	function fn_cartAdd(pno){
		var userId = $("#userId").val();
		var amount=1;
		$.ajax({
          type:"get",
          url:"${path}/mall/cartAdd.do",
          data:{pno:pno,amount:amount,userId:userId},
          datatype:"json",
          success:function(data){
             if(data==1){
             	fn_cartCount();
                swal
                ({
                   title: "장바구니 추가",
                    text: "장바구니 상품은 7일간 보관됩니다.\n확인하러 장바구니로 이동하시겠습니까?!",
                    icon: "success",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willDelete) => {
                   if (willDelete) {
                      location.href="${path}/mall/cartList.do"; 
                   } else {
                      return;
                   }
                });
             } else if(data==0){
                swal("장바구니 추가 실패", "장바구니에 상품 추가를 실패하였습니다.\n로그인 후 이용하세용", "error");
             } else {
                /* 상품이 이미 들어있는 경우 */
                swal
                ({
                   title: "장바구니 존재",
                    text: "장바구니에 상품이 이미 존재합니다.\n확인하러 장바구니로 이동하시겠습니까?!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willDelete) => {
                   if (willDelete) {
                      location.href="${path}/mall/cartList.do"; 
                   } else {
                      return;
                   }
                });
             }
          },
             error:function(jxhr,textStatus,error){
                console.log("wish cart ajax 실패 : "+jxhr+" "+textStatus+" "+error);
             }
       });
	}
</script>