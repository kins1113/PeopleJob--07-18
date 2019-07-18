<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>




<div class="divForm">
<form name="frmDelete" method="post"	
	action="<c:url value='/manager/notice/delete.do'/>" >
		<fieldset>
		<!-- hidden 필드에 no 추가 -->
		<input type="hidden" name="notifyCode" value="${param.notifyCode}">
		
		<legend>글 삭제</legend>
	        <div>           
	        	<span class="sp">${param.notifyCode}  번 글을 삭제하시겠습니까?</span>                        
	        </div>

	        <div class="center">
	            <input type ="submit"  value="삭제" />
	            <input type = "Button" value="글목록" 
                OnClick ="location.href='<c:url value='/manager/notice/list.do'/>'" />
	        </div>
	    </fieldset>
    </form>
</div>
<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>