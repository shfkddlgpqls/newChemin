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

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
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
				console.log("전체 리스트 보기::"+data.list);
				var value='';
				if(data!=null)
				{
					for(var i=0;i<data.list.length;i++)
					{
						var date=new Date(data.list[i].USERBIRTH);
						var fmDate=date.toISOString().slice(0,10);
						var gender=data.list[i].GENDER=='F'?'여자':'남자';
						var rgcount=data.list[i].RGCOUNT==0?'없음':data.list[i].RGCOUNT;
						value+='<tr style="font-size:15px;height:100px;"><td><img class="mphoto" src="${path}/resources/admin/memberEX.jpg"></td><td>'+data.list[i].USERNAME+'</td>';
						value+='<td>'+data.list[i].USERID+'</td><td>'+gender+'</td><td>'+fmDate+'</td>';
						value+='<td>'+data.list[i].USEREMAIL+'</td><td>'+data.list[i].USERPHONE+'</td>';
						value+='<td>'+data.list[i].USERADDR+'</td><td id="rgcount" name="rgcount" class="reportBtn" data-no="'+data.list[i].USERID+'" onclick="rpClick(this)">'+rgcount+'</td>';
						
						if(rgcount>=3)
						{
							value+='<td><button type="submit" data-no="'+data.list[i].USERID+'" onclick="adminMemberDelete(this)" class="btn btn-danger">탈퇴</button></td></tr>';
						}
						else
						{
							value+='<td><button type="button" class="btn btn-danger" disabled>탈퇴</button></td></tr>';
						}
						value+='<div id="chkBox"></div>';
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
	function rpClick(obj) {
		var reportId=$(obj).data("no");
		var rgcount=$(obj).find("td").eq(8).html();
		console.log(rgcount);
		if(rgcount>0)
		{
			location.href="${path}/admin/reportContent.do?userId="+reportId;

		}
		else
		{
			swal({
				text :"신고내용이 존재하지않습니다.",
				icon : "error",
				button : "확인"
			});
		}
		
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
						var date=new Date(data[0][i].USERBIRTH.time);
						var fmDate=date.toISOString().slice(0,10);
						var gender=data[0][i].GENDER=='F'?'여자':'남자';
						var rgcount=data[0][i].RGCOUNT==0?'없음':data[0][i].RGCOUNT;
						value+='<tr style="font-size:15px;height:100px;"><td><img class="mphoto" src="${path}/resources/admin/memberEX.jpg"></td><td>'+data[0][i].USERNAME+'</td>';
						value+='<td>'+data[0][i].USERID+'</td><td>'+gender+'</td><td>'+fmDate+'</td>';
						value+='<td>'+data[0][i].USEREMAIL+'</td><td>'+data[0][i].USERPHONE+'</td>';
						value+='<td>'+data[0][i].USERADDR+'</td><td id="rgcount" name="rgcount" class="reportBtn" data-no="'+data[0][i].USERID+'" onclick="rpClick(this)">'+rgcount+'</td>';
						
						if(rgcount>=3)
						{
							value+='<td><button type="button" data-no="'+data[0][i].USERID+'" onclick="adminMemberDelete(this)" class="btn btn-danger">탈퇴</button></td></tr>';
						}
						else
						{
							value+='<td><button type="button" class="btn btn-danger" disabled>탈퇴</button></td></tr>';
						}
						value+='<div id="chkBox"></div>';
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
			swal({
				text :"검색할 내용을 입력하세요.",
				icon : "error",
				button : "확인"
			});
			return false;
		}
	}
	
	/* 회원관리 검색 */
	function fn_mSearch()
	{
		var searchValue=$('#searchValue').val();
		var searchKey=$('#searchKey').val();
		$.ajax({
			type : "GET",
			dataType : "json",
			url : "${path}/admin/memberSearch.do",
			data : {searchKey:searchKey,searchValue:searchValue},
			success : function(data) {
				
				var value='';
				if(data!=null)
				{
					for(var i=0;i<data.searchList.length;i++)
					{
						var date=new Date(data.searchList[i].USERBIRTH);
						var fmDate=date.toISOString().slice(0,10);
						var gender=data.searchList[i].GENDER=='F'?'여자':'남자';
						var rgcount=data.searchList[i].RGCOUNT==0?'없음':data.searchList[i].RGCOUNT;
						value+='<tr style="font-size:15px;height:100px;"><td><img class="mphoto" src="${path}/resources/upload/member"'+data.searchList[i].RENAMEIMAGE+'"></td><td>'+data.searchList[i].USERNAME+'</td>';
						value+='<td>'+data.searchList[i].USERID+'</td><td>'+gender+'</td><td>'+fmDate+'</td>';
						value+='<td>'+data.searchList[i].USEREMAIL+'</td><td>'+data.searchList[i].USERPHONE+'</td>';
						value+='<td>'+data.searchList[i].USERADDR+'</td><td id="rgcount" name="rgcount" class="reportBtn" data-no="'+data.searchList[i].USERID+'" onclick="rpClick(this)">'+rgcount+'</td>';
						
						if(rgcount>=3)
						{
							value+='<td><button type="button" data-no="'+data.searchList[i].USERID+'" onclick="adminMemberDelete(this)" class="btn btn-danger">탈퇴</button></td></tr>';
						}
						else
						{
							value+='<td><button type="button" class="btn btn-danger" disabled>탈퇴</button></td></tr>';
						}
						value+='<div id="chkBox"></div>';
					}
					if(data.length==1){
						value+="<h5 class='p-b-30'>회원정보가 존재하지 않습니다</h5>";
					}
				}
				$('#memberContent').html(value);
			}
		});
	}  
</script>
    
	<div class="row p-t-50 justify-content-center">
	   <!--  filter 조건 -->
		    <div class="flex-sb-m flex-w p-t-10" style="float:left;">
		    	<div class="rs2-select2 of-hidden w-size12" style="width:100px">
		            <select class="selection" name="searchKey" id="searchKey">
		                <option value="memName">이름</option>
		                <option value="memId">아이디</option>
		            </select>
		        </div>
		        <input id="searchValue" name="searchValue" type="text" class="m-r-20 s-text2-change" placeholder="검색할 내용 입력" style="border:none;outline:none;border-bottom: 1px solid gray;">
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
	            <a class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" onclick="fn_blackList()" style="color:white;">
	              	 블랙리스트
	            </a>
	        </div>
        </div>
    </div>
   <div>
   <p style="margin-left:5%;font-family: 'Noto Sans KR', sans-serif;"><img src="${path }/resources/admin/right-chevron.png">회원의 신고내용을 보려면 신고 갯수를 누르세요.</p>
    <table class="table table-hover" style="width:700px;">
    	<thead>
    		<tr>
    			<th class="column1"></th>
    			<th class="column2">NAME</th>
    			<th class="column3">ID</th>
    			<th class="column4">GENDER</th>
    			<th class="column5">BIRTHDAY</th>
    			<th class="column6">EMAIL</th>
    			<th class="column7">PHONE</th>
    			<th class="column8">ADDRESS</th>
    			<th class="column9">REPORT</th>
    			<th class="column10">BUTTON</th>
    		</tr>
    	</thead>
    	<tbody id="memberContent">
    	</tbody>
    </table>
	<div class="text-center">
		<div class="row justify-content-center" id="mPageBar"></div>
 	</div>
 </div> 	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  