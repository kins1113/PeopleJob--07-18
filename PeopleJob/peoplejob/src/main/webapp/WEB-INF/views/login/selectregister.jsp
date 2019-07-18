<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/login.css'/>" />

<style type="text/css">
input[type=button]{
	    height: 44px;
    font-size: small;
}

span{
	color:red;
	margin-top: 12px;
}


/*체크박스 디자인*/
.checkbox.custom {
  float: left;
  margin: 0;
  padding: 0;
  display: block;
  width: 100%;
  margin-bottom: 20px;
}

input[type="checkbox"].custom {
  margin-left: 0;
  padding: 0;
}

input[type=checkbox].css-checkbox {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  height: 1px;
  width: 1px;
  margin: -1px;
  padding: 0px;
  border: 0;
}

input[type=checkbox].css-checkbox+label.css-label{
  padding-left: 70px;
  height: 65px;
  display: inline-block;
  line-height: 70px;
  background-repeat: no-repeat;
  background-position: 0 0;
  font-size: 15px;
  vertical-align: middle;
  cursor: pointer;
  opacity: 1;
}


input[type=checkbox].css-checkbox:checked+label.css-label{
  background-position: 0 -66px;
}

.css-label {
  background-image: url(http://codeopus.net/file/blog/check1.png);
}

div#faq1 {
    margin-left: -50px;
}

textarea {
    margin-left: 14px;
    border: 1px solid lightgray;
}
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullRoadAddr;
            }
        }).open();
    }
