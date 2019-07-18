<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/login.css'/>" />
<style type="text/css">

</style>
<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
$(function() {
	
	$('input[type=submit]').submit(function(){
		$('.form-control').each(function(){
			if($(this).val().length<1){
				alert($(this).attr('id')+"칸을 입력해주세요");
				event.prevnetDefault();
				return false;
			}	
			
		});
	});


});
</script>

<div class="container" style="min-height: 550px;padding:8px;">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="<c:url value='/login/findId.do'/>" id="register-form-link">ID찾기</a>
							</div>
							<div class="col-xs-6"  style="color: green; font-size:1.3em;font-weight: bold;">
								비밀번호 찾기
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="<c:url value='/login/findPwd.do'/>" method="post" role="form" style="display: block;">
									<div class="form-group">
										<span>비밀번호 찾기를 누르면 임시 비밀번호가 해당 이메일로 발송됩니다.</span>
									</div>
									<div class="form-group">
										<span>발급받은 임시 비밀번호로 로그인 후 비밀번호를 변경해주세요.</span>
									</div>
									<div class="form-group">
										<input type="text" name="membername" id="이름" tabindex="1" class="form-control" placeholder="이름">
									</div>
									<div class="form-group">
										<input type="text" name="memberid" id="아이디" tabindex="2" class="form-control" placeholder="ID">
									</div>
									<div class="form-group">
										<input type="text" name="email" id="이메일" tabindex="2" class="form-control" placeholder="이메일">
									</div>
									
									
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-register" value="PW찾기">
											</div>
										</div>
									</div>
									
								</form>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>    
	<%@include file="../main/inc/bottom.jsp" %>                     