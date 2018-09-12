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
    .desc .phone .time{font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<div class="row" style="margin-top:55px">
  <div class="category col-md-2">
  	 <form action="${path}/map/placeSearch.do" method="post" onsubmit="return validate();">
        <ul class="list-group">
        	<li class="list-group-item" style="width:100%">
        		<span style="font-size:1.3em; width:30%;"><strong>지역선택</strong></span>        		
				  <select class="form-control" name="plaArea" style="width:70%;margin-left:16%;margin-top:3%">
					  <option value="마포구">마포구</option>
			   		  <option value="강남구">강남구</option>
			   		  <option value="서초구">서초구</option>
			   		  <option value="송파구">송파구</option>
				</select>
        	</li>
        	<div class="row">
	            <li class="list-group-item"  id="foodMenu"  onclick="changeMarker('food')">
	            	<input type="hidden" name="plaCategory"/>
	               <div>
	               		<img style="width:35%;height:65%"  src="${path}/resources/map/img/res1.png"/>
	               	</div>
	               	<span style="font-size:1.3em; width:30%; text-align: center;"><strong>식사</strong></span> 
	            </li>
	            <li class="list-group-item" id="beerMenu" onclick="changeMarker('beer')">
	               <div>
	               		<img style="width:35%;height:65%" src="${path}/resources/map/img/beer1.png"/>
	               	</div>
	               	<span style="font-size:1.3em; width:30%; text-align: center;"><strong>술</strong></span> 
	            </li>
            </div>
            <div class="row">
	            <li class="list-group-item " id="micMenu" onclick="changeMarker('mic')">
	               	<div>
	               		<img style="width:35%;height:65%" src="${path}/resources/map/img/mic1.png"/>
	               	</div>
	               	<span style="font-size:1.3em; width:30%; text-align: center;"><strong>노래방</strong></span> 
	            </li>
	             <li class="list-group-item " id="sportsMenu" onclick="changeMarker('sports')">
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
             		<input type="submit" class="btn btn-primary" style="width:80%;height:75%" value="검색">
           		</li>
            	
            </div>
        </ul>
        </form>
    </div>
    <!-- 지도가 표시될 div -->
 		<div class="col-md-10" id="map" style="width:45%;height:100%;"></div>
  
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eb4ae7857a625ec0a907f8f742645cfb&libraries=services"></script>
<script>
var foodMarkerImgSrc = 'https://i.imgur.com/JwCP32X.png';
var movieMarkerImgSrc = 'https://i.imgur.com/5Gvp5eL.png';
var beerMarkerImgSrc = 'https://i.imgur.com/BgXoOqa.png';
var micMarkerImgSrc = 'https://i.imgur.com/GKf7xiJ.png';
var sprotsMarkerImgSrc = 'https://i.imgur.com/pxp28os.png';

/* var size = '${plaList.size()}'; */
var address=[];
var categoryImg=[];
var contentArray=[];
var overlayArr=[];

$(function(){
	if('${plaList.size()}'==0){
	swal({
		  text: "검색결과가 없습니다.",
		  icon: "error",
		  button: "확인",
		});
	}
	<c:forEach items="${plaList}" var="p">
	address.push('${p.plaAddr}')
 	if('${p.plaCategory}'=='식사'){
		   var imageSize = new daum.maps.Size(30, 37),
            imageOptions = {  
        		offset: new daum.maps.Point(18, 60)  
            };  
		  var markerImage = createMarkerImage(foodMarkerImgSrc, imageSize, imageOptions)
		  categoryImg.push(markerImage); 
	}else if('${p.plaCategory}'=='술'){
		var imageSize = new daum.maps.Size(30, 37),
        imageOptions = {  
    		offset: new daum.maps.Point(18, 60)  
        };  
	  	var markerImage = createMarkerImage(beerMarkerImgSrc, imageSize, imageOptions)
	  	categoryImg.push(markerImage);
	}
	else if('${p.plaCategory}'=='노래방'){
		var imageSize = new daum.maps.Size(30, 37),
        imageOptions = {  
    		offset: new daum.maps.Point(18, 60)  
        };  
	  	var markerImage = createMarkerImage(micMarkerImgSrc, imageSize, imageOptions)
	  	categoryImg.push(markerImage);
	} 
	else if('${p.plaCategory}'=='스포츠'){
		var imageSize = new daum.maps.Size(30, 37),
        imageOptions = {  
    		offset: new daum.maps.Point(18, 60)  
        };  
	  	var markerImage = createMarkerImage(sprotsMarkerImgSrc, imageSize, imageOptions)
	  	categoryImg.push(markerImage);
	}else{
		var imageSize = new daum.maps.Size(30, 37),
        imageOptions = {  
    		offset: new daum.maps.Point(18, 60)  
        };  
	  	var markerImage = createMarkerImage(movieMarkerImgSrc, imageSize, imageOptions)
	  	categoryImg.push(markerImage);
	}

	var addr = '${p.plaAddr}';
	var addrStr = addr.split("/"); 
	var time ='${p.plaTime}';
	var timeStr = time.split("/");
	
	var content = '<div class="wrap">' + 
    '    <div class="info">' + 
    '        <div class="title">' + 
    '              ${p.plaName}' + 
    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
    '        </div>' + 
    '        <div class="body">' + 
    '            <div class="img">' +
    '                <img src="${path}/resources/upload/place/main/${p.reImg}" width="73" height="70">' +
    '           </div>' + 
    '            <div class="desc">' + 
    '                <div class="ellipsis">'+addrStr[0]+'</div>' + 
    '                <div class="phone"><i class="fa fa-phone" style="font-size:1em;color:#989898"></i> ${p.plaPhone}</div>' + 
    '                <div class="time"><i class="fa fa-clock-o" style="font-size:1em;color:#989898;"></i>'+' '+timeStr[0]+' '+timeStr[1]+'~'+timeStr[2]+'</div>'+
    '                <div><a href="${path}/map/placeInfo.do?plaNo=${p.plaNo}" class="link">${p.plaName}</a></div>' + 
    '            </div>' + 
    '        </div>' + 
    '    </div>' +    
    '</div>';
	    contentArray.push(content)
	</c:forEach>
	
	fn_drawMap(address,categoryImg,contentArray);
	
})

// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
function createMarkerImage(src, size, options) {
    var markerImage = new daum.maps.MarkerImage(src, size, options);
    return markerImage;            
}


function fn_drawMap(address,categoryImg,contentArray){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(37.556048302475745, 126.91733299528988), // 지도의 중심좌표 
        level: 5 // 지도의 확대 레벨 
    }; 
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
  
	for(var i=0; i<address.length; i++){
	(function(i){
		geocoder.addressSearch(address[i], function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		    	
			     if (status === daum.maps.services.Status.OK) {
			    	
			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			  
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new daum.maps.Marker({
			            map: map,
			            position: coords,
			            image: categoryImg[i]
			        });
			        
			        var overlay = new daum.maps.CustomOverlay({
				     content: contentArray[i],
				      position: marker.getPosition()       
				     });
				     
			        overlayArr.push(overlay)
				     daum.maps.event.addListener(marker, 'click', function() {
				    		 overlay.setMap(map);  
				     });
				   
			    } 
			});
	})(i);
  }
	
}

