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
	
	$('form[name=updateC]').submit(function(){
	 /* 	$('.form-control infobox').each(function(){
			if($(this).val().length<1){
				var msg=$(this).attr('title');
				alert(msg+"칸을 입력해주세요");
				$(this).focus();
				event.preventDefault();
				return false;
			}
			
		}); */ 
	 	
	 	//membergender가 '남'이면 radio첫번째 체크되게, 아니면 두번째 체크되게
	 	
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
			} else if (!validate_phoneno($('#tel').val())) {
				alert('휴대폰번호를 다시 입력해주세요');
				$('#tel').focus();
				event.preventDefault();
				return false;
			} else if($('#email').val()==''){
				alert('이메일을 입력해주세요');
				$('#email').focus();
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
								<form action="<c:url value='/login/c_update.do'/> " 
								method="post" role="form" style="display: block;" name="updateC" enctype="multipart/form-data">
									<input type="hidden" name="companyCode" id="companyCode" value="${companyVo.companyCode }">
									<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="text" name="memberid" id="memberid" tabindex="1" placeholder="아이디 *" 
										class="form-control infobox" style="width:250px" title="아이디" value="${memberVo.memberid }" readonly>
									</div>
										<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="password" name="pwd" id="pwd" tabindex="1" placeholder="비밀번호 *" 
										class="form-control infobox" style="width:250px" title="비밀번호">
									</div>
									
									<div class="form-group">
										<input type="text" name="membername" id="membername" tabindex="1" class="form-control infobox" 
										title="대표자명" style="width: 250px" value="${memberVo.membername }" readonly>
									</div>
									
									<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="text" name="email" id="email" tabindex="1" placeholder="담당자 이메일" 
										class="form-control infobox" style="width:300px" style="background-color: #50a954" title="이메일"  style="width: 250px" value="${memberVo.email }">
									</div>
									
									
									<div class="form-group">
										<input type="text" name="tel" id="tel" tabindex="1" class="form-control infobox" placeholder="전화번호" title="전화번호" style="width: 300px" value="${memberVo.tel }">
										
									</div>
									
									<!-- 회사정보 -->
									<div class="form-group">
										<input type="text" name="businessNumber" id="businessNumber" tabindex="1" class="form-control infobox" placeholder="전화번호" title="전화번호" style="width: 300px" value="${companyVo.businessNumber }" readonly>
										
									</div>
									<div class="form-group">
										<input type="text" name="companyname" id="companyname" tabindex="1" class="form-control infobox" placeholder="기업명" title="전화번호" style="width: 300px" value="${companyVo.companyname }" readonly>
										
									</div>
									<div class="form-group" style="float: left; margin-right:30px;" >
										<input type="text" name="companyZipcode" id="zipcode" tabindex="1" placeholder="우편번호" 
										class="form-control" style="width:150px" style="background-color: #50a954" readonly value="${companyVo.companyZipcode }">
									</div>
									<div class="form-group">
									<div class="row">
										<input type="button" value="우편번호 찾기" class="btn btn-register"
										onclick="execDaumPostcode()">
										</div>
									</div>
									<div class="form-group">
										<input type="text" name="companyAddress" id="roadAddress" tabindex="1" class="form-control" placeholder="회사 주소" readonly value="${companyVo.companyAddress }">
									</div>
									<div class="form-group">
										<input type="text" name="companyAddressdetail" id="companyAddressdetail" tabindex="1" class="form-control" placeholder="회사 상세주소" value="${companyVo.companyAddressdetail }">
									</div>
									
									
									<!-- 9개 추가 -->
									<div class="form-group">
										<input type="text" name="establishyear" id="establishyear" tabindex="1" class="form-control" placeholder="설립년도" value="${companyVo.establishyear }">
									</div>
									<div class="form-group">
										<input type="text" name="womannum" id="womannum" tabinde x="1" class="form-control" placeholder="여자사원 수" value="${companyVo.womannum }">
									</div>
									<div class="form-group">
										<input type="text" name="mannum" id="mannum" tabindex="1" class="form-control" placeholder="남자사원 수">
									</div>
									<div class="form-group">
										<input type="text" name="companytype" id="companytype" tabindex="1" class="form-control" placeholder="회사 기업형태" value="${companyVo.mannum }">
									</div>
									<div class="form-group">
										<input type="text" name="site" id="site" tabindex="1" class="form-control" placeholder="회사 site" value="${companyVo.site }">
									</div>
									<div class="form-group">
										<input type="text" name="sales" id="sales" tabindex="1" class="form-control" placeholder="매출액" value="${companyVo.sales }">
										<!-- value="${companyVo.sales }" -->
									</div>
									<div class="form-group">
										<input type="text" name="capital" id="capital" tabindex="1" class="form-control" placeholder="자본금" value="${companyVo.capital }">
										<!--  value="${companyVo.capital }" -->
									</div>
									<div class="form-group">
										<input type="text" name="majorbusiness" id="majorbusiness" tabindex="1" class="form-control" placeholder="주요사업" value="${companyVo.majorbusiness }">
									</div>
									<div class="form-group">
										<input type="text" name="introduction" id="introduction" tabindex="1" class="form-control" placeholder="기업소개" value="${companyVo.introduction }">
									</div>
									
									   <div class="form-group"><br>
                    <label class="control-label">회사 로고 이미지 :</label> 
                    <input id="companyimageurl" name="imageurl" class="form-control" type="file" value="${companyVo.image}"/>
                <c:if test="${!empty companyVo.image }">
	            <br>
	            <span class="sp1"></span>
	            <span style="color:green;font-weight: bold">
	            	※ 첨부파일을 새로 지정할 경우 기존 파일 ${companyVo.image }은 삭제됩니다.
	            </span>
            </c:if>
	            현재 로고 이미지: <input type="text" name="oldFileName" class="form-control" value="${companyVo.image}" />
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