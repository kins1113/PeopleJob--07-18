<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>
<style type="text/css">
.panel.panel-login {
	width: 485px;
    margin: 30px 30px;
    border: 1px solid lightgray;
}
</style>
<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
$(function() {
	
	$('form[name=updateU]').submit(function(){
	/* 	$('.form-control infobox').each(function(){
			if($(this).val().length<1){
				var msg=$(this).attr('title');
				alert(msg+"칸을 입력해주세요");
				$(this).focus();
				event.preventDefault();
				return false;
			}
			
		}); */
			if($('#pwd').val()==''){
				alert('비밀번호를 입력해주세요');
				$('#pwd').focus();
				event.preventDefault();
				return false;
			}else if($('#membername').val()==''){
				alert('이름을 입력해주세요');
				$('#membername').focus();
				event.preventDefault();
				return false;
			}else if($('#tel').val()==''){
				alert('전화번호를 입력해주세요');
				$('#tel').focus();
				event.preventDefault();
				return false;
			}else if($('#email').val()==''){
				alert('이메일을 입력해주세요');
				$('#email').focus();
				event.preventDefault();
				return false;
			}else if($('#emailcertificatenum').val()==''){
				alert('이메일인증번호를 입력해주세요');
				$('#emailcertificatenum').focus();
				event.preventDefault();
				return false;
			}
		
		 
	});
	
	
	//핸드폰 정규식
	function validate_phoneno(ph){
		var pattern=new RegExp(/^[0-9]*$/g);
		return pattern.test(ph);
	}
});
</script>

<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form action="<c:url value='/login/person_update.do'/> " 
								method="post" role="form" style="display: block;" name="updateU">
									
									<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="text" name="memberid" id="memberid" tabindex="1" placeholder="아이디 *" 
										class="form-control infobox" style="width:250px" title="아이디" value="${memberVo.memberid }" readonly>
									</div>
									
									<div class="form-group">
									<div class="row">
										<!--<span id="availableId">사용가능한 아이디입니다.</span>
									 <span id="unavailableId">이미 사용중인 아이디입니다.</span> -->
										</div>
									</div>
									
									
										<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="password" name="pwd" id="pwd" tabindex="1" placeholder="비밀번호 *" 
										class="form-control infobox" style="width:250px" title="비밀번호">
									</div>
									
									<div class="form-group">
									<div class="row">
										<!--<span id="availableId">필수입력정보입니다.</span>
									 <span id="unavailableId">이미 사용중인 아이디입니다.</span> -->
										</div>
									</div>
									
									<div class="form-group">
									<div class="row">
										<!-- <span id="availableId">비밀번호가 일치하지 않습니다.</span> -->
										</div>
									</div>
									<div class="form-group">
										<input type="text" name="membername" id="membername" tabindex="1" class="form-control infobox" 
										title="이름" style="width: 250px" value="${memberVo.membername }" readonly>
									</div>
 
									<div class="form-group">
										<table>
											<tr style="font-size:1.3em">
												<td>성별</td>
												<td>&nbsp;&nbsp;</td>
												<td rowspan="3"><input type="radio" name="membergender" id="selectgender" value="남" checked>남</td>
												<td>&nbsp;&nbsp;</td>
												<td rowspan="3"><input type="radio" name="membergender" id="selectgender" value="여">여</td>
											</tr>
										</table>
									</div>
									<div class="form-group">
										<input type="text" name="birth" id="birth" tabindex="1" class="form-control" placeholder="생년월일"  style="width: 300px" value="${memberVo.birth }">
									</div>
									<div class="form-group">
									<div class="row">
										<span id="availableId" style="color: gray;">예) 19950812</span>
									</div>
									</div>
									<div class="form-group">
										<input type="text" name="tel" id="tel" tabindex="1" class="form-control infobox" placeholder="전화번호" title="전화번호" style="width: 300px" value="${memberVo.tel }">
										
									</div>
									<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="text" name="zipcode" id="zipcode" tabindex="1" placeholder="우편번호" 
										class="form-control" style="width:150px" style="background-color: #50a954" readonly value="${memberVo.zipcode }">
									</div>
									<div class="form-group">
									<div class="row">
										<input type="button" value="우편번호 찾기" class="btn btn-register"
										onclick="execDaumPostcode()">
										</div>
									</div>
									<div class="form-group">
										<input type="text" name="address" id="roadAddress" tabindex="1" class="form-control" placeholder="주소" readonly value="${memberVo.address }">
									</div>
									<div class="form-group">
										<input type="text" name="addressdetail" id="addressdetail" tabindex="1" class="form-control" placeholder="상세주소" value="${memberVo.addressdetail }">
									</div>
									<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="text" name="email" id="email" tabindex="1" placeholder="이메일*" 
										class="form-control infobox" style="width:300px" style="background-color: #50a954" title="이메일"  style="width: 250px" value="${memberVo.email }">
									</div>
									
									<div class="form-group">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="registersubmit" id="registersubmit" 
												tabindex="4" class="form-control btn btn-register" value="수정하기" style="background-color: #50a954">
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