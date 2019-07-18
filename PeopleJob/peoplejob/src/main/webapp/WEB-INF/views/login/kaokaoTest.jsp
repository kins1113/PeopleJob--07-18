<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	 <c:if test="${userId eq null}">
        <a href="https://kauth.kakao.com/oauth/authorize
            ?client_id=2cf3b4aff785f5ac3fea03db7cc7efdd
            &redirect_uri=http://localhost:9090/peoplejob/oauth
            &response_type=code">kaokaoLogin
        </a>
    </c:if>
    <c:if test="${userId ne null}">
        <h1>로그인 성공입니다</h1>
    </c:if>
</body>
</html>
