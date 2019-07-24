<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>
	<form name="frmSearch" method="post" 
   		action='<c:url value="/peopleinfo/peopleinfolist.do"/>'>
   		<!-- 현재 페이지 hidden에 넣기 -->  
   		<input type="hidden" name='currentPage' value="1" >
   		<input type="hidden" name='resumeCode' value="${vo.resumeCode}" >
   		<div id="whereall" style="margin-left: -209px;
    padding: 23px;">
   		<div id="where" class="where">
			<c:import url="peopleinfowhere.jsp"/>
		</div> 
        <c:import url="../resume/occupation.jsp"/>
		</div>
        <c:if test="${empty list }">	 
        <div style="margin: 0 auto; min-height: 630px;position: relative;bottom: 0;width: 446px;">
	 	<table class="table table-bordered">
	 	<tr>
	 		<td colspan="5" class="align_center">데이터가 존재하지 않습니다.</td>
	 	</tr>
	 	</table>
		</div>
		</c:if>
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
   		</form>
   		 <c:if test="${!empty list }">
   		<div class="talent_list" style="margin: 0 auto; min-height: 630px;position: relative;bottom: 0;width: 446px;">
   		 	<c:forEach var="vo" items="${resumelist }">
	                 <c:if test="${not loop_flag }">
				        <c:if test="${vo.resumeCode==vo.resumeCode}">   
			                <div class="cname"style="height:100px; width:120px;"><h2>${vo.resumeTitle}</h2></div>
				            <c:set var="loop_flag" value="true" />
				        </c:if>
				    </c:if>
	                </c:forEach>
    <table class="table table-bordered">
        <caption>인재검색 리스트</caption>
        <colgroup>
            <col width="46">
            <col width="218">
            <col width="549">
            <col width="147">
        </colgroup>
        <thead>
        <tr>
            <th scope="col" class="scrap"><span class="blind">관심인재</span></th>
            <th scope="col" class="name" >이름</th>
            <th scope="col" class="contents">이력서 요약</th>
            <th scope="col" class="update" id="date_type">등록일</th>
            <td id="peoplelist" >${vo.membername}<br>(${vo.membergender}|${vo.age})</td>
            <td id="peoplelist" >경력${vo.term}&nbsp;${vo.resumeTitle}<br>
            ${vo.schoolname}|${vo.hopepay}|${vo.sido}</td>
            <td id="peoplelist" >${vo.resumeRegdate}</td>
            
        </tr>
        </thead>
        </table>
        
        </div>
        <div class="choice_wrap new mt20 mb10">
  <div class="choice_inner">
    <p class="total" id="total">
      <strong>선택직종 :</strong> 
    </p>
  </div><!-- end choice_inner -->
</div>
        </c:if>
        
<%@include file="../main/inc/bottom.jsp" %>