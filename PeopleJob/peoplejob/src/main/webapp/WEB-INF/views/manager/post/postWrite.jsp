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
	div#comboPost {background: #f2f4f7; height: 60px;margin-top: 3px;}
</style>
<c:set var="upage" value="N" />
<script type="text/javascript">
	$(function(){
		
		//게시판 이름을 select에 담아서 콤보 박스로
		$.ajax({
			url:"<c:url value='/manager/board/getBoardList.do'/>",
			type:"post",
			dataType:"json",
			success:function(res){
				var divBoardName=$("<div id='divBoardName'></div>")
				var selectEl=$("<select class='custom-select my-1 mr-sm-2' id='selectBN' onchange='$.selectBN()'></select>")
					selectEl.html("<option value=''>선택하세요</option>")
				$.each(res , function(idx, val) {
					selectEl.append("<option value='"+val.boardCode1+"'>"+val.boardname+"</option>")
					divBoardName.append(selectEl);
				});
				$("#comboPost").append(divBoardName);
			},
			error:function(xhr,status, error){
				alert(status+" : "+error);
			}
			
		});

		//게시판 선택시 이벤트
		var divEl=$("<div id='divBoardInfo'></div>");
		var boardCode2;
		$.selectBN=function(){
			var boardCode=$("#selectBN option:selected").val();
			if(boardCode!=''){
				boardCode2=boardCode;
				$.ajax({
					url:"<c:url value='/manager/board/boardInfo.do'/>",
					type:"post",
					dataType:"json",
					data:"boardCode="+boardCode,
					success:function(res){
						divEl.html("<span>댓 글  여부 : </span>").append("<span>"+res.commentage+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>");
						divEl.append("<span>업로드 여부 : </span>").append("<span>"+res.upage+"</span><br>");
						divEl.append("<span>업로드 사이즈 : </span>").append("<span>"+res.upsizeage+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>");
						divEl.append("<span>업로드 갯수 : </span>").append("<span>"+res.upnumage+"</span>");
						
						if(res.upage=="가능"){
							$("#postInfo").html("");
							for(var i=0;i<res.upnumage;i++){
								$("#postInfo").append("<input type='file' name='file'><br>");
							}
						}else{
							$("#postInfo").html("");
						}
						
						
						$("#comboPost").append(divEl);
					},
					error:function(xhr,status,error){
						alert(status+":"+error);
					}
				});
			}else{
				divEl.html("<span align='absmiddle'>선택하세요</span>");
			}//if
		};
		
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
			<input type="hidden" name="boardCode" >
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