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
<article>
	<fieldset>
    <div class="col-md-9">
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
   		action='<c:url value="/apply/Capply_list.do"/>'>
   		<!-- 현재 페이지 hidden에 넣기 -->  
   		<input type="button" id="search" class="btn btn-primary" name="search" value="검색조건"> 
   		<input type="hidden" name='currentPage' value="1" >
		<input type="submit" class="btn btn-primary" value="검색">
<%-- 		<div id="where">
		<%@include file="jobopening_where.jsp" %>
			<c:import url="jobopening_where.jsp"/>
		</div>
		--%> 
    </form>
         </div>

        <div>
        <c:if test="${empty list }">	 
	 	<tr>
	 		<td colspan="5" class="align_center">데이터가 존재하지 않습니다.</td>
	 	</tr>
		</c:if>
		<c:if test="${!empty list }">
			<c:forEach var="vo" items="${list }"> 
			<c:set var="loop_flag" value="false" /> 
			<input type="checkbox" name="applyCode1" id="applyCode1" value="${vo.applyCode }" onclick="javascript_:s_it()">
	        <div class="list-group"> 
	            <div class="list-group-item">
	                <p class="list-group-item-text">
	                <small>채용공고 : <a href="<c:url value='/company/jobopening_view.do?jobopening=${vo.jobopening}'/>">${vo.jobopening }</a></small>
	                | 	<small>지원일 : ${fn:substring(vo.applydate,0,10) }</small>
	                | <small>열람여부 : ${vo.oepncheck }</small>
	                | 	<small>지원번호 : ${vo.applyCode}</small>
	                <c:forEach var="mvo" items="${list3 }">
	                 <c:if test="${not loop_flag }">
				        <c:if test="${vo.memberCode==mvo.memberCode}">
			                | 	<small>지원자 : ${mvo.membername}</small>
			                <input type="button" id="detail" class="btn btn-primary" name="detail" value="자세히보기"> 
				            <c:set var="loop_flag" value="true" />
				        </c:if>
				    </c:if>
	                	
	                	 
	                </c:forEach>
	            </div> 
	        </div>
	        </c:forEach>
		</c:if>
		</div>
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
	<input type="text" name="applyCode" id="applyCode"> 
	<div class="pull-right">
      <input type="button" id="del" name="del" class="btn btn-primary" role="button" value="삭제하기">
       <a href="<c:url value='/company/jobopening_list.do'/>" class="btn btn-primary" role="button">채용정보로 돌아가기</a>
      </div>
        </div>
    </div>
    </fieldset>
    </article>
<%@include file="../main/inc/bottom.jsp" %>
