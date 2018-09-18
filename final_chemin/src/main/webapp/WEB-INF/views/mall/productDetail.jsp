<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
  
<jsp:include page="/WEB-INF/views/common/header1.jsp"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

<!-- 상세보기 css-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/base/css/mall.css">
    <script src="<c:url value="/resources/base/js/productDetail.js" />"></script>

 <style>


.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}

.pagination a:active {
    background-color: #ffd6f4; !important;
    color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
 </style>


 <script>

 // 상품 정보를 장바구니에 넘기기 위해서 해당 상품 정보 전달 
 $(function () 
{
 	
    
    $(".cart").click(function(){
       var amount =  $("#quantity_value").text();  
       var pno = $("#pNo").val();
       var pName = $("#goodsName").text();
       var userId = $("input:hidden[name=userId]").val();
       
       $.ajax({
          type:"get",
          url:"${path}/mall/cartAdd.do",
          data:{pno:pno,amount:amount,userId:userId},
          datatype:"json",
          success:function(data){
             if(data==1){
                swal
                ({
                   title: "["+pName+"] 추가",
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
                swal("["+pName+"] 추가 실패", "장바구니에 상품 추가를 실패하였습니다.\n로그인 후 이용하세용", "error");
             } else {
                /* 상품이 이미 들어있는 경우 */
                swal
                ({
                   title: "["+pName+"] 존재",
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
                console.log("productDetail ajax 실패 : "+jxhr+" "+textStatus+" "+error);
             }
       });
    });   
 });
 
   //찜 alert
   function fn_wishList() 
   {
	   var pName = $("#goodsName").text();
	   var pno = $('#pNo').val();
	   $.ajax({
	          type:"get",
	          url:"${path}/mall/wishList.do",
	          data:{pno:pno},
	          datatype:"json",
	          success:function(data){
	        	  console.log(data);
	        	  if(data==1){
	        		  swal
	                  ({
	                     title: "["+pName+"] 찜 등록",
	                      text: "상품을 찜하였습니다.\n확인하러 이동하시겠습니까?!",
	                      icon: "success",
	                      buttons: true,
	                      dangerMode: true,
	                  })
	                  .then((willDelete) => {
	                     if (willDelete) {
	                        location.href="${path}/mypage/myWishList.do"; 
	                     } else {
	                        return;
	                     }
	                  });
	        	  } else if(data==-1){
	        		  swal
	                  ({
	                     title: "["+pName+"] 찜 취소",
	                      text: "찜한 상품을 취소하였습니다.\n확인하러 이동하시겠습니까?!",
	                      icon: "error",
	                      buttons: true,
	                      dangerMode: true,
	                  })
	                  .then((willDelete) => {
	                     if (willDelete) {
	                        location.href="${path}/mypage/myWishList.do"; 
	                     } else {
	                        return;
	                     }
	                  });
	        	  } else if(data==0){
	        		  swal("["+pName+"] 찜 실패", "찜 등록에 실패하였습니다.\n로그인 후 이용하세용", "error");
	        	  }
	          },
             error:function(jxhr,textStatus,error){
                 console.log("wish ajax 실패 : "+jxhr+" "+textStatus+" "+error);
              }
        }); 
   };
   
   $(document).ready(function(){
	   $("#wishB").on('click', function(e){
			$(this).removeClass("active");
		});
   });
   
   function fn_pwCheck() 
   {
         var dbPW = $("pNo").val();
         alert(dbPW);
   };
   
   
   //문의하기 모달에 문의 유형 카테고리 값 받기
   function fn_selectbox()
   {
       var target = $("#qna_option option:selected").val();
       
       if(target==1)
      {
          $("#board_name").val("상품 문의 글입니다.");
      }
       else if(target==2)
      {
          $("#board_name").val("교환 문의 글입니다.");
      }
       else if(target==3)
      {
          $("#board_name").val("환불 문의 글입니다.");
      }
       else if(target==4)
       {
           $("#board_name").val("반품 문의 글입니다.");
       }
       else 
      {
          $("#board_name").val("기타 문의 글입니다.");
      } 
   };
   
 //비밀번호가 일치했을 때 글번호를 넣어주는 배열 생성
   var boardArray = new Array();
   
   //글 작성시 설정한 비밀번호 확인 창 띄워주기(pno에서 비밀번호로 바꿔주기)
   function fn_inputPw(no,obj) 
   {
	  var pw = $(obj).attr('value');
//	  alert(pw);
	   
	  console.log(boardArray); 
	  
	  $('#pw_db').val(pw);
	  $('#modal_pno').val(no);
	  
	  /*
	  1. 배열의 값이 0일 때 > 모달 창
	  2. 배열이 값이 1이상이지만 일치하는 값이 없으면 > 모달창
	  3. 일치하면 토글 열어주기
	  */
	  
	  //관리자면 토글이 바로 내려오기
	  if('$(memberLoggedIn.userId)'=='admin')
	  {
		  $("."+no).toggle();
	  }	  
	  else if(boardArray.length==0)
	  {
		  $("#pwCheck").modal();
	  }	  
	 //배열 중에 방금 클릭한 게시글의 글 번호가 없으면 모달 띄워주기
	  else (boardArray.length>0)
	  {	  
		  if(!boardArray.some(function(ex) {return ex==no}))
      	  {  
		     $("#pwCheck").modal();	 
	      }
		  else
		  {
			 
			  $("#pwCheck").modal("hide"); 
			  $("."+no).toggle();
			  $("."+no).attr('display','inline-block');
			  
		  }	  
	  }	           
   };  
   
   //글 작성시 설정한 비밀번호와 사용자가 지금 입력한 비밀번호가 맞는지 확인하는 함수
   function fn_pwConfirm() 
   {
	  console.log(boardArray);
	   
      var db_pw = $("#pw_db").val().trim();
      var user_pw = $("#board_pw").val().trim();
      var board_qno = $("#modal_pno").val();
      
      //숫자만 가려내는 정규표현식
      regNumber = /^[0-9]*$/;
      
      //숫자가 아닌 문자 입력했을시에
      if(!regNumber.test(user_pw))
       {
         alert("숫자만 입력하세요");
          return;
       }
      //비밀번호가 4글자 미만일 때 : 4 숫자 바꿔줘야한다
      else if(user_pw.length<4)
      {
          alert("비밀번호는 4자리입니다. 숫자 4자리를 입력해주세요.");
      }
      else
      {
         if(db_pw==user_pw)
          {
        	    boardArray.push(parseInt(board_qno));
        	    console.log(boardArray);
	            alert("비밀번호가 일치합니다."); 
	            $("#pwCheck").modal("hide"); 
         }
         else
         {
            alert("비밀번호가 틀렸습니다. 다시 입력해주세요"); return;
         }      
         
      }         
   };
   
   //입력하기 모달창에 제품 정보 넣어주기
   function fn_insertDetails() 
   {
      var pno = $("#pNo").val();
      var pName = $("#pName").val();
        
      $("#question_modal").modal();
      $('#goods_code').val(pno);     
      $('#goods_name').val(pName);
   }
   
   function fn_checkUserPw() 
   {
     
      var user_content = $("#qna_content").val().trim();
      var user_pw = $("#user_input_pw").val().trim();
      var cate_name = $("#board_name").val().trim();
     
      //숫자만 가려내는 정규표현식
      regNumber = /^[0-9]*$/;
      
      if(cate_name.length==0)
      {
        alert("좌측의 문의 유형을 선택해주세요.");
        return;
      }     
      else if(user_content.length==0)
      {
         alert("문의 내용을 입력해주세요");    
         return;
      }
      //숫자가 아닌 문자 입력했을시
      else if(!regNumber.test(user_pw))
       {
         alert("숫자만 입력하세요");
          return;
       }
      //비밀번호가 4글자 미만일 때 : 4 숫자 바꿔줘야한다
      else if(user_pw.length<4)
      {
          alert("비밀번호는 4자리입니다. 숫자 4자리를 입력해주세요.");
          return;
      }
      else
      {
        $("#qnaFrm").submit();
      }   
   };
   
 function fn_qna(cPage) 
   {
      //pno > var로 받기 
      var pno = $("#pNo").val(); 
      //userId > var로 받기
      var userId = $("#userId").val();
      
      $.ajax
      ({
          url:"${path}/mall/qnaPage.do",
          data:{pno:pno,cPage:cPage},
          dataType:"json",    
          success : function(data) 
          {
        	var view = "";
         	console.log(data);
         	
            if(data!=null)
            {
               var num = data.length-1;
               var qnaPageBar = data.pageBar; 
              
               //alert(qnaPageBar); undefined
               console.log(qnaPageBar);
                               
               for(var i=0; i<data.list.length;i++)
               {
                  //화면 추가해주기
                  if(i==0)
                  {
                		  view += "<tr><td class='text-center'>"+data.list[i].qnaNo+"</td>";
                		  view +="<td class='text-center'>"+fn_cate(data.list[i].qna_cate_no)+"</td>";
                		  view += "<td class='text-center'><a onclick='fn_inputPw("+data.list[i].qnaNo+",this)' value='"+data.list[i].qnaPw+"' >"+data.list[i].qnaTitle+"</a></td>";  
                		  view += "<td class='text-center'>"+data.list[i].userId+"</td>";
                		  view += "<td class='text-center'>"+data.list[i].qnaDate+"</td>";
                		  
                		  if(data.list[i].qnaState=='답변대기')
                          {
                       		view += "<td class='text-center'><span class='badge badge-warning'>답변대기</span></td>";
                          }	   
                          else view += "<td class='text-center'><span class='badge badge-primary'>답변완료</span></td>";
                		  
                		 
                		  view += "<input type='hidden' id='db_pw' name='dn_pw' value='"+data.list[i].qnaPw+"'</tr>";                   
                		  view += "<tr><td class='"+data.list[i].qnaNo+"' colspan='6' class='text-center' style='display:none;'>";
                		  view+="<div><p class='text-center'><br>"+data.list[i].qnaContent+"</p><hr></div>"; 
                      	  
                      	  if(data.list[i].reply_content==null)
                      	  {
                      		 view+= "<div><p class='text-center'><br> 아직 답변이 작성되지 않았습니다. 조금만 기다려주세요! <br></p></div></td></tr>";
                      	  }	  
                      	  else
                      	  {
                      		  view+= "<div><p class='text-center'><br>안녕하세요,고객님. Free Fleuri의 스탭 영지니주리입니다 ^^ <br>"+data.list[i].reply_content+"</p></div></td></tr>";
                      	  }
                       

                  }
                  else
                  {
                	  view += "<tr><td class='text-center'>"+data.list[i].qnaNo+"</td>";
            		  view +="<td class='text-center'>"+fn_cate(data.list[i].qna_cate_no)+"</td>";
            		  view += "<td class='text-center'><a onclick='fn_inputPw("+data.list[i].qnaNo+",this)' value='"+data.list[i].qnaPw+"' >"+data.list[i].qnaTitle+"</a></td>";  
            		  view += "<td class='text-center'>"+data.list[i].userId+"</td>";
            		  view += "<td class='text-center'>"+data.list[i].qnaDate+"</td>";
            		  
            		  if(data.list[i].qnaState=='답변대기')
                      {
                   		view += "<td class='text-center'><span class='badge badge-warning'>답변대기</span></td>";
                      }	   
                      else view += "<td class='text-center'><span class='badge badge-primary'>답변완료</span></td>";
            		  
            		 
            		  view += "<input type='hidden' id='db_pw' name='dn_pw' value='"+data.list[i].qnaPw+"'</tr>";                   
            		  view += "<tr><td class='"+data.list[i].qnaNo+"' colspan='6' class='text-center' style='display:none;'>";
            		  view+="<div><p class='text-center'><br>"+data.list[i].qnaContent+"</p><hr></div>"; 
                  	  
                  	  if(data.list[i].reply_content==null)
                  	  {
                  		 view+= "<div><p class='text-center'><br> 아직 답변이 작성되지 않았습니다. 조금만 기다려주세요! <br></p></div></td></tr>";
                  	  }	  
                  	  else
                  	  {
                  		  view+= "<div><p class='text-center'><br>안녕하세요,고객님. Free Fleuri의 스탭 영지니주리입니다 ^^ <br>"+data.list[i].reply_content+"</p></div></td></tr>";
                  	  }
                  }
               }   
           
            }
            else
            {
            	qnaList.innerHTML += "<td class='text-center'>아무것도 없어요</td>";
            }   
            
            $("#qnaList").html(view);   
            $("#qnaPageBar").html(qnaPageBar);   
            
          },
          
          error:function(jxhr,textStatus,error)
          {
              console.log("mainMall ajax 실패 : "+jxhr+" "+textStatus+" "+error); 
         }         
      });
   } 
   
   //카테고리 번호를 카테고리 한글로 바꿔주기
   function fn_cate(cate) 
   {
	   var name = "";
	   
	   if(cate==1)
	   {
		   name +="상품 문의";
	   } 	   
	   else if(cate==2)
	   {
		   name +="교환 문의";
	   }
	   else if(cate==3)
	   {
		   name +="환불 문의";
	   }
	   else if(cate==4)
	   {
		   name +="반품 문의";
	   }
	   else if(cate==5)
	   {
		   name +="기타 문의";
	   }
	   
		return name;
	}
   
   function fn_review(cPage)
   {
    	//pno > var로 받기 
        var pno = $("#pNo").val(); 
        //userId > var로 받기
        var userId = $("#userId").val();
        
        $.ajax
        ({
            url:"${path}/mall/reviewPage.do",
            data:{pno:pno,cPage:cPage},
            dataType:"json",    
            success : function(data) 
            {
	          	var view = "";
	           	console.log(data);
	           	
              if(data!=null)
              {
                 var num = data.length-1;
                 var reviewPageBar = data.pageBar; 
                
                 //alert(qnaPageBar); undefined
                 console.log(data);
                                 
                 for(var i=0; i<data.list.length;i++)
                 {
                    //화면 추가해주기
                    if(i==0)//맨 처음에 값 삽입
                    {
                    	view += "<div class='card'> <div class='card-body'>  <div class='row'>";
                    	view += "<div class='col-md-2'><img src='${path}/resources/upload/review/"+data.list[i].reImg+"' class='img img-rounded img-fluid'/></div>";          	
                    	view += "<div class='col-md-10'><p><strong>"+data.list[i].userId+"</strong>님";
                    	                    	
                    	if(data.list[i].stars==5)
                    	{
                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/></span>";
                    	}
                    	else if(data.list[i].stars==4)
                    	{
                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
                    	}
                    	else if(data.list[i].stars==3)
                    	{
                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
                    	}
                    	else if(data.list[i].stars==2)
                    	{
                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
                    	}
                    	else if (data.list[i].stars==1)
                    	{
                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
                    	}
                    		
                    	view += "<span class='float-right'>"+data.list[i].reDate+"</p><div class='clearfix'>";
                    	view += "<p>"+data.list[i].reContent+"</p></div></div></div></div></div></div>";
                    
                    }
                    else//값이 2이상일 때 값들 삽입
                    {
                    	view += "<div class='card'> <div class='card-body'>  <div class='row'>";
                    	view += "<div class='col-md-2'><img src='${path}/resources/upload/review/"+data.list[i].reImg+"' class='img img-rounded img-fluid'/></div>";          	
                    	view += "<div class='col-md-10'><p><strong>"+data.list[i].userId+"</strong>님";
                    	
                    	if(data.list[i].stars==5)
                    	{
                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/></span>";
                    	}
                    	else if(data.list[i].stars==4)
                    	{
                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
                    	}
                    	else if(data.list[i].stars==3)
                    	{
                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
                    	}
                    	else if(data.list[i].stars==2)
                    	{
                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
                    	}
                    	else if(data.list[i].stars==1)
                    	{
                    		view += "<span style='margin-left : 5%'><img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/><img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/></span>";
                    	}
                    	
                    	view += "<span class='float-right'>"+data.list[i].reDate+"</p><div class='clearfix'>";
                    	view += "<p>"+data.list[i].reContent+"</p></div></div></div></div></div></div>";
                    }
                 }   
             
              }
              else
              {
            	  reviewCard.innerHTML += "<td class='text-center'>아무것도 없어요</td>";
              }   
              
              $("#reviewCard").html(view);   
              $("#reviewPageBar").html(reviewPageBar);   
              
            },
            
            error:function(jxhr,textStatus,error)
            {
                console.log("mainMall ajax 실패 : "+jxhr+" "+textStatus+" "+error); 
           }         
        });
   } 

 </script>
 
 


<section>
<div class="container single_product_container">
      <div class="row">
         <div class="col-lg-7">
            <div class="single_product_pics">
               <div class="row">
                  <div class="col-lg-9 image_col order-lg-2 order-1">
                     <div class="single_product_image">
                           
                        <img src="${path}/resources/upload/productImg/${product.reImg }">
                     </div>
                  </div>
               </div>
            </div>
         </div> 

         <div class="col-lg-5">
            <div class="product_details">
               <div class="product_details_title">
               
                  <h2 id="goodsName">${product.pName }</h2>
                  <p id="goodsDetails">${product.details }</p>
                  
               </div>
               
               <!-- fmt tag : 원화 표시로 바꿔주기 -->
               <c:set var='price' value='${product.price }' />

               <div id="goodsPrice" class="product_price">         
                  <fmt:formatNumber value="${price }" type="currency"/>      
                       
                  <input type="hidden" id="pNo" name="pNo" value="${product.pno } ">
                  <input type="hidden" id="pName" name="pName" value="${product.pName } ">

              
               </div>
               <!-- 포맷팅 끝 -->

               <div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
                  <span>수량</span>
                  <div class="quantity_selector">
                     <span class="minus"><i class="fa fa-minus" aria-hidden="true"></i></span>
                     <span id="quantity_value">1</span>
                     <span class="plus"><i class="fa fa-plus" aria-hidden="true"></i></span>
                  </div>
               </div> 
               
                <div style="margin-top:5%">
                <span><h7>해당 상품은 1인당 최대 10개까지 구매 가능합니다.</h7></span>
                </div> 
                
               <div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
                  <span style="margin-right:20px">공유하기</span>
                     <div>
                        <i class="fa fa-2x fa-instagram"  style="margin-right:10px" aria-hidden="true"></i>
                        <i class="fa fa-2x fa-facebook-official"  style="margin-right:10px" aria-hidden="true"></i>
                     </div>
               </div>

               <div class="quantity d-flex flex-column flex-sm-row align-items-sm-center" id="wishBtn">
                   <div class="red_button add_to_cart_button"><a href="#" class="cart">장바구니</a></div> 
                   		<c:if test="${memberLoggedIn==null}">
                   			<div class="product_favorite d-flex flex-column align-items-center justify-content-center" id="wishB" onclick="fn_wishList();"></div>
                   		</c:if>
                   		<c:if test="${memberLoggedIn!=null && wish==null }">
                   			<div class="product_favorite d-flex flex-column align-items-center justify-content-center" onclick="fn_wishList();"></div>
                   		</c:if>
                   		<c:if test="${memberLoggedIn!=null && wish!=null }">
                   			<div class="product_favorite d-flex flex-column align-items-center justify-content-center active" onclick="fn_wishList();"></div>
                   		</c:if>      
            	</div>
            
            </div>
         </div>
      </div>
   </div>
   
   <div class="container">
   
      <div class="shadow-sm p-4 mb-4 bg-white">
      <h2>Review</h2>   
         <h7>실제로 이 제품을 구입한 고객님들의 후기입니다.</h7>
      </div>
      <hr>
      
      <div id="reviewCard">
      	<c:forEach items="${rlist}" var="r">
          	<div class='card'> 
          		<div class='card-body'>  
	            	<div class='row'>
	               		<div class='col-md-2'>
	               			<img src='${path}/resources/upload/review/${r.reImg}' class='img img-rounded img-fluid'/>
	               		</div>          	
	                   	<div class='col-md-10'>
	                   		<p><strong>${r.userId}</strong>님 </p>${r.stars}
	                   		
	                   		<c:set var="star" value="${r.stars}"></c:set>
	                   		
	                   		<span style="margin-left : 5%"> 		
	                   		<c:choose>
	                   			<c:when test="$(star==1)">
	                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			</c:when>	
	                   			
	                   			<c:when test="$(star==2)">
	                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			</c:when>	
	                   			
	                   			<c:when test="$(star==3)">
	                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			</c:when>	
	                   			
	                   			<c:when test="$(star==4)">
	                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			   <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
	                   			</c:when>	
	                   			
	                   			<c:when test="$(star==5)">
	                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
	                   			    
	                   			</c:when>	
	                   		</c:choose>
	                   		
	                   		</span>
	                   		
	                   		<span class='float-right'>${r.reDate}</span>
		                   	<div class='clearfix'>
		                   		<p>${r.reContent}</p>
		                   	</div>
	                   	</div>
	                 </div>
	             </div>
           	</div>
           	</c:forEach>
    	</div>
              
          <br>
          
          <!-- 페이징바 -->
	      <div class="row justify-content-center" id="reviewPageBar">
			<c:if test="${not empty reviewbar }">
          		${reviewbar }
          	</c:if>
	      </div>
     
     <div class="shadow-sm p-4 mb-4 bg-white">
      <h2>Q&A</h2>   
         <h7>상품에 대한 문의사항이 있다면 알려주세요.</h7><br>
          <h7>본인이 작성한 글의 제목을 클릭하면 작성한 내용을 볼 수 있습니다.</h7>
      </div>
      
         <div class="table">
                <table id="qna" class="table">
                  <thead>
                    <tr>
                      <th class="text-center">글 번호</th>
                      <th class="text-center">카테고리</th>
                      <th class="text-center">제목</th>
                      <th class="text-center">작성자</th>            
                      <th class="text-center">등록일</th>
                      <th class="text-center">답변 상태</th>
                    </tr>
                  </thead>
                  
                  <tbody id="qnaList">
                  <c:forEach items="${qlist }" var="q">
                  
                     <tr>
                     	<td class='text-center'>${q.qnaNo}
                     	</td>
		                    <c:choose>
		  						<c:when test="${q.qna_cate_no==1 }">
		  						 <td class='text-center'>상품문의</td>
		  						</c:when>
		  						<c:when test="${q.qna_cate_no==2 }">
		  						 <td class='text-center'>교환문의</td>
		  						</c:when>
		  						<c:when test="${q.qna_cate_no==3 }">
		  						 <td class='text-center'>환불문의</td>
		  						</c:when>
		  						<c:when test="${q.qna_cate_no==4 }">
		  						 <td class='text-center'>반품문의</td>
		  						</c:when>
		  						<c:when test="${q.qna_cate_no==5 }">
		  						 <td class='text-center'>기타문의</td>
		  						</c:when>
  					</c:choose>
  					
                          <td class='text-center'>
                          	<a onclick='fn_inputPw("${q.qnaNo}", this)' value="${q.qnaPw}" >${q.qnaTitle}</a>
                          </td> 
                          
                          <td class='text-center'>
                        	  ${q.userId}
                          </td>
                          
                          <td class='text-center'>
                          	  ${q.qnaDate}
                          </td>
                          
                          <td class='text-center'>
                      	 	  <c:choose>
			  							<c:when test="${q.qnaState=='답변대기'}">
			  						 		<span class="badge badge-warning">답변대기</span>
			  							</c:when>
			  						
			  						<c:otherwise> 	
			  							<span class="badge badge-primary">답변완료</span>
			  						</c:otherwise>
			  						
		  					</c:choose>
                          </td>              
                    </tr>          
                    <tr>
                          <td class='${q.qnaNo}' colspan='6' class='text-center' style='display:none;'>
                         	 <div>
                         	 	<p class='text-center'><br>${q.qnaContent}</p><hr>
                         	 </div>
                         	 
                         	 <div>                       				
                          		<c:choose>
				  					<c:when test="${q.reply_content==null}">
				  						<p class='text-center'><br>아직 답변이 작성되지 않았습니다. 조금만 기다려주세요! <br></p> 	
				  					</c:when>
				  						
				  					<c:otherwise> 		
				  						<p class='text-center'><br>안녕하세요, 고객님. Free Fleuri의 스탭 영지니주리입니다 ^^  <br>${q.reply_content}</p> 	
				  					</c:otherwise>
			  						
		  						</c:choose>
                          	</div>
                         </td>
                   </tr>                
                    
                    </c:forEach> 
                    
			    </tbody>              
          </table>
          
          <button style="margin-left:90%;"class="btn btn-default" onclick="fn_insertDetails()">문의하기</button>
          </div>
          
          <!-- 페이징바 -->
          <div class="row justify-content-center" id="qnaPageBar">
          <c:if test="${not empty qnabar }">
          	${qnabar }
          </c:if>
         </div>
         

        </div>

        
          <!-- 문의하기 비밀번호 입력창 -->
   <div class="modal fade" id="pwCheck">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">비밀번호 확인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
                 <div class="col-12">
               글 작성시 입력했던 비밀번호 4자리를 입력해주세요.
              </div>
              
              <br>  
               <div class="col-12">
               <input type="hidden" name="modal_pno" id="modal_pno" value=""/>
               <input type="hidden" name="pw_db" id="pw_db" value=""/>
                <input type="text" name="board_pw" id="board_pw" class="form-control" maxlength="4"/>
               </div>
        </div>    
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" onclick="fn_pwConfirm()" >확인</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
        <!-- 비밀번호 입력 창 끝 -->
        

       <!-- 문의하기 모달 시작 -->
        <!-- The Modal -->
        <div class="modal fade" id="question_modal">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">문의하기</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              
              <!-- Modal body -->
<form action="${path }/mall/insert.do" id="qnaFrm" name="qnaFrm">              
              <div class="modal-body">
                  <div class="form-group row">
                   <div class="input-group col-6">
                     <div class="input-group-prepend">
                    
                       <span class="input-group-text">제품 코드 </span>
                     </div>
                     <input type="text" class="form-control input-sm" placeholder="제품 코드" id="goods_code" name="goods_code" readonly>
                 </div>
                 
                 <div class="input-group col-6">
                     <div class="input-group-prepend">
                       <span class="input-group-text">제품 이름</span>
                     </div>
                     <input type="text" class="form-control input-sm" placeholder="제품 이름" id="goods_name" name="goods_name" readonly>
                 </div>
               </div>
               
            <div class="row">
               <div class="col-md-6"> 
                  <select class="form-control" id="qna_option" name="qna_option" onchange="fn_selectbox();">
                   <option value="0" disabled selected>문의 유형 선택 </option>
                    <option value="1">상품 문의 </option>
                    <option value="2">교환 문의</option> 
                    <option value="3">환불 문의</option>             
                    <option value="4">반품 문의</option>
                    <option value="5">기타 문의 </option>
                  </select>
                  
          
               </div>
           
           <div class="col-md-6">
                  <div class="form-group">
                <input type="text" class="form-control" placeholder="좌측 문의유형 선택 " id="board_name" name="board_name" readonly>
               </div>
               </div>
               
               </div>
               
               <div class="col-12">
                  <div class="form-group">
                 <textarea class="form-control" rows="5" id="qna_content" name="qna_content" placeholder="문의 내용을 입력해주세요" required></textarea>
               </div>
               </div>
               
               <div class="input-group col-12">
                     <div class="input-group-prepend">
                       <span class="input-group-text">비밀번호 설정(숫자 4자리)</span>
                     </div>
                     <input type="text" class="form-control input-sm" placeholder="비밀번호 4자리 입력" id="user_input_pw" name="user_input_pw" maxlength="4" />
                 </div>
               
               <!-- userId들어가는 부분 -->
            <!-- <input type="hidden" name="userId" id="userId" value="user"/> -->
             <input type="hidden" id="userId" name="userId" value="${memberLoggedIn.userId }"> 
                
              </div>
              
              <!-- Modal footer -->
              <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="fn_checkUserPw();">등록하기</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
</form>              
            </div>
          </div>
        </div>
        <!-- 문의하기 모달 끝 -->
        

   
</section>



    
 
 
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  
 