</script>
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
	
	
	$('form[name=register1]').submit(function(){
		
		 if($('#memberid').val()==''){
			alert('아이디를 입력해주세요');
			$('#memberid').focus();
			event.preventDefault();
			return false;
		}else if($('#pwd').val()==''){
			alert('비밀번호를 입력해주세요');
			$('#pwd').focus();
			event.preventDefault();
			return false;
		}else if($('#pwd2').val()==''){
			alert('비밀번호 확인칸을 입력해주세요');
			$('#pwd2').focus();
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
		}else if($('input[type=checkbox]').is(":checked")==false){
			alert('이용약관에 동의해주세요');
			$('input[type=checkbox]').focus();
			event.preventDefault();
			return false;
		}
		 
	});
	
	$('form[name=register2]').submit(function(){
	/* 	$('.form-control').each(function(){
			if($(this).val().length<1){
				var msg=$(this).attr('title');
				alert(msg+'칸을 입력해주세요	.');
				$(this).focus();
				event.preventDefault();
			}
			
		}); */
		/* if($('#memberid').val()==''){
			alert('아이디를 입력해주세요');
			$('#memberid').focus();
			event.preventDefault();
			return false;
		}else if($('#pwd').val()==''){
			alert('비밀번호를 입력해주세요');
			$('#pwd').focus();
			event.preventDefault();
			return false;
		}else if($('#pwd2').val()==''){
			alert('비밀번호 확인칸을 입력해주세요');
			$('#pwd2').focus();
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
		}else if($('#businessNumber').val().length<1){
			alert($(this).attr('title')+"를 입력해주세요");
			$(this).focus();
			event.preventDefault;
			return false;
		} */
		
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
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">개인회원</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">기업회원</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="<c:url value='/login/register1.do'/> " 
								method="post" role="form" style="display: block;" name="register1">
									<input type="hidden" name="authorityCode" value=1>
									
									<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="text" name="memberid" id="memberid" tabindex="1" placeholder="아이디 *" 
										class="form-control infobox" style="width:250px" title="아이디">
									</div>
									
									<div class="form-group">
									<div class="row">
										<span id="availableId">사용가능한 아이디입니다.</span>
									<!-- <span id="unavailableId">이미 사용중인 아이디입니다.</span> -->
										</div>
									</div>
									
									
										<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="password" name="pwd" id="pwd" tabindex="1" placeholder="비밀번호 *" 
										class="form-control" style="width:250px" title="비밀번호">
									</div>
									
									<div class="form-group">
									<div class="row">
										<span id="availableId">필수입력정보입니다.</span>
									<!-- <span id="unavailableId">이미 사용중인 아이디입니다.</span> -->
										</div>
									</div>
										<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="password" name="pwd2" id="pwd2" tabindex="1" placeholder="비밀번호 확인 *" 
										class="form-control infobox" style="width:250px" title="비밀번호 확인">
									</div>
									
									<div class="form-group">
									<div class="row">
										<span id="availableId">비밀번호가 일치하지 않습니다.</span>
									<!-- <span id="unavailableId">이미 사용중인 아이디입니다.</span> -->
										</div>
									</div>
									<div class="form-group">
										<input type="text" name="membername" id="membername" tabindex="1" class="form-control infobox" placeholder="이름*" title="이름*" style="width: 250px">
									</div>
										<!-- <div class="radio radio-danger" style="float:left">
 
										<input type="radio" name="membergender" id="membergender" value="Yes" checked>
										<input type="radio" name="membergender" id="membergender" value="No">
										<label>남</label>
										<label>여</label>
										</div> -->
 
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
										<!-- <input type="text" name="membergender" id="membergender" value="남자"> -->
									</div>
									<div class="form-group">
										<input type="text" name="birth" id="birth" tabindex="1" class="form-control" placeholder="생년월일"  style="width: 300px">
									</div>
									<div class="form-group">
									<div class="row">
										<span id="availableId" style="color: gray;">예) 19950812</span>
									</div>
									</div>
									<div class="form-group">
										<input type="text" name="tel" id="tel" tabindex="1" class="form-control infobox" placeholder="전화번호" title="전화번호" style="width: 300px">
										
									</div>
									<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="text" name="zipcode" id="zipcode" tabindex="1" placeholder="우편번호" 
										class="form-control" style="width:150px" style="background-color: #50a954" readonly>
									</div>
									<div class="form-group">
									<div class="row">
										<input type="button" value="우편번호 찾기" class="btn btn-register"
										onclick="execDaumPostcode()">
										</div>
									</div>
									<div class="form-group">
										<input type="text" name="address" id="roadAddress" tabindex="1" class="form-control" placeholder="주소" readonly>
									</div>
									<div class="form-group">
										<input type="text" name="addressdetail" id="addressdetail" tabindex="1" class="form-control" placeholder="상세주소">
									</div>
									<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="text" name="email" id="email" tabindex="1" placeholder="이메일*" 
										class="form-control infobox" style="width:300px" style="background-color: #50a954" title="이메일"  style="width: 250px">
									</div>
									<div class="form-group">
									<div class="row">
										<input type="button" value="이메일 인증" class="btn btn-register" id="emailcertificate">
										</div>
									</div>
									<div class="form-group">
										<input type="text" name="emailcertificatenum"  id="emailcertificatenum" tabindex="1" class="form-control" placeholder="이메일 인증 번호*" style="width: 300px">
									</div>
									
									
									<div class="form-group">
				          <h3>이용약관 동의<input type="checkbox" name="chk" id="chk"></h3>
						
				        <ul id="faq-list" class="wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
				          <li>
				            <!-- <a data-toggle="collapse" class="collapsed" href="#faq1">이용약관 보기▽ <i class="ion-android-remove"></i></a> -->
				            <div id="faq1">
				            <textarea rows="10" cols="65">
개인 회원 약관 (개정 및 적용 2019. 08. 01)
제1조 (목적)
본 약관은 ㈜PEOPLEJOB(이하 "회사")이 운영하는 웹사이트(이하 “사이트”)를 통해 인터넷 관련 서비스를 제공함에 있어, 회사가 제공하는 서비스와 관련하여, 이를 이용하는 가입자(이하 “회원” 또는 “개인회원”)의 이용조건 및 제반 절차, 기타 필요한 사항을 규정함을 목적으로 한다.

제2조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 아래와 같다.

① “사이트”라 함은 “회사”가 서비스를 “개인회원” 에게 제공하기 위하여 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함) 등 정보통신설비를 이용하여 설정한 가상의 영업장 또는 회사가 각각 운영하는 웹사이트를 말하며, 통합된 하나의 아이디 및 비밀번호(이하 “통합 계정”)를 이용하여 서비스를 제공받을 수 있는 아래의 사이트로 정의한다.
1. 사람인 : www.peoplejob.co.kr
② "서비스"라 함은 “회사”가 기업(단체, 사업자, 교육기관) 또는 개인이 구인, 구직과 교육을 목적으로 등록하는 자료를 DB화하여 각각의 목적에 맞게 분류 가공, 집계하여 정보를 제공하는 서비스와 해당 인터넷 주소에서 제공하는 모든 부대 서비스를 말한다.
③ "개인회원"이라 함은 서비스를 이용하기 위하여 동 약관에 동의하고 회사와 이용계약을 체결하여 이용자ID를 부여 받은 개인을 말한다.
④ "이용자ID" 또는 "회원ID"라 함은 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 부여하는 문자와 숫자의 조합을 말한다.
⑤ "비밀번호"라 함은 회사의 서비스를 이용하려는 사람이 이용자ID를 부여 받은 자와 동일인임을 확인하고 회원의 권익을 보호하기 위하여 회원이 선정한 문자와 숫자의 조합을 말한다.
제3조 (약관의 명시와 개정)
① 회사는 이 약관의 내용과 상호, 영업소 소재지, 사업자등록번호, 연락처 등을 이용자가 알 수 있도록 초기 화면에 게시하거나 기타의 방법으로 이용자에게 공지해야 한다.
② 회사는 약관의 규제 등에 관한법률, 전기통신기본법, 전기통신사업법, 정보통신망이용촉진등에관한법률 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있다.
③ 회사가 약관을 개정할 경우에는 개정 약관 적용일 최소 7일전(약관의 변경이 소비자에게 불리한 경우에는 30일전)부터 웹사이트 초기화면 공지사항 또는 이메일을 통해 고지한다.
④ 이용자는 변경된 약관에 대해 거부할 권리가 있다. "이용자"는 변경된 약관이 공지된 지 15일 이내에 거부의사를 표명할 수 있다. "이용자"가 거부하는 경우 본 서비스 제공자인 "회사"는 15일의 기간을 정하여 "이용자"에게 사전 통지 후 당해 "이용자"와의 계약을 해지할 수 있다. 만약, "이용자"가 거부의사를 표시하지 않고 "서비스"를 계속 이용하는 경우에는 동의하는 것으로 간주한다.
제4조 (약관 외 준칙)
① 이 약관에서 규정하지 않은 사항에 관해서는 약관의 규제 등에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신망이용촉진등에관한법률 등의 관계법령에 따른다.
② 회원이 회사와 개별 계약을 체결하여 서비스를 이용하는 경우에는 개별 계약이 우선한다.
제5조 (이용계약의 성립)
① 회사의 서비스 이용계약(이하 '이용계약'이라 한다)은 서비스를 이용하고자 하는 자의 본 약관과 개인정보처리방침의 내용에 대한 동의 및 이용신청(회원가입신청)에 대하여 회사가 승낙함으로써 성립한다.
② 서비스를 이용하고자 하는 자가 이용신청 당시 웹상의 "동의함"에 체크 후 회원인증 과정을 완료시 본 약관 및 개인정보처리방침에 대하여 동의한 것으로 간주한다.
③ 제1항의 승낙은 이용신청자의 본 약관에 대한 동의를 확인하고 웹 상의 안내 및 전자메일로 통지함으로써 이루어지고 이러한 승낙의 통지가 이용신청자에게 도달하면 이용계약이 성립한다.
④ 사람인 인재정보에 공개된 이력서의 개인정보는 열람권한을 가진 기업회원에게 제공된다.
제공받는 자 : 사람인 기업회원
제공받는 목적 : 개인회원의 구직의사에 따른 인재 채용활동
제공하는 항목 : 개인회원이 구직활동을 위해 인재정보에 공개한 정보
보유기간 및 이용기간 : 개인회원이 선택한 개인정보 보유기간 동안
⑤ 페이스북 등 외부 서비스와의 연동을 통해 이용계약을 신청할 경우, 본 약관과 개인정보취급방침, 서비스 제공을 위해 회사가 이용하고자 하는 자의 외부 서비스 계정 정보 접근 및 활용에 ＂동의함＂ 또는 ＂확인＂ 버튼을 누르면 회사가 웹 상의 안내 및 전자메일로 이용 신청자에게 통지함으로써 이용계약이 성립된다.
제6조 (서비스 이용신청)
① 회원으로 가입하여 본 서비스를 이용하고자 하는 이용고객은 회원인증 방식(휴대폰 인증, 아이핀 인증)을 선택하여 회사에서 요청하는 제반정보(이름, 외국인등록번호, 여권번호, 생년월일, 전화번호, 휴대폰 번호 등)를 제공하여야 한다
② 실명으로 등록하지 않은 사용자는 일체의 권리를 주장할 수 없다.
③ 타인의 명의를 도용하여 이용신청을 한 회원의 모든 ID는 삭제 되며, 관계법령에 따라 처벌을 받을 수 있다.
④ 만 15세 미만자의 회원가입은 금지되며 성명, 연령, 기타의 정보를 허위로 기재한 경우에는 이용정지, 강제탈퇴, 손해배상청구 등 불이익이 부과될 수 있다.
제7조 (이용신청의 승낙과 제한)
① 회사는 전조의 규정에 이한 이용신청 고객에 대하여 업무수행상 또는 기술상 지장이 없는 경우에는 원칙적으로 접수순서에 따라 서비스 이용을 승낙한다.
② 회사는 아래사항에 해당하는 경우에 대해서는 이용신청을 승낙하지 아니한다.
1. 실명이 아니거나 타인의 명의를 이용하여 신청한 경우
2. 이용계약 신청서의 내용을 허위로 기재한 경우
③ 회사는 아래사항에 해당하는 경우에는 그 신청에 대하여 승낙제한 사유가 해소될 때까지 승낙을 유보할 수 있다.
1. 회사가 설비의 여유가 없는 경우
2. 회사의 기술상 지장이 있는 경우
3. 기타 회사의 사정(회사의 귀책사유 있는 경우도 포함)으로 이용승낙이 곤란한 경우
제8조 (서비스의 내용)
① 회사는 제2조 4항의 서비스를 제공할 수 있으며 그 내용은 다음 각 호와 같다.
1. 인재 데이터베이스 검색을 위한 이력서 등록서비스
2. 온라인 입사지원 서비스
3. 헤드헌팅/아웃소싱 서비스
4. 구인/구직과 관련된 제반 서비스
5. 기타 회사가 추가 개발하거나 제휴계약 등을 통해 회원에게 제공하는 일체의 서비스
제9조 (개인회원 정보, 이력서 노출)
① 개인회원의 이력서는 개인이 회원가입 또는 이력서 작성 및 수정시 희망한 형태로 이력서를 노출한다.
② 회사는 개인회원이 이력서의 인재정보 등록/미등록 지정, 이력서상의 연락처 공개/비공개를 자유롭게 선택할 수 있도록 하여야 한다.
③ 회사는 개인회원이 이력서를 인재정보에 등록하기를 희망했을 경우 유료이력서 검색을 신청한 기업회원이 열람 가능하도록 할 수 있다. 다만, 연락처 각 항목이 비공개로 지정된 경우 해당 항목별 연락처를 노출할 수 없다.
④ 회사는 개인회원이 등록한 이력서를 아이디 휴면상태 이전까지 노출할 수 있으며, 회사가 지정한 기간이 지난 이력서는 개인회원 탈퇴시 까지 관리할 수 있다.
⑤ 회사는 안정적인 서비스를 제공하기 위해 테스트 및 모니터링, 고객문의 용도에 한하여 개인회원의 이력서 정보를 열람할 수 있다.
제10조(제휴를 통한 서비스)
① 회사는 제휴 관계를 체결한 여타 인터넷 웹 사이트 또는 신문, 잡지 등의 오프라인 매체를 통해 사이트에 등록한 개인회원의 이력서 정보가 열람될 수 있도록 서비스를 제공할 수 있다. 단, 개인회원의 경우 제휴 서비스를 통해 노출되는 이력서의 연락처 정보는 제10조의 각 항에 따른다.
② 회사는 제휴를 통해 타 사이트 및 매체에 등록될 수 있음을 고지하고 동의를 받아야 하며, 제휴 사이트 전체 목록을 사이트내에서 상시 열람할 수 있도록 해야 한다.
				            	
				            </textarea>
				            
				            </div>
				          </li>
				
				        </ul>
				
				      
   				 </div>
									
									<div class="form-group">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="registersubmit" id="registersubmit" 
												tabindex="4" class="form-control btn btn-register" value="가입하기" style="background-color: #50a954">
										</div>
									</div>
									<div class="form-group">
											<div class="col-sm-6 col-sm-offset-3">
												<div class="text-center">
													<a href="<c:url value='/login/login.do'/>" tabindex="5" class="forgot-password">로그인하기</a>
												</div>
											</div>
									</div>
								</form>
								<form id="register-form" action="<c:url value='/login/register2.do'/>" method="post" role="form" style="display: none;" name="register2">
									<input type="hidden" name="authorityCode" value=2>
									<input type="hidden" name="zipcode">
									<input type="hidden" name="address">
									<input type="hidden" name="addressdetail">
									<input type="hidden" name="membergender">
									<input type="hidden" name="birth">
									
									<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="text" name="memberid" id="memberid" tabindex="1" placeholder="아이디" 
										class="form-control" style="width:250px" title="아이디" >
									</div>
									
									<div class="form-group">
									<div class="row">
										<span id="availableId">사용가능한 아이디입니다.</span>
									<!-- <span id="unavailableId">이미 사용중인 아이디입니다.</span> -->
										</div>
									</div>
									
									
									<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="text" name="pwd" id="pwd" tabindex="1" placeholder="비밀번호" 
										class="form-control" style="width:250px" title="비밀번호">
									</div>
									
									<div class="form-group">
									<div class="row">
										<span id="necessary">필수입력정보입니다.</span>
										</div>
									</div>
										<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="text" name="pwd2" id="pwd2" tabindex="1" placeholder="비밀번호 확인" 
										class="form-control" style="width:250px" title="비밀번호 확인">
									</div>
									
									<div class="form-group">
									<div class="row">
										<span id="availableId">비밀번호가 일치하지 않습니다.</span>
									<!-- <span id="unavailableId">이미 사용중인 아이디입니다.</span> -->
										</div>
									</div>
									<div class="form-group">
										<input type="text" name="membername" id="membername" tabindex="1" class="form-control" placeholder="대표자명" title="대표자명"  style="width: 300px">
									</div>
									
									<div class="form-group">
										<input type="text" name="tel" id="tel" tabindex="1" class="form-control" placeholder="전화번호" title="전화번호"  style="width: 300px">
									</div>
									<div class="form-group">
										<input type="text" name="companyname" id="companyname" tabindex="1" class="form-control" placeholder="기업명" style="width:300px" title="기업명">
									</div>
									<div class="form-group">
										<input type="text" name="businessNumber" id="businessNumber" tabindex="1" class="form-control" placeholder="사업자등록번호" title="사업자 등록번호">
									</div>
									<div class="form-group">회사로고 이미지
										<input type="file" name="image" id="image">
									</div>
									
									<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="text" name="email" id="email" tabindex="1" placeholder="이메일" 
										class="form-control" style="width:300px" style="background-color: #50a954" title="이메일">
									</div>
									<div class="form-group">
									<div class="row">
										<input type="button" value="이메일 인증" class="btn btn-register" id="emailcertificate">
										</div>
									</div>
									<div class="form-group">
										<input type="text" name="emailcertificatenum"  id="emailcertificatenum" tabindex="1" class="form-control" placeholder="이메일 인증 번호" style="width:300px">
									</div>
									
									<div class="form-group">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="registerCompanysubmit" id="registerCompanysubmit" 
												tabindex="4" class="form-control btn btn-register" value="가입하기" style="background-color: #50a954">
										</div>
									</div>
									<div class="form-group">
											<div class="col-sm-6 col-sm-offset-3">
												<div class="text-center">
													<a href="<c:url value='/login/login.do'/>" tabindex="5" class="forgot-password">로그인하기</a>
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