<%@page import="com.kh.chemin.community.model.vo.Community"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set value="${pageContext.request.contextPath }" var="path"/>
<jsp:include page="/WEB-INF/views/common/header1.jsp"/>
<script type="text/javascript">
var length=($('#upFile')[0].files.length);
function fn_file() {
		if(length>=3) {
			swal({
				text : "파일은 2개까지 가능합니다.",
				icon : "warning",
				button : "확인"
			});
			return false;
		}
		
		var fm=document.communityFrm;
		var fnm=fm.upFile;
		var ext=fnm.value;
		if(!(ext.substr(ext.length-3) == 'mp4' || ext.substr(ext.length-3) == 'MP4' || ext.substr(ext.length-3) == 'jpg' || ext.substr(ext.length-3) == 'JPG' || ext.substr(ext.length-3) == 'PNG' || ext.substr(ext.length-3) == 'png'))
		{
			alert("png/jpg/mp4 파일만 올릴 수 있습니다.");
			return false;
		}
		return true;
}
/* 제목 글자수 제한하기 */
 	function fn_titleCheck(obj, maxByte) {
	var strValue=obj.value;
	var strLen=strValue.length;
	var totalByte=0;
	var len=0;
	var oneChar="";
	var str2="";
	
	for(var i=0;i<strLen;i++) {
		oneChar=strValue.charAt(i);
		if(escape(oneChar).length>4) {
			totalByte+=2;
		}
		else {
			totalByte++;
		}
		
		//입력한 문자 길이보다 넘치면 잘라내기 위해 저장
		if(totalByte <= maxByte) {
			len = i+1;
		}
	}
	
	//넘어가는 글자는 자름.
	if(totalByte > maxByte) {
		swal({
			text : ""+maxByte+"자를 초과 입력 할 수 없습니다.",
			icon : "warning",
			button : "확인"
		});
		str=strValue.substr(0,len);
		obj.value=str2;
		fn_titleCheck(obj,200);
	}
}

/* 내용 글자 수 제한하기 */
 function fn_contentCheck(obj, maxByte) {
	 var strValue=obj.value;
		var strLen=strValue.length;
		var totalByte=0;
		var len=0;
		var oneChar="";
		var str2="";
		
		for(var i=0;i<strLen;i++) {
			oneChar=strValue.charAt(i);
			if(escape(oneChar).length>4) {
				totalByte+=2;
			}
			else {
				totalByte++;
			}
			
			//입력한 문자 길이보다 넘치면 잘라내기 위해 저장
			if(totalByte <= maxByte) {
				len = i+1;
			}
		}
		
		//넘어가는 글자는 자름.
		if(totalByte > maxByte) {
			swal({
				text : ""+maxByte+"자를 초과 입력 할 수 없습니다.",
				icon : "warning",
				button : "확인"
			});
			str=strValue.substr(0,len);
			obj.value=str2;
			fn_titleCheck(obj,2000);
		}
}
 
</script>
<section>
<form name="communityFrm" action="${path }/community/communityUpdateEnd.do" method="post" onsubmit="return fn_file();" enctype="multipart/form-data">
   <div class="container" style=" box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
      <div class="row" style="margin-top:55px">
			<input type="hidden" id="community_no" name="community_no" value="${community.COMMUNITYNO }"/>
              <h1 class="text-uppercase nanumFont">
                <i class="fa fa-edit"></i> 게시판 수정
             </h1>
             <hr/>
             
             <div class="info col-md-12">
                <div class="row frist">
                   <div class="col-md-2">
                      <span>종류</span>
                   </div>
                   <div class="col-md-3">
                       <select id="select" class="form-control smallSzie"  name="community_category">
                       		  <option selected>${community.CATEGORY }</option>
                              <option value="인테리어">인테리어</option>
                              <option value="보안">보안</option>
                              <option value="1인레시피">1인레시피</option>
                              <option value="청소">청소</option>
                           </select> 
                   </div>
                </div><br>
                
                <div class="row margin-bottom">
	             <div class="col-md-2">
	                      <span>작성자</span>
	                </div>
	                <div class="col-md-2">
	                	<input class="form-control" id="community_wirter" name="community_writer" value="${memberLoggedIn.userId }" readonly>
	                </div>
	             </div>
                <br>
                <div class="row margin-bottom">
                   <div class="col-md-2">
                      <span>제목</span>
                   </div>
                   <div class="col-md-10">             
                     <input class="form-control middleSize"  name="community_title" type="text"  placeholder="제목을 입력해주세요 " value="${community.TITLE }" onkeyup="fn_titleCheck(this,200)" required>
                   </div>
                </div>
                <br>
                 <div class="row margin-bottom margin-top">
                   <div class="col-md-2">
                      <span>내용</span>
                   </div>
                   <div class="col-md-10 " >
                      <div class="middleSize">
                            <textarea class="form-control" row="6" id="community_content" name="community_content" maxlength="2000" onkeyup="fn_contentCheck(this,2000)" required> ${community.CONTENT }</textarea>                             
                        </div>
                        
                   </div>
                </div>
                <br>
                 <div class="row margin-bottom">
                   <div class="col-md-2">
                      <span>파일 등록</span>
                   </div>
                   <div class="col-md-10">
                       <div class="form-group middleSize">
                          <input multiple="multiple" id="upFile" name="upFile" type="file" class="file" data-preview-file-type="any"/> 
                          <p style="font-size:12px;">사진과 동영상 합쳐서 2개까지만 등록 가능합니다 (사진 : jpg, png / 동영상 : mp4)<p>
                     </div> 
      
                   </div>
                </div>  
           
                 <div class="row margin-bottom">
                   <div class="col-md-2">
                      <span>키워드</span>
                   </div>
                   <div class="col-md-10">
                      <input class="form-control" id="community_hashTag" type="text" name="community_hashTag" value="${community.HASHTAG }" placeholder="태그와 태그 사이에 (,)로 작성 가능, 최대 5가지만 입력해주세요"/>
                   </div>
                </div> <br>
                
                 <div class="margin-bottom" id="center">
                   <input id="submit" class="btn btn-primary" type="submit" value="수정하기"/>

                </div> 
             </div>
      </div>
   </div>
   </form>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>