<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

 <!-- 마이페이지 css-->
	<link rel="stylesheet" type="text/css" href="${path}/resources/base/css/mypage.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	
	<script src="${path }/resources/base/js/jquery-1.11.3.min.js"></script>
	<script src="${path }/resources/base/js/star.js"></script>
	
	<!-- 이미지팝업 -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.4.1/jquery.fancybox.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.4.1/jquery.fancybox.min.js"></script>
	
    
<style>

.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('../resources/base/img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}


    .pagination a 
    {
	    color: black;
	    float: left;
	    padding: 8px 16px;
	    text-decoration: none;
	}

	.pagination a:active 
	{
   		background-color: #ffd6f4; !important;
  	    color: white;
	}
	
	.pagination a:hover
	{
		background-color : #ffd6f4; !important;
  	    color: white;
	}
	
	.boardAtag
	{
		color : hotpink;
	}
	.boardAtag:hover
	{
		background-color : white; 
		color : #ffd6f4;
	}
	
	.image-preview-input 
	 {
			position: relative;
		   	overflow: hidden;
		    margin: 0px;    
		    color: #333;
	        background-color: #fff;
		    border-color: #ccc;    
	}
	.image-preview-input input[type=file] 
	{
		position: absolute;
		top: 0;
   		right: 0;
		margin: 0;
		padding: 0;
		font-size: 20px;
		cursor: pointer;
		opacity: 0;
		filter: alpha(opacity=0);
	}
	.image-preview-input-title 
	{
		 margin-left:2px;
	}
	
	</style>   
	
<script>

//파일 업로드
$(document).on('click', '#close-preview', function()
	            { 
	                $('.image-preview').popover('hide');
	                // Hover befor close the preview
	                $('.image-preview').hover(
	                    function () {
	                       $('.image-preview').popover('show');
	                    }, 
	                     function () {
	                       $('.image-preview').popover('hide');
	                    }
	                );    
	            });

	            $(function() {
	            	
	                // Create the close button
	                var closebtn = $('<button/>', {
	                    type:"button",
	                    text: 'x',
	                    id: 'close-preview',
	                    style: 'font-size: initial;',
	                });
	                closebtn.attr("class","close pull-right");
	                // Set the popover default content
	                $('.image-preview').popover({
	                    trigger:'manual',
	                    html:true,
	                    title: "<strong>미리보기</strong>"+$(closebtn)[0].outerHTML,
	                    content: "선택된 이미지 없음",
	                    placement:'bottom'
	                });
	                // Clear event
	                $('.image-preview-clear').click(function(){
	                    $('.image-preview').attr("data-content","").popover('hide');
	                    $('.image-preview-filename').val("");
	                    $('.image-preview-clear').hide();
	                    $('.image-preview-input input:file').val("");
	                    $(".image-preview-input-title").text("찾아보기"); 
	                }); 
	                // Create the preview image
	                $(".image-preview-input input:file").change(function (){     
	                    var img = $('<img/>', {
	                        id: 'dynamic',
	                        width:250,
	                        height:200
	                    });      
	                    var file = this.files[0];
	                    var reader = new FileReader();
	                    // Set preview image into the popover data-content
	                    reader.onload = function (e) {
	                        $(".image-preview-input-title").text("변경하기");
	                        $(".image-preview-clear").show();
	                        $(".image-preview-filename").val(file.name);            
	                        img.attr('src', e.target.result);
	                        $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
	                    }        
	                    reader.readAsDataURL(file);
	                });  
	            });


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

	function fn_toggle(no) 
    {
   		 $("."+no).toggle();
	 }



	function fn_delete() 
	{
		confirm("삭제하시겠습니까?");
	}
	
	function fn_qna(cPage)
    {     
       $.ajax
       ({
           url:"${path}/mypage/myQna.do",
           data:{cPage:cPage},
           dataType:"json",    
           success : function(data) 
           {
	         	var view = "";	
	          	console.log(data);
	          	
             if(data!=null)
             {
                var num = data.length-1;
                var qnaPageBar = data.qnaPageBar; 
               
                                
                for(var i=0; i<data.list.length;i++)
                {
                   //화면 추가해주기
                   if(i==0) 
                   {
                	   
                	  view += "<tr><td class='text-center'><a class='boardAtag' href='${path }/mall/detail.do?no="+data.list[i].pno+"'><strong>"+data.list[i].pno+"</strong></a></td>";
                	  view += "<td class='text-center'><a class='boardAtag' href='${path }/mall/detail.do?no="+data.list[i].pno+"'><strong>"+data.list[i].pname+"</strong></a></td>";
                  	  view += "<td class='text-center'>"+data.list[i].qnaNo+"</td>";
               		  view +="<td class='text-center'>"+fn_cate(data.list[i].qna_cate_no)+"</td>";
               		  view += "<td class='text-center'><a onclick='fn_toggle("+data.list[i].qnaNo+",this)'  >"+data.list[i].qnaTitle+"</a></td>";  
               		  view += "<td class='text-center'>"+data.list[i].qnaDate+"</td>";
               		  
               		  if(data.list[i].qnaState=='답변대기')
                      {
                      	view += "<td class='text-center'><span class='badge badge-warning'>답변대기</span></td>";
                      }	   
                      else view += "<td class='text-center'><span class='badge badge-primary'>답변완료</span></td>";
               		  
                      view +="<td class='text-center'><button class='btn btn-default' onclick='fn_qnaEdit("+data.list[i].qnaNo+");'>수정하기</button><button class='btn btn-default' onclick='fn_qnaDel("+data.list[i].qnaNo+");'>삭제하기</button></td></tr>";
               		 
               		                   
               		  view += "<tr><td class='"+data.list[i].qnaNo+"' colspan='7' class='text-center' style='display:none;'>";
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
                	 	  view += "<tr><td class='text-center'><a class='boardAtag' href='${path }/mall/detail.do?no="+data.list[i].pno+"'><strong>"+data.list[i].pno+"</strong></a></td>";
                 		  view += "<td class='text-center'><a class='boardAtag' href='${path }/mall/detail.do?no="+data.list[i].pno+"'><strong>"+data.list[i].pname+"</strong></a></td>";
                   	      view += "<td class='text-center'>"+data.list[i].qnaNo+"</td>";
                		  view +="<td class='text-center'>"+fn_cate(data.list[i].qna_cate_no)+"</td>";
                		  view += "<td class='text-center'><a onclick='fn_toggle("+data.list[i].qnaNo+",this)'  >"+data.list[i].qnaTitle+"</a></td>";  
                		  view += "<td class='text-center'>"+data.list[i].qnaDate+"</td>";
                		  
                		  if(data.list[i].qnaState=='답변대기')
	                      {
	                       	view += "<td class='text-center'><span class='badge badge-warning'>답변대기</span></td>";
	                      }	   
                       	  else view += "<td class='text-center'><span class='badge badge-primary'>답변완료</span></td>";
                		  
                       	 view +="<td class='text-center'><button class='btn btn-default' onclick='fn_qnaEdit("+data.list[i].qnaNo+");'>수정하기</button><button class='btn btn-default' onclick='fn_qnaDel("+data.list[i].qnaNo+");'>삭제하기</button></td></tr>";
                		 
                		                   
                		  view += "<tr><td class='"+data.list[i].qnaNo+"' colspan='7' class='text-center' style='display:none;'>";
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
	
	function fn_review(cPage)
	   {
	        
	        $.ajax
	        ({
	            url:"${path}/mypage/myReview.do",
	            data:{cPage:cPage},
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
	                 console.log(reviewPageBar);
	                                 
	                 for(var i=0; i<data.list.length;i++)
	                 {
	                    //화면 추가해주기
	                    if(i==0)//맨 처음에 값 삽입
	                    {
	                    	view += "<div class='card'> <div class='card-body'>  <div class='row'>";
	                    	view += "<div class='col-md-2'>";  
	                    	
	                    	if(data.list[i].orImg != null && data.list[i].reImg != null)
	                    	{
//	                    		view+= "<img src='${path}/resources/upload/review/"+data.list[i].reImg+"' class='img img-rounded img-fluid'/></div>";    

	                    		view+="<a data-fancybox='gallery' href='${path}/resources/upload/review/"+data.list[i].reImg+" '>";
	                    		view+="<img src='${path}/resources/upload/review/"+data.list[i].reImg+"' class='img img-rounded img-fluid'/></a></div>";
	                    	}
	                    	else view+="<img src='${path}/resources/base/img/noImg.png' class='img img-rounded img-fluid'/></div>";
	                    	
	                    	
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
	                    		
	                    	view += "<span class='float-right'>"+data.list[i].reDate+"</p></span>";
	                    	view += "<div class='clearfix'><p>"+data.list[i].reContent+"</p> <span class='float-right'><a class='boardAtag' href='${path }/mall/detail.do?no="+data.list[i].pno+"'><strong>>>해당 "+data.list[i].pname+" 상품 보러가기</strong></a></span></div>";
	                    	view +="<div class='clearfix float-right'><br><button class='btn btn-default' onclick='fn_reviewEdit("+data.list[i].reNO+")' value='"+data.list[i].reNO+"'>수정</button><button class='btn btn-default' onclick='fn_reviewDel("+data.list[i].reNO+")' value='"+data.list[i].reNO+"'>삭제</button></div></div></div></div></div></div>"
	                    
	                    }
	                    else//값이 2이상일 때 값들 삽입
	                    {
	                    	view += "<div class='card'> <div class='card-body'>  <div class='row'>";
	                    	view += "<div class='col-md-2'>";  
	                    	if(data.list[i].orImg != null && data.list[i].reImg != null)
	                    	{
	    //                		view+= "<img src='${path}/resources/upload/review/"+data.list[i].reImg+"' class='img img-rounded img-fluid'/></div>";          	
	               
	                    		view+="<a data-fancybox='gallery' href='${path}/resources/upload/review/"+data.list[i].reImg+" '>";
	                    		view+="<img src='${path}/resources/upload/review/"+data.list[i].reImg+"' class='img img-rounded img-fluid'/></a></div>";
	                    	}
	                    	else view+="<img src='${path}/resources/base/img/noImg.png' class='img img-rounded img-fluid'/></div>";
	                    	
	                    	
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
	                    	
	                    	view += "<span class='float-right'>"+data.list[i].reDate+"</p></span>";
	                    	view += "<div class='clearfix'><p>"+data.list[i].reContent+"</p> <span class='float-right'><a class='boardAtag' href='${path }/mall/detail.do?no="+data.list[i].pno+"'><strong>>>해당 "+data.list[i].pname+" 상품 보러가기</strong></a></span></div>";
	                    	view +="<div class='clearfix float-right'><br><button class='btn btn-default' onclick='fn_reviewEdit("+data.list[i].reNO+")' value='"+data.list[i].reNO+"'>수정</button><button class='btn btn-default' onclick='fn_reviewDel("+data.list[i].reNO+")'value='"+data.list[i].reNO+"'>삭제</button></div></div></div></div></div></div>"
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
	
	//수정하기 모달창 구현
	function fn_qnaEdit(qno) 
	{
		$("#qnaNo").val(qno);
		
		$("#qna_edit").modal();
	}
	
	//삭제하기 모달 구현
	function fn_qnaDel(qno) 
	{
		$("#modal_qno").val(qno);
		
		$("#qnaDel").modal();
	}
	
	//문의하기 모달에 문의 유형 카테고리 값 받기
	   function fn_selectbox()
	   {
	       var target = $("#qna_cate_no option:selected").val();
	       
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
	   
	   function fn_qnaEditConfirm() 
	   {
	     
	      var user_content = $("#qna_content").val().trim();
	      var user_pw = $("#user_input_pw").val().trim();
	      var cate_name = $("#board_name").val().trim();
	     
	      //숫자만 가려내는 정규표현식
	      regNumber = /^[0-9]*$/;
	      
	      if(cate_name.length==0)
	      {
	        alert("좌측의 문의 유형을 선택해주세요.");
	        return false;
	      }     
	      else if(user_content.length==0)
	      {
	         alert("문의 내용을 입력해주세요");    
	         return false;
	      }
	      //숫자가 아닌 문자 입력했을시
	      else if(!regNumber.test(user_pw))
	       {
	         alert("숫자만 입력하세요");
	          return false;
	       }
	      //비밀번호가 4글자 미만일 때 : 4 숫자 바꿔줘야한다
	      else if(user_pw.length<4)
	      {
	          alert("비밀번호는 4자리입니다. 숫자 4자리를 입력해주세요.");
	          return false;
	      }
	      else if(user_pw.length>=4)
	      {
	        	$("#qnaEditFrm").submit();
	      }   
	   };
	   
	   function fn_qnaDelConfirm() 
	   {
		    var modal_qno = $('[name=modal_qno]').val();
		   location.href="${path}/mypage/qnaDel.do?modal_qno="+modal_qno; 

	   }

	   function fn_reviewEdit(reviewNum) 
	   {
//		   var btnReno = $(obj).attr('value');
		
		   $("#reNO").val(reviewNum);
		   $("#review_Edit_modal").modal();
		
	   }
	   
	 //삭제하기 모달 구현
		function fn_reviewDel(reviewNum) 
		{	
			
			 $("#modal_rno").val(reviewNum);
			 
			 $("#reviewDel").modal();
		}
	 
	 function fn_reviewDelConfirm() 
	 {
		 $("#reviewDelFrm").submit();
  	}
	    
	  
	   function fn_reviewEditConfirm(reno) 
	   {
		   var content = $("#reContent").val().trim();
		   var star =  $('input[name="star-input"]:checked').val();
		     
		   //별점을 input에다가 넣기
		   $('#stars').val(star); 
		   
			 //리뷰 내용에 아무것도 안 적었을 때
		    if(content.length==0)
		    {
		    	alert("내용을 입력해주세요.");
		    	
		    	return false;
		    }	
		    else
		    {
		    	 $("#reviewEditFrm").submit(); 
		    	return true;
		    }	
	   }
	   
</script>


	<div class="mypage">
		<h2 class="text-center">마이페이지</h2>
	</div>
		
	
	<div class="container">
		<div class="row">
				<div class="col-md-12">
					<hr>
						<ul class="nav justify-content-center">
						    <li class="nav-item">
						      <strong><a class="nav-link mypageAtag" href="${path }/mypage/myOrderList.do">주문 목록	</a></strong>
						    </li>
						    <li class="nav-item">
						      <strong><a class="nav-link mypageAtag" href="${path }/mypage/myBoardList.do?userId='${memberLoggedIn.userId}'">게시글 관리</a></strong>
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
	
		  	<div class="col-md-12">
		  	
		  	<div>
		  		<h3>게시글 관리</h3>
		  		<br>
		  	</div>		
		  	
		  	<div class="shadow-sm p-4 mb-4 bg-white">
				<h2>Q&A</h2>	
				<h7>글의 제목을 클릭하면 작성한 글 내용 및 답변을 확인할 수 있습니다.</h7>
			</div>
		  	
 		  		<div class="table">
			        <table>
			                  <thead>      
			                    <tr>
			                   	  <th class="text-center" style="width: 7%">상품 코드</th>
			                   	  <th class="text-center" style="width: 23%">상품명</th>
			                      <th class="text-center" style="width: 8%">글 번호</th>
			                      <th class="text-center " style="width: 10%">카테고리</th>
			                      
			                      <th class="text-center " style="width: 17%">제목</th>           
			                      <th class="text-center "style="width: 15%">등록일</th>
			                      <th class="text-center " style="width: 12%">답변 상태</th>
			                      <th class="text-center " style="width: 8%"></th>
			                    </tr>
			                  </thead>
			                  
			                  <tbody id="qnaList">
			                  <c:forEach items="${qlist }" var="q">
			                 <tr>
			            	     <td class='text-center'>
                     				<a class='boardAtag' href='${path }/mall/detail.do?no=${q.pno}'><strong>${q.pno}</strong></a>
                     			</td>
                     			
                     			<td class='text-center'>
                     				<a class='boardAtag' href='${path }/mall/detail.do?no=${q.pno}'><strong>${q.pname}</strong></a>
                     			</td>
			                 
			                 	
                     			<td class='text-center'>
                     				${q.qnaNo}
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
                          			<a onclick='fn_toggle("${q.qnaNo}")' >${q.qnaTitle}</a>
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
                          		
                          		<td class='text-center'>
			  						<button class="btn btn-default" onclick="fn_qnaEdit(${q.qnaNo});">수정하기</button>
			  						<button class="btn btn-default" onclick="fn_qnaDel(${q.qnaNo});">삭제하기</button>
                          		</td>          
                    		</tr>
                    	          
                         	<tr>
                         		<td class='${q.qnaNo}' colspan='7' class='text-center' style='display:none;'>
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
    			  </div>  	
		   		 
		   		 <!-- qna 페이지바 -->
		   		<div class="row justify-content-center" id="qnaPageBar">
			       	<c:if test="${not empty qnaPageBar }">
			          	${qnaPageBar }
			        </c:if>
			     </div> 
		   		 
		  <div class="shadow-sm p-4 mb-4 bg-white">
				<h2>Review</h2>	
			</div>
		  	
		    <div id="reviewCard">
		      	<c:forEach items="${rlist}" var="r">
		          	<div class='card'> 
		          		<div class='card-body'>  
			            	<div class='row'>
			            	
			               		<div class='col-md-2'>
			               		
			               			<c:set var="picRe" value="${r.reImg}"></c:set>
	               					<c:set var="picOr" value="${r.orImg}"></c:set>
			               		
			               		<c:choose>
			               			<c:when test="${not empty picRe && not empty picOr}">
			               				<%-- <img src='${path}/resources/upload/review/${r.reImg}' class='img img-rounded img-fluid'/> --%>
			               			
			               				<a data-fancybox="gallery" href="${path}/resources/upload/review/${r.reImg}">
					               			<img src='${path}/resources/upload/review/${r.reImg}' class='img img-rounded img-fluid'/>
					               		</a>
			               			</c:when>
			               			
			               			<c:otherwise>
			               				<img src='${path}/resources/base/img/noImg.png' class='img img-rounded img-fluid'/>
			               			</c:otherwise>
			               		</c:choose>	
			               		
			               		</div>          	
			               		
			                   	<div class='col-md-10'>
			                   		<p><strong>${r.userId}</strong>님 
			                   		
			                   		<span style="margin-left : 5%"> 	
			                   		
				                   		<c:set var="star" value="${r.stars}"></c:set>
				                   			
				                   		<c:choose>
				                   			<c:when test="${ star==1}">
				                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			</c:when>	
				                   			
				                   			<c:when test="${ star==2}">
				                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			</c:when>	
				                   			
				                   			<c:when test="${ star==3}">
				                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			</c:when>	
				                   			
				                   			<c:when test="${ star==4}">
				                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			   <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_e.png' aria-hidden='true'/>
				                   			</c:when>	
				                   			
				                   			<c:otherwise>
				                   				<img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    <img src='${path}/resources/base/img/star_f.png' aria-hidden='true'/>
				                   			    
				                   			</c:otherwise>	
				                   		</c:choose>
			                   		</span>
			                   		
			                   		<span class='float-right'>
			                   			${r.reDate}</p>
			                   		</span>
				                   	<div class='clearfix'>
				                   		<p>${r.reContent}</p>
				                   		
				                   		<span class='float-right'>
				                   			<a class='boardAtag' href='${path }/mall/detail.do?no=${r.pno }'><strong>>>해당 "${r.pname }" 상품 보러가기</strong></a>
				                   		</span>
				                   		
				                   	</div>
				                   	
				                   	<div class='clearfix float-right'>
				                   	<br>
				                   		<button class="btn btn-default" onclick="fn_reviewEdit(${r.reNO})" value="${r.reNO}">수정</button>
				                   		<button class="btn btn-default" onclick="fn_reviewDel(${r.reNO})" value="${r.reNO}">삭제</button>
				                   	</div>
				                   	
			                   	</div>
			                 </div>
			             </div>
		           	</div>
		           	</c:forEach>
		    	</div>
		   		 <br>
		   		 
		   		  <!-- 페이지바 -->   	
		   		  <div class="row justify-content-center" id="reviewPageBar">
					<c:if test="${not empty reviewbar }">
		          		${reviewbar }
		          	</c:if>
			      </div>
		   		  
		   		  	 
		</div>
	</div> 	
	</div>

<!-- 수정 하기 모달 시작 -->
		  <!-- The Modal -->
        <div class="modal fade" id="qna_edit">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">문의 글 수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              
              <!-- Modal body -->
<form action="${path }/mypage/qnaEdit.do" id="qnaEditFrm" name="qnaEditFrm">              
              <div class="modal-body">
  
                <input type="hidden" placeholder="제품 코드" id="qnaNo" name="qnaNo" value="" readonly>
               
            <div class="row">
               <div class="col-md-6"> 
                  <select class="form-control" id="qna_cate_no" name="qna_cate_no" onchange="fn_selectbox();">
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
			    <input type="hidden" id="userId" name="userId" value="${memberLoggedIn.userId }"> 
                
              </div>
              
              <!-- Modal footer -->
              <div class="modal-footer">
                <button class="btn btn-success" onclick="return fn_qnaEditConfirm();">등록하기</button>
                <button class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
</form>              
            </div>
          </div>
        </div>
        
 <!-- 삭제하기 -->       
        
   <div class="modal fade" id="qnaDel">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">문의게시글 삭제</h4>
          <button class="close" data-dismiss="modal">&times;</button>
        </div>
        	
        <!-- Modal body -->
        <div class="modal-body">
             <div class="col-12">
          		<p class="text-center">작성하신 문의 글을 삭제하시겠습니까? <br>삭제한 글은 복구되지 않습니다. </p> 
          		
          		<input type="hidden" name="modal_qno" id="modal_qno" value=""/> 
          		  
              </div>
     
        </div>    
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button class="btn btn-primary" onclick="fn_qnaDelConfirm()" >삭제하기</button>
          <button class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
        <!-- 삭제하기 끝 -->
		  
	
		<!-- 리뷰 수정 하기 모달 -->
		 <!-- The Modal -->
		  <div class="modal fade" id="review_Edit_modal">
		    <div class="modal-dialog modal-dialog-centered">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title text-center">리뷰 수정하기</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
<form action="${path }/mypage/myReviewEdit.do" id="reviewEditFrm" name="reviewEditFrm" method="post" enctype="multipart/form-data">		        
		        <div class="modal-body">
		         
		         <div class="col-12">
		         	<div class="form-group">
		         	<input type="hidden" id="userId" name="userId" value="${memberLoggedIn.userId }"> 
					
					<!-- 주문 번호 생성되면 이거 바꿔주기 -->
					<input type="hidden" id="reNO" name="reNO" value=""> 
					
					<textarea class="form-control" rows="5" id="reContent" name="reContent" placeholder="리뷰 내용을 입력해주세요"></textarea>
					</div>
		         </div>
		         
		         <div class="col-12" style="margin-bottom:5%;">
     				별점 : 
     				<span class="star-input">
						<span class="input">
					    	<input type="radio" name="star-input" value="1" id="p1">
					    	<label for="p1">1</label>
					    	<input type="radio" name="star-input" value="2" id="p2">
					    	<label for="p2">2</label>
					    	<input type="radio" name="star-input" value="3" id="p3">
					    	<label for="p3">3</label>
					    	<input type="radio" name="star-input" value="4" id="p4">
					    	<label for="p4">4</label>
					    	<input type="radio" name="star-input" value="5" id="p5" checked>
					    	<label for="p5">5</label>
					  	</span>
					</span>				
						<input type="hidden" id="stars" name="stars" >
		        </div>
		            
		             <div class="col-12">
		             
		             <p> ▼ 리뷰에 올릴 이미지를 첨부해주세요 ▼ </p>
			            <div class="input-group image-preview">
			                <input type="text" class="form-control image-preview-filename" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
			                <span class="input-group-btn">
			                    <!-- image-preview-clear button -->
			                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
			                        <span class="glyphsicon glyphicon-remove"></span> 지우기
			                    </button>
			                    <!-- image-preview-input -->
			                    <div class="btn btn-default image-preview-input">
			                        <span class="glyphicon glyphicon-folder-open"></span>
			                        <span class="image-preview-input-title">찾아보기</span>
			                        <input type="file" accept="image/png, image/jpeg, image/gif" id="review_file" name="review_file"/> <!-- rename it -->
			                    </div>
			                </span>
			            </div><!-- /input-group image-preview [TO HERE]--> 
		            </div>					 	   
			  </div>
			         
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button class="btn btn-success" onclick="fn_reviewEditConfirm();">등록하기</button>
		          <button class="btn btn-secondary" data-dismiss="modal">Close</button>
		        </div>
</form>		        
		      </div>
		    </div>
		  </div>
		  <!-- 리뷰 수정 하기 모달 끝 -->
		  
		  
<!-- 삭제하기 -->       
   <div class="modal fade" id="reviewDel">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">리뷰 삭제</h4>
          <button class="close" data-dismiss="modal">&times;</button>
        </div>
        	
        <!-- Modal body -->
        <div class="modal-body">
             <div class="col-12">
          		<p class="text-center">작성하신 리뷰 글을 삭제하시겠습니까? <br>삭제한 글은 복구되지 않습니다. </p> 
          		
          		<form action="${path }/mypage/reviewDel.do" id="reviewDelFrm" name="reviewDelFrm">  
          		<input type="hidden" name="modal_rno" id="modal_rno" value=""/> 
          		</form>
          		  
              </div>
     
        </div>    
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button class="btn btn-primary" onclick="fn_reviewDelConfirm()" >삭제하기</button>
          <button class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
        <!-- 삭제하기 끝 -->
	  
		  	
</section>


 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  
    