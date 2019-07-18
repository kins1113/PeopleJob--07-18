<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>
<style>
	.uploadCK{
		padding-left: 30px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		//유효성 검사 입력 안했을 때 체크되도록
		$(".infoBox").keyup(function() {
			if ($(this).val().length < 1) {
				$(this).attr("class", "form-control is-invalid");
				$(this).next().show();
			} else {
				$(this).attr("class", "form-control is-valid");
				$(this).next().hide();
			}
		});
		//업로드 일때만 보이도록 처리
		$(".uploadCK").hide();
		$(".uploadCheck").change(function() {
			var checked = $(this).prop('checked')
			if (checked) {
				$(this).parent().parent().parent().parent().parent().find(".uploadCK").show();
			} else {
				$(this).parent().parent().parent().parent().parent().find(".uploadCK").hide();

			}

		})
		
		//1 버튼 생성 
		//2 각각 다른 이름 주기
		$("form[name=frmBoardEdit]").each(function(){
			//3 클릭 이벤트
			$(this).submit(function(){
				if($(this).find("input[name=upnumage]").val()==null || $(this).find("input[name=upnumage]").val()==''){
					$(this).find("input[name=upnumage]").val("0");
				}
				if($(this).find("input[name=upsizeage]").val()==null || $(this).find("input[name=upsizeage]").val()==''){
					$(this).find("input[name=upsizeage]").val("0");
				}
				$.ajax({
					url:"<c:url value='/manager/board/boardEdit.do'/>",		
					type:"get",
					data:$(this).serializeArray(),
					dataType:"json",
					success:function(res){
						var today=new Date();
						$("#successSpan"+res.boardCode1).html("  수정 완료되었습니다.");
						$("#lastAdmin"+res.boardCode1).html(res.lastAdmin);
						$("#boardupdate"+res.boardCode1).html(today.getFullYear()+"-"+fometdate(today.getMonth()+1)+"-"+fometdate(today.getDate()));
						$("#title"+res.boardCode1).html(res.boardname);
					},
					error:function(xhr, status, error){
						alert(status+" : "+error);
					}
				});			
				event.preventDefault();
			});
		});
		//5 input에 val로 뿌려주기
	});
	function fometdate(a){
		if(a<10){
			a="0"+a;
		}
		return a;
	}
</script>
<div class="row">
		<div class="col-lg-12"><a href="<c:url value='/manager/board/boardList.do'/>" class="btn btn-secondary btn-default">목록으로</a></div>
		<c:forEach var="vo" items="${list }">
	<div class="col-lg-4">
			<div class="card card-default">
				<div class="card-body">
					<div class="card-header card-header-border-bottom">
						<h2 id="title${vo.boardCode1 }">${vo.boardname }</h2>
						<span id="successSpan${vo.boardCode1 }"></span>
					</div>
					<form name="frmBoardEdit" > 
					<!-- 수정처리를 위한 boardCode  -->
					<input type="hidden" name="boardCode1" value="${vo.boardCode1 }">
					
						<div class="card-body">
							<div class="form-row">
								<div class="col-md-12 mb-3">
									<label for="validationServer01">이름</label> 
									<input type="text" id="boardName${vo.boardCode1 }" class="form-control is-valid infoBox"
										id="validationServer01" placeholder="title" name="boardname"
										value="${vo.boardname }">
									<!--class="form-control is-invalid"	 초록색-->
									<!-- <div class="valid-feedback">유효성 검사</div> -->
									<div class="invalid-feedback">이름을 입력하세요</div>
								</div>
								<div class="col-md-12 mb-3">
									<div class="form-row">
										<label for="boardKind">게시판 종류</label> 
										<select	class="form-control" id="boardKind${vo.boardCode1 }" name="typeCode" >
											<option value="">선택하세요</option>
											<!-- boardKind 태이블 조회에서 뿌리기 -->
											<c:forEach var="bkVO" items="${BKList }">
												<option value="${bkVO.typeCode }"
													<c:if test="${vo.typeCode== bkVO.typeCode}">
												selected="selected"
											</c:if>>${bkVO.type}</option>
											</c:forEach>
										</select>

										<!-- input 태그 스위치 스타일 -->
										<label class="control control-checkbox checkbox-primary">
										댓글사용 여부
											 <input type="checkbox" name="commentage" id="commentage${vo.boardCode1 }"
											<c:if test="${vo.commentage=='Y' }">
												checked="checked"
											</c:if> />
											<div class="control-indicator"></div>&nbsp;
										</label>
										 <label class="control control-checkbox checkbox-primary">
										 업로드 가능 여부 
											<input type="checkbox" name="upage" class="uploadCheck" id="uploadCheck${vo.boardCode1 }"
											<c:if test="${vo.upage=='Y' }">
												checked="checked"
											</c:if> /> 
											<div class="control-indicator"></div>
										</label>
									</div>
								</div>
							</div>
							<div>
								<div class="uploadCK">
									<div class="row">
										<div class="col-md-6 mb-3">
											<label for="fileCount">파일 수</label>
											 <input type="text"	class="form-control is-invalid infoBox" id="upnumage${vo.boardCode1 }"
												placeholder="State" name="upnumage"
												<c:if test="${vo.upage=='Y' }">
											value="${vo.upnumage }"
										</c:if>>
											<div class="invalid-feedback">값을 입력하세요</div>
										</div>
										<div class="col-md-6 mb-3">
											<label for="filesize">파일 크기</label> 
											<input id="filesize" type="text" class="form-control is-invalid infoBox"
												placeholder="State" name="upsizeage" id="upsizeage${vo.boardCode1 }"
												<c:if test="${vo.upage=='Y' }">
											value="${vo.upnumage }"
										</c:if>>
											<div class="invalid-feedback">값을 입력하세요</div>
										</div>
									</div>
								</div>
							</div>
							<!-- <div class="col-md-3 mb-3">
							<label for="validationServer05">Zip</label> <input type="text"
								class="form-control is-invalid" id="validationServer05"
								placeholder="Zip" required>
							<div class="invalid-feedback">Please provide a valid zip.</div>
						</div> -->
					</div>

				
					<div class="col-md-6 mb-3">
						<div class="contact-info pt-4">
							<h5 class="text-dark mb-1">게시판 관련 정보</h5>
							<span class="text-dark font-weight-medium pt-4 mb-2">등록인</span> <span>${vo.firAdmin}</span><br>
							<span class="text-dark font-weight-medium pt-4 mb-2">등록일</span> <span><fmt:formatDate value="${vo.boardregdate1 }" pattern="yyyy-MM--dd"/></span><br> <span
								class="text-dark font-weight-medium pt-4 mb-2">수정인</span> <span id="lastAdmin${vo.boardCode1 }"></span><br> <span
								class="text-dark font-weight-medium pt-4 mb-2">수정일</span> <span id="boardupdate${vo.boardCode1 }"></span><br>
						</div>
					</div>
					<input type="submit" class="btn btn-secondary btn-default" name="btBoardEdit" value="수정">
				</form>
	</div>
	</div>
	
	</div>
		</c:forEach>
</div>


<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>