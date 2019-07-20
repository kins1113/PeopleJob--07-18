<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp"%>
<style type="text/css">
.wrap_checker .checker_input, .wrap_checker .checker_preview {
	display: block;
	overflow-y: scroll;
	width: 100%;
	height: 401px;
	color: #444;
	font-size: 14px;
	letter-spacing: -1px;
	line-height: 22px;
	word-break: break-all;
	resize: none;
}

.box1 {
	width: 60%;
	border: 1px solid lightgray;
	margin: 0 auto;
	padding: 10px;
}
p {
	margin-left: 17px;
	font-size:2em;
	display: inline-block;
	margin-right:5px;
}
.text_header {
    width: 100%;
    height: 81px;
    overflow: hidden;
    border-bottom: 2px solid #333;
    font-family: "Nanum Gothic";
}
</style>
<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		
	});


</script>


<div style="min-height: 640px; padding: 30px;">
	<div class="box1">
		<h1>맞춤법 검사</h1>
		1. 입력칸에 자기소개서 내용을 작성하시거나 붙여넣은 후 글자수에 맞게 내용을 편집하세요 <br>
		2. 입력하신 내용은 저장되지 않으니 PEOPLEJOB 이력서로 등록하시거나 따로 저장해두세요.<br>
		3. 맞춤법 검사를 실행하여 붉게 표시된 단어를 클릭하시면 맞춤법에 맞는 단어로 수정하실 수 있습니다.
		
		
		<textarea name="content" id="character_counter_content" class="content" cols="100"
			rows="25" class="checker_input" placeholder="내용을 입력해주세요."
			style="margin-top: 10px; border: 1px solid lightgray;">
</textarea>
	</div>
</div>

<%@include file="../main/inc/bottom.jsp"%>