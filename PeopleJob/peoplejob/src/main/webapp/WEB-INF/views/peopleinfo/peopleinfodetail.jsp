<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>    
<style type="text/css">

</style> 
 
	<h2>인재 정보</h2>
	<div class="divForm">
	<input type="hidden" name="resumeCode" value="${vo.resumeCode }">
		<div class="firstDiv">
			<table class="table">
				<tr>
				<td>
					<img src="<c:url value='/peoplejob_upload/${vo.picture }'/>" 
						alt="이력서이미지" width="50px" height="50px"></span>
				</td>
 				<td> <span>${vo.resumeTitle}</span>&nbsp; ${fn:substring(vo1.birth,0,3) } | ${vo1.membergender} | ${vo4.workcheck }</td>
 				<td><span class="glyphicon glyphicon-user" aria-hidden="true">회사이름</span> <span>${cvo.companyname}</span></td>
 				</tr>
 				<tr>
 				<td><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> <span>${vo1.email}</span></td>
 				<td><span class="glyphicon glyphicon-phone" aria-hidden="true"></span> <span>${vo1.tel}</span></td>
 				<td><span class="glyphicon glyphicon-globe" aria-hidden="true"></span> <span>${vo1.zipcode}&nbsp;${vo1.address}&nbsp;${vo1.addressdetail}</span></td>
 				<td><span class="glyphicon glyphicon-" aria-hidden="true">고용형태</span> <span>${vo.workform}</span></td>
				
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
				<th>학력사항</th>
				<th>경력사항</th>
				<th>희망연봉/근무형태</th>
				<th>희망근무지</th>
 				<td><span class="glyphicon glyphicon-education" aria-hidden="true"></span><br><span>${vo3.graduatetype }</span></td>
 				<td><span class="glyphicon glyphicon-education" aria-hidden="true"></span><br><span>${vo15.term }</span></td>
 				<td><span class="glyphicon glyphicon-education" aria-hidden="true">급여/</span><br> <span>${vo2.hopepay }/${vo2.hopeworkform }</span></td> 
 				<td><span class="glyphicon glyphicon-education" aria-hidden="true">근무형태</span> <br><span>${vo7.sido}</span></td>
	 			</tr>
			</table>
		</div>
		<div class="pull-right">
            
                <!-- 일반회원일경우 -->
                <c:if test="${vo1.authorityCode==1}">
                <span>기업회원 로그인 후,<br>
                인재정보 열람 상품을 신청하시면 본 이력서의 전체 내용을 확인 할 수 있습니다.</span>
                <input type="button" value="기업회원 로그인">
                <input type="button" value="인재 정보 열람 상품 신청">
                
                </c:if>
                <a href="<c:url value='/peopleinfo/peopleinfolist.do'/>"><input type="button" id="listBtn" class="btn btn-default btn-mg" role="button" value="목록"></a>
            </div>
		<div>
		<label for="hopework">희망조건</label> &nbsp;
		<table class="table">
			<tr>
 				<td><span class="glyphicon glyphicon-star" aria-hidden="true">근무형태</span> <span>${vo2.hopeworkform}</span></td>
 				<td><span class="glyphicon glyphicon-star" aria-hidden="true">희망연봉</span> <span>${vo2.hopepay}</span></td>
 				<td><span class="glyphicon glyphicon-star" aria-hidden="true">(희망근무지역)시도</span> <span>${vo7.sido}</span></td>
 				<td><span class="glyphicon glyphicon-star" aria-hidden="true">(희망근무지역)구군</span> <span>${vo8.gugun}</span></td>
 				<td><span class="glyphicon glyphicon-star" aria-hidden="true">(희망근무지역)업종1차</span> <span>${vo9.btypename1}</span></td>
 				<td><span class="glyphicon glyphicon-star" aria-hidden="true">(희망근무지역)업종2차</span> <span>${vo10.btypename2}</span></td>
 				<td><span class="glyphicon glyphicon-star" aria-hidden="true">(희망근무지역)업종3차</span> <span>${vo11.btypename3}</span></td>
 				<td><span class="glyphicon glyphicon-star" aria-hidden="true">직종1차</span> <span>${vo12.firstname}</span></td>
 				<td><span class="glyphicon glyphicon-star" aria-hidden="true">직종2차</span> <span>${vo13.secondname}</span></td>
 				<td><span class="glyphicon glyphicon-star" aria-hidden="true">직종3차</span> <span>${vo14.thirdname}</span></td>
 				<td><span class="glyphicon glyphicon-star" aria-hidden="true">근무일시</span> <span>${vo2.hopeworkdate}</span></td>
			</tr>
		</table>
		 <!-- 일반회원일경우 -->
                <c:if test="${vo1.authorityCode==1}">
                <span>기업회원 로그인 후,<br>
                인재정보 열람 상품을 신청하시면 본 이력서의 전체 내용을 확인 할 수 있습니다.</span>
                <input type="button" value="기업회원 로그인">
                <input type="button" value="인재 정보 열람 상품 신청">
                
                </c:if>
                <!--기업회원  -->
		<c:if test="${vo1.authorityCode==3}">
		<span>${vo.introduce }</span>
		</c:if>
		<div>
		<label for="workcheck">경력사항</label> &nbsp;
			   <!-- 기업회원  --> 
        		 <c:if test="${vo1.authorityCode==3}">
                
			<table class="table">
				<tr>
 				<td><span class="glyphicon glyphicon-briefcase" aria-hidden="true">경력구분</span> <span>${vo4.workcheck}</span></td>
 				<td><span class="glyphicon glyphicon-briefcase" aria-hidden="true">회사명</span> <span>${vo4.companyname}</span></td>
 				<td><span class="glyphicon glyphicon-briefcase" aria-hidden="true">근무기간</span> <span>${vo4.workterm}</span></td>
 				<td><span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span> <span>${vo4.workcondition}</span></td>
 				<td><span class="glyphicon glyphicon-briefcase" aria-hidden="true">직종</span> <span>${vo4.chargework}</span></td>
 				<td><span class="glyphicon glyphicon-briefcase" aria-hidden="true">직급</span> <span>${vo4.jobgrade}</span></td>
			</tr>
			</table>
                </c:if>
                 <!-- 일반회원일경우 -->
                <c:if test="${vo1.authorityCode==1}">
                <span>기업회원 로그인 후,<br>
                인재정보 열람 상품을 신청하시면 본 이력서의 전체 내용을 확인 할 수 있습니다.</span>
                <input type="button" value="기업회원 로그인">
                <input type="button" value="인재 정보 열람 상품 신청">
                
                </c:if>
		</div>
		
		<div>
			<label for="certificationtype">자격증/어학/수상 내역</label> &nbsp;
			<table class="table">
				<tr>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo5.certificationtype}</span></td>
				<c:if test="${vo5.certificationtype=='자격증/면허증'}">            	
            		 <label for="lName">자격증명</label>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo6.lName}</span></td>
 				<label for="lInstitution">발행처/기관</label>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo6.lInstitution}</span></td>
 				 <label for="lGetdate">취득일</label>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo6.lGetdate}</span></td>
            	</c:if>
				<c:if test="${vo5.certificationtype=='어학시험'}">            	
            		 <label for="language">언어</label>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo5.language}</span></td>
 				<label for="institution">발행처/기관</label>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo5.institution}</span></td>
 				 <label for="langlicencename">시험종류</label>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo5.langlicencename}</span></td>
 				 <label for="langpoint">시험점수</label>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo5.langpoint}</span></td>
 				 <label for="langGrade">시험급수</label>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo5.langGrade}</span></td>
 				<label for="langGetdate">취득일</label>
 				<td><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span>${vo5.langGetdate}</span></td>
            	</c:if>
				</tr>
			</table>
		
		</div>
		<c:if test="${!empty vo.award}">
		 <label for="award">수상명</label>
 		<span class="glyphicon glyphicon-tower" aria-hidden="true"></span> <span>${vo.award}</span>
 		</c:if>
		
		
		</div>
		</div>
		 
	
<%@include file="../main/inc/bottom.jsp" %>