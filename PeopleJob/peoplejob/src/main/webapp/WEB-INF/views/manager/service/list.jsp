<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		$('input[id=chkAll]').click(function(){
			$('.divList table tbody input[type=checkbox]')
				.prop('checked',this.checked);
		});
		
		$("#btDelMulti").click(function(){
			
			$("form[name=frmList]").prop("action","<c:url value='/manager/service/serviceDel.do'/>")
			$("form[name=frmList]").submit();
			
		});
		
	});
</script>


<div class="content-wrapper">
	<div class="content">
<div class="row">
	<div class="col-lg-12">
		<div class="card card-default">
		
		<div class="card-header card-header-border-bottom">
				<h2>서비스 조회</h2>
						</div>
						<form name="frmList" method="post" action="<c:url value='/manager/service/list.do'/>">
								<div class="divList">
								<table class="table">
									<thead>
										<tr>
											<th><label
												class="control control-checkbox checkbox-primary"> <input
													type="checkbox" id="chkAll" />
													<div class="control-indicator"></div>
											</label></th>
											<th scope="col"><a href="#" class="fileterCode"
												id="serviceCode">서비스 코드</a></th>
											<th scope="col"><a href="#" class="fileterCode"
												id="serviceName">서비스명</a></th>
											<th scope="col"><a href="#" class="fileterCode"
												id="servicePrice">가격</a></th>
											<th scope="col"><a href="#" class="fileterCode"
												id="serviceContent">서비스 내용</a></th>
											<th scope="col"><a href="#" class="fileterCode"
												id="serviceDay">서비스일</a></th>

										</tr>
									</thead>
									<tbody>
										<!--  반복 시작  -->
										<tr>
											<c:if test="${empty list}">
												<td colspan="6" class="align_center">상품이 존재하지 않습니다.</td>
											</c:if>
											<c:if test="${!empty list }">
												<c:set var="idx" value="0" />
												<c:forEach var="vo" items="${list}">
													<tr>
														<td>
														<label class="control control-checkbox checkbox-primary"> 
													<input type="checkbox" name="serviceChk" value="${vo.serviceCode }"/>
													<div class="control-indicator"></div>
														</label>
														</td>
															<td>${vo.serviceCode }</td>
															<td>${vo.serviceName }</td>
															<td>${vo.servicePrice }</td>
															<td>${vo.serviceContent }</td>
															<td>${vo.serviceDay }</td>
													</tr>
												</c:forEach>
											</c:if>
										</tr>
										
										<!-- 반복 끝 -->
									</tbody>
								</table>
									</div>
									<div class="card-body">
								<button type="button" class="mb-1 btn btn-danger"
									id="btDelMulti">선택한 상품 삭제</button>
				
									</div>
</form>
</div></div></div></div></div>






<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>