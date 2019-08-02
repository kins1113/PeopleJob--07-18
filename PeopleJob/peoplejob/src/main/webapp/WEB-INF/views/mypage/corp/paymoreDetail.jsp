<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<style type="text/css">
table tr td{
    color: darkslategray;
}

table thead tr th{
	font-weight: bold;
}

table{
	    margin-top: 20px;
}
</style>
<title>결제내역 상세보기</title>
</head>
<body>
<div class="card-body" id="cardBoduPostList" style="">
	<table class="table table-bordered">
		<thead>
			<tr> 
				<th scope="col">채용공고 제목</th>
				<th scope="col">상품명</th> 
				<th scope="col">구매자 이름</th>
				<th scope="col">결제 수단</th>
				<th scope="col">할부 기간</th>
				<th scope="col">결제 일시</th>
				<th scope="col">결제 금액</th>
				<th scope="col">사용기간</th>
				<th scope="col">결제 상황</th>
			</tr>
		</thead>
		<tbody>

			<!--  반복 시작  -->
			<c:if test="${empty list }">
				<td colspan="8" align="center">결제하신 상품이 없습니다.</td>
			</c:if>
			
			<c:if test="${!empty list }"> 
		<%-- <c:forEach var="map" items="${list }" begin="0" end="1">
				<span style="color: black; font-size: 1.1em;">
				${map['PAYDATE'] } 에 결제한 상품 내역 리스트: 총 ${fn:length(list) }개</span>
		</c:forEach> --%>
		
				<c:forEach var="map" items="${list }">
					<tr>
						<td>
						<a href="<c:url value='/company/jobopening_view.do?jobopening=${map["JOBOPENING"] }' /> " target="_blank">${map['JOBTITLE'] }</a>
						</td>
						<td>${serviceName }</td>
						<td>${sessionScope.memberName }</td>
						<td>${map['PAYMENTWAY'] }</td> 
						<td>일시불</td>
						<td>
						<fmt:formatDate value="${map['PAYDATE'] }" pattern="yyyy/MM/dd HH:mm:ss"/></td>
						<td>${map['PRICE'] }원</td>
						<td>
						${fn:substring(map['PAYSTART_DATE'],0,10) }
						~<fmt:formatDate value="${map['PAYEND_DATE'] }"
								pattern="yyyy/MM/dd" /> (${map['PERIOD'] }일)
						</td>  
						
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
						
 					</tr> 
 						
				  </c:forEach>  
			</c:if> 
			
			<!-- 반복 끝 -->
		</tbody>
	</table>

</div>
</body>
</html>