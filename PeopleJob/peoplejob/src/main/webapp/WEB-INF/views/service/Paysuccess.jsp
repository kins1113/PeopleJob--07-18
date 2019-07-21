<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">

$(function(){
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	  IMP.init("imp49241177"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	  
	  IMP.request_pay({
		  	pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'peoplejob_' + new Date().getTime(),
		    name : 'PEOPLEJOB 채용공고 vip관',
		    amount : 10,
		    buyer_email : 'diva716@naver.com',
		    buyer_name : '담당자',
		    buyer_tel : '01039128012',
		    buyer_addr : '주소',
		    buyer_postcode : '12345',
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
});
</script>
</head>
<body>
<h1>Paysuccess.jsp</h1>
<%-- <jsp:forward page="<c:url value=''/>"></jsp:forward> --%>
</body>
</html>