/* function closeOverlay() {
	for(var i=0; i<overlayArr; i++){
		overlayArr[i].setMap(null);  
	}
	   
} */


// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
function changeMarker(type){
    
    var foodMenu = document.getElementById('foodMenu');
    var beerMenu = document.getElementById('beerMenu');
    var micMenu = document.getElementById('micMenu');
    var sportsMenu = document.getElementById('sportsMenu');
    var movieMenu = document.getElementById('movieMenu');
    var addMenu = document.getElementById('addMenu');
    
    // 식사 카테고리가 클릭됐을 때
    if (type === 'food') {
        // 식사 카테고리를 선택된 스타일로 변경하고
        foodMenu.className = 'menu_selected';
        
        // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
        beerMenu.className = '';
        micMenu.className = '';
        sportsMenu.className = '';
        movieMenu.className = '';
        addMenu.className = '';

        $('[name=plaCategory]').val('식사');
        
    } else if (type === 'beer') { // 술 카테고리가 클릭됐을 때
    
        foodMenu.className = '';
        beerMenu.className = 'menu_selected';
        micMenu.className = '';
        sportsMenu.className = '';
        movieMenu.className = '';
        addMenu.className = '';
        
        $('[name=plaCategory]').val('술');
    } else if (type === 'mic') { // 노래방 카테고리가 클릭됐을 때
     
        foodMenu.className = '';
        beerMenu.className = '';
        micMenu.className = 'menu_selected';
        sportsMenu.className = '';
        movieMenu.className = '';
        addMenu.className = '';
        $('[name=plaCategory]').val('노래방');

    } 
    else if (type === 'sports') { // 스포츠 카테고리가 클릭됐을 때
        foodMenu.className = '';
        beerMenu.className = '';
        micMenu.className = '';
        sportsMenu.className = 'menu_selected';
        movieMenu.className = '';
        addMenu.className = '';
        $('[name=plaCategory]').val('스포츠');
        
    } 
    else if (type === 'movie') { // 영화/공연 카테고리가 클릭됐을 때 
        foodMenu.className = '';
        beerMenu.className = '';
        micMenu.className = '';
        sportsMenu.className = '';
        movieMenu.className = 'menu_selected';
        addMenu.className = '';
        $('[name=plaCategory]').val('영화/공연');
        
    } else if (type === 'add'){
    	 foodMenu.className = '';
         beerMenu.className = '';
         micMenu.className = '';
         sportsMenu.className = '';
         movieMenu.className = '';
         addMenu.className='menu_selected';
         location.href="${path}/map/placeReg.do";
    }
} 

function validate(){
	var food = $('#foodMenu').attr('class');
	var beer = $('#beerMenu').attr('class');
	var mic = $('#micMenu').attr('class');
	var sports = $('#sportsMenu').attr('class');
	var movie = $('#movieMenu').attr('class');

		if(food!='menu_selected'&&beer!='menu_selected'&&mic!='menu_selected'&&sports!='menu_selected'&&movie!='menu_selected'){
			swal({
				  text: "카테고리를 선택해주세요",
				  icon: "warning",
				  button: "확인",
				});
			return false;
		}
		return true;	
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
