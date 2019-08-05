<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 신고하기</title>
<style type="text/css">
	
</style>
<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
 <script type="text/javascript">
 
 function report(){
	 var coment=$("input[name=reportComent]").val();
	 if(coment.length<1){
		 alert('신고내용을 작성해주세요');
		 event.preventDefault();
		 return false;
	 }else{
		 $("input[name=close]").val("close");
		 $("form[name=frmreport]").submit();
		 
	 }
			
 }
 
 
 $(function(){
	
	if($("input[name=close]").val()=="close"){
		opener.parent.location.reload();
		window.close();
	}
 });
 

 </script>
</head>
<body>
<form method="post" action="<c:url value='/board/report.do'/>" id="frmreport" name="frmreport">
	<h2>게시판 글 신고하기</h2>
		<input type="hidden" name="close"  value="${param.close}">
	<input type="hidden" name="boardCode2" value="${param.no }">
	<div>작성자 : (${sessionScope.memberName })<input type="text" name="reportUser" value="${sessionScope.memberid }" readonly></div>
	<Div><span>신고내용 : </span><input type="text" name="reportComent"></Div><br>
	<input type="button" value="신고하기" onclick="report()">
</form>
</body>
</html>