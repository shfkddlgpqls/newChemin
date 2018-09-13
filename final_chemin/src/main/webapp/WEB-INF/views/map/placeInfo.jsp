<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<c:set value="${pageContext.request.contextPath }" var="path"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eb4ae7857a625ec0a907f8f742645cfb&libraries=services"></script>
    
<style>
      .box {
        min-height: auto;
         margin-left:auto;
  		margin-right:auto;
  		
      }
      .detail_box {
        background-color: white;
       /*  color: #efefef; */
        margin-bottom:1%;
        height:35%;
        border:solid 1px #E5E8E8;
      }
      .picture_box{
       background-color: white;
       /*  color: #efefef; */
        height:auto;
        border:solid 1px #E5E8E8;
        margin-bottom:1%;
      }
      .menu_box{
       background-color: white;
       /*  color: #efefef; */
        margin-bottom:1%;
        height:auto;
        border:solid 1px #E5E8E8;
      }
 	   .title_box{
 	   	 margin-left:auto;
  		margin-right:auto;
 	   	 background:white;
 	   	 width:70%;
 	   	 height:25%;
 	   	 position:relative; top:50px;
 	   	 box-shadow: 0px 2px 5px #BDBDBD;
 	   	 border:solid 1px #E5E8E8;
 	   }
      .box {
        width: 80%;      
      }
      @media screen and (max-width: 400px) {
        .detail_box {
          color: white;
        }
      }
     
      @media screen and (min-width:800px) {
        body{
          padding: 0 2em 0 2em;
        }
      }
	h1{
	text-align: center;
    font-family:"Impact";
    font-size:95px;
    text-transform:uppercase;
    display: block;    
	}
	h5{
		text-align: center;
		 font-family:"Impact";
	    font-size:60px;
	    text-transform:uppercase;
	    display: block;   
	}
