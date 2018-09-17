<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set value="${pageContext.request.contextPath }" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script>
var length=($('#upFile')[0].files.length);

function fn_file() {
		if(length>=4) {
			alert("사진은 3개까지 등록가능합니다.");
			return false;
		}
		var fm=document.communityFrm;
		var fnm=fm.upFile;
		var ext=fnm.value;
		if(!(ext.substr(ext.length-3) == 'mp4' || ext.substr(ext.length-3) == 'jpg' || ext.substr(ext.length-3) == 'JPG' || ext.substr(ext.length-3) == 'PNG'))
		{
			alert("png/jpg 파일만 올릴 수 있습니다.");
			return false;
		}
		return true;
}

</script>
<section>
<form name="communityFrm" action="${path }/community/communityWriteEnd.do" method="post" onsubmit="return fn_file();" enctype="multipart/form-data">
   <div class="container" style=" box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
      <div class="row" style="margin-top:55px">

              <h1 class="text-uppercase nanumFont">
                <i class="fa fa-edit"></i> 게시판 등록
             </h1>
             <hr/>
             
             <div class="info col-md-12">
                <div class="row frist">
                   <div class="col-md-2">
                      <span>종류</span>
                   </div>
                   <div class="col-md-3">
                       <select class="form-control smallSzie"  name="community_category">
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
                     <input class="form-control middleSize"  name="community_title" type="text"  placeholder="제목을 입력해주세요 " required>
                   </div>
                </div>
                <br>

                <!-- <div class="row margin-bottom">
                   <div class="col-md-2">
                      <span>이용시간</span>
                   </div>
                   <div class="col-md-10 form-inline" >
                          <select class="form-control"  id="phone" name="day">
                              <option value="daily">매일</option>
                              <option value="weekday">평일</option>
                              <option value="weekend">주말</option>
                           </select> 
                            <select class="form-control"  id="phone" name="startTime">
                              <option value="daily">00:00</option>
                              <option value="weekday">01:00</option>
                              <option value="weekend">02:00</option>
                           </select>
                           <select class="form-control"  id="phone" name="endTime">
                              <option value="daily">01:00</option>
                              <option value="weekday">02:00</option>
                              <option value="weekend">03:00</option>
                           </select>
                           <input class="form-control" style="width:25%"  type="text" placeholder="ex)1월 1일 휴무"/>
                     </div>                   
                </div>
                
                
                <div class="row margin-bottom-sub">
                   <div class="col-md-2">
                      <span>가격정보</span>
                   </div>
                   <div class="col-md-10 form-inline" >
                           <input class="form-control addr"  type="text" placeholder="ex)아메리카노"/>
                           <input class="form-control addr"  type="text" placeholder="ex)2500원"/>
                           <input type="button" class="btn btn-primary" value="추가" onclick="add_item()"/>
                   </div>
                </div>
                
                추가버튼 클릭시 추가되는 div
                <div class="row margin-bottom-sub">
                   <div class="col-md-2">
                   </div>
                   <div class="col-md-10" id="field">
                      
                   </div>
                </div>
               추가 되는 div 내용물                
                  <div id="pre_set" style="display:none">
                        <input class="form-control addr"  type="text" placeholder="ex)아메리카노"/>
                        <input class="form-control addr"  type="text" placeholder="ex)2500원"/>
                        <input type="button" class="btn btn-primary" value="삭제" onclick="remove_item(this)"/>
                  </div>                 -->
                
           
                 <div class="row margin-bottom margin-top">
                   <div class="col-md-2">
                      <span>내용</span>
                   </div>
                   <div class="col-md-10 " >
                      <div class="middleSize">
                            <textarea class="form-control" rows="6" id="community_content" name="community_content" maxlength="2000" required></textarea>   
                            <span id="counter" style="margin-left:89%">###</span>                          
                        </div>
                        
                   </div>
                </div>
                
                 <div class="row margin-bottom">
                   <div class="col-md-2">
                      <span>사진등록</span>
                   </div>
                   <div class="col-md-10">
                       <div class="form-group middleSize">
                          <input multiple="multiple" id="upFile" name="upFile" type="file" class="file" data-preview-file-type="any"/> 
                          <p style="font-size:12px;">사진은 3개까지만 등록 가능합니다<p>
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
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set value="${pageContext.request.contextPath }" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script>
var length=($('#upFile')[0].files.length);

