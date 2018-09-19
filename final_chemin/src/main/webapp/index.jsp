<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<%@ include file='WEB-INF/views/common/header.jsp' %>
    
    <!-- header -->
	<Section class="mainHomeSection text-center text-white d-flex">
		<div class="container my-auto">
		<div class="row">
			<div class="col-lg-10 mx-auto">	
                <h1 class="text-uppercase nanumFont">
              <strong>꽃길만 걸을 당신을 위한 서비스 </strong>
          	  </h1>
                <hr class="hrmain">
             </div>
                <div class="col-lg-8 mx-auto">
             <p class="text-faded mb-5">1인 가구를 위한 서비스</p>
            <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Find Out More</a>
          </div>
        </div>
      </div>
	</Section>
      
 <Section id="about" style="background-color:#FCFDFD;">
	<div class="container">
		<div class="row section1">
		
		 <div class="col-lg-12 text-center section1">
            <h2 class="text-uppercase nanumFont">
              <strong>나와 같은 1인 가구, 얼마나 있을까요? </strong>
            </h2>
            <br> 
            <br>
          </div>
		
		<div class="container">
	      <div class="row">
	      
	      	 <div class="col-lg-3 col-md-6 text-center">
	      	 	 <div class="counter">
				      <i class="fa fa-user fa-2x"></i>
				      <h2 class="timer count-title count-number nanumFont" data-to="27" data-speed="1500"></h2>
				       <p class="count-text nanumFont">1인 가구 비중 (%)</p>
   			 	 </div>
	      </div>
	      
          <div class="col-lg-3 col-md-6 text-center">
              <div class="counter">
			      <i class="fa fa-home fa-2x"></i>
			      <h2 class="timer count-title count-number nanumFont " data-to="5397615" data-speed="1500"></h2>
			      <p class="count-text nanumFont">1인 가구 수</p>
			  </div>
          </div>
          
              <div class="col-lg-3 col-md-6 text-center">
                  <div class="counter">
				      <i class="fa fa-map-pin fa-2x"></i>
				      <h2 class="timer count-title count-number nanumFont " data-to="4124961" data-speed="1500"></h2>
				      <p class="count-text nanumFont">도시 지역 거주 1인 가구 수 </p>
    			 </div>
    	     	</div>
    	     	
    	     	<div class="col-lg-3 col-md-6 text-center">
                  <div class="counter">
				      <i class="fa fa-krw fa-2x"></i>
				      <h2 class="timer count-title count-number nanumFont " data-to="77" data-speed="1500"></h2>
				      <p class="count-text nanumFont">1인 가구 평균 소비 성향(%) </p>
    			 </div>
    	     	</div>	
      		 </div>
  		</div>
	</div>
	</div>
