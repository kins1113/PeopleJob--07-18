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
<script>
	$(document).ready(function(){
		$("#del").click(function(){
			if(confirm("삭제하시겠습니까?(답변이 달린 글은 삭제 불가)")){
				location.href="<c:url value='/custext/custextDel.do?custextCode=${vo.custextCode }'/>";
			}else{
				event.preventDefault();
			}
		});
		$("#edit").click(function(){
			if(confirm("수정하시겠습니까?")){
				location.href="<c:url value='/custext/editanswer_ck.do?custextCode=${vo.custextCode }'/>";
			}else{
				event.preventDefault();
			}
		});
	});
</script>
<div class="divList" style="min-height: 600px">

	<div class="content">
		<div class="row">
			<div class="col-lg-12">
				<div class="card card-default"> 
					<div class="card-body" style="min-height: 300px">
					<h2>${vo.custitle}</h2>
		<hr> 
				<div> 
				<p style="float:right;"><span>등록일</span>
				<span><fmt:formatDate value="${vo.cusRegdate}" pattern="yyyy-MM-dd" /></span></p> 
				</div>
				<br><br>
				 <label for="custextcategory">카테고리</label>
              <select id="custextcategory" name="custextcategory" disabled="true">
              	<option value="기업문의"
              	<c:if test="${vo.custextcategory=='개인문의' }">
              	selected
              	</c:if>
              	>개인문의</option>
              	<option value="기업문의"
              	<c:if test="${vo.custextcategory=='기업문의' }">
              	selected
              	</c:if>
              	>기업문의</option>
              	<option value="후원문의"
              	<c:if test="${vo.custextcategory=='후원문의' }">
              	selected
              	</c:if>
              	>후원문의</option>
              </select>
			<div class="lastDiv">			
						<p class="content">
							<% pageContext.setAttribute("newLine", "\r\n"); %>
							${fn:replace(vo.cuscontent, newLine,'<br>')}
						</p>
			</div> 
			
			</div>
			
		</div></div>
		
		</div> 
		</div>
		<c:if test="${vo.answerRegdate!=null}">
		<div class="col-lg-12">
		<div class="card card-default"> 
					<div class="card-body" style="min-height: 200px;">
					<h2>답변내용</h2>
				<hr> 
				<div> 
				<p style="float:right;"><span>답변일</span>
				<span><fmt:formatDate value="${vo.answerRegdate}" pattern="yyyy-MM-dd" /></span></p> 
				</div>
				<br><br>
			<div class="lastDiv">			
						<p class="content">
							<% pageContext.setAttribute("newLine", "\r\n"); %>
							${fn:replace(vo.answercontent, newLine,'<br>')}
						</p>
			</div> 

				</div>
		</div>
		</div>
		</c:if>
		<div style="float:right;"> 
		<button class="btn btn-primary btn-default" id="edit"name="edit">수정</button>
		<button class="btn btn-primary btn-default" id="del"name="del">삭제</button>
		<button class="btn btn-primary btn-default" onclick="location.href='<c:url value='/custext/mycustext.do'/>' ">목록</button>
		</div>
		</div>

<%@include file="../main/inc/bottom.jsp" %>