function fn_file() {
		if(length>=4) {
			alert("사진은 3개까지 등록가능합니다.");
			return false;
		}
		var fm=document.communityFrm;
		var fnm=fm.upFile;
		var ext=fnm.value;
		if(!(ext.substr(ext.length-3) == 'mp4' || ext.substr(ext.length-3) == 'jpg' || ext.substr(ext.length-3) == 'JPG' || ext.substr(ext.length-3) == 'PNG'))
		{
			alert("png/jpg 파일만 올릴 수 있습니다.");
			return false;
		}
		return true;
}

</script>
<section>
<form name="communityFrm" action="${path }/community/communityWriteEnd.do" method="post" onsubmit="return fn_file();" enctype="multipart/form-data">
   <div class="container" style=" box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
      <div class="row" style="margin-top:55px">

              <h1 class="text-uppercase nanumFont">
                <i class="fa fa-edit"></i> 게시판 등록
             </h1>
             <hr/>
             
             <div class="info col-md-12">
                <div class="row frist">
                   <div class="col-md-2">
                      <span>종류</span>
                   </div>
                   <div class="col-md-3">
                       <select class="form-control smallSzie"  name="community_category">
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
	                	<input class="form-control" id="community_wirter" name="community_writer" >
	                </div>
	             </div>
                <br>
                <div class="row margin-bottom">
                   <div class="col-md-2">
                      <span>제목</span>
                   </div>
                   <div class="col-md-10">             
                     <input class="form-control middleSize"  name="community_title" type="text"  placeholder="제목을 입력해주세요 " required>
                   </div>
                </div>
                <br>

                <!-- <div class="row margin-bottom">
                   <div class="col-md-2">
                      <span>이용시간</span>
                   </div>
                   <div class="col-md-10 form-inline" >
                          <select class="form-control"  id="phone" name="day">
                              <option value="daily">매일</option>
                              <option value="weekday">평일</option>
                              <option value="weekend">주말</option>
                           </select> 
                            <select class="form-control"  id="phone" name="startTime">
                              <option value="daily">00:00</option>
                              <option value="weekday">01:00</option>
                              <option value="weekend">02:00</option>
                           </select>
                           <select class="form-control"  id="phone" name="endTime">
                              <option value="daily">01:00</option>
                              <option value="weekday">02:00</option>
                              <option value="weekend">03:00</option>
                           </select>
                           <input class="form-control" style="width:25%"  type="text" placeholder="ex)1월 1일 휴무"/>
                     </div>                   
                </div>
                
                
                <div class="row margin-bottom-sub">
                   <div class="col-md-2">
                      <span>가격정보</span>
                   </div>
                   <div class="col-md-10 form-inline" >
                           <input class="form-control addr"  type="text" placeholder="ex)아메리카노"/>
                           <input class="form-control addr"  type="text" placeholder="ex)2500원"/>
                           <input type="button" class="btn btn-primary" value="추가" onclick="add_item()"/>
                   </div>
                </div>
                
                추가버튼 클릭시 추가되는 div
                <div class="row margin-bottom-sub">
                   <div class="col-md-2">
                   </div>
                   <div class="col-md-10" id="field">
                      
                   </div>
                </div>
               추가 되는 div 내용물                
                  <div id="pre_set" style="display:none">
                        <input class="form-control addr"  type="text" placeholder="ex)아메리카노"/>
                        <input class="form-control addr"  type="text" placeholder="ex)2500원"/>
                        <input type="button" class="btn btn-primary" value="삭제" onclick="remove_item(this)"/>
                  </div>                 -->
                
           
                 <div class="row margin-bottom margin-top">
                   <div class="col-md-2">
                      <span>내용</span>
                   </div>
                   <div class="col-md-10 " >
                      <div class="middleSize">
                            <textarea class="form-control" rows="6" id="community_content" name="community_content" maxlength="2000" required></textarea>   
                            <span id="counter" style="margin-left:89%">###</span>                          
                        </div>
                        
                   </div>
                </div>
                
                 <div class="row margin-bottom">
                   <div class="col-md-2">
                      <span>사진등록</span>
                   </div>
                   <div class="col-md-10">
                       <div class="form-group middleSize">
                          <input multiple="multiple" id="upFile" name="upFile" type="file" class="file" data-preview-file-type="any"/> 
                          <p style="font-size:12px;">사진은 3개까지만 등록 가능합니다<p>
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