<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>
<style type="text/css">
a{color: black;}
#pageDiv {width: 30%;}
.serDiv {float: right;margin-top: 9px;}
input.form-control {	margin-top: 4px;}
input.btn.btn-secondary.btn-default {margin-top: 4px;}
#boardTable {font-size: 1.0em;}
#cardBoduPostList {margin: 0 5px 5px 5px;padding: 0 5px 5px 5px;}
#btGroup {margin-right: 20px;}
#pageSize {	float: left;margin-left: 20px;margin-top: 9px;}
</style>
<script type="text/javascript">
	$(document).ready(function (){
		//맨위에 체크박스 누르면 전체 선택
		$("#postCkAll").click(function(){
			$("input[name=postCheck]").prop("checked",this.checked)
		});
		$("#pageSize select[name=recordCountPerPage]").change(function(){
			$("form[name=postList]").submit();
		});
		//선택한것 삭제 처리
		$("#checkDelete").click(function(){
			$("form[name=postList]").attr("action","<c:url value='/manager/post/postCheckDelete.do'/>");
			$("form[name=postList]").submit();
		});
		//필터링
		$(".fileterCode").click(function(){
			$("input[name=filterCode]").val($(this).attr("id"));

			if($("form[name=postList] input[name=filterKey]").val()=="N"){
				$("form[name=postList] input[name=filterKey]").val("Y");
			}else if($("form[name=postList] input[name=filterKey]").val()=="Y"){
				$("form[name=postList] input[name=filterKey]").val("N");
			}else{
				$("form[name=postList] input[name=filterKey]").val("Y");
			}
			
			$("form[name=postList]").submit();
		});
	});
	function pageFunc(curPage){
		$("input[name=currentPage]").val(curPage);
		$("form[name=postList]").submit();
	}
	//삭제 버튼 누르면 삭제=> 미삭제  미삭제 => 삭제로 변경 
	function changeDelete(delCheck, boardCode){
		$("input[name=deletecheck]").val(delCheck);
		$("input[name=boardCode2]").val(boardCode);
		$("form[name=postList]").attr("action","<c:url value='/manager/post/postList.do?deleteChange=Y'/>")
		$("form[name=postList]").submit();
	}
</script>
<form action="<c:url value='/manager/post/postList.do'/>" name="postList" method="post" >
<!-- 페이지 처리를 위한 hidden  -->
<input type="hidden" name="currentPage"
	<c:if test="${param.currentPage!=null }">
	 	value="${param.currentPage }"
	</c:if>
	<c:if test="${param.currentPage==null }">
		value='1';
	</c:if>
 >
<!-- 필터링을 위한 hidden -->
<input type="hidden" name="filterCode" value="${param.filterCode }">
<input type="hidden" name="filterKey" value="${param.filterKey}">

<!-- 삭제 수정 처리를 위한 hidden -->
<input type="hidden" name="deletecheck" value="N">
<input type="hidden" name="boardCode2" value="0">
<div class="row">
	<div class="col-lg-12">
		<div class="card card-default">
			<div class="card-header card-header-border-bottom">
				<h2>게시글 조회</h2>
			</div>
			<!-- 해더 부분 버튼 그룹 시작  -->
			<div>
				<div align="right" class="form-group serDiv" id="btGroup">
					<input type="button" class="btn btn-secondary btn-default" id="boardAdd" value="등록"> 
					<input type="button"class="btn btn-secondary btn-default" id="checkEdit"value="아직 기능 미정"> 
					<input type="button" class="btn btn-secondary btn-default" id="checkDelete"value="선택한 것 삭제">
				</div>
				<div class="form-group serDiv">
					<input type="submit" class="btn btn-secondary btn-default" id="postSearch"value="검색">&nbsp;
				</div>
				<div class="form-group serDiv">
					<input type="text" class="form-control" placeholder="검색어"
						name="searchKeyword" value="${param.searchKeyword }">
				</div>
				<div class="form-group serDiv">
					<select class="custom-select my-1 mr-sm-2" name="searchCondition">
						<option value="">선택</option>
						<option value="boardTitle,boardcontent"
							<c:if test="${param.searchCondition=='boardTitle,boardcontent' }">
							selected="selected"
							</c:if>>제목+내용
						</option>
						<option value="memberid"
							<c:if test="${param.searchCondition=='memberid' }">
							selected="selected"
							</c:if>>회원 아이디
						</option>
						<option value="type"
							<c:if test="${param.searchCondition=='type' }">
							selected="selected"
						</c:if>>카테고리
						</option>
	<!-- 날짜가 선택되면 달력이 나오도록 처리-->
						<option value="boardname"
							<c:if test="${param.key=='boardname' }">
							selected="selected"
				</c:if>>날짜</option>
					</select>
				</div>
				<div class="form-group serDiv">
					<c:import url="/inc/searchDate.do"></c:import>					
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
									<input type="checkbox" name="postCheckAll" id="postCkAll" />
									<div class="control-indicator"></div>
							</label></th>
							<th scope="col"><a href="#" class="fileterCode" id="TYPE">카테고리</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="boardtitle">게시판 이름</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="memberid">회원 아이디</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="boardtitle">제목</a></th>
							<!-- <th scope="col">내용</th> -->
							<th scope="col"><a href="#" class="fileterCode" id="boardregdate2">등록일</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="boardhits">조회수</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="deletecheck">삭제 여부</a></th>
							<th>신고여부</th>
							<th scope="col">파일
							<input type="text" value="">
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="map" items="${postList}">
							<tr>
								<td><label
									class="control control-checkbox checkbox-primary"> 
									<input type="checkbox" name="postCheck"  value="${map['BOARD_CODE2']}"/>
										<div class="control-indicator"></div>
								</label></td>
								<td>${map['TYPE'] }</td>
								<td scope="row">${map['BOARDNAME'] }</td>
								<td>${map['MEMBERID'] }</td>
								<td>${map['BOARDTITLE']}</td>
								<%-- <td>${vo.boardcontent }</td> --%>
								<td><fmt:formatDate value="${map['BOARDREGDATE2']}" pattern="yyyy-MM-dd"/></td>
								<td>${map['BOARDHITS']}</td>
								<td>
									<c:set var="delCheck" value="${map['DELETECHECK']}"/>
									<c:if test='${delCheck eq "Y"}'>
										<a href="#" onclick="changeDelete('${map['DELETECHECK']}','${map['BOARD_CODE2']}')">삭제</a>
									</c:if>
									<c:if test="${delCheck eq 'N'}">
										<a href="#" onclick="changeDelete('${map['DELETECHECK']}','${map['BOARD_CODE2']}')">미삭제</a>
									</c:if>
								</td>
								<td>
									<c:if test='${reportCk eq "Y"}'>
										신고
									</c:if>
									<c:if test="${reportCk eq 'N'}">
										미신고
									</c:if>
								</td>
								<td>
									<!-- 파일이 있을 수 도 있고 없을 수 도 있다.? -->
								파일 O,X
								</td>
							</tr>
						</c:forEach>
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