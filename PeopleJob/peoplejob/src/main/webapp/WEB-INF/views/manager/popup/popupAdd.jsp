<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>


<script type="text/javascript">
$(function(){

	$("#btpopAdd").click(function(){
		//현제 날짜 세팅
		var today=new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var endMM=today.getMonth()+2;
		var yyyy = today.getFullYear();
		if(dd<10) {
		    dd='0'+dd
		} 
		if(mm<10) {
		    mm='0'+mm
		} 
		if(endMM<10) {
			endMM='0'+endMM
		} 
		today = yyyy+'-' + mm+'-'+dd;
		endDay=yyyy+'-'+endMM+'-'+dd;
		//var st_date = new Date().toISOString().substr(0, 10).replace('T', ' ');
		//alert(st_date);
		
		if($("input[name=adminCode]").val()==""){$("input[name=adminCode]").val(0)}
		if($("input[name=width]").val()==""){$("input[name=width]").val(400)}
		if($("input[name=height]").val()==""){$("input[name=height]").val(500)}
		if($("input[name=left]").val()==""){$("input[name=left]").val(0)}
		if($("input[name=top]").val()==""){$("input[name=top]").val(0)}
		if($("input[name=popupCode]").val()==""){$("input[name=popupCode]").val(0)}
		if($("input[name=startDay]").val()==""){$("input[name=startDay]").val(today)}
		if($("input[name=endDay]").val()==""){$("input[name=endDay]").val(endDay)}
		
		$("form[name=popUpAdd]").attr("action","<c:url value='/manager/popup/popupAdd.do'/>");
		$("form[name=popUpAdd]").submit();
	});
	//수정 처리
	$("#btpopEdit").click(function(){
		
		if($("input[name=adminCode]").val()==""){$("input[name=adminCode]").val(0)}
		if($("input[name=width]").val()==""){$("input[name=width]").val(400)}
		if($("input[name=height]").val()==""){$("input[name=height]").val(500)}
		if($("input[name=left]").val()==""){$("input[name=left]").val(0)}
		if($("input[name=top]").val()==""){$("input[name=top]").val(0)}
		if($("input[name=startDay]").val()==""){$("input[name=startDay]").val(today)}
		if($("input[name=endDay]").val()==""){$("input[name=endDay]").val(endDay)}
		
		$("form[name=popUpAdd]").attr("action","<c:url value='/manager/popup/popupEdit.do'/>");
		$("form[name=popUpAdd]").submit();
	});
	
	
	/*  var form = $('#popupAdd').serialize();
    var formData = new FormData();
    formData.append("fileObj", $("#popupImg")[0].files[0]); */
    /* 
    var form = new FormData($("#popupAdd")[0]);
		alert(form);
		event.preventDefault();
		$.ajax({
			url:"<c:url value='/manager/popup/popupAdd.do'/>",
			type:"post",
			enctype: 'multipart/form-data', 
			data:form
			,dataType:"json",
		    contentType: false,
		    processData: false,
			success:function(res){
				alert(res);
			},
			error:function(xhr,status, error){
				alert(status+" : "+error);
			}
				
		});//ajax */
});
</script>

