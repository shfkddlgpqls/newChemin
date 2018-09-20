<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set value="${pageContext.request.contextPath }" var="path"/>
<jsp:include page="/WEB-INF/views/common/header1.jsp"/>
<script>
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
		var title=$('input[name=community_title]').val().trim();
		alert(title);
		alert(title.length);
		if(title.length > 200)
		{
			swal({
				text : "200자 이하로 작성해주세요.",
				icon : "warning",
				button : "확인"
			});
			return false;
		}
		var content=$('#community_content').val().trim();
		alert(content);
		alert(content.length);
		if(content.length > 2000)
		{
			swal({
				text : "2000자 이하로 작성해주세요.",
				icon : "warning",
				button : "확인"
			});
			return false;
		}
		return true;
}


</script>
<section>
<form name="communityFrm" action="${path }/community/communityWriteEnd.do" method="post" onsubmit="return fn_file();" enctype="multipart/form-data">
   <div class="container" style=" box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
      <div class="row" style="margin-top:55px;">

              <h1 class="text-uppercase nanumFont">
                <i class="fa fa-edit"></i> 게시판 등록
             </h1><br>
             <hr/>
             
             <div class="info col-md-12">
                <div class="row frist">
                   <div class="col-md-2">
                      <span>종류</span>
                   </div>
                   <div class="col-md-3">
                       <select class="form-control smallSzie"  name="community_category">
                              <option value="인테리어">인테리어</option>
                              <option value="청소">청소</option>
                              <option value="보안">보안</option>
                              <option value="1인레시피">1인레시피</option>
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
                     <input class="form-control middleSize"  id="community_title" name="community_title" type="text"  placeholder="제목을 입력해주세요 " maxlength="200" required>
                   </div>
                </div>
                <br>

                 <div class="row margin-bottom margin-top">
                   <div class="col-md-2">
                      <span>내용</span>
                   </div>
                   <div class="col-md-10 " >
                      <div class="middleSize">
                            <textarea class="form-control" rows="6" id="community_content" name="community_content" maxlength="2000" required></textarea>                           
                        </div>
                        
                   </div>
                </div>
                
                 <div class="row margin-bottom">
                   <div class="col-md-2">
                      <span>파일 등록</span>
                   </div>
                   <div class="col-md-10">
                       <div class="form-group middleSize">
                          <input multiple="multiple" id="upFile" name="upFile" type="file" class="file" data-preview-file-type="any" required/> 
                          <p style="font-size:12px;">사진과 동영상 합쳐서 2개까지만 등록 가능합니다<p>
                     </div> 
      
                   </div>
                </div>  
           
                 <div class="row margin-bottom">
                   <div class="col-md-2">
                      <span>키워드</span>
                   </div>
                   <div class="col-md-10">
                      <input class="form-control" id="community_hashTag" type="text" name="community_hashTag" placeholder="태그와 태그 사이에 (,)로 작성 가능, 최대 5가지만 입력해주세요"/>
                   </div>
                </div> <br>
                
                 <div class="margin-bottom" id="center">
                   <input id="submit" class="btn btn-primary" type="submit" value="등록하기"/>

                </div> 
             </div>
      </div>
   </div>
   </form>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>