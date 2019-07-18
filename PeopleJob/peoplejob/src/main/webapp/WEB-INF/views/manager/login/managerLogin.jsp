<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
body{
    background-color:#5286F3;
    font-size:14px;
    color:#fff;
    margin-top: 300px;
}
.simple-login-container{
    width:300px;
    max-width:100%;
    margin:50px auto;
}
.simple-login-container h2{
    text-align:center;
    font-size:20px;
}

.simple-login-container .btn-login{
    background-color:#FF5964;
    color:#fff;
}
a{
    color:#fff;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("form[name=managerLogin]").submit(function(){
			if($("input[name=adminid]").val().length < 1){
				alert("아이디를 입력해야 합니다.");
				$("input[name=adminid]").focus();
				event.preventDefault();
				return false;
			}
			if($("input[name=adminpwd]").val().length < 1){
				alert("비밀번호를 입력해야 합니다.");
				$("input[name=adminpwd]").focus();
				event.preventDefault();
				return false;
			}
		});
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!------ Include the above in your HEAD tag ---------->

<div class="simple-login-container">
    <h2>People Job Admin</h2>
    <form action="<c:url value='/manager/login/managerLogin.do'/>" name="managerLogin" method="post">
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="text" name="adminid" class="form-control" placeholder="Id">
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="password" name="adminpwd" placeholder="Password" class="form-control">
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="submit" name="loginButton" value="Login" class="btn btn-block btn-login" placeholder="Enter your Password" >
        </div>
    </div>
    </form>
</div>
</body>
</html>