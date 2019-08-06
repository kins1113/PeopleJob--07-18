<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>
<script>
	function pageFunc(curPage){
		document.frmSearch.currentPage.value=curPage;
		document.frmSearch.submit();
	}
	$(document).ready(function(){
		$("#where").hide();
		$("#search").click(function(){
			$("#where").toggle();
		}); 
		$("#wheresubmit").click(function(){
			$("#where").hide();
			/* $("#hi").val($("#localcheck").val());
			$("#hi2").val($("#workway").val());
			$("#hi3").val($("#payway").val());
			$("#hi4").val($("#academicCondition").val()); */
		}); 
		$("#del").click(function(){
			var cnt=0;
			if(confirm("삭제하시겠습니까?")){
				$("input[name=applyCode1]").each(function(){
					if($(this).is(':checked')==true){
						cnt=1;
					}
				})
				if(cnt==0){
					alert("삭제할 공고를 체크해주세요.");
					event.preventDefault();
					return false;
				}else{
					location.href="<c:url value='/apply/apply_del.do?applyCode='/>"+$('#applyCode').val();
				}
			}
		});
	});
	function s_it()
	{
	  var total_str = "";
	  var obj = document.getElementsByName("applyCode1");

	  for (i=0; i < obj.length; i++)
	  {
	    if (obj[i].checked == true)
	    {
	      total_str += (total_str != "") ? "," + obj[i].value : obj[i].value;
	    }
	  }
	  document.getElementById("applyCode").value = total_str;
	}
</script>
<style type="text/css">
.divList {
    width: 900px;
    margin: 0 auto;
    padding: 10px;
    background: #cccccc;
}
</style>
<article>
	<fieldset>
    
<div class="divList" style="min-height: 630px">
        <div class="page-header">
            <h3>지원현황</h3>
       
       <!--  지역<input type="text" name="hi" id="hi">
        근무방식<input type="text" name="hi2" id="hi2">
       	급여방식<input type="text" name="hi3" id="hi3">
       	 학력<input type="text" name="hi4" id="hi4"> -->
	 </div> 
<div class="divSearch"> 
	<!-- 페이징 처리에도 사용 -->
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/apply/apply_list.do"/>'>
   		<!-- 현재 페이지 hidden에 넣기 -->  
   		<input type="hidden" name='currentPage' value="1" >
<%-- 		<div id="where">
		<%@include file="jobopening_where.jsp" %>
			<c:import url="jobopening_where.jsp"/>
		</div>
		--%> 
    </form>
         </div>
         <table class="table"
	 	summary="이력서 현황에 관한 표로써, 이력서제목, 이력서 공개 설정, 내 이력서 열람 기업에 대한 정보를 제공합니다.">
	   
	    <th scope="col"> 체크</th>
	    <th scope="col">공고명</th>
	    <th scope="col">열람상태</th>
	    <th scope="col">지원일</th>
	    <th scope="col">회사이름</th>
	    <th scope="col">이력서</th>
	    <tbody> 
	    <c:if test="${empty list }">	 
	 	<tr>
	 		<td colspan="6" class="align_center">데이터가 존재하지 않습니다.</td>
	 	</tr>
		</c:if> 
		 <c:if test="${!empty list }">
		<c:forEach var="vo" items="${list }">					
	  <!-- 반복문 시작  -->	  	
					<tr>
					<!-- 제목이 긴 경우 30글자만 보여주기 -->
					<td><input type="checkbox" name="applyCode1" id="applyCode1"value="${vo.applyCode }" onclick="javascript_:s_it()"></td>
					<td>
					<a href="<c:url value='/company/jobopening_view.do?jobopening=${vo.jobopening}'/>">
					<c:set var="loop_flag2" value="false" />
					<c:forEach var="jvo" items="${list4 }">
	                 <c:if test="${not loop_flag2 }"> 
				        <c:if test="${jvo.jobopening==vo.jobopening}">
			                ${jvo.jobtitle }
				            <c:set var="loop_flag2" value="true" />
				        </c:if>
				    </c:if> 
				    </c:forEach>
					</a></td>
	    			<td>
	    			<c:if test="${vo.opencheck=='Y'}">
	    			읽음 
	    			</c:if>
	    			<c:if test="${vo.opencheck=='N'}">
	    			안읽음
	    			</c:if>
	    			
	    			</td>
	   				<td><fmt:formatDate value="${vo.applydate}" pattern="yyyy-MM-dd"/></td>
	    			<td> 
	           		<c:set var="loop_flag" value="false" /> 
					<c:forEach var="mvo" items="${list4 }">
				        <c:if test="${vo.jobopening==mvo.jobopening}">
					             <c:forEach var="cvo" items="${list5 }">
				                	<c:if test="${not loop_flag }">
					               		<c:if test="${mvo.companyCode==cvo.companyCode }">
					               			${cvo.companyname }
								            <c:set var="loop_flag" value="true" />
					               		</c:if>
					        		</c:if>
					               </c:forEach>
					    </c:if>
				    </c:forEach>
					</td>
					<td><a href="<c:url value='/resume/resumedetail.do?resumeCode=${vo.resumeCode }'/>"><input type="button" id="detail" class="btn btn-primary" name="detail" value="자세히보기"></a></td>
				</tr>
	    	</c:forEach>
	</c:if>
  <!--반복처리 끝  -->	
	
	  </tbody>
</table>	

        <div class="pull-left">
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
			<a href="#" onclick="pageFunc(${i})">
				[${i}]</a>
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
	<input type="hidden" name="applyCode" id="applyCode"> 
	<div class="pull-right">
      <input type="button" id="del" name="del" class="btn btn-primary" role="button" value="삭제하기">
       <a href="<c:url value='/company/jobopening_list.do'/>" class="btn btn-primary" role="button">채용정보로 돌아가기</a>
      </div>
        </div>
    </div>
    </fieldset>
    </article>
<%@include file="../main/inc/bottom.jsp" %>