</Section>

    <section style="background-color:#B7BEC9;">
      <div class="container text-center" >
        <h4 class="mb-4 nanumFont" style="color:white;">우리는 이 많은 1인 가구들을 위해 어떤 서비스를 제공해줄 수 있는지 고민하였습니다. <br>
      		 당신을 위해 준비한 놀라운 서비스들을 확인해보세요.</h4>
      		 <br>
         <a class="btn btn-primary btn-xl js-scroll-trigger nanumFont" href="#services">서비스 확인</a>
      </div>
    </section>

    <section id="services">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading basicEngFont">At Your Service</h2>
            <hr class="hrmain my-4">
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-map-marker text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3 nanumFont">혼족 Map</h3>
              <p class="text-muted mb-0 nanumFont">혼밥, 혼술, 혼즐하기 좋은 장소들을 지도에서 찾아보세요. </p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-cart-plus text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3 nanumFont">Chemin Mall</h3>
              <p class="text-muted mb-0 nanumFont">1인 가구에 적합한 물품들을 구경해보고 구입할 수도 있습니다.</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-comments-o text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3 nanumFont">꿀팁 커뮤니티</h3>
              <p class="text-muted mb-0 nanumFont ">혼자 살 때 도움이 되는 꿀팁들을 나누고, 다른 사람들의 꿀팁도 확인해보세요.</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-lightbulb-o text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3 nanumFont">당신만을 위한 기능 </h3>
              <p class="text-muted mb-0 nanumFont">당신을 위해 준비한 더 많은 기능들이 있습니다. 확인해보세요!</p>
            </div>
          </div>
        </div>
      </div>
    </section>
   
    
 	<section style="background-color:#B7BEC9;">
 	 <div class="container-fluid">
        <div class="row" >
          <div class="col-lg-12 text-center">
            <h4 class="section-heading nanumFont" style="color:white;">지금 이 시간, Mall의 Best 상품들입니다</h4>
        	<hr>
          </div>
        </div>
        <div class="container">
		<div class="row" style="margin-left:auto;margin-right:auto;">
			<div id="ThumbnailCarousel" class="carousel slide col-xs-12" data-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active" id="view1">
			      
			    </div>
			    <div class="carousel-item" id="view2">
			      
			    </div>
			    <div class="carousel-item" id="view3">
			      
			    </div>
			  </div>
			  
			  <a class="carousel-control-prev" href="#ThumbnailCarousel" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  
			  <a class="carousel-control-next" href="#ThumbnailCarousel" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
			</div>
		 </div>
		</div>
	
	<script>
	$(function(){
    	best_list();
    });
	function best_list(){
		$.ajax({
			type:"get",
			url:"${path}/mall/mainList.do",
			datatype:"json",
			success:function(data){
				var view1="";
				var view2="";
				var view3="";
				if(data!=null){
					view1+='<div class="row">';
					view1+='<div class="col-md-3"><a href="#" class="thumbnail"><img src="${path}/resources/upload/productImg/'+data[0][0]+'" alt="Image" class=" img-thumbnail"></a></div>';
					view1+='<div class="col-md-3"><a href="#" class="thumbnail"><img src="${path}/resources/upload/productImg/'+data[0][1]+'" alt="Image" class=" img-thumbnail"></a></div>';
					view1+='<div class="col-md-3"><a href="#" class="thumbnail"><img src="${path}/resources/upload/productImg/'+data[0][2]+'" alt="Image" class=" img-thumbnail"></a></div>';
					view1+='<div class="col-md-3"><a href="#" class="thumbnail"><img src="${path}/resources/upload/productImg/'+data[0][3]+'" alt="Image" class=" img-thumbnail"></a></div>';
					view1+='</div>';
					
					view2+='<div class="row">';
					view2+='<div class="col-md-3"><a href="#" class="thumbnail"><img src="${path}/resources/upload/productImg/'+data[0][4]+'" alt="Image" class=" img-thumbnail"></a></div>';
					view2+='<div class="col-md-3"><a href="#" class="thumbnail"><img src="${path}/resources/upload/productImg/'+data[0][5]+'" alt="Image" class=" img-thumbnail"></a></div>';
					view2+='<div class="col-md-3"><a href="#" class="thumbnail"><img src="${path}/resources/upload/productImg/'+data[0][6]+'" alt="Image" class=" img-thumbnail"></a></div>';
					view2+='<div class="col-md-3"><a href="#" class="thumbnail"><img src="${path}/resources/upload/productImg/'+data[0][7]+'" alt="Image" class=" img-thumbnail"></a></div>';
					view2+='</div>';
					
					view3+='<div class="row">';
					view3+='<div class="col-md-3"><a href="#" class="thumbnail"><img src="${path}/resources/upload/productImg/'+data[0][8]+'" alt="Image" class=" img-thumbnail"></a></div>';
					view3+='<div class="col-md-3"><a href="#" class="thumbnail"><img src="${path}/resources/upload/productImg/'+data[0][9]+'" alt="Image" class=" img-thumbnail"></a></div>';
					view3+='<div class="col-md-3"><a href="#" class="thumbnail"><img src="${path}/resources/upload/productImg/'+data[0][10]+'" alt="Image" class=" img-thumbnail"></a></div>';
					view3+='<div class="col-md-3"><a href="#" class="thumbnail"><img src="${path}/resources/upload/productImg/'+data[0][11]+'" alt="Image" class=" img-thumbnail"></a></div>';
					view3+='</div>';
				}
				$('#view1').html(view1);
				$('#view2').html(view2);
				$('#view3').html(view3);
			},
			error:function(jxhr,textStatus,error){
				console.log("mainMall ajax 실패 : "+jxhr+" "+textStatus+" "+error);
			}
		});
	}
	</script>
	
	</section>
    <!-- footer -->
 <%@ include file='WEB-INF/views/common/footer.jsp' %>
