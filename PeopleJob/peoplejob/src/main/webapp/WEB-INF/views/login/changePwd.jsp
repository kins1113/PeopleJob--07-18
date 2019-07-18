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
			}else if(!confirm('비밀번호를 수정하시겠습니까?')){
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
								<a href="<c:url value='/login/changePwd.do'/>"  style="color: green; font-size:1.2em;">비밀번호 변경</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
							<pre id="memberOutInfo">
							
＊PEOPLEJOB은 회원님의 중요한 개인정보를 관리자도 
알 수 없도록 암호화하여 철저히 관리하고 있습니다.
＊개인정보 보호를 위해 동일한 숫자반복 등과 같이 
다른 사람이 쉽게 알아낼 수 있는 비밀번호는 사용하지 마십시요.
＊개인정보 보안강화를 위하여 비밀번호의 대소문자를 구분하고 있습니다. 
비밀번호 대소문자를 확인하시고 입력해 주세요.
＊비밀번호는 주기적으로 변경해 주시기 바랍니다.

</pre>
							<p class="p">비밀번호를 변경하시겠습니까?</p>
	<form name="frmOut" method="post" action="<c:url value='/login/changePwd.do'/>">
		<fieldset>
			<div class="form-group" >
				<input type="password" name="pwd" id="pwd" tabindex="2" class="form-control" placeholder="Password"
				style="    width: 250px; margin: 0 auto;">
				</div>
		<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" 
												tabindex="4" class="form-control btn btn-register" value="비밀번호 변경하기">
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