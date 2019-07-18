<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../main/inc/top.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/payment.css'/>" />
<style type="text/css">

</style>
<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>

<!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script type="text/javascript">
  $(function(){

		  
	  $('#pay').click(function(){
		  
		  if(${sessionScope.memberid==null}){ 
			  alert('로그인을 해주세요');
			  location.href="<c:url value='/login/login.do'/>";
		  }else{ //로그인을 했을 때 
			  if(${sessionScope.author_code!=3}){
				  if(${sessionScope.author_code==2}){
				 	 alert('기업회원 승인을 받은 후 서비스 이용가능합니다.');
					   
				  }else if(${sessionScope.author_code==1}){
				 	 alert('기업회원만 이용가능한 상품입니다.');
				  }     
			  }else if(${sessionScope.author_code==3 && fn:length(list)>=1}){ //승인받은 기업회원 일 때 
				  var IMP = window.IMP; // 생략해도 괜찮습니다.
				  IMP.init("imp49241177"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
				  
				  IMP.request_pay({
					  	pg : 'inicis', // version 1.1.0부터 지원.
					    pay_method : 'card',
					    merchant_uid : 'peoplejob_' + new Date().getTime(),
					    name : 'PEOPLEJOB 채용공고 vvip관',
					    amount : 10,
					    buyer_email : '${memberVo.email}',
					    buyer_name : '${sessionScope.memberName}',
					    buyer_tel : '${memberVo.tel}',
					    buyer_addr : '${companyVo.companyAddress}',
					    buyer_postcode : '${companyVo.companyZipcode}',
					    m_redirect_url : '<c:url value="/service/payment.do"/>' //모바일 결제 후 이동될 주소
					}, function(rsp) {
					    if ( rsp.success ) {
					        var msg = '결제가 완료되었습니다.\n';
					        msg+='결제일로부터 30일간 이용가능합니다.\n';
					        msg += '고유ID : ' + rsp.imp_uid;
					        msg += '상점 거래ID : ' + rsp.merchant_uid;
					        msg += '결제 금액 : ' + rsp.paid_amount+'원';
					        msg += '카드 승인번호 : ' + rsp.apply_num;
					        location.href="<c:url value='/service/success.do'/>";
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += ' : ' + rsp.error_msg;
					    }
					    alert(msg);
					});
			  }else if(${sessionScope.author_code==3 && fn:length(list)<1}){   
				  alert('등록된 채용공고가 없습니다. 채용공고를 먼저 등록해주세요');
				  location.href="<c:url value='/company/jobopening_register.do'/>";  
			  }
		  }//로그인해서 아이디 있을 때
		  
		 
	  });//
  
 $('#pay2').click(function(){
		  
		  if(${sessionScope.memberid==null}){ 
			  alert('로그인을 해주세요');
			  location.href="<c:url value='/login/login.do'/>";
		  }else{ //로그인을 했을 때 
			  if(${sessionScope.author_code!=3}){
				  if(${sessionScope.author_code==2}){
				 	 alert('기업회원 승인을 받은 후 서비스 이용가능합니다.');
					   
				  }else if(${sessionScope.author_code==1}){
				 	 alert('기업회원만 이용가능한 상품입니다.');
				  }     
			  }else if(${sessionScope.author_code==3 && fn:length(list)>=1}){ //승인받은 기업회원 일 때 
				  var IMP = window.IMP; // 생략해도 괜찮습니다.
				  IMP.init("imp49241177"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
				  
				  IMP.request_pay({
					  	pg : 'inicis', // version 1.1.0부터 지원.
					    pay_method : 'card',
					    merchant_uid : 'peoplejob_' + new Date().getTime(),
					    name : 'PEOPLEJOB 채용공고 vip관',
					    amount : 10,
					    buyer_email : '${memberVo.email}',
					    buyer_name : '${sessionScope.memberName}',
					    buyer_tel : '${memberVo.tel}',
					    buyer_addr : '${companyVo.companyAddress}',
					    buyer_postcode : '${companyVo.companyZipcode}',
					    m_redirect_url : '<c:url value="/service/payment.do"/>' //모바일 결제 후 이동될 주소
					}, function(rsp) {
					    if ( rsp.success ) {
					        var msg = '결제가 완료되었습니다.\n';
					        msg+='결제일로부터 30일간 이용가능합니다.\n';
					        msg += '고유ID : ' + rsp.imp_uid;
					        msg += '상점 거래ID : ' + rsp.merchant_uid;
					        msg += '결제 금액 : ' + rsp.paid_amount+'원';
					        msg += '카드 승인번호 : ' + rsp.apply_num;
					        location.href="<c:url value='/service/success.do'/>";
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += ' : ' + rsp.error_msg;
					    }
					    alert(msg);
					});
			  }else if(${sessionScope.author_code==3 && fn:length(list)<1}){   
				  alert('등록된 채용공고가 없습니다. 채용공고를 먼저 등록해주세요');
				  location.href="<c:url value='/company/jobopening_register.do'/>";  
			  }
		  }//로그인해서 아이디 있을 때
		  
		 
	  });//
	 
  
  });
</script>
<div class="container" style="margin-top: 30px; margin-bottom: 30px;">
    <div class="row">
        <div class="col-12 col-md-6 col-lg-3">
            <div class="card text-center p-table p-red">
                <div class="card-header">
            
                    <h3 class="p-name p-name">VVIP</h3>
                    <h4 class="p-price">1,000,000원 </h4>
                    <small class="text-muted">매월</small>
                </div>
                <div class="card-body">

                    <ul class="list-unstyled">
                        <li>메인 채용정보 VVIP</li>
                        <li>노출위치 : VVIP채용관</li>
                        <li>부가서비스 : 채용관 상단고정</li>
                        <li>PC웹: VVIP채용관</li>
                        <li>모바일 : 모바일 홈 VVIP</li>
                        <li>매월1일</li>
                    </ul>
                    <button type="button" class="btn btn-lg btn-primary" id="pay">결제하기</button>
                </div>
            </div>
        </div>

        <div class="col-12 col-md-6 col-lg-3">
            <div class="card text-center p-table p-green">
                <div class="card-header">
                    <h3 class="p-name p-name">VIP</h3>
                    <h4 class="p-price">700,000원 </h4>
                    <small class="text-muted">매월</small>
                </div>
                <div class="card-body">

                    <ul class="list-unstyled">
                        <li>메인 채용정보 VVIP</li>
                        <li>노출위치 : VVIP채용관</li>
                        <li>부가서비스 : 채용관 상단고정</li>
                        <li>PC웹: VVIP채용관</li>
                        <li>모바일 : 모바일 홈 VVIP</li>
                        <li>매월1일</li>
                    </ul>
                    <button type="button" class="btn btn-lg btn-primary" id="pay2">결제하기</button>
                </div>
            </div>
        </div>

        <div class="col-12 col-md-6 col-lg-3">
            <div class="card text-center p-table p-blue">
                <div class="card-header">
                     <h3 class="p-name p-name">Premium</h3>
                    <h4 class="p-price">500,000원 </h4>
                    <small class="text-muted">매월</small>
                </div>
                <div class="card-body">

                   <ul class="list-unstyled">
                        <li>메인 채용정보 VVIP</li>
                        <li>노출위치 : VVIP채용관</li>
                        <li>부가서비스 : 채용관 상단고정</li>
                        <li>PC웹: VVIP채용관</li>
                        <li>모바일 : 모바일 홈 VVIP</li>
                        <li>매월1일</li>
                    </ul>
                    <button type="button" class="btn btn-lg btn-primary">결제하기</button>
                </div>
            </div>
        </div>

        <div class="col-12 col-md-6 col-lg-3">
            <div class="card text-center p-table p-violet">
                <div class="card-header">
                     <h3 class="p-name p-name">Grand</h3>
                    <h4 class="p-price">300,000원 </h4>
                    <small class="text-muted">매월</small>
                </div>
                <div class="card-body">

                   <ul class="list-unstyled">
                        <li>메인 채용정보 VVIP</li>
                        <li>노출위치 : VVIP채용관</li>
                        <li>부가서비스 : 채용관 상단고정</li>
                        <li>PC웹: VVIP채용관</li>
                        <li>모바일 : 모바일 홈 VVIP</li>
                        <li>매월1일</li>
                    </ul>
                    <button type="button" class="btn btn-lg btn-primary">결제하기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../main/inc/bottom.jsp" %>