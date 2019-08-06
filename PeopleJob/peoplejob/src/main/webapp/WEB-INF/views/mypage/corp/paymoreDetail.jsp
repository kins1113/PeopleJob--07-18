<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제내역 상세보기</title>
</head>
<body>
<div class="card-body" id="cardBoduPostList" style="">
	<table class="table table-bordered">
		<thead>
			<tr> 
				<th scope="col">상품명</th> 
				<th scope="col">구매자 이름</th>
				<th scope="col">결제 수단</th>
				<th scope="col">할부 기간</th>
				<th scope="col">결제 일시</th>
				<th scope="col">결제 금액</th>
				<th scope="col">사용기간</th>
				<th scope="col">결제 상황</th>
				<th scope="col">결제 취소</th>
				<th scope="col">상세보기</th>
			</tr>
		</thead>
		<tbody>
			<!--  반복 시작  -->
			<c:if test="${empty list }">
				<td colspan="10" align="center">결제하신 상품이 없습니다.</td>
			</c:if>
			
			<c:if test="${!empty list }"> 
				<c:forEach var="map" items="${list }">
 					<input type="hidden" value="${map['PAYDATE'] }" id="pd">
					<tr>
						<td>${map['SERVICENAME'] }</td>
						<td>${sessionScope.memberName }</td>
						<td>${map['PAYMENTWAY'] }</td> 
						<td>일시불</td>
						<td>${map['PAYDATE'] }</td>
						<td>${map['SERVICEPRICE'] }원</td>
						<td>
						<fmt:formatDate value="${map['PAYDATE'] }"
								pattern="yyyy/MM/dd HH:mm" />
						~<fmt:formatDate value="${map['PAYEND_DATE'] }"
								pattern="yyyy/MM/dd HH:mm" />
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
						
						<form id="frmpay" method="post" action="<c:url value='/mypage/corp/paymentDetail.do'/>">
						<input type="hidden" name="paymentCode" value="${map['PAYMENT_CODE'] }">
						<td><input type="submit" value="결제 취소" id="cancelpay" style="padding: 5px; font-size: 0.9em;"></td>
						</form>
						<td><input type="button" value="..." style="background: white;
    border: 1px solid lightgray;
    width: 40px;
    font-weight: bold;
    margin: 0 auto; cursor: pointer;" onclick="detail(${map['PAYDATE']})" class="btnDetail"></td>
 					</tr> 
 						
				  </c:forEach>  
			</c:if> 
			
			<!-- 반복 끝 -->
		</tbody>
	</table>

</div>
</body>
</html>