<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>
<style type="text/css">
 	#pageDiv{
 		width:30%;
 	}
 	.serDiv{
 		float: right;
 	}
 	input.form-control {
  		margin-top: 4px;
	}
	input.btn.btn-secondary.btn-default {
	    margin-top: 4px;
	}
	#boardTable{
	font-size: 1.0em;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		//필터링 하나로 합칠 수 있을 듯....
		$("#filterBoardKind").click(function(){
			if($("#formBoardKind input[name=useCheck]").val()!="Y"){
				$("#formBoardKind input[name=useCheck]").val("Y");
			}else{
				$("#formBoardKind input[name=useCheck]").val("N")	;
			}
			$("#formBoardKind").submit();
		});
		$("#filterComent").click(function(){
			if($("#formComent input[name=useCheck]").val()!="Y"){
				$("#formComent input[name=useCheck]").val("Y");
			}else{
				$("#formComent input[name=useCheck]").val("N")	;
			}
			$("#formComent").submit();
		});
		$("#filterUpload").click(function(){
			if($("#formUpload input[name=useCheck]").val()!="Y"){
				$("#formUpload input[name=useCheck]").val("Y");
			}else{
				$("#formUpload input[name=useCheck]").val("N")	;
			}
			$("#formUpload").submit();
		});
		$("#filterUsage").click(function(){
			if($("#formUsage input[name=useCheck]").val()!="Y"){
				$("#formUsage input[name=useCheck]").val("Y");
			}else{
				$("#formUsage input[name=useCheck]").val("N")	;
			}
			$("#formUsage").submit();
		});
		
		//맨위에 체크박스 누르면 전체 선택 ,해제
		$("#boardCkAll").click(function(){
			$("#boardTable tbody input[name=boardCheckBox]").prop("checked",this.checked);
		});
		//체크된것들 삭제
		$("#checkDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
					var cnt=0;
				$("input[name=boardCheckBox]").each(function(){
					if($(this).is(':checked')==true){
						cnt=1;
					}
				})
				if(cnt==0){
					alert("하나라도 체크해야 합니다.");
					event.preventDefault();
					return false;
				}else{
					$("form[name=boardListForm]").attr("action",
									'<c:url value="/manager/board/boardDelete.do"/>');
					$("form[name=boardListForm]").submit();
				}
			
			}
		});
		//등록 버튼 boardAdd.do 로 보내기
		$("#boardAdd").click(function(){
			location.href="<c:url value='/manager/board/boardAdd.do'/>";
		})
		//수정 버튼 누르면 체크된수많큼 수정화면 보여주기
		$("#checkEdit").click(function(){
			var cnt=0;
			$("input[name=boardCheckBox]").each(function(){
				if($(this).is(':checked')==true){
					cnt=1;
				}
			})
			if(cnt==0){
				alert("하나라도 체크해야 합니다.");
				event.preventDefault();
				return false;
			}else{
				$("form[name=boardListForm]").attr("action",
							'<c:url value="/manager/board/boardEdit.do"/>');
				$("form[name=boardListForm]").submit();
			}
		});
	});
	// 사용가능 불가능 변경하는 함수
	function boardUpdate(boardCode,usage){
		$("form[name=boardListForm]").attr("action","<c:url value='/manager/board/boardUpdate.do'/>")
		$("input[name=boardCode]").val(boardCode);
		$("input[name=usage]").val(usage);
		$("form[name=boardListForm]").submit();
	}
</script>
<!-- 타입 필터링용 -->
<form action="<c:url value='/manager/board/boardList.do'/>" method="post" id="formBoardKind">
	<input type="hidden" name="fileter" value='type_code'>
	<input type="hidden" name="key" value="${param.key}">
	<input type="hidden" name="content" value="${param.content}">
	<input type="hidden" name="useCheck" value="${param.useCheck }">
</form>
<!-- 업로드 필터링용 -->
<form action="<c:url value='/manager/board/boardList.do'/>" method="post" id="formComent">
	<input type="hidden" name="fileter" value='commentage'>
	<input type="hidden" name="key" value="${param.key}">
	<input type="hidden" name="content" value="${param.content}">
	<input type=hidden name="useCheck" value="${param.useCheck }">
</form>
<!-- 댓글 필터링용 -->
<form action="<c:url value='/manager/board/boardList.do'/>" method="post" id="formUpload">
	<input type="hidden" name="fileter" value='upage'>
	<input type="hidden" name="key" value="${param.key}">
	<input type="hidden" name="content" value="${param.content}">
	<input type=hidden name="useCheck" value="${param.useCheck }">
</form>
<!-- 사용여부 필터링용 -->
<form action="<c:url value='/manager/board/boardList.do'/>" method="post" id="formUsage">
	<input type="hidden" name="fileter" value='usage'>
	<input type="hidden" name="key" value="${param.key}">
	<input type="hidden" name="content" value="${param.content}">
	<input type=hidden name="useCheck" value="${param.useCheck }">
</form>
<div class="content-wrapper">
	<div class="content">
		<div class="breadcrumb-wrapper">

		<div class="col-lg-12">
			<div class="card card-default">
				<div class="card-header card-header-border-bottom">
					<h2>게시판 관리 	</h2>
				</div>
				<div class="card-body">
