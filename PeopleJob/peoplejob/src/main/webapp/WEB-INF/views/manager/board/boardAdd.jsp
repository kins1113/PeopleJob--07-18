<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>
<script type="text/javascript">
	$(function(){
		$("#uploadCK").hide();
		$("#uploadCheck").change(function(){
			var checked = $(this).prop('checked')
			if(checked){
				$("#uploadCK").show();	
			}else{
				$("#uploadCK").hide();
				
			}
				
		})
		 
		$("form[name=insertBoardForm]").submit(function(){
			//업로드 체크가 안되면 0이 들어가도록			
			if($('#boardname').val()<1){
				alert("이름을 입력하세요");
				$('#boardname').focus();
				event.preventDefault();
				return false;
			}
			if($("#boardKind").val()<1){
				alert("종류를 선택하세요");
				$("#boardKind").focus();
				event.preventDefault();
				return false;
			}
			if(!$("input[name=upage]").prop('checked')){
				$("input[name=upnumage]").val(0);
				$("input[name=upsizeage]").val(0);
			}else{
				if($("input[name=upnumage]").val().length<1){
					alert("업로드 가능 숫자를 입력하세요");
					$("input[name=upnumage]").focus()
					event.preventDefault();
					return false;
				}else if($("input[name=upsizeage]").val().length<1){
					alert("업로드 사이즈를 입력하세요");
					$("input[name=upsizeage]").focus()
					event.preventDefault();
					return false;
				}
			}
			 	  
		});
		//맨위에 버튼 누르면 전체 선택
		$("#bkCheckAll").click(function(){
			$("#boardKindDiv input[name=bkCheck]").prop("checked",this.checked);
		})
		
		//선택된것 삭제 
		$("#btMultDel").click(function(){
			
			$("form[name=boardKindAddForm]").prop("action","<c:url value='/manager/board/boardkindDel.do'/>")
			$("form[name=boardKindAddForm]").submit();
			
		});
		
		//목록으로
		$("#goToBoardList").click(function(){
			location.href="<c:url value='/manager/board/boardList.do'/>";
		});
		
	})
	//카테고리 사용중 / 미사용중
	function boardKindChange(useCk,typeCode){
		$("input[name=useCk]").val(useCk);
		$("input[name=typeCode]").val(typeCode);
		$("#BKChange").submit();
	}
</script>
<form id="BKChange" action="<c:url value='/manager/board/boardKindChange.do'/>" method="post"> 
	<input type="hidden" name="useCk">
	<input type="hidden" name="typeCode">
</form>
 <div class="content-wrapper">
          <div class="content">		
          	<div class="breadcrumb-wrapper">

