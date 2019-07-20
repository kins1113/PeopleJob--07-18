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
		$('textarea.content').keyup(function() {
			bytesHandler(this);
			charlength(this);
			trimlength(this);
			trimbytes(this);
		});
	});

	function getTextLength(str) {
		var len = 0;

		for (var i = 0; i < str.length; i++) {
			if (escape(str.charAt(i)).length == 6) {
				len++;
			}
			len++;
		}
		return len;
	}

	function bytesHandler(obj) {
		var text = $(obj).val();
		$('p.bytes').text(getTextLength(text));
	}
	
	function charlength(obj){
		var text = $(obj).val();
		$('p.length').text(text.length);
		
	}
	

	function trimlength(obj){
		/* var text = $(obj).val();
		var trim=text.trim();
		$('p.trimlength').text(trim.length); */
	
		var text = $(obj).val();
		text.replace(/ /g, '');
		text.replace(/\n /g, '');
		$('p.trimlength').text(text.length); 
		
	}
	
	function trimbytes(str){
		var len = 0;
		var str2=str.val().trim();
		
		for (var i = 0; i < str2.length; i++) {
			if (escape(str2.charAt(i)).length == 6) {
				len++;
			}
			len++;
		}
		return len;
	}
	
</script>


<div style="min-height: 640px; padding: 30px;">
	<div class="box1">
		<h1>글자수 세기</h1>
		1. 입력칸에 자기소개서 내용을 작성하시거나 붙여넣은 후 글자수에 맞게 내용을 편집하세요.<br> 2. 입력하신
		내용은 저장되지 않으니 PEOPLEJOB 이력서로 등록하시거나 따로 저장해두세요. <br>
		
		<div class="text_header">
		공백 포함
		<p class="length">0</p>자
		<p class="bytes">0</p>bytes
		</div>
		
		<div class="text_header">
		공백 제외
		<p class="trimlength">0</p>자
		<p class="trimbytes">0</p>bytes
		</div>
		
		<textarea name="content" id="character_counter_content" class="content" cols="100"
			rows="25" class="checker_input" placeholder="내용을 입력해주세요."
			style="margin-top: 10px; border: 1px solid lightgray;">
</textarea>
	</div>
</div>

<%@include file="../main/inc/bottom.jsp"%>