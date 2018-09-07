<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set value="${pageContext.request.contextPath }" var="path"/>
 <style>
.category, .category *{margin:0;padding:0;color:#000;}   
.category {
	position:relative;
	top:0px;left:0px;width:50px;
	height:100%;
	z-index:10;
	border:1px solid black;
	font-family:'Malgun Gothic','맑은 고딕',sans-serif;
	font-size:12px; 
	text-align:center;
	background-color:#B6BDC8;
}
.category .menu_selected 
{
	background:#F06340;
	color:#fff;
/* 	border-left:1px solid #915B2F;
	border-right:1px solid #915B2F; */
	margin:0 -1px;
} 
.category li
{
	
	background-color:#B6BDC8;
	height:10%;
	width:50%;
/* 	border-bottom: solid 1px #374854; */
	padding-top:5px;
	list-style:none;
	float:left;
	cursor:pointer;
	color:#fff;
}
.list-group-item{
	border:0
}
.material-icons{
color:#fff;
}
.category .ico_comm 
{
	display:block;
	margin:0 auto 2px;
	width:22px;
	height:26px;
}

/* 마커위에 창 */
   .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}

</style>
<div class="row" style="margin-top:55px">
  <div class="category col-md-2">
        <ul class="list-group">
        	<li class="list-group-item" style="width:100%">
        		<span style="font-size:1.3em; width:30%;"><strong>지역선택</strong></span>        		
				  <select class="form-control" style="width:70%;margin-left:16%;margin-top:3%">
				  <option>마포구</option>
				  <option>강남구</option>
				  <option>서초구</option>
				  <option>송파구</option>
				</select>
        	</li>
        	<div class="row">
            <li class="list-group-item"  id="coffeeMenu" onclick="changeMarker('coffee')">
               <div>
               		<img style="width:35%;height:65%" src="${path}/resources/map/img/res1.png"/>
               	</div>
               	<span style="font-size:1.3em; width:30%; text-align: center;"><strong>식사</strong></span> 
            </li>
            <li class="list-group-item" id="storeMenu" onclick="changeMarker('store')">
               <div>
               		<img style="width:35%;height:65%" src="${path}/resources/map/img/beer1.png"/>
               	</div>
               	<span style="font-size:1.3em; width:30%; text-align: center;"><strong>술</strong></span> 
            </li>
            </div>
            <div class="row">
            <li class="list-group-item " id="carparkMenu" onclick="changeMarker('carpark')">
               	<div>
               		<img style="width:35%;height:65%" src="${path}/resources/map/img/mic1.png"/>
               	</div>
               	<span style="font-size:1.3em; width:30%; text-align: center;"><strong>노래방</strong></span> 
            </li>
             <li class="list-group-item " id="sportskMenu" onclick="changeMarker('sports')">
               	<div>
               		<img style="width:35%;height:65%" src="${path}/resources/map/img/gym1.png"/>
               	</div>
               	<span style="font-size:1.3em; width:30%; text-align: center;"><strong>운동</strong></span> 
            </li>
            </div>
            <div class="row">
             <li class="list-group-item " id="movieMenu" onclick="changeMarker('movie')"> 
             		<div>
               		<img style="width:35%;height:65%" src="${path}/resources/map/img/movie1.png"/>
               		</div>
               		<span style="font-size:1.3em; width:30%; text-align: center;"><strong>영화/공연</strong></span> 
            </li>
             <li class="list-group-item " id="addMenu" onclick="changeMarker('add')">
               	<div>
               		<img style="width:35%;height:65%" src="${path}/resources/map/img/add.png"/>
               	</div>
               	<span style="font-size:1.3em; width:30%; text-align: center;"><strong>장소추가</strong></span> 
            </li>
            </div>
            
            <div class="row" >
            	 <li class="list-group-item "style="width:100%"> 
             		<button class="btn btn-primary" style="width:80%;height:75%">검색</button>
           		</li>
            	
            </div>
        </ul>
    </div>
    <!-- 지도가 표시될 div -->
 		<div class="col-md-10" id="map" style="width:45%;height:100%;"></div>
  
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eb4ae7857a625ec0a907f8f742645cfb"></script>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(37.498004414546934, 127.02770621963765), // 지도의 중심좌표 
        level: 3 // 지도의 확대 레벨 
    }; 

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 커피숍 마커가 표시될 좌표 배열입니다
var coffeePositions = [ 
    new daum.maps.LatLng(37.499590490909185, 127.0263723554437),
    new daum.maps.LatLng(37.499427948430814, 127.02794423197847),
    new daum.maps.LatLng(37.498553760499505, 127.02882598822454),
    new daum.maps.LatLng(37.497625593121384, 127.02935713582038),
    new daum.maps.LatLng(37.49646391248451, 127.02675574250912),
    new daum.maps.LatLng(37.49629291770947, 127.02587362608637),
    new daum.maps.LatLng(37.49754540521486, 127.02546694890695)                
];



selectMarker=null;

var markerImageSrc = 'http://localimg.daum-img.net/localimages/07/2009/map/icon/blog_icon01_on.png';
	
    coffeeMarkers = []; // 커피숍 마커 객체를 가지고 있을 배열입니다



// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
function createMarkerImage(src, size, options) {
    var markerImage = new daum.maps.MarkerImage(src, size, options);
    return markerImage;            
}

// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다

	function createMarker(position, image) {
	    var marker = new daum.maps.Marker({
	        position: position,
	        image: image
	    });
	      var overlay = new daum.maps.CustomOverlay({
	     	 content: content,
	      position: marker.getPosition()       
	     });
	     
	     daum.maps.event.addListener(marker, 'click', function() {
	    		 overlay.setMap(map);  
	     });
	    return marker;  
	}   

	function closeOverlay() {
		overlay.setMap(null);     
	}



//마커 클릭시 보여지는 커스텀 창
var content = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '              용호낙지' + 
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="${path}/resources/base/img/yong.PNG" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">서울 강남구 테헤란로 119</div>' + 
            '                <div class="jibun ellipsis">(우) 06134 (지번) 역삼동 649-14 1층</div>' + 
            '                <div><a href="${path}/map/placeInfo.do" class="link">용호낙지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';


            createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
          

            changeMarker('coffee'); // 지도에 커피숍 마커가 보이도록 설정합니다    
             
           
            
              
// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
function createCoffeeMarkers() {
    
    for (var i = 0; i < coffeePositions.length; i++) {  
        
        var imageSize = new daum.maps.Size(28, 35),
            imageOptions = {  
        		offset: new daum.maps.Point(18, 60)  
            };     
        
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(coffeePositions[i], markerImage);
        
      
        // 생성된 마커를 커피숍 마커 배열에 추가합니다
        coffeeMarkers.push(marker);
    }    
  

}

// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
function setCoffeeMarkers(map) {        
    for (var i = 0; i < coffeeMarkers.length; i++) {  
        coffeeMarkers[i].setMap(map);
        
       
    } 
  
}



// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
function changeMarker(type){
    
    var coffeeMenu = document.getElementById('coffeeMenu');
    var storeMenu = document.getElementById('storeMenu');
    var carparkMenu = document.getElementById('carparkMenu');
    var sportskMenu = document.getElementById('sportskMenu');
    var movieMenu = document.getElementById('movieMenu');
    var addMenu = document.getElementById('addMenu');
    
    // 커피숍 카테고리가 클릭됐을 때
    if (type === 'coffee') {
        // 커피숍 카테고리를 선택된 스타일로 변경하고
        coffeeMenu.className = 'menu_selected';
        
        // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
        storeMenu.className = '';
        carparkMenu.className = '';
        sportskMenu.className = '';
        movieMenu.className = '';
        addMenu.className = '';
        
        // 커피숍 마커들만 지도에 표시하도록 설정합니다
        setCoffeeMarkers(map);
        setStoreMarkers(null);
        setCarparkMarkers(null);
        
    } else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때
    
        // 편의점 카테고리를 선택된 스타일로 변경하고
        coffeeMenu.className = '';
        storeMenu.className = 'menu_selected';
        carparkMenu.className = '';
        sportskMenu.className = '';
        movieMenu.className = '';
        addMenu.className = '';
        
        // 편의점 마커들만 지도에 표시하도록 설정합니다
        setCoffeeMarkers(null);
        setStoreMarkers(map);
        setCarparkMarkers(null);
        
    } else if (type === 'carpark') { // 주차장 카테고리가 클릭됐을 때
     
        // 주차장 카테고리를 선택된 스타일로 변경하고
        coffeeMenu.className = '';
        storeMenu.className = '';
        carparkMenu.className = 'menu_selected';
        sportskMenu.className = '';
        movieMenu.className = '';
        addMenu.className = '';
        
        // 주차장 마커들만 지도에 표시하도록 설정합니다
        setCoffeeMarkers(null);
        setStoreMarkers(null);
        setCarparkMarkers(map);  
    } 
    else if (type === 'sports') { // 스포츠 카테고리가 클릭됐을 때
        
        // 주차장 카테고리를 선택된 스타일로 변경하고
        coffeeMenu.className = '';
        storeMenu.className = '';
        carparkMenu.className = '';
        sportskMenu.className = 'menu_selected';
        movieMenu.className = '';
        addMenu.className = '';
        
        // 주차장 마커들만 지도에 표시하도록 설정합니다
        setCoffeeMarkers(null);
        setStoreMarkers(null);
        setCarparkMarkers(map);  
    } 
    else if (type === 'movie') { // 스포츠 카테고리가 클릭됐을 때 
        // 주차장 카테고리를 선택된 스타일로 변경하고
        coffeeMenu.className = '';
        storeMenu.className = '';
        carparkMenu.className = '';
        sportskMenu.className = '';
        movieMenu.className = 'menu_selected';
        addMenu.className = '';
        
        // 주차장 마커들만 지도에 표시하도록 설정합니다
        setCoffeeMarkers(null);
        setStoreMarkers(null);
        setCarparkMarkers(map);  
    } else if (type === 'add'){
    	 coffeeMenu.className = '';
         storeMenu.className = '';
         carparkMenu.className = '';
         sportskMenu.className = '';
         movieMenu.className = '';
         addMenu.className='menu_selected';
         location.href="${path}/map/placeReg.do";
    }
} 
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