<div class="row">
	<div class="col-lg-12">
		<div class="card card-default">
			<div class="card-header card-header-border-bottom">
				<h2>
					<c:if test="${empty popupVo}">
						팝업 관리
					</c:if>
					<c:if test="${!empty popupVo}">
						팝업 수정
					</c:if>
				</h2>
			</div>
			<form name="popUpAdd" id="popUpAdd" method="post"
				enctype="multipart/form-data">
				<!-- 400에러를 막기위한 값 -->
				<input type="hidden" name="adminCode" value="${popupVo.adminCode}"> 
				<input type="hidden" name="popupCode"value="${popupVo.popupCode}"> 
				<!--    -->
				<!-- body -->
				<div class="modal-body">
				<p class="mb-5">기본 사이즈는  가로 400px, 세로 500px, left 0, top 0입니다. <br>
								기본 날짜는 등록일부터 1달입니다.<br>
				<a href="#" target="_blank">새창 여는 아직 미정</a>
				</p>
					<div class="row">
						<div class="col-lg-12">
							<table class="table" id="modalTable">
								<tbody>
									<tr>
										<th scope="col" align="abscenter">팝업 제목</th>
										<td scope="row">
											<input type="text" style="height: 20px;"
												name="popupName" class="form-control"
												placeholder="Popup Title"
											<c:if test="${!empty popupVo}">
												value="${popupVo.popupName }"
											</c:if>>
										</td>
									</tr>
									<tr>
										<th scope="col">출력 여부</th>
										<td scope="row">
										<label for="usageOn">출력 </label> 
											<input type="radio" name="usage" id="usageOn" value="Y" 
												<c:if test="${popupVo.usage=='Y'}">
													checked="checked"
												</c:if>
											 /> 
											<label for="usageOut">미출력 </label> 
											<input type="radio" name="usage" id="usageOut" value="N"
												<c:if test="${popupVo.usage=='N'}">
													checked="checked"
												</c:if>
													<c:if test="${empty popupVo}">
														checked="checked" 
													</c:if>
											 />
										</td>
									</tr>
									<tr>
										<th scope="col">팝업 크기</th>
										<td scope="row"><span class="spanSize1"> 가로</span> 
											<input type="text" class="form-control size" name="width"
												<c:if test="${!empty popupVo}">
													value="${popupVo.width}"
												</c:if>
											>
											<span class="spanSize2">px, 세로 </span> 
											<input type="text" class="form-control size" name="height"
												<c:if test="${!empty popupVo}">
													value="${popupVo.height}"
												</c:if>
											> 
											<span class="infoSpan">px 운영체제에 따라 실제 출력크기와 다를 수 있음 </span></td>
									</tr>
									<tr>
										<th scope="col">팝업 위치</th>
										<td scope="row">
											<span class="spanSize1">좌측 </span>
											<input type="text" class="form-control size" name="left"
												<c:if test="${!empty popupVo}">
													value="${popupVo.left}"
												</c:if>
											> 
											<span class="spanSize2">px, 상단 </span> 
											<input type="text" class="form-control size" name="top"
												<c:if test="${!empty popupVo}">
													value="${popupVo.top}"
												</c:if>
											> 
											<span class="infoSpan">px 새창 사용시 브라우저의 좌측상단 끝이 0,0 이며, 레이어
												사용시 웹페이지 내용부터 계산</span></td>
									</tr>
									<tr>
										<th scope="col">출력기간</th>
										<td scope="row">
											<c:import url="/inc/date.do">
												<c:param name="name" value="startDay"></c:param>
												<c:param name="id" value="workdate1"></c:param>
													<c:param name="val"
														 value="${popupVo.startDay }"
													/>
											</c:import> <span class="spanSize1">&nbsp;&nbsp;~</span> 
											<c:import url="/inc/date.do">
												<c:param name="name" value="endDay"></c:param>
												<c:param name="id" value="workdate2"></c:param>
													<c:param name="val" 
														value="${popupVo.endDay }"
													/>
											</c:import></td>
									</tr>
									<tr>
										<th scope="col">내용</th>
										<td><input type="file" id="popupImg" name="file">
												<c:if test="${!empty popupVo && popupVo.popupImg != null}">
													<span  style="color:#9f69ff;">수정 할 경우 ${popupVo.popupImg}는 삭제 됩니다.</span>
												</c:if>
										</td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
				</div>
				<!-- Footer -->
				<div class="modal-footer" align="center">
					<c:if test="${!empty popupVo}">
						<input type="button" id="btpopEdit" class="mb-1 btn btn-outline-success" value='수정하기'>
					</c:if>
					<c:if test="${empty popupVo}">
						<input type="button" id="btpopAdd" class="mb-1 btn btn-outline-success" value='등록하기'>
					</c:if>
						<a id="btpopupList" href="<c:url value='/manager/popup/popupList.do'/>"
						class="mb-1 btn btn-outline-success">목록으로</a>
				</div>
			</form>
		</div>
	</div>
</div>




<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>