<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../main/inc/top.jsp" %>
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }
	.divForm{
		width:650px;
		border:1px solid #ddd;		
	}
	/* .divForm form{
		width:650px;
	} */
	.divForm div	{
		/* clear: both; */
		border:none;
		padding: 7px 0;
		margin: 0;
		overflow: auto;
	}	
	.sp{
		font-size:0.9em;
		color:#0056AC;			
	}
	.divForm fieldset	{
		border:0;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('form[name=frmDelete]').submit(function(){
			if(confirm("활성화수정하시겠습니까?")){
				if($('#pwd').val().length<1){
					alert('비밀번호를 입력하세요');
					$('#pwd').focus();
					event.preventDefault();
				}				
			}else{  //삭제 취소
				event.preventDefault();
			}			
		});
		
	});
</script>
<style type="text/css">
.divList {
    width: 900px;
    margin: 0 auto;
    padding: 10px;
    background: #cccccc;
}
</style>
<article>
	<fieldset>
    
<div class="divList" style="min-height: 630px">
<form name="frmDelete" method="post" enctype="multipart/form-data"	
	action="<c:url value='/company/jobopening_agreeeditck.do'/>" >
		<fieldset>
		<!-- hidden 필드에 no 추가 -->
		<input type="hidden" name="jobopening" value="${param.jobopening}">  
		<input type="hidden" name="companyCode" value="${vo.companyCode}"> 
		<legend>활성화 수정</legend>
	        <div>            
	        	<span class="sp">${param.jobopening }번 글의 활성화를 수정하시겠습니까?</span>                        
	        </div>
	        <div>           
	            <label for="pwd" >비밀번호</label>
	            <input type="password" id="pwd" name="pwd" class="form-control"/>   
	        </div>
	        <div class="center">
	            <input type ="submit"  value="활성화수정" class="btn btn-primary"/>
	            <input type = "Button" value="글목록" class="btn btn-primary"
                	OnClick
               ="location.href='<c:url value='/company/jobopening_list.do'/>'" />
	        </div>
	    </fieldset>
    </form>
</div>
</fieldset>
</article>
<%@include file="../main/inc/bottom.jsp" %>