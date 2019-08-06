<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>

<style type="text/css">
a{color: black;}
#pageDiv {width: 30%;}
.serDiv {float: right;margin-top: 9px;font-size: 9px;}
input.form-control {	margin-top: 4px;}
input.btn.btn-secondary.btn-default {margin-top: 4px;}
#boardTable {font-size: 1.0em;}
#cardBoduPostList {margin: 0 5px 5px 5px;padding: 0 5px 5px 5px;}
#btGroup {margin-right: 20px;}
#pageSize {	float: left;margin-left: 20px;margin-top: 9px;}
#startDay, #endDay{width: 120px;}
#btGroup button{margin-top: 4px;}
select.custom-select.my-1.mr-sm-2 {    font-size: 13px;}
input#workdate2,input#workdate1 { font-size: 15px;}

/* 
부트스트랩 pagination 가운데 정렬하기
 ul에 justify-content: center; 써주면 됩니다.  -영현 */
.pagination {
	justify-content: center;
}
</style>


<script type="text/javascript">
	$(document).ready(function(){
		$('input[id=chkAll]').click(function(){
			$('.divList table tbody input[type=checkbox]')
				.prop('checked',this.checked);
		});
		
		$("#btProgressEdit").click(function(){
			
			$("form[name=frmList]").attr("action","<c:url value='/manager/payment/progressEdit.do'/>")
			$("form[name=frmList]").submit();
			
		});
		
	$("input[name=btPayment]").click(function(){
		var type = $(this).val();
		alert("type="+type);
			
			$("form[name=frmList]").attr("action",
					"<c:url value='/manager/payment/list.do?type="+type+"'/>")
			$("form[name=frmList]").submit();
			
		});
		
		
	});
	
	function pageFunc1(curPage){
	$("input[name=currentPage]").val(curPage);
	$("form[name=frmSearch]").submit();
	}

	
</script>
<div class="divSearch">

 	
<form name="frmSearch" method="post"
action='<c:url value="/manager/payment/list.do"/>'>
			<!-- 현재 페이지 hidden에 넣기 -->
<input type="hidden" name='currentPage' value="1">
<input type="hidden" name='searchCondition' value="${param.searchCondition }">
<input type="hidden" name='searchKeyword' value="${param.searchKeyword }">




</form>
</div>

		<div class="row">
			<div class="col-lg-12">
