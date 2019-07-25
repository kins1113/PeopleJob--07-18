<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>
<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmSearch.currentPage.value=curPage;
		document.frmSearch.submit();
	} 
	function cancel(){
		self.close();
	}
	$(document).ready(function(){ 
		$("#choice").click(function(){
			if($("input[name=resumeCode]").is(':checked')){   
				/* var test1=$("input[name=resumeCode]").prop(':checked').val(); */
				/* var test1=$("input[name=resumeCode]").attr('checked',true).val();  */ 
				var test1 = $(":input:radio[name=resumeCode]:checked").val();

				if(confirm("해당이력서로 지원하시겠습니까?")){  
					opener.location.href="<c:url value='/apply/insertapply.do?jobopening="+${param.jobopening}+
							"&resumeCode="+test1+"'/>";
					self.close();
				}else{
					event.preventDefault();
				}
			}else{ 
				alert("이력서를 선택해주세요");
			}
		});
	}); 
	
</script>
<style type="text/css">
.divList {
    width: 900px;
    margin: 0 auto;
    padding: 10px;
    background: white;
}
#divlist {
    background: #f2f4f7;
}
button.btn.btn-success {
    float: right;
}
</style>
<div id="divlist">
<div class="divList" style="min-height: 630px"> 
	  <input type="hidden" name="resumeCode" value="${param.resumeCode }"/>
	  <input type="hidden" name="jobopening" value="${param.jobopening }"/>
	  <input type="hidden" name="resumeCode" value="${param.jobopening }"/>
<table class="table"
	 	summary="이력서 현황에 관한 표로써, 이력서제목, 이력서 공개 설정, 내 이력서 열람 기업에 대한 정보를 제공합니다.">
	<h3>이력서리스트</h3>
	
	<input type="button" class="btn btn-success" id="choice" name="choice" value="선택">
	<input type="button" class="btn btn-success" id="cancel" value="취소" onclick="cancel();">
	    <c:if test="${!empty list }">
	    <th scope="col"> 체크</th>
	    <th scope="col"> 이력서제목</th>
	    <th scope="col">이력서 공개 설정</th>
	    <th scope="col">내 이력서 열람 기업</th>
	    <th scope="col">등록일</th>
		<c:forEach var="vo" items="${list }">					
	    
	  <!-- 반복문 시작  -->	  	
			
					<tr>
					<!-- 제목이 긴 경우 30글자만 보여주기 -->
					<td><input type="radio" name="resumeCode" id="resumeCode" value="${vo.resumeCode }"></td>
					<td>
					<a href="<c:url value='/resume/resumedetail.do?resumeCode=${vo.resumeCode}'/>">
					<c:if test="${fn:length(vo.resumeTitle) >=30 }">
						${fn:substring(vo.resumeTitle, 0,30)}...
					</c:if>
					<c:if test="${fn:length(vo.resumeTitle) <30 }">					
						${vo.resumeTitle}
					</c:if>
					</a></td>
		
	    <td>${vo.opencheck}</td>
	   	
	    <td>${vo.opencheck}</td><!--일단 멤버 네임으로  -->
	    
	    
	    <td><fmt:formatDate value="${vo.resumeRegdate}" pattern="yyyy-MM-dd"/>
				</td>
				</tr>
	    	</c:forEach>
	</c:if>
	   

  <!--반복처리 끝  -->	
	<tbody> 
	<c:if test="${empty list }">	 
	 	<tr>
	 		<td colspan="5" class="align_center">데이터가 존재하지 않습니다.</td>
	 	</tr>
	</c:if> 	
	  </tbody>
</table>	   
</div>
</div>
<div class="divPage">
	<!-- 이전블럭으로 이동하기 -->
	<c:if test="${pagingInfo.firstPage>1 }">	
		<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
			<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전블럭으로 이동">
		</a>	
	</c:if>
	<!-- 페이지 번호 추가 -->
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
		<c:if test="${i==pagingInfo.currentPage }">
			<span style="color:blue;font-size: 1em">${i }</span>
		</c:if>
		<c:if test="${i!=pagingInfo.currentPage }">
			<a href="#" onclick="pageFunc(${i})">[${i}]</a>
		</c:if>
	</c:forEach>
	<!--  페이지 번호 끝 -->
	
	<!-- 다음 블럭으로 이동하기 -->
	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">	
		<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
			<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음블럭으로 이동">
		</a>
	</c:if>
</div>
<div class="divSearch">
	<!-- 페이징 처리에도 사용 -->
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/resume/list.do"/>'>
   		<!-- 현재 페이지 hidden에 넣기 -->
   		<input  type="hidden" name='currentPage' value="1">
        
    </form>
</div>


<%@include file="../main/inc/bottom.jsp" %>

