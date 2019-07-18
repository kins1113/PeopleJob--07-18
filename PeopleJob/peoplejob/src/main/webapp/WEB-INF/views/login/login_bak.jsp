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

    $('#login-form-link').click(function(e) {
		$("#login-form").delay(100).fadeIn(100);
 		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#login-form").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	
	$('input[type=submit]').click(function(){
		if($('#memberId').val()==''){
			alert('아이디를 입력하세요');
			$('#memberId').focus();
			event.preventDefault();
			return false;
		}else if($('#pwd').val()==''){
			alert('비밀번호를 입력하세요');
			$('#pwd').focus();
			event.preventDefault();
			return false;
		}
	});

});
</script>

<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">개인회원 로그인</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">기업회원 로그인</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="<c:url value='/login/login.do'/>" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="memberId" id="memberId" tabindex="1" class="form-control" placeholder="ID"
										 value="${cookie.ck_memberid.value}">
									</div>
									<div class="form-group">
										<input type="password" name="pwd" id="pwd" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
									<div class="row" style="margin-left:-1px">
										<input type="checkbox" name="saveId" id="saveId"
										
										<c:if test="${!empty cookie.ck_memberid }">
											checked="checked"
										</c:if>>
										<label for="saveId">아이디 저장</label>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-register" value="로그인">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="<c:url value='/login/findId.do'/>" tabindex="5" class="forgot-password">ID/PW찾기</a>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="<c:url value='/login/registerU.do'/>" tabindex="5" class="forgot-password">회원가입</a>
												</div>
											</div>
										</div>
									</div>
								</form>
								<form id="register-form" action="" method="post" role="form" style="display: none;">
								<input type="Text" value="기업회원 로그인">
									<div class="form-group">
										<input type="text" name="memberId" id="memberId" tabindex="1" class="form-control" placeholder="ID" value="">
									</div>
									<div class="form-group">
										<input type="password" name="pwd" id="pwd" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
									<div class="row" style="margin-left:-1px">
										<input type="checkbox" name="saveId" id="saveId">&nbsp;아이디 저장
										
										<c:if test="${!empty cookie.ck_userid }">
											checked="checked"
										</c:if>
				
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-register" value="로그인">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="<c:url value='/login/findId.do'/>" tabindex="5" class="forgot-password">ID/PW찾기</a>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="<c:url value='/login/selectregister.do'/>" tabindex="5" class="forgot-password">회원가입</a>
												</div>
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