<form name="frmList" method="post"
							action="<c:url value='/manager/payment/list.do'/>">
				<div class="card card-default">
					<div class="card-body">
					
					



				<h2>결제 관리</h2>
			</div>
			<!-- 해더 부분 버튼 그룹 시작  -->
			
			<div>
			<input type="button" value="결제완료" name="btPayment" class="mb-1 btn btn-success">
			<input type="button" value="결제취소" name="btPayment" class="mb-1 btn btn-success">
			<input type="button" value="결제취소요청" name="btPayment" class="mb-1 btn btn-success">
			
				<div class="form-group serDiv">
					<input type="submit" class="btn btn-secondary btn-default" id="postSearch"value="검색">&nbsp;
				</div>
				<div class="form-group serDiv">
					<input type="text" class="form-control" placeholder="검색어"
						name="searchKeyword" value="${param.searchKeyword }">
				</div>
				<div class="form-group serDiv">
					<select class="custom-select my-1 mr-sm-2" name="searchCondition">
						<option value="all">통합검색</option>
				
						<option value="memberid"
							<c:if test="${param.searchCondition=='memberid' }">
							selected="selected"
							</c:if>>아이디
						</option>
			
						<option value="servicename"
							<c:if test="${param.searchCondition=='servicename' }">
							selected="selected"
							</c:if>>서비스이름
						</option>


					</select>
				</div>
				<div class="form-group serDiv incDate" id="endDay">
					 <c:import url="../../inc/date.jsp">
						<c:param name="name" value="endDay"></c:param>
						<c:param name="id" value="workdate2"></c:param>
					</c:import> 				
				</div>
				<div class="form-group serDiv">
					<br><b> ~ </b>
				</div>
				<div class="form-group serDiv incDate" id="startDay">
					 <c:import url="../../inc/date.jsp">
						<c:param name="name" value="startDay"></c:param>
						<c:param name="id" value="workdate1"></c:param>
					</c:import>				
				</div>
				
			</div>
			<!-- 해더 부분 버튼 그룹 끝 -->
			

			<div class="divList" >
				<table class="table">
					<thead>
						<tr>
							<th><label class="control control-checkbox checkbox-primary">
									<input type="checkbox"  id="chkAll" />
									<div class="control-indicator"></div>
							</label></th>
							<th scope="col"><a href="#" class="fileterCode" id="payment_Code">결제번호</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="memberid">아이디</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="paymentway">결제방법</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="progress">결제상태</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="servicename">상품명</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="discount">할인</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="price">가격</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="paydate">결제시간</a></th>

						</tr>
					</thead>
					<tbody>
					<!--  반복 시작  -->
					<c:if test="${empty list }">
						<td colspan="11" align="center">결제 내역이 없습니다.</td>
					</c:if>
					<c:if test="${!empty list }">
						<c:forEach var="vo" items="${list}">
							<tr>
								<td>
									<label class="control control-checkbox checkbox-primary">
											<input type="checkbox" name="paymentChk" id="paymentChk" value="${vo['PAYMENT_CODE']}" />
											<div class="control-indicator"></div>
									</label>
								</td>
								<td>${vo['PAYMENT_CODE']}</td>
								<td>${vo['MEMBERID']}</td>
								<td>${vo['PAYMENTWAY']}</td>
								<td>${vo['PROGRESS']} </td>
								<td>${vo['SERVICENAME']}</td>
								<td>${vo['PERIOD']}</td>
								<td>${vo['PRICE']}</td>
								<td>${vo['PAYDATE']}</td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- 반복 끝 -->
					</tbody>
				</table>
				<div class="divPage">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
										<!-- 이전블럭으로 이동하기 -->
										<li class="page-item"><c:if
												test="${pagingInfo.firstPage>1 }">
												<li class="page-item"><a class="page-link" href="#"
													aria-label="Previous"
													onclick="pageFunc1(${pagingInfo.firstPage-1})"> <span
														aria-hidden="true" class="mdi mdi-chevron-left"></span> <span
														class="sr-only">Previous</span>
												</a></li>
											</c:if></li>
										<!-- 페이지 번호 추가 -->
										<!-- [1][2][3][4][5][6][7][8][9][10] -->
										<c:forEach var="i" begin="${pagingInfo.firstPage }"
											end="${pagingInfo.lastPage }">
											<c:if test="${i==pagingInfo.currentPage }">
												<li class="page-item active"><a class="page-link"
													href="#">${i}</a></li>
											</c:if>

											<c:if test="${i!=pagingInfo.currentPage }">
												<li class="page-item"><a class="page-link" href="#"
													onclick="pageFunc1(${i})">${i}</a></li>
											</c:if>
										</c:forEach>
										<!--  페이지	 번호 끝 -->


										<!-- 다음 블럭으로 이동하기 -->
										<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
											<li class="page-item"><a class="page-link" href="#"
												aria-label="Next"
												onclick="pageFunc1(${pagingInfo.lastPage+1})"> <span
													aria-hidden="true" class="mdi mdi-chevron-right"></span> <span
													class="sr-only">Next</span>
											</a></li>
										</c:if>
									</ul>
								</nav>
							</div>
		
			
		
		<div class="divRight">
	
선택한 결제내역 상태를
	<select class="custom-select my-1 mr-sm-2" name="progressSel">
		<option value="결제완료">결제완료</option>
		<option value="결제취소">결제취소</option>
		<option value="결제취소요청">결제취소요청</option>
	</select>
	<input type="button" value="변경" id="btProgressEdit" class="mb-1 btn btn-success">
</div>
		</form>

	</div>
			</div>

			


<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>