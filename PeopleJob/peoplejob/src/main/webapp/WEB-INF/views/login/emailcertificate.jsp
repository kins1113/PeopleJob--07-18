<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증 페이지</title>
<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	
	function check(){
		var form=document.authenform;
		var authNum=${authNum};
		
		if(form.authnum.value==''){
			alert('인증번호를 입력해주세요!');
			return false;
		}else if(form.authnum.value!=authNum){
			alert('틀린 인증번호 입니다. 인증번호를 다시 입력해주세요');
			form.authnum.value='';
			return false;
		}else if(form.authnum.value==authNum){
			$(opener.document).find("#chkId").val("Y");
			alert('인증완료');
			self.close();
		}
		
	}
	
</script>
</head>
<body>
	<div>
		<p>인증번호 7자리를 입력하세요</p>
		<form method="post" name="authenform" onSubmit="return check();">
		<input type="text" name="authnum">
		<input type="submit" value="확인">
		</form>
	</div>
	
</body>
</html>