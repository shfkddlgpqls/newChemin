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
        min-height: 150px;
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
      .menu_box{
       background-color: white;
       /*  color: #efefef; */
        margin-bottom:1%;
        height:30%;
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
        height:40%;
        border:solid 1px #E5E8E8;
	}
	.review_sub_box{
		border:solid 1px #E5E8E8;
		  margin-left:auto;
  		margin-right:auto;
  		height:46%;
	}
 .load_box{
 background-color: white;
       /*  color: #efefef; */
        margin-bottom:1%;
        height:109%;
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
      	<h1 style="margin-top:3%;font-size:50px"><strong>용호낙지 강남점</strong></h1>
      	<div class="row" style="width:40%;margin-left:auto; margin-right:auto;text-align:center">
      	<span style="margin:2%;font-size:1.09em">평점 </span> 	
      			<div class="star-rating" style=" font-size:1.3em;margin:1%">
					        <span class="fa fa-star-o" data-rating="1"></span>
					        <span class="fa fa-star-o" data-rating="2"></span>
					        <span class="fa fa-star-o" data-rating="3"></span>
					        <span class="fa fa-star-o" data-rating="4"></span>
					        <span class="fa fa-star-o" data-rating="5"></span>
					        <span class="rating-value" value="3">
					   </div>&nbsp;&nbsp;
					   <input type="text" name="whatever1" class="rating-value" value="3" style="width:3%;border:none;font-size:1.09em"/>
					   <span style="border:none;margin-top:2%;font-size:1.09em">점</span>&nbsp;
			   <span style="margin:2%"> ·&nbsp;&nbsp;리뷰(45)</span>
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
	      		<span style="font-size:15px;text-transform:uppercase;">업데이트 2018.08.27</span>
	      	</div>
      	</div>

      	<div class="row">
      	<div style="margin-left:15%;float:left;">
      		<i class="fa fa-map-marker" style="font-size:20px;color:#989898;"></i>
      		<span >서울 강남구 테헤란로 119 (우)21574</span>
      		 <p>(지번) 역삼동 649-14 1층</p> 
      	</div> 
      	</div>
      	
      	<div class="row">
      	<div style="margin-left:15%;float:left;">
      		<i class="fa fa-clock-o" style="font-size:20px;color:#989898;"></i>
      		<span >영업시간 영업종료</span>
      		<p>매일 11:00 ~ 23:00 연중무휴</p> 
      	</div> 
      	</div>
      	
      	<div class="row">
      	<div style="margin-left:15%;float:left">
      		<i class="fa fa-phone" style="font-size:20px;color:#989898"></i>
      		<span >02-1564-5441</span>
      	</div> 
      	</div>	
      	
      </div> 
      
      <!-- 메뉴  content -->
      <div class="box menu_box">
      	<div style="height:10%; margin-top:5%; margin-bottom:2%">
		      <div style="margin-left:13%; float:left">
		      		<span style="font-size:20px;text-transform:uppercase;"><strong>메뉴</strong></span>
		      </div>
      	</div>
      	
      	<div class="row">
      	<div style="margin-left:15%;float:left;">
      		<table>
      			<tr>
	      			<th></th>
	      			<th></th>
	      			<th></th>
      			</tr>
      			<tr>
      				<td>낙곱새</td>
      				<td>&nbsp;---------------------------------------------------&nbsp;</td>
      				<td>10000원</td>
      			
      			</tr>
      			
      			<tr>
      				<td>용호전골</td>
      				<td>&nbsp;---------------------------------------------------&nbsp;</td>
      				<td>10000원</td>
      			</tr>
      			<tr>
      				<td>낙새</td>
      				<td>&nbsp;---------------------------------------------------&nbsp;</td>
      				<td>10000원</td>
      			</tr>
      			<tr >
      				<td>라면 · 우동</td>
      				<td>&nbsp;---------------------------------------------------&nbsp;</td>
      				<td>2000원</td>
      			</tr>
      			<tr>
      				<td>사이다 · 콜라</td>
      				<td>&nbsp;---------------------------------------------------&nbsp;</td>
      				<td>2000원</td>
      			</tr>
      		</table>
      	</div> 
      	</div>
      		
      </div> 
      
      
     <!-- 사진 내용 -->
       <div class="box detail_box">
	       <div style="height:10%; margin-top:5%; margin-bottom:2%">
		      	<div style="margin-left:13%; float:left">
		      		<span style="font-size:20px;text-transform:uppercase;"><strong>사진</strong></span>
		      	</div>
	      	</div>
	      	
	      	<div class="row" style="width:80%;margin-left:auto;margin-right:auto;">
	      	<div style="float:left;">

    <!-- main slider carousel -->
    
        <div id="ThumbnailCarousel" class="carousel slide col-xs-12" data-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <div class="row">
			          <div class="col-md-3 col-sm-6"><a href="#x" class="thumbnail"><img src="${path}/resources/base/img/menu.jpg" alt="Image" class=" img-thumbnail"></a>
			          </div>
			          <div class="col-md-3 col-sm-6"><a href="#x" class="thumbnail"><img src="${path}/resources/base/img/menu.jpg" alt="Image" class=" img-thumbnail"></a>
			          </div>
			          <div class="col-md-3"><a href="#x" class="thumbnail"><img src="${path}/resources/base/img/menu.jpg" alt="Image" class=" img-thumbnail"></a>
			          </div>
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="${path}/resources/base/img/menu.jpg" alt="Image" class=" img-thumbnail"></a>
			          </div>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <div class="row">
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/kr/ko/images/products/vardagen-baleudagen-gyelyangkeob__0462815_PE608339_S4.JPG" alt="Image" class=" img-thumbnail"></a>
			          </div>
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/kr/ko/images/products/tokig-tokigeu-chaesotalsugi-hwaiteu__0095891_PE235176_S4.JPG" alt="Image" class=" img-thumbnail"></a>
			          </div>
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/kr/ko/images/products/plastis-peullaseutiseu-eol-eumteul-teokwoijeu__0092975_PE229787_S4.JPG" alt="Image" class=" img-thumbnail"></a>
			          </div>
			           <div class="col-md-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/kr/ko/images/products/dekad-dekadeu-allamsigye-beullaeg__0110719_PE262840_S4.JPG" alt="Image" class=" img-thumbnail"></a>
			          </div>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <div class="row">
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/PIAimages/0566046_PE664563_S3.JPG" alt="Image" class="img-fluid img-thumbnail"></a>
			          </div>
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/kr/ko/images/products/fado-pado-tagsangseutaendeu-pingkeu__0606975_PE682644_S4.JPG" alt="Image" class=" img-thumbnail"></a>
			          </div>
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/kr/ko/images/products/koarp-koaleupeu-amcheeo-beiji__0522280_PE643185_S4.JPG" alt="Image" class=" img-thumbnail"></a>
			          </div>
			          <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="https://www.ikea.com/kr/ko/images/products/bumerang-bumelang-osgeol-i-hwaiteu__0192382_PE347080_S4.JPG" alt="Image" class=" img-thumbnail"></a>
			          </div>
			      </div>
			    </div>
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
				<!-- 1. 약도 노드 -->
				<div style="margin:0%;width:100%;" id="daumRoughmapContainer1535771533186" class="root_daum_roughmap root_daum_roughmap_landing"></div>
				
				<!-- 2. 설치 스크립트 -->
				<script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>
				
				<!-- 3. 실행 스크립트 -->
				<script charset="UTF-8">
					new daum.roughmap.Lander({
						"timestamp" : "1535771533186",
						"key" : "psb4",
						"mapWidth" : "100%",
						"mapHeight" : "300"
					}).render();
				</script>
	      	</div> 
	      </div>
	      
	      
	      
	      
	      <!-- 평가 리뷰 -->
	      <div class="box review_box">
	       <div style="height:10%; margin-top:5%; margin-bottom:2%">
		      	<div style="margin-left:13%; float:left">
		      		<span style="font-size:20px;text-transform:uppercase;"><strong>평가하기</strong></span>
		      	</div>
	      	</div>
	      	
	      	<div class="row" ">
				<div class="review_sub_box" style="width:72%; float:left;">					
					<div style="width:100%;height:20%; border-bottom:solid 1px #E5E8E8;">
						<div class="star-rating" style="margin:2%">
					        <span class="fa fa-star-o" data-rating="1"></span>
					        <span class="fa fa-star-o" data-rating="2"></span>
					        <span class="fa fa-star-o" data-rating="3"></span>
					        <span class="fa fa-star-o" data-rating="4"></span>
					        <span class="fa fa-star-o" data-rating="5"></span>
					        <input type="text" name="star-value" class="rating-value" value="3">/5 
					        &nbsp;<span style="font-size:0.85em"> 평가해주세요!</span>
					      </div>
					</div>
					<textarea rows="5" style="width:100%;border-bottom:1px solid #E5E8E8;border-top:0px;border-left:0px;border-right:0px" 
					placeholder="&#13;&#10;&#13;&#10;&nbsp;여기의 어떤 점이 마음에 드셨나요?" id="content" maxlength="1000"></textarea>
					
				  <div  style="width:100%;height:18%;">
				  <button  style="height:100%;width:10%;float:right;">등록</button>
				  	 <span id="counter" style="font-size:1.2em;margin:1%;float:right;">###</span>&nbsp; 					
				  </div>
				</div>		
    
	      	</div> 
	      </div>
    
<!-- <script>
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
geocoder.addressSearch('서울 강남구 테헤란로 119', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

       /*  // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker); */

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>  -->
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
   
    
    $(function() {
        $('#content').keyup(function (e){
            var content = $(this).val();
             /* $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');  */
            $('#counter').html(content.length + '/1000');
        });
        $('#content').keyup();
    });
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
