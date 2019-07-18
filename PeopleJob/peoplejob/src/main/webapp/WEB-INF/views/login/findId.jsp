<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %> 
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/login.css'/>" />
<style type="text/css">
.error {
	display: none;
    color: steelblue;
    font-size: 1.2em;
    margin-left: 18px;
    font-weight: 500;
}
</style>
<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
$(function() {
	$('#frmfindid').submit(function(){
			var membername=$('#membername').val();
			var email=$('#email').val();
			
			if(membername.length>0 && email.length>0){
				 $.ajax({
					url : "<c:url value='/login/ajaxfindId.do'/>",
					type : "post",
					dataType:"text",
					//data: $('#frmfindid').serialize(),
					data : {"membername":membername, "email":email},
					//contentType:"application/x-www-form-urlencoded; charset=UTF-8",
					success : function(res) {
						
					 if(res.length>0){
							var str="아이디 : "+res;
							$('.error').html(str);
							$('.error').show();
							event.preventDefault();
							return false;
						}else{
							$('.error').html('입력한 정보에 해당하는 아이디가 없습니다.');
							$('.error').show();
							event.preventDefault();
							return false;
						}
						
							event.preventDefault();

					},
					error : function(xhr, status, error) {
						alert(status + ":" + error);
					}
				});

			} else {
					if(membername==''){
						alert('이름을 입력해주세요');
						event.preventDefault();
						return false;
					}else if(email.length<1){
						alert('이메일을 입력해주세요');
						event.preventDefault();
						return false;
					}else{
						$('.error').html("입력한 정보에 해당하는 아이디가 없습니다.");
						$('.error').show();
						event.preventDefault();
						return false;					
					}
			}
			event.preventDefault();
		});
	
	

});
</script>

<div class="container" style="min-height: 550px;padding:8px;">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6"  style="color: green; font-size:1.3em;font-weight: bold;">
								ID찾기
							</div>
							<div class="col-xs-6">
								<a href="<c:url value='/login/findPwd.do'/>" id="register-form-link">비밀번호 찾기</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="frmfindid" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="membername" id="membername" tabindex="1" class="form-control" placeholder="이름">
									</div>
									<div class="form-group">
										<input type="text" name="email" id="email" tabindex="2" class="form-control" placeholder="이메일">
									</div>
									<div class="form-group">
									<div class="row">
										<span class="error"></span>
									</div>
								</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-register" value="ID찾기">
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