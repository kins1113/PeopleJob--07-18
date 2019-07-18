<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../main/inc/top.jsp" %>




<style type="text/css">
.divForm {
    width: 700px;
    margin: 0 auto;
}
</style>
<script type="text/javascript">
</script>
<article>
<div class="divForm">
<form name="frm1" method="post" 
	action="<c:url value='/resume/register.do'/>" enctype="multipart/form-data">
<fieldset>
	<legend style="font-weight: bold">이력서등록</legend>
	
	<div>        
        <label for="resumeTitle">이력서 제목</label>
        <input type="text" class="form-control" placeholder="이력서 제목을 입력하세요" name="resumeTitle" id="infobox"  style="ime-mode:active">
    </div>
    <hr>
    <h3>기본정보</h3>
    <!-- hidden필드에 no 넣기 -->
    
    <input type="hidden" name="memberCode" value="${vo.memberCode }">
    
        
		
    <div>
    <!--이력서 사진  https://kuzuro.blogspot.com/2018/10/11.html-->
    <div class="inputArea">
 <label for="picture">이미지</label>
 <input type="file" id="gdsImg" name="file" />
 <div class="select_img"><img src="" /></div>
 
 <script>
  $("#picture").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(200);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
 <%=request.getRealPath("/") %>
</div>
        <input type="hidden" class="form-control"  name="picture" id="picture"  >
    </div>
    <div>        
        <label for="membername">이름</label>
        <input type="text" class="form-control"  name="membername" id="membername" value="${vo.membername }" style="ime-mode:active">
    </div>
    <div>        
        <label for="birth">생년월일</label>
        <input type="text" class="form-control"  name="birth" id="birth" value="${vo.birth}" style="ime-mode:active">
    	<label class="radio-inline">
  		<input type="radio" name="membergender" id="membergender" value="남" <c:if test="${vo.membergender=='남'}">            	
            		checked="checked"
            	</c:if>>남
		</label>
    	<label class="radio-inline">
  		<input type="radio" name="membergender" id="membergender" value="여" <c:if test="${vo.membergender=='여'}">            	
            		checked="checked"
            	</c:if>>여
		</label>
    </div>
  
   
    <div>
        <label for="email">이메일 주소</label>
        <input type="text" class="form-control"  name="email"  id="email" value="${vo.email }" title="이메일주소 앞자리">
    </div>
    
    <div>
        <label for="address">주소</label>
        <input type="text" class="form-control"  name="zipcode" id="zipcode" ReadOnly  
        	title="우편번호" class="width_80" value="${vo.zipcode}">
        
        <button type="button" class="btn btn-success" value="우편번호 찾기" id="btnZipcode" 
        title="새창열림">우편번호찾기</button>
        <br />
        <span class="sp1">&nbsp;</span>
        <input type="text"  class="form-control" id="address" name="address" value="${vo.address }" ReadOnly title="주소"  class="width_350"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text"  class="form-control" id="addressdetail" name="addressdetail" value="${vo.addressdetail }" title="상세주소"  class="width_350">
    </div>
    <div>
        <label for="tel">핸드폰</label>&nbsp;
       
        <input type="text"  class="form-control"   name="tel" id="tel" value="${vo.tel}" maxlength="4" title="휴대폰 번호"
        	class="width_80">
    </div>
    
    <h3>학력사항</h3>
    <div>
        <label for="education">학력사항</label>&nbsp;
       
       <label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="학력무관"> 학력무관
		</label>
		
       <label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="초등학교졸업"> 초등학교 졸업
		</label>
		
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="중학교졸업"> 중학교 졸업
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="고등학교졸업"> 고등학교 졸업
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="대학졸업 (2,3년)"> 대학졸업 (2,3년)
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="대학교졸업 (4년)"> 대학교졸업 (4년)
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="석사졸업이상"> 석사졸업이상
		</label>
		<hr>
	</div>
		
		<div>
		 <label for="schoolname">학교명</label>&nbsp;
			    
        <input type="text"  class="form-control" placeholder="학교명을 입력"  name="schoolname" id="schoolname">
        </div>
        <div>
		 <label for="schoollocal">지역</label>&nbsp;
			<select class="form-control" name="schoollocal" id="schoollocal" >
        	<option data-value="101000" value="서울">서울</option>
        	<option data-value="102000" value="경기">경기</option>
        	<option data-value="103000" value="광주">광주</option>
        	<option data-value="104000" value="대구">대구</option>
        	<option data-value="105000" value="대전">대전</option>
        	<option data-value="106000" value="부산">부산</option>
        	<option data-value="107000" value="울산">울산</option>
        	<option data-value="108000" value="인천">인천</option>
        	<option data-value="109000" value="강원">강원</option>
        	<option data-value="110000" value="경남">경남</option>
        	<option data-value="111000" value="경북">경북</option>
        	<option data-value="112000" value="전남">전남</option>
        	<option data-value="113000" value="전북">전북</option>
        	<option data-value="114000" value="충북">충북</option>
        	<option data-value="115000" value="충남">충남</option>
        	<option data-value="116000" value="제주">제주</option>
        	<option data-value="118000" value="세종">세종</option>
        	
        </select>   
       </div>
       <div>
       <label>전공</label>
  		<input type="text"  class="form-control" name="major" id="major" >
       
       </div>
       <div>
       <label>학위</label>
  		<input type="text"  class="form-control" name="degree" id="degree" >
       
       </div>
       <div>
		 <c:import url="resume_date2.jsp"/>
         <select class="form-control" name="graduatecheck" id="graduatecheck" >
        	<option value="졸업여부">졸업여부</option>
        	<option value="졸업">졸업</option>
        	<option value="중퇴">중퇴</option>
        </select>
       </div>	
    
    <h3>경력사항</h3>
    <div>
    <label for="workcheck">경력구분</label>&nbsp;
       
       <label class="radio-inline">
  		<input type="radio" name="workcheck" id="workcheck" value="신입">신입
		</label>
		
		<label class="radio-inline">
  		<input type="radio" name="workcheck" id="workcheck" value="경력">경력
		</label>
    </div>
    <hr>
    <div>        
        <label for="companyname">회사명</label>
        <input type="text" class="form-control" placeholder="회사명 입력" name="companyname" id="companyname" style="ime-mode:active">
    </div>
    <div>
        <c:import url="resume_date.jsp"/>
  		&nbsp;
		<select class="form-control" name="workcondition" id="workcondition" >
        	<option value="재직중">재직중</option>
        	<option value="퇴사">퇴사</option>
        </select>
	</div>
	<div>
        <label for="chargework">직종</label>
        <input type="text" class="form-control"  name="chargework" id="chargework" style="ime-mode:active">
        <c:import url="occupation.jsp"/>
    </div>	
    <div>
        <label for="jobgrade">직급</label>
        <input type="text" class="form-control"  name="jobgrade" id="jobgrade" style="ime-mode:active">
   </div>
  

   
   <h3>자격증/어학</h3>
        <label for="certificationtype">항목선택</label>
        <select class="form-control" name="certificationtype" id="certificationtype" >
        	<option value="자격증/면허증">자격증/면허증</option>
        	<option value="어학시험">어학시험</option>
        </select>
     <div>
   <h5>자격증/면허증</h5>
        <label for="lName">자격증명</label>
        <input type="text" class="form-control"  name="lName" id="lName" style="ime-mode:active">
    </div>
    <div>    
        <label for="lInstitution">발행처/기관</label>
        <input type="text" class="form-control"  name="lInstitution" id="lInstitution" style="ime-mode:active">
    </div>
    <div>
    	<c:import url="resume_date3.jsp"/>
    </div> 
    &nbsp;
    <div>	
    <h5>어학시험</h5>  
        <label for="language">언어</label>
        <input type="text" class="form-control"  name="language" id="language" style="ime-mode:active">
    </div>
     <div>
        <label for="institute">발행처/기관</label>
        <input type="text" class="form-control"  name="institute" id="institute" style="ime-mode:active">
     </div>
     <div>
        <label for="langlicencename">시험종류</label>
        <input type="text" class="form-control"  name="langlicencename" id="langlicencename" style="ime-mode:active">
     </div> 
     <div>
        <label for="langpoint">점수</label>
        <input type="text" class="form-control"  name="langpoint" id="langpoint" style="ime-mode:active">
     </div>
     
     <div>
        <label for="langGrade">급수</label>
        <input type="text" class="form-control"  name="langGrade" id="langGrade" style="ime-mode:active">
     </div>
     <div>
     	<c:import url="resume_date4.jsp"/>             
	</div>
     &nbsp;

  <div class="well">
     <h5>수상내역</h5>
      <label for="award">수상명</label>
        <input type="text" class="form-control"  name="award" id="award" style="ime-mode:active">
  </div>
     &nbsp;

     <h3>자기소개서</h3>
      <div>	
    	<!-- <label for="introduce">자기소개서</label>
        <textarea class="form-control" rows="3"></textarea> -->
        
        <c:import url="/main/smarteditorTestjsp.do">
			<c:param name="name" value="introduce"></c:param>
		</c:import>
        
        
      </div>
      &nbsp;
      <h3>희망근무 선택</h3>
      <div>
    	<label for="hopeworkform">근무형태</label>
    	<select class="form-control" name="hopeworkform" id="hopeworkform" >
        	<option value="근무형태 선택">근무형태 선택</option>
        	<option value="정규직">정규직</option>
        	<option value="교육생 (정규직 전환가능)">교육생</option>
        	<option value="별정직">별정직</option>
        	<option value="파트">파트</option>
        	<option value="전임">전임</option>
        	<option value="계약직 (정규직 전환가능)">계약직</option>
        	<option value="병역특례">병역특례</option>
        	<option value="인턴직 (정규직 전환가능)">인턴직</option>
        	<option value="아르바이트">아르바이트</option>
        	<option value="파견직">파견직</option>
        	<option value="해외취업">해외취업</option>
        	<option value="위촉직">위촉직</option>
        	<option value="프리랜서">프리랜서</option>
        </select>
       </div>
       <div>
    	<label for="hopepay">희망연봉</label>
    	<select class="form-control" name="hopepay" id="hopepay" >
        	<option value="회사내규에 따름">회사내규에 따름</option>
        	<option value="1400만원이하">1400만원이하</option>
        	<option value="1400~1600만원">1400~1600만원</option>
        	<option value="1600~1800만원">1600~1800만원</option>
        	<option value="1800~2000만원">1800~2000만원</option>
        	<option value="2000~2200만원">2000~2200만원</option>
        	<option value="2200~2400만원">2200~2400만원</option>
        	<option value="2400~2600만원">2400~2600만원</option>
        	<option value="2600~2800만원">2600~2800만원</option>
        	<option value="2800~3000만원">2800~3000만원</option>
        	<option value="3000~4000만원">3000~4000만원</option>
        	<option value="4000~5000만원">4000~5000만원</option>
        	<option value="5000~6000만원">5000~6000만원</option>
        	<option value="6000~7000만원">6000~7000만원</option>
        	<option value="7000~8000만원">7000~8000만원</option>
        	<option value="8000~9000만원">8000~9000만원</option>
        	<option value="9000~1억원">9000~1억원</option>
        	<option value="면접 후 결정">면접 후 결정</option>
        	
        </select>
       </div>
       
       
       <h3>희망근무지역</h3>
       <div>
       
       <label for="시도">시도</label>
        <input type="text" class="form-control"  name="sido" id="sido" style="ime-mode:active">
       	
        </div>
       	<div>
       
       <label for="구군">구군</label>
        <input type="text" class="form-control"  name="gugun" id="gugun" style="ime-mode:active">
       	
        </div>
        
        <div>
        <label for="btypename1">업종1차</label>
        
        <input type="text" class="form-control"  name="btypename1" id="btypename1"   style="ime-mode:active">
        </div>
        <div>
        <label for="btypename2">업종2차</label>
        
        <input type="text" class="form-control"  name="btypename2" id="btypename2"   style="ime-mode:active">
        </div>
        <div>
        <label for="btypename3">업종3차</label>
        
        <input type="text" class="form-control"  name="btypename3" id="btypename3"  style="ime-mode:active">
        </div>
        <div>
        <label for="firstname">직종1차</label>
        <input type="text" class="form-control"  name="firstname" id="firstname" style="ime-mode:active">
     
        </div>
        <div>
        <label for="secondname">직종2차</label>
        <input type="text" class="form-control"  name="secondname" id="secondname"  style="ime-mode:active">
        	
        </div>
        <div>
        <label for="thirdname">직종3차</label>
        <input type="text" class="form-control"  name="thirdname" id="thirdname"  style="ime-mode:active">
        
        </div>
        <div>
        <label for="hopeworkdate">근무일시</label>
        <select class="form-control" name="hopeworkdate" id="hopeworkdate" >
        	<option value="09시~06시">09시~06시</option>
        	<option value="10시~06시">10시~06시</option>
        	<option value="자율근무제">자율근무제</option>
        </select>
        </div>
   &nbsp;
    <div>
    <label>기업 인사담당자의 입사제의 및 면접제의를 받으시겠어요?</label>
    <label class="radio-inline">
  		<input type="radio" name="opencheck" id="opencheck" value="Y">공개
		</label>
		
		<label class="radio-inline">
  		<input type="radio" name="opencheck" id="opencheck" value="N">비공개
	</label>
    </div>
    <br>
    <input type="submit" value="이력서 저장"/>
    
</fieldset> 
</form>
</div>       
</article>
<%@include file="../main/inc/bottom.jsp" %>
      