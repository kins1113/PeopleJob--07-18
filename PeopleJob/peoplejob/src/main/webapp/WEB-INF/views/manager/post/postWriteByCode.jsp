<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>
<style>
	#divBoardName{width: 200px; float: left;}
	#divBoardInfo{width: 300px; float: left;}
	#divTitle{clear: left;}
	#divBoardInfo span{width: 70px;}
	#divBoardInfo{background: #f2f4f7;padding: 5px;}
	div#cardBoduPostList { padding-top: 0;}
	div#comboPost {background: #f2f4f7; height: 105px;margin-top: 3px;padding: 5px;}
</style>
<c:set var="upage" value="N" />
<script type="text/javascript">
	$(function(){
		//번호를 가지고 지금 들어온 
		var boardCode=${param.boardCode}
		var divEl=$("<div></div>");
		$.ajax({
			url:"<c:url value='/manager/post/getBoardInfoByBoardCode.do'/>",
			type:"post",
			data:"boardCode="+boardCode,
			success:function(res){
				divEl.append("<h3>"+res.boardname+" 게시판 정보</h3><br>");
				divEl.append("<span>댓 글  여부 : </span>").append("<span>"+res.commentage+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>");
				divEl.append("<span>업로드 여부 : </span>").append("<span>"+res.upage+"</span><br>");
				divEl.append("<span>업로드 사이즈 : </span>").append("<span>"+res.upsizeage+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>");
				divEl.append("<span>업로드 갯수 : </span>").append("<span>"+res.upnumage+"</span>");
				
				$("#comboPost").html(divEl);
				if(res.upage=="가능"){
					$("#postInfo").html("");
					for(var i=0;i<res.upnumage;i++){
						$("#postInfo").append("<input type='file' name='file'><br>");
					}
				}else{
					$("#postInfo").html("");
				}
			},
			error:function(xhr, status, error){
				alert(status+" : "+error);
			}
		});
		
	//등록하기
	$("#postWriteForm").submit(function(){
		$("input[name=boardCode]").val(boardCode2);
		
	})

});
</script>

<div class="row">
	<div class="col-lg-12">
		<div class="card card-default">
			<div class="card-header card-header-border-bottom">
				<h2>게시글 추가</h2>
			</div>
			<!-- 해더 부분 버튼 그룹 끝 -->
			<form name="postWriteForm" id="postWriteForm" enctype="multipart/form-data" 
					method="post" action="<c:url value='/manager/post/postWrite.do'/>">
			<!-- 게시판 정보를 넘기기위한 hidden -->
			<input type="hidden" name="boardCode" value="${param.boardCode }">
			<input type="hidden" name="adminCode" value='${sessionScope.adminCode }'>
					
			<div class="card-body" id="cardBoduPostList">
				<div class="form-group" id="comboPost">

				</div>
				<div class="form-group" id="divTitle">
					<label for="boardtitle">게시글 제목</label> 
					<input type="text" name="boardtitle" id="boardtitle" class="form-control"  placeholder="게시글 제목"> 
					<span class="mt-2 d-block">입력하세요.</span>
				</div>
					<div class="form-group" >
					<label>게시글 내용</label>
						<c:import url="/manager/smarteditorTestjsp.do">
							<c:param name="name" value="boardcontent"></c:param>
						</c:import>
					<div id="postInfo">
					<!-- input type=file 이 들어올 위치 -->
					</div>
					</div>
				<div>
					<input type="submit" class="btn btn-primary btn-default" value="등록">
					<input type="reset" class="btn btn-secondary btn-default" value="취소">
					<a id="btpopupList" href="<c:url value='/manager/popup/popupList.do'/>"
						class="mb-1 btn btn-outline-success">목록으로</a> 
				</div>

		</div>
		</form>
	</div>
</div>
</div>

<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>