.review_box{
		background-color: white;
       /*  color: #efefef; */
        margin-bottom:1%;
        height:auto;
        border:solid 1px #E5E8E8;
	}
	.review_sub_box{
		border:solid 1px #E5E8E8;
		  margin-left:auto;
  		margin-right:auto;
  		height:auto;
	}
  .sub_review{
  	 margin-left:auto;
  		margin-right:auto;
  		height:auto;
  		width:72%;
  		float:left;
  		/* border-bottom:solid 1px #E5E8E8; */
  		
  }
	.confirm_box{
		border:solid 1px #E5E8E8;
		  margin-left:auto;
  		margin-right:auto;
  		height:auto;
  		width:72%;
  		height:5%;
  		float:left;
  		border-top:0;
  		margin-bottom:3%
	}
 .load_box{
 background-color: white;
       /*  color: #efefef; */
        margin-bottom:1%;
        height:auto;
        border:solid 1px #E5E8E8;
 }
	.star-rating {
  font-size:1.55em;
}
.star-rating .fa-star{color: #F05F40;}
.rating-value{
	 width:2%;
	  border:none 	  
  }
  @font-face {
  font-family: 'Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url(https://example.com/MaterialIcons-Regular.eot); /* For IE6-8 */
  src: local('Material Icons'),
    local('MaterialIcons-Regular'),
    url(https://example.com/MaterialIcons-Regular.woff2) format('woff2'),
    url(https://example.com/MaterialIcons-Regular.woff) format('woff'),
    url(https://example.com/MaterialIcons-Regular.ttf) format('truetype');
}
.material-icons {
  font-family: 'Material Icons';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;  /* Preferred icon size */
  display: inline-block;
  line-height: 1;
  text-transform: none;
  letter-spacing: normal;
  word-wrap: normal;
  white-space: nowrap;
  direction: ltr;
  /* Support for all WebKit browsers. */
  -webkit-font-smoothing: antialiased;
  /* Support for Safari and Chrome. */
  text-rendering: optimizeLegibility;
  /* Support for Firefox. */
  -moz-osx-font-smoothing: grayscale;
  /* Support for IE. */
  font-feature-settings: 'liga';
}
</style>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="container-fluid" style="background:#F3F3F3;">
<section>
<div class="container">
      <div class="title_box">
      	<input type="hidden" name="plaName" value="${place.plaName}"/>
      	<h1 style="margin-top:3%;font-size:50px"><strong>${place.plaName}</strong></h1>
      	<div class="row" style="width:40%;margin-left:auto; margin-right:auto;text-align:center">
      			<div class="row" id="main_review" style="width:95%;margin-left:auto; margin-right:auto;text-align:center">
    
			   	</div>
			   <div class="row" style="width:100%;margin-left:auto; margin-right:auto;">
				 <div style="margin-left:auto; margin-right:auto;">
				 	<i class="material-icons" style="font-size:2.5em;color:#FB6E9D">call_split</i>
				 	<p>길찾기</p>
				 </div>
			   	 <div style="margin-left:auto; margin-right:auto;">
			   	 <i class = "material-icons" style="font-size:2.5em;color:#FB6E9D"> pin_drop</i> 
			   	 <p>위치</p>
		 		</div>
			   </div>
			  
		  </div>
		
      </div>
      
      <div class="box detail_box">
       <div style="height:10%; margin-top:90px; margin-bottom:2%">
	      	<div style="margin-left:13%; float:left">
	      		<span style="font-size:20px;text-transform:uppercase;"><strong>상세정보</strong></span>
	      	</div>
	      	<div style="float:right; color:#989898;font-size:5px;margin-right:13%">
	      		<span style="font-size:15px;text-transform:uppercase;">등록날짜 <fmt:formatDate value="${place.plaDate}" pattern="yyyy년  MM월  dd일"/></span>
	      	</div>
      	</div>

      	<div class="row">
      	<div style="margin-left:15%;float:left;">
      		<i class="fa fa-map-marker" style="font-size:20px;color:#989898;"></i>
      		<input type="hidden" name="addr" value="${place.plaAddr}">
      		<c:forTokens items="${place.plaAddr}" delims="/" var="addr" varStatus="status">
      		  <c:if test="${status.index == 0}">
	      		<span style="font-size:0.94em">${addr}</span><br>
	      	  </c:if>
	      	  <c:if test="${status.index == 1}">
	      		<span style="width:20%;font-size:0.94em">&nbsp;&nbsp;&nbsp;(우)${addr}</span>
	      	  </c:if>
	      	  <c:if test="${status.index == 2}">	
	      		<span style="font-size:0.94em">&nbsp;&nbsp;&nbsp;(지번)${addr}</span> 
	      	  </c:if>	
      		</c:forTokens>
      	</div> 
      	</div>
      	
      	<div class="row">
      	<div style="margin-left:15%;float:left;margin-top:1%">
      		<i class="fa fa-clock-o" style="font-size:19px;color:#989898;"></i>
      		<span style="font-size:0.94em">영업시간</span><br>
      		<c:forTokens items="${place.plaTime}" delims="/" var="time" varStatus="status"> 
      		  <c:if test="${status.index == 0}">		
	      		<span style="font-size:0.94em;">&nbsp;&nbsp;&nbsp; ${time} </span> 
	      	  </c:if>
	      	  <c:if test="${status.index == 1}">	
	      		<span style="font-size:0.94em;">${time} ~</span>
	      	  </c:if>
	      	  <c:if test="${status.index == 2}">
	      		<span style="font-size:0.94em;">${time}</span>
	      	  </c:if>
	      	  <c:if test="${status.index == 3}">	
	      		<span style="font-size:0.94em;color:#F05F40">${time}</span>
	      	  </c:if>	
      		</c:forTokens>
      	</div> 
      	</div>
      	
      	<div class="row">
      	<div style="margin-left:15%;float:left;margin-top:1%">
      		<i class="fa fa-phone" style="font-size:20px;color:#989898"></i>
      		<span style="font-size:0.94em">${place.plaPhone }</span>
      	</div> 
      	</div>	
      	
      </div> 
      
      <!-- 메뉴  content -->
      <div class="box menu_box">
      	<div style="height:6%; margin-top:5%; ">
		      <div style="margin-left:13%; float:left">
		      		<span style="font-size:20px;text-transform:uppercase;"><strong>가격</strong></span>
		      </div>
      	</div>
      	
      	<div class="row">
      	<div style="margin-left:15%;float:left;margin-bottom:4%">
      		<table>
      			<c:forEach items="${menuList}" var="menu">
      			<tr>
      				<td>${menu.menuName}</td>
      				<td>&nbsp;------------------------------------------------------------&nbsp;</td>
      				<td>${menu.menuPrice}원</td>
      			
      			</tr>
      			</c:forEach>
      		</table>
      	</div> 
      	</div>
      		
      </div> 
      
      
     <!-- 사진 내용 -->
       <div class="box picture_box">
	       <div style="height:6%; margin-top:5%;margin-bottom:3%">
		      	<div style="margin-left:13%; float:left">
		      		<span style="font-size:20px;text-transform:uppercase;"><strong>사진</strong></span>
		      	</div>
	      	</div>
	      	
	      	<div class="row" style="width:80%;margin-left:auto;margin-right:auto;">
	      	<div style="float:left;">

    <!-- main slider carousel -->
    
        <div id="ThumbnailCarousel" class="carousel slide col-xs-12" data-ride="carousel" style="margin-bottom:7%">
			 <div class="carousel-inner">
			  <div class="carousel-item active">
			  	<div class="row">
			  	  <input type="hidden" name="plaNo" value="${place.plaNo }"/>
			  	  <c:forEach items="${attachList}" var="attach" varStatus="status">
			  	     <c:if test="${status.index <4}">
			          <div class="col-md-3"><a href="#x" class="thumbnail"><img src="${path}/resources/upload/place/attach/${attach.reImg}" alt="Image" class=" img-thumbnail"></a>
			          </div>
			         </c:if> 
			         </c:forEach> 
			       </div>
			     </div>
			     
			     <%--  <div class="carousel-item">
				    <div class="row">
				    	<c:forEach items="${attachList}" var="attach" varStatus="status">
					    <c:if test="${status.index>3 && status.index<8 }">
					          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="${path}/resources/upload/place/attach/${attach.reImg}" alt="Image" class=" img-thumbnail"></a>
					          </div>
					      
					    </c:if>
				    	</c:forEach>      
					</div>
				   </div> --%>
			  </div>
			  
			  <a class="carousel-control-prev "  href="#ThumbnailCarousel" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon " aria-hidden="true"></span>
			    <span class="sr-only ">Previous</span>
			  </a>
			  
			  <a class="carousel-control-next" href="#ThumbnailCarousel" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
		</div>
        	</div>
	      	</div> 
	      </div>
	      
	      <!-- 찾아오기 -->
	      <div class="box load_box">
	       <div style="height:6%; margin-top:5%; margin-bottom:1%">
		      	<div style="margin-left:13%; float:left">
		      		<span style="font-size:20px;text-transform:uppercase;"><strong>찾아가는 길</strong></span>
		      	</div>
	      	</div>
	      	
	      	<div class="row" style="width:75%;margin-left:auto;margin-right:auto;">
	      		 <c:if test="${!empty place.plaStamp}">
					 <!-- 1. 약도 노드 -->
					<div style="margin-bottom:5%;width:100%;" id="daumRoughmapContainer${place.plaStamp}" class="root_daum_roughmap root_daum_roughmap_landing"></div>
					<input type="hidden" name="stamp" value="${place.plaStamp}"/>
					<input type="hidden" name="key" value="${place.plaKey}"/>
					<!-- 2. 설치 스크립트 -->
					<script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>
					
					<!-- 3. 실행 스크립트 -->
					<script charset="UTF-8">
					  var stamp= $('[name=stamp]').val();
					  var key= $('[name=key]').val()
					
						new daum.roughmap.Lander({
							"timestamp" : stamp,
							"key" : key,
							"mapWidth" : "100%",
							"mapHeight" : "300"
						}).render();
					</script> 
					
				</c:if> 
				  <c:if test="${empty place.plaStamp}">
					 <div id="map" style="width:100%;height:45%;margin-bottom:10%"></div>
					<script>
						var addr = $('[name=addr]').val();
						var plaName = $('[name=plaName]').val();
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = {
						        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 3 // 지도의 확대 레벨
						    };  
						<!-- // 지도를 생성합니다    
						var map = new daum.maps.Map(mapContainer, mapOption); 
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new daum.maps.services.Geocoder();
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch(addr, function(result, status) {
						    // 정상적으로 검색이 완료됐으면 
						     if (status === daum.maps.services.Status.OK) {
						        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new daum.maps.Marker({
						            map: map,
						            position: coords
						        });
						         // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new daum.maps.InfoWindow({
						            content: '<div style="width:100%;text-align:center;padding:6px 0;">'+plaName+'</div>'
						        });
						        infowindow.open(map, marker); 
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});    
						</script>  
				</c:if>  
					    
	      	</div> 
	      </div>
	      
	      
	      
	      <!-- 평가 리뷰 -->
	      <div class="box review_box">
	       <div style="height:6%; margin-top:5%; margin-bottom:1%">
		      	<div style="margin-left:13%; float:left">
		      		<span style="font-size:20px;text-transform:uppercase;"><strong>평가하기</strong></span>
		      	</div>
	      	</div>

		      	<div class="row">
					<div class="review_sub_box" style="width:72%; float:left;">					
						<div style="width:100%;height:6%; border-bottom:solid 1px #E5E8E8;">
							<div class="star-rating" style="margin:2%">
						        <span class="fa fa-star-o" data-rating="1"></span>
						        <span class="fa fa-star-o" data-rating="2"></span>
						        <span class="fa fa-star-o" data-rating="3"></span>
						        <span class="fa fa-star-o" data-rating="4"></span>
						        <span class="fa fa-star-o" data-rating="5"></span>
						        <input type="text" name="star" class="rating-value" value="3">/5 
						        &nbsp;<span style="font-size:0.85em"> 평가해주세요!</span>
						      </div>
						</div>
						<textarea rows="5" style="width:100%;border-bottom:1px solid #E5E8E8;border-top:0px;border-left:0px;border-right:0px" 
						placeholder="&#13;&#10;&#13;&#10;&nbsp;여기의 어떤 점이 마음에 드셨나요?" id="content" name="content" maxlength="1000"></textarea>
					
					</div>		
	    		    <div class="confirm_box">
					  <button class="btn btn-primary"  style="height:100%;width:10%;float:right; border-radius:3px" onclick="fn_reviewReg(this)" data-no='${place.plaNo}'>등록</button>
					  	 <span id="counter" style="font-size:1.2em;margin:1%;float:right;">###</span>&nbsp; 					
					</div>
					
					<div class="sub_review" id="sub_review">
					  	
		      		</div> 
		      	</div>
	      </div>
    

    <script>
 
    var $star_rating = $('.star-rating .fa');
    
    var SetRatingStar = function() {
    	
      return $star_rating.each(function() {
        if (parseInt($star_rating.siblings('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
          return $(this).removeClass('fa-star-o').addClass('fa-star');
        } else {
          return $(this).removeClass('fa-star').addClass('fa-star-o');
        }
      });
    };
    $star_rating.on('click', function() {
      $star_rating.siblings('input.rating-value').val($(this).data('rating'));
      return SetRatingStar();
    });
    SetRatingStar();
   
    //리뷰 내용의 글자수 세기 이벤트, 리뷰 리스트 불러오기
    $(function() {
        $('#content').keyup(function (e){
            var content = $(this).val();
             /* $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');  */
            $('#counter').html(content.length + '/1000');
        });
        $('#content').keyup();
        var  plaNo = $('[name=plaNo]').val();
        fn_reviewList(plaNo)
    });
 
  
    //리뷰 리스트를 불러오는 함수
    function fn_reviewList(plaNo){
    	$.ajax({
    		url:"${path}/map/placeReviewList.do",
    		data:{plaNo:plaNo},
    		dataType:"json",
    		success:function(data){
    			var content="";
    			var mainRe="";
    			var sum=0;
    			var avg=0;
    			
               
                
    			if(data!=null){
    				 for(var i=0; i<data.reviewList.length; i++){
    					sum+=data.reviewList[i].REVIEWSTAR;
    				}
    				avg=sum/data.reviewList.length; 
    			
    				if(isNaN(avg)){
    					avg=0;
    				}
    			 	mainRe+=' <span style="font-size:1.09em;margin-left:8%;margin-top:2%">평점 </span> ';
    				mainRe+='<div class="star-rating" style=" font-size:1.3em;margin-top:0.4em">';
    				for(var r=0; r<5; r++){
    					if(r<Math.round(avg)){
    						mainRe+='<span class="fa fa-star"></span>';
    					}else{
    						mainRe+='<span class="fa fa-star-o" data-rating="2"></span>';
    					}
    				}
    				mainRe+='<span class="rating-value">';
    				mainRe+='</div>&nbsp;&nbsp;';
    				mainRe+='<span style="width:7%;border:none;font-size:1.15em;margin-top:0.2em">'+avg.toFixed(1)+'</span>';
    				mainRe+='<span style="border:none;margin-top:2%;font-size:1.09em;margin-left:3%">점</span>&nbsp;';
    				mainRe+='<span style="margin:2%"> ·&nbsp;&nbsp;리뷰('+data.reviewList.length+')</span>'; 
    				
    				for(var i=0; i<data.reviewList.length; i++){
    					var date=new Date(data.reviewList[i].REVIEWDATE);
    					 var fmDate=date.toISOString().slice(0,10);
    					if(i==0){
    						content+='<div class="star-rating" style=" font-size:1.1em;">';
    						for(var j=0; j<5; j++){
    							if(j<data.reviewList[i].REVIEWSTAR){
    								content+='<span class="fa fa-star"></span>';
    							}else{
    								content+='<span class="fa fa-star-o"></span>';   
    							}
								
    						}
    						content+='<span>'+data.reviewList[i].REVIEWSTAR+'</span>';
    						content+='</div>';
        					content+='<p style="word-wrap: break-word;margin-bottom:0rem;font-size:0.9em;">'+data.reviewList[i].REVIEWCONTENT+'</p>';
        					content+='<div style="color:#989898;font-size:0.95em;margin-bottom:3%;">'+data.reviewList[i].USERID+'｜'+fmDate+'<div style="float:right;">';
        					content+='<button class="btn btn-primary">수정</button><button class="btn btn-primary">삭제</button></div></div>';
        					
    					}else{																													
    						content+='<div  style="border-top:1px solid #E5E8E8">';
    						content+='<div class="star-rating" style=" font-size:1.1em;margin-top:3%">';
    						for(var j=0; j<5; j++){
    							if(j<data.reviewList[i].REVIEWSTAR){
    								content+='<span class="fa fa-star"></span>';
    							}else{
    								content+='<span class="fa fa-star-o"></span>';   
    							}
								
    						}
    						content+='<span>'+data.reviewList[i].REVIEWSTAR+'</span>';
    						content+='</div>';
        					content+='<p style="word-wrap: break-word;margin-bottom:0rem;font-size:0.9em;">'+data.reviewList[i].REVIEWCONTENT+'</p>';
        					content+='<div style="color:#989898;font-size:0.95em;margin-bottom:3%">'+data.reviewList[i].USERID+'｜'+fmDate+'</div>';
    						content+='</div>';
    					}	
    				}
    			}
    			$('#sub_review').html(content);
    		    $('#main_review').html(mainRe);  
    		},
    		error:function(jxhr,textStatus,error)
            {
                console.log("ajax실패!");
                console.log(jxhr);
                console.log(textStatus);
                console.log(error);
             }
    	})
    }
    
    
    function fn_reviewReg(obj){
    	var plaNo = $(obj).data("no");
    	var star = $('[name=star]').val();
    	var content = $('[name=content]').val();
    	var userId ='${memberLoggedIn.userId}';
    	
    	if(userId.trim().length==0){
    		swal({
				  text: "로그인 후 이용이 가능합니다.",
				  icon: "warning",
				  button: "확인",
				});
    	}
    	else if(content.trim().length==0){
			swal({
				  text: "내용을 입력해주세요",
				  icon: "warning",
				  button: "확인",
				});
		}
    	
    	if(content.trim().length>0){
      	$.ajax({
    		url:"${path}/map/placeInsertReview.do",
    		data:{plaNo:plaNo,reStar:star,reContent:content,userId:userId},
    		dataType:"json",
    		success:function(data)
    		{
				if(data.result>0){
					swal({
						  text: "등록이 완료되었습니다.",
						  icon: "success",
						  button: "확인",
						}).then(function(isConfirm) {
							  if (isConfirm) {
								   fn_reviewList(plaNo); 
								  }
								});
				}else{
					swal({
						  text: "등록이 되지 않았습니다.",
						  icon: "error",
						  button: "확인",
						});
				}
    			
    		},error:function(jxhr,textStatus,error)
            {
                console.log("ajax실패!");
                console.log(jxhr);
                console.log(textStatus);
                console.log(error);
             }
    	})  
    	}
    } 
    function parseMSDate(s) {
    	   var dregex = /\/Date\((\d*)\)\//;
    	   return dregex.test(s) ? new Date(parseInt(dregex.exec(s)[1])) : s;
    	}
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>