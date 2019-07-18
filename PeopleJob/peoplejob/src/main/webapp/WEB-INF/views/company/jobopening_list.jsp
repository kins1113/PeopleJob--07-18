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
	});
</script>
<article>
	<fieldset>
    <div class="col-md-9">
        <div class="page-header">
            <h3>채용공고</h3>
       
       <!--  지역<input type="text" name="hi" id="hi">
        근무방식<input type="text" name="hi2" id="hi2">
       	급여방식<input type="text" name="hi3" id="hi3">
       	 학력<input type="text" name="hi4" id="hi4"> -->
        <c:if test="${!empty param.searchKeyword}">
			<p>
				검색어 : ${param.searchKeyword}, ${pagingInfo.totalRecord}건 검색되었습니다.
			</p>
		</c:if>
	 </div> 
<div class="divSearch"> 
	<!-- 페이징 처리에도 사용 -->
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/company/jobopening_list.do"/>'>
   		<!-- 현재 페이지 hidden에 넣기 -->  
   		<input type="button" id="search" class="btn btn-primary" name="search" value="검색조건"> 
   		<input type="hidden" name='currentPage' value="1" >
		<input type="submit" class="btn btn-primary" value="검색">
		<div id="where">
		<%-- <%@include file="jobopening_where.jsp" %> --%>
			<c:import url="jobopening_where.jsp"/>
		</div> 
        </div>
    </form>

        <div>
        <c:if test="${empty list }">	 
	 	<tr>
	 		<td colspan="5" class="align_center">데이터가 존재하지 않습니다.</td>
	 	</tr>
		</c:if>
		<c:if test="${!empty list }">
			<c:forEach var="vo" items="${list }"> 
			<c:set var="loop_flag" value="false" /> 
	        <div class="list-group"> 
	            <div class="list-group-item">
	                <h4 class="list-group-item-heading"><a href="<c:url value='/company/jobopening_upHit.do?jobopening=${vo.jobopening }'/>">공고제목:${vo.jobtitle }</a></h4>
	                <p class="list-group-item-text">
	                <c:forEach var="cvo" items="${clist }">
	                 <c:if test="${not loop_flag }">
				        <c:if test="${vo.companyCode==cvo.companyCode}">
			                ${cvo.companyname}
				            <c:set var="loop_flag" value="true" />
				        </c:if>
				    </c:if>
	                </c:forEach>
	                 | 지역:${vo.localcheck} | 기간 : ${fn:substring(vo.workdate,0,10) }~${fn:substring(vo.endDate,0,10)} 
	                | <small>등록일 : ${fn:substring(vo.jobregdate,0,10)}</small> 
	                | <small>근무방식 : ${vo.workway }</small>
	                | <small>급여방식 : ${vo.payway }</small>
	                | <small>조회수 : ${vo.hits }</small>
	                <span class="label label-info">
					<img src="<c:url value='/peoplejob_upload/${vo.companyimage }'/>" 
							alt="공고이미지" width="50">
					
					</span> <span class="label label-info">복리후생 : ${vo.welfare }</span>
					<br> 
					<c:if test="${mvo.authorityCode==1 }"> 
					<a href="<c:url value='/apply/insertapply.do?jobopening=${vo.jobopening}'/>"><input type="button" id="apply" name="apply"class="btn btn-primary" value="즉시지원"></a>
					</c:if>
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

        </div>
       <!-- 기업회원(3)이면 글쓰기 나옴  -->
         <c:if test="${mvo.authorityCode==3}"> 
        <div class="pull-right"> 
            <a href="<c:url value='/apply/Capply_list.do'/>" class="btn btn-primary" role="button">지원현황 보기</a>
            <a href="<c:url value='/company/my_jobopening_list.do?companycode1=${mvo.companyCode}'/>" class="btn btn-primary" role="button">내가쓴 채용 정보</a>
            <a href="<c:url value='/company/jobopening_register.do'/>" class="btn btn-primary" role="button">공고등록</a>
        </div>
        </c:if>
    </div>
    </div>
    </fieldset>
    </article>
<%@include file="../main/inc/bottom.jsp" %>