<form action="<c:url value='/manager/board/boardList.do'/>" name="boardListForm" method="post">
<input type="hidden" name="fileter" value='${param.fileter }'>
<input type="hidden" name=boardCode value=''>
<input type="hidden" name=usage value=''>
	
	<div>
		<div align="right" class="form-group serDiv">
			<input type="button" class="btn btn-secondary btn-default" id="boardAdd" value="등록">
			<input type="button" class="btn btn-secondary btn-default" id="checkEdit" value="선택한 것 수정">
			<input type="button" class="btn btn-secondary btn-default" id="checkDelete" value="선택한 것 삭제">
		</div>
		<div class="form-group serDiv">
			<input type="submit" class="btn btn-secondary btn-default" value="검색">&nbsp;	
			</div>
		<div class="form-group serDiv">
			<input type="text" class="form-control" placeholder="검색어" name="content" value="${param.content }">
		</div>
		<div class="form-group serDiv">
		<select class="custom-select my-1 mr-sm-2" name="key">
			<option value="">선택</option>
			<option value="fir_admin" 
				<c:if test="${param.key=='fir_admin' }">
					selected="selected"
				</c:if>
			>등록인</option>
			<option value="last_admin"
				<c:if test="${param.key=='last_admin' }">
					selected="selected"
				</c:if>
			>수정인</option>
			<option value="boardname"
				<c:if test="${param.key=='boardname' }">
					selected="selected"
				</c:if>
			>타이틀</option>
		</select>
		</div>
	</div>
	
	
<!-- 	<div class="btn-group  serDiv" role="group" aria-label="Basic example">
		<button type="button" class="btn btn-outline-primary">가능</button>
		<button type="button" class="btn btn-outline-primary">불가능</button>
	</div>
	<div class="btn-group  serDiv" role="group" aria-label="Basic example">
		<button type="button" class="btn btn-outline-primary"></button>
		<button type="button" class="btn btn-outline-primary">Middle</button>
		<button type="button" class="btn btn-outline-primary">Right</button>
	</div>
	
 -->	

						</p>
						<table class="table table-hover" id="boardTable">
							<thead>
								<tr>
									<th>
										<label class="control control-checkbox checkbox-primary"> 
											<input type="checkbox" name="boardCheck" id="boardCkAll" />
											<div class="control-indicator"></div>
										</label>
									</th>
									<th>순서</th>
									<th><a href="#" id="filterBoardKind">타입</a></th>
									<th>이름</th>
									<th>등록 MA</th>
									<th>등록일</th>
									<th>수정 MA</th>
									<th>수정일</th>
									<th><a href="#" id="filterComent">댓글</a></th>
									<th><a href="#" id="filterUpload">업로드</a></th>
									<th>파일수 </th>
									<th>사이즈</th>
									<th ><a href="#" id="filterUsage">사용여부</a></th>
								</tr>
							</thead>
							<tbody>
								<!-- 게시판 보여주기 반복 시작 -->
								<c:forEach var="vo" items="${boardList }">
								<tr>
									<td>
										<label class="control control-checkbox checkbox-primary"> 
											<input type="checkbox" name="boardCheckBox" 
												value="${vo.boardCode1 }"/>
											<div class="control-indicator"></div>
										</label>
									</td>
									<td scope="row">${vo.boardCode1 }</td>
									<td>
									<c:forEach var="BKVo" items="${BKList }">
										<c:if test="${vo.typeCode == BKVo.typeCode }">
											${BKVo.type }	
										</c:if> 
									</c:forEach>
									</td>
									<td>${vo.boardname }</td>
									<td>${vo.firAdmin }</td>
									<td>${vo.boardregdate1 }</td>
									<td>${vo.lastAdmin }</td>
									<td>${vo.boardupdate }</td>
									<td>
									<c:if test="${vo.commentage=='Y' }">
										가능
									</c:if>
									<c:if test="${vo.commentage=='N' }" >
										불가능
									</c:if>
									</td>
									<td>
									<c:if test="${vo.upage=='Y' }">
										가능
									</c:if>
									<c:if test="${vo.upage=='N' }">
										불가능
									</c:if>
									</td>
									<td>${vo.upnumage }</td>
									<td>${vo.upsizeage }</td>
									<td>
										<c:if test="${vo.usage=='Y' }">
											<a href="#" onclick="boardUpdate('${vo.boardCode1}','${vo.usage }')">사용중</a>
										</c:if>
										<c:if test="${vo.usage=='N' }">
											<a href="#" onclick="boardUpdate('${vo.boardCode1 }','${vo.usage }')">미사용</a>
										</c:if>
									</td>
								</tr>
								<!--  게시판 반복 끝 -->
								</c:forEach>
</form>
							</tbody>
						</table>
				
<%-- <div class="divPage" id="pageDiv">
	<!-- 페이지 번호 추가 -->		
	<c:if test="${pagingInfo.firstPage>1 }">
		<a href="#" onclick="boardList(${pagingInfo.firstPage-1})">			
		    <img src='<c:url value="/images/first.JPG" />'  border="0">	</a>
	</c:if>
					
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
		<c:if test="${i==pagingInfo.currentPage }">
			<span style="color:blue;font-weight:bold">${i }</span>
		</c:if>
		<c:if test="${i!=pagingInfo.currentPage }">						
			<a href="#" onclick="boardList(${i})">
				[${i }]
			</a>
		</c:if>		
	</c:forEach>
	
	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
		<a href="#" onclick="boardList(${pagingInfo.lastPage+1})">			
			<img src="<c:url value="/images/last.JPG" />" border="0">
		</a>
	</c:if>
	</div>
	<!--  페이지 번호 끝 --> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>
