<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@include file="../main/inc/top.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$('form[name=frmDelete]').submit(function(){
			if(confirm("삭제하시겠습니까?")){
				
								
			}else{  //삭제 취소
				event.preventDefault();
			}			
		});
		
	});
</script>
<style>
form {
    margin-left: 700px;
    margin-top: 300px;
    border: 1px solid gray;
    padding: 30px;
    width: 500px;
}
.divForm {
    min-height: 630px;
}
</style>
</head>
<body>
<div class="divForm">
<form name="frmDelete" method="post"	
	action="<c:url value='/resume/delete.do'/>" >
		<fieldset>
		<!-- hidden 필드에 resumeCode 추가 -->
		<input type="hidden" name="resumeCode" value="${param.resumeCode}">
		
		<legend>이력서 삭제</legend>
	        <div>           
	        	<span class="sp">${param.resumeCode}  번 글을 삭제하시겠습니까?</span>                        
	        </div>
	        
	        <div class="center">
	            <input class="btn btn-success" type ="submit"  value="삭제" />
	            <input class="btn btn-success" type = "Button" value="이력서목록" 
                	OnClick
               ="location.href='<c:url value='/resume/list.do'/>'" />
	        </div>
	    </fieldset>
    </form>
</div>

<%@include file="../main/inc/bottom.jsp" %>