<div class="col-lg-12">
	<div class="card card-default">
		<div class="card-header card-header-border-bottom">
			<h2>게시판 추가</h2>
		</div>
		<div class="card-body">
			<ul class="nav nav-pills nav-justified nav-style-fill" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link " id="home3-tab" data-toggle="tab" href="#home3" role="tab" aria-controls="home3" aria-selected="true">게시판 추가</a>
				</li>
				<li class="nav-item" >
					<a class="nav-link" id="profile3-tab" data-toggle="tab" href="#profile3" role="tab" aria-controls="profile3" aria-selected="false">카테고리 추가</a>
				</li>
			</ul>
			<div class="tab-content active" id="myTabContent4">
				<div class="tab-pane pt-3 fade show active" id="home3" role="tabpanel" aria-labelledby="home3-tab">
					<!-- 게시판 추가 -->
					
					
					<div class="card card-default">
										<div class="card-body">
										
										
											<form class="form-pill" method="post" name="insertBoardForm"
											action="<c:url value='/manager/board/boardInsert.do'/>">
											
												
												<div class="form-group">
													<label for="boardname">게시판 이름</label>
													<input type="text" class="form-control" name="boardname" id="boardname" placeholder="Title">
												</div>
												<div class="form-group">
													<label for="boardKind">게시판 종류</label>
													<select class="form-control" id="boardKind" name="typeCode">
														<option value="">선택하세요</option>
														<!-- boardKind 태이블 조회에서 뿌리기 -->
														<c:forEach var="bkVO" items="${BKList }">
															<option value="${bkVO.typeCode }">${bkVO.type}</option>
														</c:forEach>
													</select>
												</div>
							<div class="row">
								<div class="col-sm-6">
								<!-- input 태그 스위치 스타일 -->
								<label class="control control-checkbox checkbox-primary">댓글사용 여부 
													<input type="checkbox" name="commentage" id="commentage" />
													<div class="control-indicator"></div>
								</label>
								<label class="control control-checkbox checkbox-primary">업로드 가능 여부
									<input type="checkbox" name="upage" id="uploadCheck" />
									<div class="control-indicator"></div>
								</label>
									<br>									
								<button id="boardAddButton" type="submit" class="mb-1 btn active  btn-secondary">추가</button>
								<button type="button" id="goToBoardList" class="mb-1 btn btn-info">목록으로</button>
								</div>
								<div class="col-sm-6" id="uploadCK">
									<div class="form-group">
										<label for="exampleFormControlPassword3">업로드 가능 한 숫자(1~5개)</label>
										<input type="Upload Count" name="upnumage" class="form-control" id="exampleFormControlPassword3" placeholder="Password">
									</div>				
									<div class="form-group">
										<label for="exampleFormControlPassword3">업로드가능한 파일 사이즈</label>
										<input type="Upload Size" name="upsizeage" class="form-control" id="exampleFormControlPassword3" placeholder="Password">
									</div>
										</div>  
								</div>
								
											</form>
										</div>
									</div>
					
					
					

					<!--input 태그 스위치 스타일
					<label class="switch switch-icon switch-outline-alt-primary form-control-label">
							<input type="checkbox" class="switch-input form-check-input" value="on" checked>
							<span class="switch-label"></span>
							<span class="switch-handle"></span>
						</label> -->

				</div>
				<div class="tab-pane pt-3 fade" id="profile3" role="tabpanel" aria-labelledby="profile3-tab">
					<!--  카테고리 추가 조회 -->
					
		<div class="card card-default">
					<div class="card-body">
						<form action="<c:url value='/manager/board/boardKindAdd.do'/>" method="post" name="boardKindAddForm">
							<div class="row">
							
							<!-- 카테고리 보여주는 테이블 -->
				<div class="col-lg-6">
									<div class="card card-default">
										<div class="card-body" id="boardKindDiv">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>
															<label class="control outlined control-checkbox checkbox-primary">
															<input type="checkbox" id="bkCheckAll" />
															<div class="control-indicator"></div>
														</th>
														<th scope="col">이름</th>
														<th scope="col">사용여부</th>
														<th scope="col">등록일</th>
													</tr>
												</thead>
												<tbody>
												<!--  -->
												<c:forEach var="vo" items="${BKList }">
													<tr>
														<td>
															<label class="control outlined control-checkbox checkbox-primary">
															<input type="checkbox" name="bkCheck"  value="${vo.typeCode }"/>
															<div class="control-indicator"></div>
														</td>
														<td scope="row">${vo.type }</td>
														<td>
														<c:if test="${vo.usage=='Y' }">
															<a href="#" onclick="boardKindChange('${vo.usage }','${vo.typeCode}')">사용중</a>
														</c:if>
														<c:if test="${vo.usage!='Y' }">
															<a href="#" onclick="boardKindChange('${vo.usage }','${vo.typeCode }')">미사용</a>
														</c:if>
														</td>
														<td>
														<fmt:formatDate value="${vo.regdate }" pattern="yy-MM-dd"/>
														</td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							
							
								<div class="col-sm-6">
									<div class="form-group">
										<label for="fname">카테고리 명</label>
										<input type="text" name="type" class="form-control" placeholder="Cartegory name">
											<br>
											<button type="submit" class="btn btn-primary btn-default">추가</button>
											<button type="button" class="btn btn-primary btn-default" id="btMultDel">선택 삭제</button>
									</div>
								</div>
								<!-- <div class="col-sm-6">
									<div class="row">
										<div class="col-6">
										</div>
									</div>
								</div> -->
							</div>
						</form>
					</div>
				</div>
				
				</div>
			</div>
		</div>
	</div>
</div>

</div></div></div>
<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>


	
