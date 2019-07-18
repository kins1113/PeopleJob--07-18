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
			
			$("form[name=frmList]").prop("action","<c:url value='/manager/notice/noticeDel.do'/>")
			$("form[name=frmList]").submit();
			
		});
		
	});
	
	function pageFunc1(curPage){
	$("input[name=currentPage]").val(curPage);
	$("form[name=frmSearch]").submit();
	}

	
</script>

<Style type="text/css">
/* 
부트스트랩 pagination 가운데 정렬하기
 ul에 justify-content: center; 써주면 됩니다.  -영현 */
.pagination {
	justify-content: center;
}
</Style>



<div class="content-wrapper">
	<div class="content">
		<div class="row">
			<div class="col-lg-12">
				<div class="card card-default">
					<div class="card-body">




						<form class="form-inline">

							<select class="custom-select my-1 mr-sm-2" name="searchCondition">

								<option value="notifytitle"
									<c:if test="${param.searchCondition=='notifytitle'}">
            		selected="selected"
            	</c:if>>제목</option>
								<option value="notifycontent"
									<c:if test="${param.searchCondition=='notifycontent'}">
            		selected="selected"
            	</c:if>>내용</option>

							</select>

							<div class="input-group mb-2 mr-sm-2">


								<input type="text" name="searchKeyword" class="form-control"
									placeholder="검색어" value="${param.searchKeyword }">
							</div>
							<button type="submit" class="btn btn-primary mb-2">검색</button>
						</form>
						<div class="pt-5 mt-4 border-top w-100"></div>




						<div class="divSearch">
							<!-- 페이징 처리에도 사용 -->

							<form name="frmSearch" method="post"
								action='<c:url value="/manager/notice/list.do"/>'>
								<!-- 현재 페이지 hidden에 넣기 -->
								<input type="hidden" name='currentPage' value="1">


							</form>
						</div>



						<form name="frmList" method="post"
							action="<c:url value='/manager/notice/list.do'/>">
							<div class="divList">
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th><input type="checkbox" id="chkAll"></th>
											<th scope="col">공지번호</th>
											<th scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">등록일</th>
											<th scope="col">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty list }">
											<tr>
												<td colspan="5" class="align_center">데이터가 존재하지 않습니다.</td>
											</tr>
										</c:if>
										<c:if test="${!empty list }">
											<!--  내용 반복 시작 -->
											<c:set var="idx" value="0" />
											<c:forEach var="vo" items="${list }">
												<tr>
													<td><input type="checkbox" name="noChk"
														value="${vo['NOTIFY_CODE'] }"></td>


													<td>${vo['NOTIFY_CODE'] }</td>
													<td><a
														href="<c:url value='/manager/notice/countUpdate.do?notifyCode=${vo["NOTIFY_CODE"]}'/>">
															<!-- 제목이 긴경우 30글자만 보여주기 --> <c:if
																test="${fn:length(vo['NOTIFYTITLE'] ) >=30}">
  							${fn:substring(vo['NOTIFYTITLE'],0,30)}...
  						</c:if> <c:if test="${fn:length(vo['NOTIFYTITLE'])<30 }">
  				${vo['NOTIFYTITLE']}
  					</c:if> <!-- 24시간 이내 글인 경우 new 이미지 보여주기 --> <c:if
																test="${vo['NEW_IMG_TERM']<24 }">
																<img src="<c:url value='/resources/images/new.gif'/>"
																	alt="new이미지">
															</c:if>
													</a></td>
													<!-- adminid로 찍어주기 -->
													<td>${vo['ADMINID']}</td>
													<td><fmt:formatDate value="${vo['NOTIFYDATE']}"
															pattern="yyyy-MM-dd" /></td>
													<td>${vo['READCOUNT']}</td>
												</tr>
												<c:set var="idx" value="${idx+1 }" />
											</c:forEach>
										</c:if>
										<!-- 반복끝 -->
									</tbody>
								</table>

							</div>
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

							<div class="card-body">
								<button type="button" class="mb-1 btn btn-danger"
									onclick="location.href='write.do' ">공지등록</button>
								<button type="button" class="mb-1 btn btn-danger"
									id="btDelMulti">선택한 상품 삭제</button>

							</div>
						</form>

					</div>




					
				</div>
			</div>
		</div>
	</div>
</div>



<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>