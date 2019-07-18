<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>
          
          <div class="content-wrapper">
	<div class="content">
		<div class="row">
			<div class="col-lg-6">
				<div class="card card-default">
					<div class="card-header card-header-border-bottom">
					<form name="serviceRegister" method="post"
						action="<c:url value='/service/register.do'/>" >
							<div class="form-group">
								<label for="serviceName">서비스명</label>
					<input type="text" class="form-control" id="serviceName" name="serviceName"/>
					<label for="servicePrice">가격</label>
					<input type="text" class="form-control" id="servicePrice" name="servicePrice"/>
					<label for="serviceContent">서비스내용</label>
					<textarea  class="form-control" id="serviceContent" name="serviceContent" rows="10" cols="30"></textarea>
					<label for="serviceDay">서비스일</label>
					<input type="text" class="form-control" id="serviceDay" name="serviceDay" />
				
						<br>
								<button type="submit" class="btn btn-primary btn-default">등록하기</button>
							
							</div>
							</form>
          </div>
          </div>
          </div>
          
	<div class="col-lg-6">
		<div class="card card-default">
			<div class="card-header card-header-border-bottom">
  <form action="<c:url value='/manager/post/postList.do'/>" name="postList" method="post" >
				<h2>상품 관리</h2>
			
<!-- 페이지 처리를 위한 hidden  -->
<input type="hidden" name="currentPage"
	<c:if test="${param.currentPage!=null }">
	 	value="${param.currentPage }"
	</c:if>
	<c:if test="${param.currentPage==null }">
		value='1';
	</c:if>
 >
			<!-- 해더 부분 버튼 그룹 시작  -->
			<div>
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
									<input type="checkbox" name="postCheckAll" id="postCkAll" />
									<div class="control-indicator"></div>
							</label></th>
							<th scope="col"><a href="#" class="fileterCode" id="serviceCode">서비스 코드</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="serviceName">서비스명</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="servicePrice">가격</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="serviceContent">서비스 내용</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="serviceDay">서비스일</a></th>
			
						</tr>
					</thead>
					<tbody>
					<!--  반복 시작  -->
							<tr>
							<c:if test="${empty list}">
								<td colspan="6" class="align_center">상품이 존재하지 않습니다.</td>
							</c:if>
							<c:if test="${!empty list }">
								<c:set var="idx" value="0"/>
								<c:forEach var="vo" items="${list}">
									<tr>
									<td>
									<input type="checkbox" name="serviceChk" value="${vo.ServiceCode }">
									</td>
									</tr>
								</c:forEach>
							</c:if>
							</tr>
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
			</form>
			</div>
		</div>
		
		</div>

          
          
          
         
          </div>
          </div>
          </div>
          
          
          
<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>