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
</style>
<script type="text/javascript">
	$(document).ready(function (){
		//맨위에 체크박스 누르면 전체 선택
		$("#paymemtCkAll").click(function(){
			$("input[name=paymentCk]").prop("checked",this.checked)
		});
		$("#pageSize select[name=recordCountPerPage]").change(function(){
			$("form[name=postList]").submit();
		});

	//페이지 처리 함수
	function pageFunc(curPage){
		$("input[name=currentPage]").val(curPage);
		$("form[name=paymentList]").submit();
	}

</script>
<form name="paymentList" method="post" 
		 enctype="multipart/form-data" >
<!-- 페이지 처리를 위한 hidden  -->
<input type="hidden" name="currentPage"
	<c:if test="${param.currentPage!=null }">
	 	value="${param.currentPage }"
	</c:if>
	<c:if test="${param.currentPage==null }">
		value='1';
	</c:if>
 >
 


<div class="row">
	<div class="col-lg-12">
		<div class="card card-default">
			<div class="card-header card-header-border-bottom">
				<h2>결제 관리</h2>
			</div>
			<!-- 해더 부분 버튼 그룹 시작  -->
			<div>
			
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
						<option value="membername"
							<c:if test="${param.searchCondition=='progress' }">
							selected="selected"
							</c:if>>결제상태
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
				<div class="form-group" id='pageSize'>
					<select class="custom-select my-1 mr-sm-2" name="recordCountPerPage">
						<option value="10"
							<c:if test="${param.recordCountPerPage==10 }">
								selected="selected"
							</c:if>>10개씩
						</option>
						<option value="20"
							<c:if test="${param.recordCountPerPage==20 }">
								selected="selected"
							</c:if>>20개씩
						</option>
						<option value="30"
							<c:if test="${param.recordCountPerPage==30 }">
								selected="selected"
							</c:if>>30개씩
						</option>
						<option value="50"
							<c:if test="${param.recordCountPerPage==50 }">
								selected="selected"
							</c:if>>50개씩
						</option>
					</select>
				</div>
			</div>
			<!-- 해더 부분 버튼 그룹 끝 -->
			<div class="card-body" id="cardBoduPostList">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th><label class="control control-checkbox checkbox-primary">
									<input type="checkbox" name="paymemtCkAll" id="paymemtCkAll" />
									<div class="control-indicator"></div>
							</label></th>
							<th scope="col"><a href="#" class="fileterCode" id="payment_Code">결제번호</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="memberid">아이디</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="paymentway">결제방법</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="progress">결제상태</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="servicename">상품명</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="discount">할인</a></th>
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
											<input type="checkbox" name="paymentCk" id="paymentCk" value="${memberVo.email}" />
											<div class="control-indicator"></div>
									</label>
								</td>
								<td>${vo['PAYMENT_CODE']}</td>
								<td>${vo['MEMBERID']}</td>
								<td>${vo['PAYMENTWAY']}</td>
								<td>${vo['ROGRESS']} </td>
								<td>${vo['SERVICENAME']}</td>
								<td>${vo['DISCOUNT']}</td>
								<td>${vo['PAYDATE']}</td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- 반복 끝 -->
					</tbody>
				</table>
				<div class="divPage" align="center">
					<!-- 이전블럭으로 이동하기 -->
					<c:if test="${pagingInfo.firstPage>1 }">
						<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> <img
							src="<c:url value='/resources/images/first.JPG'/>"
							alt="이전블럭으로 이동">
						</a>
					</c:if>
					<!-- 페이지 번호 추가 -->
					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage }"
						end="${pagingInfo.lastPage }">
						<c:if test="${i==pagingInfo.currentPage }">
							<span style="color: blue; font-size: 1em">${i }</span>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<a href="#" onclick="pageFunc(${i})">[${i}]</a>
						</c:if>
					</c:forEach>
					<!--  페이지 번호 끝 -->

					<!-- 다음 블럭으로 이동하기 -->
					<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
						<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> <img
							src="<c:url value='/resources/images/last.JPG'/>"
							alt="다음블럭으로 이동">
						</a>
					</c:if>
				</div>
				<div class="divSearch"></div>
			</div>
		</div>
</form>

<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>