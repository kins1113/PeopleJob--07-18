<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500|Poppins:400,500,600,700|Roboto:400,500"
	rel="stylesheet" />
<link
	href="https://cdn.materialdesignicons.com/3.0.39/css/materialdesignicons.min.css"
	rel="stylesheet" />

<!-- PLUGINS CSS STYLE -->
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/plugins/toastr/toastr.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/plugins/nprogress/nprogress.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/plugins/flag-icons/css/flag-icon.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/plugins/jvectormap/jquery-jvectormap-2.0.3.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/plugins/ladda/ladda.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/plugins/select2/css/select2.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/plugins/daterangepicker/daterangepicker.css"
	rel="stylesheet" />

<!-- SLEEK CSS -->
<link id="sleek-css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/assets/css/sleek.css" />

<%@include file="../../main/inc/top.jsp"%>

<style type="text/css">
.box1 {
	min-height: 600px;
}

table {
	margin: 0 auto;
	vertical-align: middle;
}

td{
	text-align: center;
	vertical-align: middle;
}

h2 {
	text-align: center;
}

a {
	color: black;
}

#pageDiv {
	width: 30%;
}

.serDiv {
	float: right;
	margin-top: 9px;
	font-size: 9px;
}

input.form-control {
	margin-top: 4px;
}

input.btn.btn-secondary.btn-default {
	margin-top: 4px;
}

#boardTable {
	font-size: 1.0em;
}

#cardBoduPostList {
	margin: 0 5px 5px 5px;
	padding: 0 5px 5px 5px;
	
}
div#cardBoduPostList {
    margin: 0 auto;
    min-height: 600px;
    margin-top: 60px;
    width: 65%;
}
#btGroup {
	margin-right: 20px;
}

#pageSize {
	float: left;
	margin-left: 20px;
	margin-top: 9px;
}

#startDay, #endDay {
	width: 120px;
}

#btGroup button {
	margin-top: 4px;
}

.badge {
	display:block;  
    text-transform: uppercase;
    color: #ffffff;
    padding-top: .75em;
}

.badge-success {
    color: #ffffff;
    background-color: #29cc97;
}
.badge {
    padding: 0.5em 1em; 
    font-size: 75%;
    font-weight: 500;
    line-height: 1;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: 0.125rem;
}
.badge-warning {
    color: #212529;
    background-color: #fec400;
}
.badge-danger {
    color: #ffffff;
    background-color: #fe5461;
}

table tr td, table tr th{
	text-align: center;
}
</style>

<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
 <script type="text/javascript">
 
 $(function(){ 
	var time=new Date().getTime(); 
	var paydate=$('#pd').val();
	 
	
	 $('#refund').click(function(){
		 var cancelprice=$('input[name=totalprice]').val();
		 
		 $.ajax({
		        url: "http://www.myservice.com/payments/cancel",
		        type: "POST",
		        contentType: "application/json",
		        data: JSON.stringify({
		          merchant_uid:  "peoplejob_1564556321967", // 주문번호
		          cancel_request_amount: cancelprice, // 환불금액
		          reason: "테스트 결제 환불", // 환불사유
		          //refund_holder: "${sessionScope.memberName}", // [가상계좌 환불시 필수입력] 환불 가상계좌 예금주
		          //refund_bank: "88",
		          // [가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번)
		          //refund_account: "1002952534048" 
		          // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
		        }),
		        dataType: "json" 
		      });
		 
			
	 });
	 

	 
 });
 
	
	function detail(paydate, memberCode, serviceName){
		 window.open('<c:url value="/mypage/corp/paymoreDetail.do?paydate='+paydate+'&memberCode='+memberCode+'&serviceName='+serviceName+'"/>',
				 'paymoreDetailView',
				 "'status=no, height=500, width=1100, left='300px', top='300px'");
		
	}
	
 </script>

<!-- 결제 내역: 구매자이름(memberName), 전화번호(tel), 이메일, 
상품명,  (결제수단, 결제 일시, 할부 기간(일시불), 승인번호,)
 구매 상점명 
연락처 (1588-4954) , 결제금액, 사용기간?! , 결제취소 버튼 -->

<div class="card-body" id="cardBoduPostList" style="min-height: 629px; ">
<a href="<c:url value='/service/payment.do'/>" style="float: right; font-size: 1.3em; color: steelblue;">채용광고 및 배너 광고 신청 문의</a>
<br><br><br>
	<table class="table table-bordered">
		<thead>
			<tr> 
				<th scope="col">번호</th> 
				<th scope="col">상품명</th> 
				<th scope="col">구매자 이름</th>
				<th scope="col">결제 수단</th>
				<th scope="col">할부 기간</th>
				<th scope="col">결제 일시</th>
				<th scope="col">결제 금액</th>
				<!-- <th scope="col">사용기간</th> -->
				<th scope="col">결제 상황</th>
				<th scope="col">결제 취소</th>
				<th scope="col">상세보기</th>
			</tr>
		</thead>
		<tbody>
			<!--  반복 시작  -->
			<c:if test="${empty Timelist }">
				<td colspan="9" align="center">결제하신 상품이 없습니다.</td>
			</c:if>
			
			<c:if test="${!empty Timelist }">
			<c:set var="i" value="1"/>
			<c:forEach var="map" items="${Timelist }">
				<tr>
							<td>${i }</td>
							<td>${map['SERVICENAME'] }</td>
							<td>${sessionScope.memberName }</td>
							<td>카드</td> 
							<td>일시불</td>
							<td>${map['BYTIME'] }</td>
							<td>${map['TOTALPRICE'] }원</td>
							<input type="hidden" name="totalprice" value="${map['TOTALPRICE'] }">
							<td>
							<c:if test="${map['PROGRESS']=='결제완료' }">
							<span class="badge badge-success">Completed</span>
							</c:if>
							<c:if test="${map['PROGRESS']=='결제취소요청' }">
							<span class="badge badge-warning">결제 취소 요청</span>
							</c:if>
							<c:if test="${map['PROGRESS']=='결제취소' }">
							<span class="badge badge-danger">결제 취소</span>
							</c:if>
							</td>
							
							<form id="frmpay" method="post" action="<c:url value='/mypage/corp/paymentDetail.do'/>">
							<input type="hidden" name="paymentCode" value="${map['PAYMENT_CODE'] }">
							<td><input type="submit" value="결제 취소" id="cancelpay" style="padding: 5px; font-size: 0.9em; margin: 0 auto;">
								<input type="button" id="refund" value="결제 환불"></td> 
						
							</form>
							<td>
						 <input type="button" value="..." style="background: white; border: 1px solid lightgray; width: 40px;
	    font-weight: bold; margin: 0 auto; cursor: pointer;" onclick="detail('${map['BYTIME']}', '${map['MEMBER_CODE'] }', '${map['SERVICENAME'] }')" class="btnmore"> 
	
	    </td>
	 					</tr>  
	 				 <c:set var="i" value="${i+1 }"/>
			</c:forEach>
			</c:if>
			
			<!-- 반복 끝 -->
		</tbody>
	</table>

</div>

<%@include file="../../main/inc/bottom.jsp"%>