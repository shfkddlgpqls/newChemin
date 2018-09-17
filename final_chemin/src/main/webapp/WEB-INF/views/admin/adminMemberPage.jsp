<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="<%=request.getContextPath()%>"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/admin/adminMenuBar.jsp"/>

<link rel="stylesheet" type="text/css" href="${path}/resources/base/css/adminPage.css">
<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/select2/select2.min.css">
<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${path }/resources/mall/vendor/slick/slick.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/util.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/mall/css/mall.css">
<style>
.mphoto {
	width: 47px; height: 47px;
    object-fit: cover;
    border-radius: 50%;
}
</style>
<script>
	/* 회원정보 리스트 보기 */
	$(function(){
		fn_listMember(1);
	});
	
	function fn_listMember(cPage) {
		$.ajax({
			dataType : "json",
			type : "GET",
			url : "${path}/admin/adminMemberList.do",
			data : {cPage:cPage},
			success : function(data) {
				var pageBar=data.pageBar;
				console.log(data.list);
				var value='';
				if(data!=null)
				{
					for(var i=0;i<data.list.length;i++)
					{
						var date=new Date(data.list[i].USERBIRTH);
						var fmDate=date.toISOString().slice(0,10);
						var gender=data.list[i].GENDER=='F'?'여자':'남자';
						var rgcount=data.list[i].RGCOUNT==0?'없음':data.list[i].RGCOUNT;
						value+='<tr style="font-size:15px;" class="reportBtn" data-no="'+data.list[i].USERID+'" onclick="rpClick(this)"><td><img class="mphoto" src="${path}/resources/admin/memberEX.jpg"></td><td>'+data.list[i].USERNAME+'</td>';
						value+='<td>'+data.list[i].USERID+'</td><td>'+gender+'</td><td>'+fmDate+'</td>';
						value+='<td>'+data.list[i].USEREMAIL+'</td><td>'+data.list[i].USERPHONE+'</td>';
						value+='<td>'+data.list[i].USERHOBBY+'</td><td>'+data.list[i].USERADDR+'</td><td id="rgcount">'+rgcount+'</td>';
						
						if(rgcount>=3)
						{
							value+='<td><button type="button" data-no="'+data.list[i].USERID+'" onclick="adminMemberDelete(this)" class="btn btn-danger">탈퇴</button></td></tr>';
						}
						else
						{
							value+='<td><button type="button" class="btn btn-danger" disabled>탈퇴</button></td></tr>';
						}
						value+='<tr id="chkBox"></tr>';
					}
					if(data.length==1){
						value+="<h5 class='p-b-30'>회원정보가 존재하지 않습니다</h5>";
					}
				}
				$('#memberContent').html(value);
				$('#mPageBar').html(pageBar);
			}
		});
	}
	
	/* 회원별 신고 내용 보기 */
	$('#chkBox').hide(); 
	function rpClick(obj) {
		
		$('#chkBox').show();
		
		var reportId=$(obj).data("no");
		console.log(reportId);
		
		$.ajax({
			dataType : "json",
			type : "GET",
			url : "${path}/admin/reportContent.do",
			data : {userId:reportId},
			success : function(data) {
				console.log(data[0]);
				console.log(data[1]);
				
				if(data[1]>0)
				{
					for(var i=0;i<data[0].length;i++)
					{
						/* $(obj).next('#chkBox').append('<tr>'); */
						$(obj).next('#chkBox').append('<td></td><td><img style="width:50px;height:40px;" src="${path}/resources/admin/member화살표.JPG"/>');
						$(obj).next('#chkBox').append('<td>'+data[0][i].CATEGORY+'</td><td colspan="7">'+data[0][i].CONTENT+'</td>');
						/* $(obj).next('#chkBox').append('</tr>'); */
					}
				}
				else
				{
					alert('신고내용이 없습니다.');
				}
				
			}
		});
			
	}
	
	/* 관리자 권한으로 신고 3번이상 받은 회원 강제탈퇴 */
	function adminMemberDelete(obj) {
		var userId=$(obj).data("no");
		location.href="${path}/admin/adminMemberDelete.do?userId="+userId;
	}
	
	/* 블랙리스트 분류 */
	function fn_blackList() {
		$.ajax({
			dataType : "json",
			type : "GET",
			url : "${path }/admin/blackList.do",
			success : function(data) {
				console.log(data[0]);
				var value='';
				if(data!=null)
				{
					for(var i=0;i<data[0].length;i++)
					{
						var gender=data[0][i].GENDER=='F'?'여자':'남자';
						var rgcount=data[0][i].RGCOUNT==0?'없음':data[0][i].RGCOUNT;
						value+='<tr style="font-size:15px;" class="reportBtn" data-no="'+data[0][i].USERID+'" onclick="rpClick(this)"><td><img class="mphoto" src="${path}/resources/admin/memberEX.jpg"></td><td>'+data[0][i].USERNAME+'</td>';
						value+='<td>'+data[0][i].USERID+'</td><td>'+gender+'</td><td>'+data[0][i].USERBIRTH+'</td>';
						value+='<td>'+data[0][i].USEREMAIL+'</td><td>'+data[0][i].USERPHONE+'</td>';
						value+='<td>'+data[0][i].USERHOBBY+'</td><td>'+data[0][i].USERADDR+'</td><td id="rgcount">'+rgcount+'</td>';
						
						if(rgcount>=3)
						{
							value+='<td><button type="button" data-no="'+data[0][i].USERID+'" onclick="adminMemberDelete(this)" class="btn btn-danger">탈퇴</button></td></tr>';
						}
						else
						{
							value+='<td><button type="button" class="btn btn-danger" disabled>탈퇴</button></td></tr>';
						}
						value+='<tr id="chkBox"></tr>';
					}
					if(data.length==1){
						value+="<h5 class='p-b-30'>회원정보가 존재하지 않습니다</h5>";
					}
				}
				$('#memberContent').html(value);
			}
		});
	}
	
	/* 검색 유효성검사 */
	function fn_search()
	{
		var sValue=$('#searchValue').val().trim();
		if(sValue==''||sValue==null)
		{
			swal("검색할 내용을 입력해주세요");
			return false;
		}
	}
	
	/* 회원관리 검색 */
	function fn_mSearch()
	{
		var mValue=$('#searchValue').val();
		var mKey=$('#searchKey').val();
		$.ajax({
			type : "GET",
			dataType : "json",
			url : "${path}/admin/memberSearch.do",
			data : {searchKey:mKey,searchValue:mValue},
			success : function(data) {
				console.log(data[0]);
			}
		});
	}  
