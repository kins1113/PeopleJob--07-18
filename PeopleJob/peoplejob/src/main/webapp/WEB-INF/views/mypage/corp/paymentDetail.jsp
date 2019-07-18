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
    margin-top: 30px;
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
</style>

<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
 <script type="text/javascript">
 
 $(function(){ 
	 $('#canclepay').click(function(){
		  if(!confirm(${i}+'번 상품을 결제 취소 하시겠습니까?')){
			 event.preventDefault();
			 return false; 
		 }
	 });
 });
 </script>
<%-- <div class="box1">
	<h2>결제내역</h2>
	<table border="1px solid lightgray;">
		<c:if test="${empty list }">
			<tr>
				<td colspan="9">결제하신 상품이 없습니다.</td>
			</tr>
		</c:if>

		<c:if test="${!empty list }">
			<c:forEach var="map" items="${list }">
				<tr>
					<th>상품명</th>
					<th>구매자 이름</th>
					<th>할부 기간</th>
					<th>결제 수단</th>
					<th>결제 일시</th>
					<th>결제 금액</th>
					<th>사용 기간</th>
					<th>구매 상점명</th>
					<th>결제 취소</th>
				</tr>

				<tr>
					<td>채용공고 vvip관</td>
					<td>${sessionScope.memberName }</td>
					<td>일시불</td>
					<td>${map['PAYMENTWAY'] }</td>
					<td>${map['PAYDATE'] }</td>
					<td>${map['SERVICEPRICE'] }원</td>
					<td>~<fmt:formatDate value="${map['PAYEND_DATE'] }"
							pattern="yyyy/MM/dd HH:mm:ss" />
					</td>
					<td>[(주):케이지이니시스]</td>
					<td><button>결제 취소</button></td>
				</tr>

			</c:forEach>
		</c:if>
		<!-- <tr>
    <td>채용공고 vvip관</td>
    <td>이름</td>
    <td>일시불</td>
    <td>카드</td>
    <td>2019/07/15</td>
    <td>1,000,000원</td>
    <td>~2019/10/29</td>
    <td>[(주):케이지이니시스] </td>
    <td><button>결제 취소</button></td>
  </tr> -->
	</table>
</div> --%>
<!-- 결제 내역: 구매자이름(memberName), 전화번호(tel), 이메일, 
상품명,  (결제수단, 결제 일시, 할부 기간(일시불), 승인번호,)
 구매 상점명 
연락처 (1588-4954) , 결제금액, 사용기간?! , 결제취소 버튼 -->

<div class="card-body" id="cardBoduPostList">
	<table class="table table-bordered">
		<thead>
			<tr> 
				<th scope="col">상품명</a></th>
				<th scope="col">구매자 이름</th>
				<th scope="col">할부 기간</th>
				<th scope="col">결제 수단</th>
				<th scope="col">결제 일시</th>
				<th scope="col">결제 금액</th>
				<th scope="col">사용기간</th>
				<th scope="col">결제 상황</th>
				<th scope="col">결제 취소</th>
			</tr>
		</thead>
		<tbody>
			<!--  반복 시작  -->
			<c:if test="${empty list }">
				<td colspan="10" align="center">결제하신 상품이 없습니다.</td>
			</c:if>
			
			<c:if test="${!empty list }">
				<c:forEach var="map" items="${list }">
 
					<tr>
						<td>${map['SERVICENAME'] }</td>
						<td>${sessionScope.memberName }</td>
						<td>일시불</td>
						<td>${map['PAYMENTWAY'] }</td> 
						<td>${map['PAYDATE'] }</td>
						<td>${map['SERVICEPRICE'] }원</td>
						<td>~<fmt:formatDate value="${map['PAYEND_DATE'] }"
								pattern="yyyy/MM/dd HH:mm:ss" />
						</td> 
						<td>${map['PROGRESS'] }</td>
						<form id="frmpay" method="post" action="<c:url value='/mypage/corp/paymentDetail.do'/>">
						<input type="hidden" name="paymentCode" value="${map['PAYMENT_CODE'] }">
						<td><input type="submit" value="결제 취소" id="canclepay"></td>
						</form>
 					</tr> 
				  </c:forEach>  
			</c:if>
			<!-- 반복 끝 -->
		</tbody>
	</table>

</div>

<%@include file="../../main/inc/bottom.jsp"%>