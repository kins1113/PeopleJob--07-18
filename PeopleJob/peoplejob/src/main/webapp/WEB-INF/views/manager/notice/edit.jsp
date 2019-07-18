<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>



<script type="text/javascript">
	$(document).ready(function(){
		$('form[name=frmEdit]').submit(function(){
			$('.infobox').each(function(idx, item){
				if($(this).val().length<1){
					alert($(this).prev().html()+'를 입력하세요');
					$(this).focus();
					
					event.preventDefault();  //이벤트 진행을 막고
					return false;  //each() 탈출
				}
			});	
		});
		
	});
</script>

          <div class="content-wrapper">
	<div class="content">
		<div class="row">
			<div class="col-lg-12">
				<div class="card card-default">
					<div class="card-header card-header-border-bottom">

<div class="card-body">
<form name="frmEdit" method="post" 
	action="<c:url value='/manager/notice/edit.do'/>"> 
    <fieldset>
	
		<!-- hidden필드에 notifyCode 넣기 -->
		<input type="hidden" name="notifyCode" value="${vo.notifyCode}" />
            	
        <div class="form-group">
            <label for="notifytitle">제목</label>
            <input type="text" id="notifytitle" name="notifytitle" class="form-control"
            	value="${vo.notifytitle}" />
        </div>


        <div class="form-group">  
        	<label for="notifycontent">내용</label>        
 			<textarea class="form-control" id="notifycontent" name="notifycontent" rows="10" cols="30">${vo.notifycontent}</textarea>
        </div>
     
            <button class="btn btn-primary btn-default" type = "submit">수정</button>
            <button class="btn btn-primary btn-default" onclick="location.href='list.do' ">목록</button>      
      
	</fieldset>
</form>    
</div>
</div></div></div></div></div></div>
<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>