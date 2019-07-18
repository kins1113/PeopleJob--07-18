<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/login.css'/>" />
<style type="text/css">
.simpleForm{
	margin:0 auto;
}

#memberOutInfo{
	width:478px;
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function(){
		$('#pwd').focus();

		$('input[type=submit]').click(function(){
			if($('input[type=password]').val()<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			}else if(!confirm('회원탈퇴하시겠습니까?')){
				event.preventDefault();
			}
			
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
								<a href="<c:url value='/login/registerC.do'/>"  style="color: green; font-size:1.2em;">회원탈퇴</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
							<pre id="memberOutInfo">
지금까지 이용해주셔서 감사 드립니다. 
탈퇴하기 전 아래 유의사항을 확인해주세요.
1. 탈퇴하신 아이디는 복구가 불가능하며, 
추후 동일한 아이디로 재가입이 되지 않습니다.
2. 이력서 정보, 구직 활동내역, 유료서비스가 모두 삭제되며
 삭제된 데이터는 복구되지 않습니다.
3. 회원탈퇴 시 등록한 게시물은 삭제되지 않으므로, 
삭제를 원하시면 회원탈퇴 전에 삭제해 주시기 바랍니다.
4. 소셜 로그인 회원의 경우, 모든 정보가 삭제되며 
같은 소셜 아이디로 재가입 시 신규 회원으로 가입됩니다.
</pre>
							<p class="p">회원 탈퇴하시겠습니까?</p>
	<form name="frmOut" method="post" action="<c:url value='/login/memberOut.do'/>">
		<fieldset>
			<div class="form-group" >
				<input type="password" name="pwd" id="pwd" tabindex="2" class="form-control" placeholder="Password"
				style="    width: 250px; margin: 0 auto;">
				</div>
		<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" 
												tabindex="4" class="form-control btn btn-register" value="회원탈퇴">
											</div>
										</div>
									</div>
		</fieldset>
	</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="../main/inc/bottom.jsp"%>