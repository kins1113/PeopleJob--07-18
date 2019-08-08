<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../main/inc/top.jsp"%>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<style type="text/css">
.body{
	border: 1px solid lightgray;
	width: 700px;
	height: 500px;
	margin: 0 auto;
	margin-top:100px;
}

.title{
	height:45px;
	border: 1px solid lightgray;
	margin-left: 20px;
}

.tbrow{
	display: block;
	margin-top:15px;
}

span{
	margin-left: 20px;
}

#divBoardName{width: 200px; float: left;}
	#divBoardInfo{width: 300px; float: left;}
	#divTitle{clear: left;}
	#divBoardInfo span{width: 70px;}
	#divBoardInfo{background: #f2f4f7;padding: 5px;}
	div#cardBoduPostList { padding-top: 0;}
	div#comboPost {background: #f2f4f7; height: 60px;margin-top: 3px;}
</style>
<script type="text/javascript" src=<c:url value='/resources/js/jquery-3.4.1.min.js'/>></script>
<script type="text/javascript">

$(function(){
	$("form[name=postEditForm]").submit(function(){
		$('input[name=file]').each(function(){
			if($(this).val()!=''){
				$(this).parents(".oneclass").find("input[type=checkbox]").prop("checked",true);
			}
			
		});
		
	});
});
</script>
<div class="container" style="min-height: 629px;">
	
	
<div class="row">
	<div class="col-lg-12">
		<div class="card card-default">
			<div class="card-header card-header-border-bottom">
				<h2>${boardVo.boardname } 글 수정</h2>
			</div>
			<!-- 해더 부분 버튼 그룹 끝 -->
			<form name="postEditForm" id="postEditForm" enctype="multipart/form-data" 
					method="post" action="<c:url value='/board/boardEdit.do'/>">
			<!-- 게시판 정보를 넘기기위한 hidden -->
			<div class="card-body" id="cardBoduPostList">
				
				<div class="form-group" id="divTitle">
					<label for="boardtitle">게시글 제목</label> 
					<input type="text" name="boardtitle" id="boardtitle" class="form-control"  placeholder="게시글 제목" class="title" value="${postVo.boardtitle }"> 
					<input type="hidden" name="boardCode2" value="${postVo.boardCode2 }">
				</div>
					<div class="form-group" >
					<label>게시글 내용</label>
					
						<c:import url="/main/smarteditorTestjsp.do">
							<c:param name="name" value="boardcontent"></c:param>
							<c:param name="value" value="${postVo.boardcontent }"></c:param>
						</c:import> 
					<div id="postInfo">
				
				<!-- 첨부파일 있을 경우 -->
					  <div class="form-group">
					  <c:if test="${fn:length(uploadList)>0 }">
					  <c:forEach var="uploadVo" items="${uploadList }">
                <div class="oneclass">
                    <label >업로드할 파일 :</label> 
                    <input id="file" name="file" class="" type="file" value=""/>
	            <input type="checkbox" name="oldFileCode" value="${uploadVo.fileName}" readonly />
                </div>
	            <br>
	            <span class="sp1"></span>
		            <span style="color:green;font-weight: bold">
		            	※ 첨부파일을 새로 지정할 경우 기존 파일 ${uploadVo.originalFileName } (${uploadVo.fileSize/1000.0 }KB)은 삭제됩니다.
		            </span> 
	            </c:forEach>
            </c:if>
            </div>
            
            <c:if test="${boardVo.upage=='Y' }">
				<c:set var="i" value="1"/>
				<c:forEach begin="${fn:length(uploadList)-1 }" end="${boardVo.upnumage }">
					<div class="form-group" id="divTitle">
						<label for="boardtitle">업로드할 파일 :</label> 
						<input type="file" name="file" id="file" class="form-control"> 
						
					</div>
					<c:set var="i" value="${i+1 }" />
				</c:forEach>
			</c:if>
				
					</div>
					</div>
				<div>
					<input type="submit" class="btn btn-primary btn-default" value="수정">
					<input type="reset" class="btn btn-secondary btn-default" value="취소">
					<a id="" href="<c:url value='/board/boardByCategory.do?boardCode=${postVo.boardCode }'/>"
						class="mb-1 btn btn-outline-success">목록으로</a>
				</div>

		</div>
		</form>
	</div>
</div>
</div>
</div>
<%@include file="../main/inc/bottom.jsp"%>