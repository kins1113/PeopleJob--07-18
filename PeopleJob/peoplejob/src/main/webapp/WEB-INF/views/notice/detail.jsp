<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>
<style type="text/css">
.divList {
    width: 900px;
    margin: 0 auto;
    padding: 10px;
}
</style>
<div class="divList" style="min-height: 630px">

	<div class="content">
		<div class="row">
			<div class="col-lg-12">
				<div class="card card-default">
					<div class="card-body">
					<h2>${vo.notifytitle}</h2>
<hr>



			<div>
			<span>작성자</span> <span>${vo.adminCode}</span>
			<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
			<span>조회수</span> <span>${vo.readcount}</span>
			<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
			<span>등록일</span> <span><fmt:formatDate value="${vo.notifydate}"
							pattern="yyyy-MM-dd" /></span>
			</div>


		
		<div class="lastDiv">			
			<p class="content">
				<% pageContext.setAttribute("newLine", "\r\n"); %>
				${fn:replace(vo.notifycontent, newLine,'<br>')}
			</p>
		</div>
			<button class="btn btn-primary btn-default" onclick="location.href='list.do' ">목록</button>
		

		</div>
		</div></div></div></div></div>

<%@include file="../main/inc/bottom.jsp" %>