</script>
    
	<div class="row p-t-50 justify-content-center">
	    <!-- filter 조건 -->
		    <div class="flex-sb-m flex-w p-t-10" style="float:left;">
		    	<div class="rs2-select2 of-hidden w-size12" style="width:100px">
		            <select class="selection" name="searchKey" id="searchKey">
		                <option value="memName">이름</option>
		                <option value="memId">아이디</option>
		            </select>
		        </div>
		        <input id="searchValue" name="searchValue" type="text" class="m-r-20 s-text2" placeholder="검색할 내용 입력" style="border:none;outline:none;border-bottom: 1px solid gray;">
		    </div>
	           
	        <div class="flex-sb-m flex-w p-t-10" style="float:right;">
	            <div class="w-size11">
	                <button class="size4 bg7 bo-rad-15 hov1 s-text14 trans-0-4" onclick="fn_mSearch();return fn_search();" style="border:none;outline: none;">
	                    search
	                </button>
	            </div>
	        </div>
    </div>
	<div class="container">
    	<div class="flex-w flex-sb-m p-t-25 p-l-35 p-r-60">
	        <div class="flex-w flex-m w-full-sm"></div>
	
	        <div class="size10 trans-0-4 m-t-10">
	            <!-- Button -->
	            <a class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" onclick="fn_blackList()" style="color:white">
	              	 블랙리스트
	            </a>
	        </div>
        </div>
    </div><br><br>
   <section>
    <table class="table table-hover " style="width:70%;margin-left:15%;">
    	<thead>
    		<tr>
    			<th class="column1"></th>
    			<th class="column2">NAME</th>
    			<th class="column3">ID</th>
    			<th class="column4">GENDER</th>
    			<th class="column5">BIRTHDAY</th>
    			<th class="column6">EMAIL</th>
    			<th class="column7">PHONE</th>
    			<th class="column8">HOBBY</th>
    			<th class="column9">ADDRESS</th>
    			<th class="column10">REPORT</th>
    			<th class="column11">BUTTON</th>
    		</tr>
    	</thead>
    	<tbody id="memberContent">
    	</tbody>
    </table>
	<div class="text-center">
		<div class="row justify-content-center" id="mPageBar"></div>
 	</div>
 </section> 	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  