<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js">
</script>
<script src="${pageContext.request.contextPath}/resources/se2/js/HuskyEZCreator.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/se2/init.js" type="text/javascript"></script>
<head>
</head>
<style>
  textarea { width: 99%; height: 300px; }
</style>
<body>
<textarea id="${param.name}" name="${param.name}" class="smarteditor2">
<c:if test="${!empty param.value }">
${param.value }
</c:if>
</textarea>
</body>
</html>