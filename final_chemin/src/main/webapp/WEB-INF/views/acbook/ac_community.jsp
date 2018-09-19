<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!-- Jquery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- Community -->
<link rel="stylesheet" href="<c:url value= "/resources/acbook/css/ac_cummunity.css"/>">
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- sideBar -->
<jsp:include page="/WEB-INF/views/acbook/sideBar.jsp" />

<!-- Main Start -->
<div class="col-md-10 col-sm-8 main-content"  id="newMain">
<!-- 삭제금지 -->
<div class="container-fluid"><br><br>
   <div class="row">   
      <section class="content">         
         <h1>Free-fleri Monthly Closing an Account</h1><hr>
            <!-- <div class="col-md-10 col-md-offset-2"> -->
            <div class="panel panal-default">
               <div class="panel-body">
                  <div class="pull-right">
                     <div class="btn-group">
                        <button type="button" class="btn btn-info btn-filter" data-target="a">10's</button>
                        <button type="button" class="btn btn-warning btn-filter" data-target="b">20's</button>
                        <button type="button" class="btn btn-default btn-filter" data-target="c">30's</button>
                        <button type="button" class="btn btn-primary btn-filter" data-target="d">40's</button>
                        <button type="button" class="btn btn-danger btn-filter" data-target="e">50's</button>
                        <button type="button" class="btn btn-info btn-filter" data-target="f">60's</button>
                        <button type="button" class="btn btn-success btn-filter" data-target="all">all</button>
                     </div>
                  </div>
                  <div class="table-container">
                     <table class="table table-filter" id="tbl-comlist"></table>
                     <div  id="pageBar"></div>
                     <div id="totalCounts"></div>
                  </div>
                  <div class="container" style="magin:10%;padding:5%;">
                     <button type="button" class="btn btn-info btn-filter" id="writeAc">write</button>
                  </div>
               </div>
            </div>
            <div class="content-footer">
               <p>
                  Page © - 2018 <br>
                  Powered By <a href="" target="_blank">Chemin_Fluri_Accountbook</a>
               </p>
            </div>
            <!-- </div> -->
      </section>
   </div>
</div>
<!-- 삭제금지 -->
</div>
<!-- Main End -->
</div>
</div>
<!-- Side Bar Div End -->
<script>
$('#writeAc').on('click',function(){
   location.href="${pageContext.request.contextPath}/ac_comBoard.do";
})
</script>
<script>
$('#readAc').on('click',function(){
   location.href="${pageContext.request.contextPath}/acbook/selectReadOne.do";
})
</script>
<script>
$(document).ready(function () {

   $('.star').on('click', function () {
      $(this).toggleClass('star-checked');
    });

    $('.ckbox label').on('click', function () {
      $(this).parents('tr').toggleClass('selected');
    });

    $('.btn-filter').on('click', function () {
      var $target = $(this).data('target');
      if ($target != 'all') {
        $('.table tr').css('display', 'none');
        $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
      } else {
        $('.table tr').css('display', 'none').fadeIn('slow');
      }
    });

 });
</script>
<script>
$(function(){
   fn_list(1);
});
function fn_list(cPage){
   $.ajax({
      url:"${pageContext.request.contextPath}/acbook/acComList.do",
      data:{cPage:cPage},
      type:"get",
      dataType:"json",
      success: function(data){
         console.log(data+"데이터");
         console.log("load (BoardList) success");

         /* var html1=$("#totalCounts").html();
         var totalCounts= data.model.totalCounts;
         $("#totalCounts").html(html1+totalCounts).show(); */
         
         var html2=$("#pageBar").html();
         var pageBar= data.model.pageBar;
         $("#pageBar").html(pageBar).show();
         
         if(data!=null){
            var html3= $("#tbl-comlist").html();
            var html;
            var birth;
            var ages;
            for(var i=0;i<data.model.list.length;i++){
               
               if((data.model.list[i].BIRTHDAY).substr(0,4)<1960){
                  ages="f";
               }
               if((data.model.list[i].BIRTHDAY).substr(0,4)<1970 && (data.model.list[i].BIRTHDAY).substr(0,4)>=1960){
                  ages="e";
               }
               if((data.model.list[i].BIRTHDAY).substr(0,4)<1980 && (data.model.list[i].BIRTHDAY).substr(0,4)>=1970){
                  ages="d";
               }
               if((data.model.list[i].BIRTHDAY).substr(0,4)<1990 && (data.model.list[i].BIRTHDAY).substr(0,4)>=1980){
                  ages="c";
               }
               if((data.model.list[i].BIRTHDAY).substr(0,4)<2000 && (data.model.list[i].BIRTHDAY).substr(0,4)>=1990){
                  ages="b";
               }
               if(((data.model.list[i].BIRTHDAY).substr(0,4))>=2000){
                  ages="a";
               }
         
               html+="<tbody>";
               html+="<tr data-status="+ages+">";
               html+="<td>";
               html+="<div class='ckbox'>";
               html+="<input type='checkbox' id='checkbox1'>";
               html+="<label for='checkbox1'></label>";
               html+="</div>";               
               html+="</td>";
               html+="<td><h4 class='accmt' id='accmt'>"+data.model.list[i].ACCNO+"</h4>";
               html+="</td>";
               html+="<td>";
               html+="<a href='javascript:;' class='star'>";
               html+="<i class='glyphicon glyphicon-star'></i>";
               html+="</a>";
               html+="</td>";
               html+="<td>";
               html+="<div class='media'>";
               html+="<a href='#' class='pull-left'>";
               html+="<img src='https://image.flaticon.com/icons/svg/138/138283.svg' class='media-photo'>";
               html+="</a>";
               html+="<div class='media-body'>";
               html+="<span class='media-meta pull-right'>"+data.model.list[i].ACCDATE+"</span>";
               html+="<h4 class='title'>";
               html+=data.model.list[i].USERID;
               html+="<span class='pull-right pagado' id='accNo'>"+data.model.list[i].ACCNO+"</span>";
               html+="<span class='media-meta pull-right' style='color:salmon'>2</span><span class='media-meta pull-right'>10</span>"
               html+="</h4>";
               html+="<p class='summary'>"+data.model.list[i].ACCTITLE+"</p>";
               html+="</div>";
               html+="</div>";
               html+="</td>";               
               html+="<td><h4 class='accmt' id='accmt'>0</h4>";
               html+="</td>";
               html+="</tr>";
               html+="</tbody>";
                              
            }
            $("#tbl-comlist").html(html).show();
            
            $("#tbl-comlist tr").on('click',function(){
               var accNo = "";

               $(this).find("td").each(function(i, item){ 
                  if (i == 1) {
                      accNo = $(item).text();
                      location.href="${pageContext.request.contextPath}/acbook/selectReadOne.do?accNo="+accNo;
                      }
                  });
            });

            }else{
               html="<tr><td>게시글이 없습니다</td></tr>";
               $("#tbl-calist").html(html).show();
            }
      }
   })
}
</script>
<script>

</script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />