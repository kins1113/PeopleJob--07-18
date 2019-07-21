<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp"%>
<style type="text/css">

.text_header{ 
	font-family: "Nanum Gothic";
    display: inline-block;
    width: 32%;
}

.box1 {
	width: 60%;
	border: 1px solid lightgray;
	margin: 0 auto;
	padding: 10px;
	background: white;
}
p {
	margin-left: 17px;
	font-size:2em;
	display: inline-block;
	margin-right:5px;
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
		 var str=$(obj).val();
		 var te=str.replace(/(\s*)/g,"")
		$('p.trimlength').text(te.length);   
		
	}
	
	function trimbytes(obj){
		var text = $(obj).val();
		var te=text.replace(/(\s*)/g,"");
		
		$('p.trimbytes').text(getTextLength(te));
	}
	
</script>


<div style="min-height: 640px; padding: 30px;background: #f5f6f8;">
	<div class="box1">
		<h1>글자수 세기</h1><br>
		1. 입력칸에 자기소개서 내용을 작성하시거나 붙여넣은 후 글자수에 맞게 내용을 편집하세요.<br> 2. 입력하신
		내용은 저장되지 않으니 PEOPLEJOB 이력서로 등록하시거나 따로 저장해두세요. <br>
		
		<div class="text_header">
		공백 포함
		<p class="length" style="color: orangered;">0</p>자
		<p class="bytes">0</p>byte
		</div>
		
		<div class="text_header">
		공백 제외
		<p class="trimlength" style="color: orangered;">0</p>자
		<p class="trimbytes" style="color:#484848;">0</p>byte
		</div>
		
		<textarea name="content" id="character_counter_content" class="content" cols="90"
			rows="25" class="checker_input" placeholder="내용을 입력해주세요."
			style="margin-top: 10px; border: 1px solid lightgray; font-size:1.2em;">
</textarea>
	</div>
</div>

<%@include file="../main/inc/bottom.jsp"%>