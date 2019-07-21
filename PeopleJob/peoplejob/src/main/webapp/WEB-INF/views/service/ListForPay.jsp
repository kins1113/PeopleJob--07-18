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
</style>

<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
 <script type="text/javascript">
 
 $(function(){ 
	
 });
 </script>

<!-- 결제 내역: 구매자이름(memberName), 전화번호(tel), 이메일, 
상품명,  (결제수단, 결제 일시, 할부 기간(일시불), 승인번호,)
 구매 상점명 
연락처 (1588-4954) , 결제금액, 사용기간?! , 결제취소 버튼 -->

<div class="card-body" id="cardBoduPostList" style="min-height: 300px; ">
	<table class="table table-bordered">
		<thead>
			<tr> 
				<th scope="col">&nbsp;</a></th>
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
				<c:forEach var="jobopeningVo" items="${list }">
					<tr>
						<td colspan="10" align="center">${jobopeningVo.jobtitle }</td>
						
 					</tr> 
 					
				  </c:forEach>  
			</c:if>
			<!-- 반복 끝 -->
		</tbody>
	</table>

</div>

