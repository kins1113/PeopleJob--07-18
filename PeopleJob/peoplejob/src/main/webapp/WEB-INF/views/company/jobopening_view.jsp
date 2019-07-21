<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../main/inc/top.jsp" %>    
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }
	frm1 {
    width: 1277px;
    margin: 0 auto;
    border: 1px;
    margin-right: 299px;
}
</style> 
 
	<h2>채용정보 상세보기</h2>
	<div class="divForm">
	<input type="hidden" name="jobopening" value="${vo.jobopening }">
		<div class="firstDiv">
		<label for="memberinfo">기본정보</label> &nbsp;
			<table class="table">
				<tr>
				<td rowspan="2">
				<span  aria-hidden="true">
					<img src="<c:url value='/peoplejob_upload/${vo.companyimage }'/>" 
						alt="공고이미지" width="50px" height="50px"></span>
				</td>
 				<td><span class="glyphicon glyphicon-text-size" aria-hidden="true">공고제목</span> <span>${vo.jobtitle}</span></td>
 				<td><span class="glyphicon glyphicon-text-size" aria-hidden="true">공고등록일</span> <span>${fn:substring(vo.jobregdate,0,10) }</span></td>
 				<td><span class="glyphicon glyphicon-user" aria-hidden="true">회사이름</span> <span>${cvo.companyname}</span></td>
 				<td><span class="glyphicon glyphicon-gift" aria-hidden="true">고용형태</span> <span>${vo.workway}</span></td>
 				<td><span class="glyphicon glyphicon-gift" aria-hidden="true">근무지역</span> <span>${vo.localcheck}</span></td>
 				</tr>
 				<tr>
 				<td><span class="glyphicon glyphicon-envelope" aria-hidden="true">역정보</span> <span>${vo.subwayinfo}</span></td>
 				<td><span class="glyphicon glyphicon-globe" aria-hidden="true">성별</span> <span>${vo.gender}</span></td>
 				<td><span class="glyphicon glyphicon-globe" aria-hidden="true">제한연령</span> <span>${vo.agelimit}</span></td>
 				<td><span class="glyphicon glyphicon-globe" aria-hidden="true">학력조건</span> <span>${vo.academicCondition}</span></td>
 				<td><span class="glyphicon glyphicon-phone" aria-hidden="true">고용형태</span> <span>${vo.workform}</span></td>
				
				</tr>
			</table>
		</div>
		<div>
		<!--이력서 사진 https://kuzuro.blogspot.com/2018/10/11.html 여기 참고 -->
		</div>
		<div>
		<label for="education">학력사항</label> &nbsp;
			<table class="table">
			<tr>
 				<td><span class="glyphicon glyphicon-education" aria-hidden="true">모집기간</span><br><span>${fn:substring(vo.workdate,0,10) }~${fn:substring(vo.endDate,0,10)}</span></td>
 				<td><span class="glyphicon glyphicon-education" aria-hidden="true">근무요일</span><br><span>${vo.dayofweek }</span></td>
 				<td><span class="glyphicon glyphicon-education" aria-hidden="true">급여/급여방식</span><br> <span>${vo.pay }/${vo.payway }</span></td> 
 				<td><span class="glyphicon glyphicon-education" aria-hidden="true">근무형태</span> <br><span>${vo.workway}</span></td>
	 			</tr>
			</table>
		</div>
		<div>
		<label for="workcheck">복리후생</label> &nbsp;
			<table class="table">
				<tr>
 				<td><span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span> <span>${vo.welfare}</span></td>
			</tr>
			</table>
		</div>
		
		<div>
			<label for="certificationtype">우대조건</label> &nbsp;
			<table class="table">
				<tr>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo.sweetener}</span></td>
				</tr>
			</table>
		</div>
		<div>
			<label for="certificationtype">경력사항</label> &nbsp;
			<table class="table">
				<tr>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo.career}</span></td>
				</tr>
			</table>
		</div>
		<div>
			<label for="certificationtype">모집인원</label> &nbsp;
			<table class="table">
				<tr>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo.recruit}</span></td>
				</tr>
			</table>
		</div>
		<div>
			<label for="certificationtype">모집대상</label> &nbsp;
			<table class="table">
				<tr>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo.recruitmentTarget}</span></td>
				</tr>
			</table>
		</div>
		<div>
			<label for="certificationtype">접수방법</label> &nbsp;
			<table class="table">
				<tr>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo.receiveway}</span></td>
				</tr>
			</table>
		</div>
		<div>
			<label for="certificationtype">제출서류</label> &nbsp;
			<table class="table">
				<tr>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo.submit}</span></td>
				</tr>
			</table>
		</div>
		<div>
			<label for="certificationtype">상세모집요강</label> &nbsp;
			<table class="table">
				<tr>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo.applicationhandbook}</span></td>
				</tr>
			</table>
		</div>
		</div>
		  <form id="removeForm" method="post">
            <input type="hidden" name="_method" value="delete"/>
            <div class="pull-right">
               <!-- 기업회원(3)이면 글쓰기 나옴  --> 
        		 <c:if test="${mvo.authorityCode==3}">
                <a href="<c:url value='/company/jobopening_deleteck.do?jobopening=${vo.jobopening}'/>"><input type="button" id="deleteBtn" class="btn btn-default btn-mg" role="button" value="삭제"></a>
                <a href="<c:url value='/company/jobopening_editck.do?jobopening=${vo.jobopening }'/>"><input type="button" id="modifyBtn" class="btn btn-default btn-mg" role="button" value="수정"></a>
                <a href="<c:url value='/company/jobopening_agreeeditck.do?jobopening=${vo.jobopening}'/>"><input type="button" class="btn btn-default btn-mg" role="button" value="활성화 수정"></a>
                </c:if>
                <!-- 일반회원일경우 -->
                <c:if test="${mvo.authorityCode==1}">
                <a href="<c:url value='/apply/insertapply.do?jobopening=${vo.jobopening}'/>"><input type="button" id="apply" name="apply"class="btn btn-primary" value="즉시지원"></a>
                <a href="<c:url value='/scrap/insertscrap.do?jobopening=${vo.jobopening}&member_code=${mvo.memberCode }'/>"><input type="button" class="btn btn-default btn-mg" role="button" value="스크랩"></a>
                </c:if>
                <a href="<c:url value='/company/jobopening_list.do'/>"><input type="button" id="listBtn" class="btn btn-default btn-mg" role="button" value="목록"></a>
            </div>
        </form>
		</div>
	</div>

<%@include file="../main/inc/bottom.jsp" %>