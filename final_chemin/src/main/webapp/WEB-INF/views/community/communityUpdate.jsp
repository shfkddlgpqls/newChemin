<%@page import="com.kh.chemin.community.model.vo.Community"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set value="${pageContext.request.contextPath }" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
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
                              <option value="집수리">집수리</option>
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
                     <input class="form-control middleSize"  name="community_title" type="text"  placeholder="제목을 입력해주세요 " value="${community.TITLE }" required>
                   </div>
                </div>
                <br>
                 <div class="row margin-bottom margin-top">
                   <div class="col-md-2">
                      <span>내용</span>
                   </div>
                   <div class="col-md-10 " >
                      <div class="middleSize">
                            <textarea class="form-control" row="6" id="community_content" name="community_content" maxlength="2000" required> ${community.CONTENT }</textarea>                             
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
                          <p style="font-size:12px;">사진과 동영상 합쳐서 2개까지만 등록 가능합니다<p>
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