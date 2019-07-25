<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../main/inc/top.jsp" %>




<style type="text/css">
.divForm {
    width: 1000px;
    margin: 0 auto;
    background: white;
    padding: 13px;
}
#registerdiv {
    background: #f2f4f7;
}
select#schoollocal {
    height: 35px;
}
select#graduatecheck {
    height: 35px;
}
select#workcondition {
    height: 35px;
}
select#certificationtype {
    height: 35px;
}
select#hopeworkform {
    height: 35px;
}
select#hopepay {
    height: 35px;
}
select#hopeworkdate {
    height: 35px;
}
<style>

</style>
<script type="text/javascript">
jQuery('#selectBox').change(function() {
	var state = jQuery('#selectBox option:selected').val();
	if ( state == 'option2' ) {
		jQuery('.layer').show();
	} else {
		jQuery('.layer').hide();
	}
});
</script>
<article>
<div id="registerdiv">
<div class="divForm">
<form name="frm1" method="post" 
	action="<c:url value='/resume/register.do'/>" enctype="multipart/form-data">
<fieldset>
	<legend style="font-weight: bold">이력서등록</legend>
	<section id="registerds">
	<div>        
        <label for="resumeTitle">이력서 제목</label>
        <input type="text" class="form-control" placeholder="이력서 제목을 입력하세요(최대 100자 입력)" name="resumeTitle" id="infobox"  style="ime-mode:active">
    </div>
    </section>
    <hr>
    <section id="registerds">
    <h3>기본정보</h3>
    <!-- hidden필드에 no 넣기 -->
    
    <input type="hidden" name="memberCode" value="${vo.memberCode }">
    
        
		
    <div>
    <!--이력서 사진  https://kuzuro.blogspot.com/2018/10/11.html-->
    <div class="inputArea">
 <label for="picture">이력서 사진</label>
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
    	
    </div>
  
   
    <div>
        <label for="email">이메일 주소</label>
        <input type="text" class="form-control"  name="email"  id="email" value="${vo.email }" title="이메일주소 앞자리">
    </div>
    
    <div>
        <label for="address">주소</label>
        <input type="text" class="form-control"  name="zipcode" id="zipcode" ReadOnly  
        	title="우편번호" class="width_80" value="${vo.zipcode}">
        
       
        <br />
        <span class="sp1">&nbsp;</span>
        <input type="text"  class="form-control" id="address" name="address" value="${vo.address }" ReadOnly title="주소"  class="width_350"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text"  class="form-control" id="addressdetail" name="addressdetail" value="${vo.addressdetail }" title="상세주소"  class="width_350">
    </div>
    <div>
        <label for="tel">핸드폰</label>&nbsp;
       
        <input type="text"  class="form-control"   name="tel" id="tel" value="${vo.tel}" maxlength="11" title="휴대폰 번호"
        	class="width_80">
    </div>
    </section>
    <section id="registerds">
    <h3>학력사항</h3>
    <div>
        <label for="education">학력사항</label>&nbsp;
       
      
		
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
  		<input type="text"  class="form-control" placeholder="전공을 입력하세요" name="major" id="major" >
       
       </div>
       <div>
       <label>학위</label>
  		<input type="text"  class="form-control" placeholder="학위를 입력하세요" name="degree" id="degree" >
       
       </div>
       <div>
		 <c:import url="resume_date2.jsp"/>
         <select class="form-control" name="graduatecheck" id="graduatecheck" >
        	<option value="졸업여부">졸업여부</option>
        	<option value="졸업">졸업</option>
        	<option value="중퇴">중퇴</option>
        </select>
       </div>	
    </section>
    <section id="registerds">
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
        <%-- <c:import url="occupation.jsp"/> --%>
    </div>	
    <div>
        <label for="jobgrade">직급</label>
        <input type="text" class="form-control"  name="jobgrade" id="jobgrade" style="ime-mode:active" placeholder="직급을 입력하세요">
   </div>
   </section>
  <script>
$(function () {
	$("#certificationtype").hide();
	$("#certification").click(function () {
		$("#certificationtype").toggle(500);
	});
	$("#award").hide();
	$("#awardbt").click(function () {
		$("#award").toggle(500);
	});
	$("#hopework").hide();
	$("#hopeworkbt").click(function () {
		$("#hopework").toggle(500);
	});

});
</script>
   <button type="button" id="certification" class="btn btn-success" value="자격증/어학">자격증/어학</button>
   <section id="registerds">
   <div id="certificationtype">
   
   <h3>자격증/어학</h3>
        <label for="certificationtype">항목선택</label>
        <select class="form-control" name="certificationtype" id="certificationtype" >
        	<option value="자격증/면허증">자격증/면허증</option>
        	<option value="어학시험">어학시험</option>
        </select>
        
   <h5>자격증/면허증</h5>
        <label for="lName">자격증명</label>
        <input type="text" class="form-control"  name="lName" id="lName" placeholder="자격증명을 입력하세요" style="ime-mode:active">
    <div>    
        <label for="lInstitution">발행처/기관</label>
        <input type="text" class="form-control"  name="lInstitution" placeholder="발행처/기관을 입력하세요" id="lInstitution" style="ime-mode:active">
    </div>
    <div>
    	<c:import url="resume_date3.jsp"/>
    </div>
    </section> 
    &nbsp;
    <section id="registerds">
    <div>	
    <h5>어학시험</h5>  
        <label for="language">언어</label>
        <input type="text" class="form-control" placeholder="언어를 입력하세요" name="language" id="language" style="ime-mode:active">
    </div>
     <div>
        <label for="institute">발행처/기관</label>
        <input type="text" class="form-control" placeholder="발행처/기관을 입력하세요" name="institute" id="institute" style="ime-mode:active">
     </div>
     <div>
        <label for="langlicencename">시험종류</label>
        <input type="text" class="form-control" placeholder="시험종류를 입력하세요"  name="langlicencename" id="langlicencename" style="ime-mode:active">
     </div> 
     <div>
        <label for="langpoint">점수</label>
        <input type="text" class="form-control" placeholder="점수를 입력하세요" name="langpoint" id="langpoint" style="ime-mode:active">
     </div>
     
     <div>
        <label for="langGrade">급수</label>
        <input type="text" class="form-control" placeholder="급수를 입력하세요" name="langGrade" id="langGrade" style="ime-mode:active">
     </div>
     <div>
     	<c:import url="resume_date4.jsp"/>             
	</div>
	</section>
	
     &nbsp;

   <button type="button" id="awardbt" class="btn btn-success" value="수상내역">수상내역</button>
    <div class="well" id="award">
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
      <button type="button" id="hopeworkbt" class="btn btn-success" value="희망근무">희망근무</button>
	 <div  id="hopework">
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
       	<select class="form-control" name="sido" id="sido" style="ime-mode:active" >
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
       
       <label for="구군">구군</label>
       <select class="form-control" name="gugun" id="gugun" style="ime-mode:active" >
       <option data-value="101000" id="seoul" value="서울전체">서울전체</option>
       <option data-value="101010" id="seoul" value="강남구">강남구</option>
       <option data-value="101020" id="seoul" value="강동구">강동구</option>
       <option data-value="101030" id="seoul"  value="강북구">강북구</option>
       <option data-value="101040"  id="seoul"value="강서구">강서구</option>
       <option data-value="101050" id="seoul"value="관악구">관악구</option>
       <option data-value="101060" id="seoul"value="광진구">광진구</option>
       <option data-value="101070" id="seoul"value="구로구">구로구</option>
       <option data-value="101080" id="seoul"value="금천구">금천구</option>
       <option data-value="101090" id="seoul"value="노원구">노원구</option>
       <option data-value="101100" id="seoul"value="도봉구">도봉구</option>
       <option data-value="101110" id="seoul"value="동대문구">동대문구</option>
       <option data-value="101120" id="seoul"value="동작구">동작구</option>
       <option data-value="101130" id="seoul"value="마포구">마포구</option>
       <option data-value="101140" id="seoul"value="서대문구">서대문구</option>
       <option data-value="101150" id="seoul"value="서초구">서초구</option>
       <option data-value="101160" id="seoul"value="성동구">성동구</option>
       <option data-value="101170" id="seoul"value="성북구">성북구</option>
       <option data-value="101180" id="seoul"value="송파구">송파구</option>
       <option data-value="101190" id="seoul"value="양천구">양천구</option>
       <option data-value="101200" id="seoul"value="영등포구">영등포구</option>
       <option data-value="101210" id="seoul"value="용산구">용산구</option>
       <option data-value="101220" id="seoul"value="은평구">은평구</option>
       <option data-value="101220" id="seoul"value="종로구">종로구</option>
       <option data-value="101240" id="seoul"value="중구">중구</option>
       <option data-value="101250" id="seoul"value="중랑구">중랑구</option>
       <option data-value="102000" id="gyeonggi"value="경기전체">경기전체</option>
       <option data-value="102010" id="gyeonggi"value="가평군">가평군</option>
       <option data-value="102020" id="gyeonggi"value="고양시">고양시</option>
       <option data-value="102030" id="gyeonggi"value="고양시 덕양구">고양시 덕양구</option>
       <option data-value="102040" id="gyeonggi"value="고양시 일산동구">고양시 일산동구</option>
       <option data-value="102050" id="gyeonggi"value="고양시 일산서구">고양시 일산서구</option>
       <option data-value="102060" id="gyeonggi"value="과천시">과천시</option>
       <option data-value="102070" id="gyeonggi"value="광명시">광명시</option>
       <option data-value="102080" id="gyeonggi"value="광주시">광주시</option>
       <option data-value="102090" id="gyeonggi"value="구리시">구리시</option>
       <option data-value="102100" id="gyeonggi"value="군포시">군포시</option>
       <option data-value="102110" id="gyeonggi"value="김포시">김포시</option>
       <option data-value="102120" id="gyeonggi"value="남양주시">남양주시</option>
       <option data-value="102130" id="gyeonggi"value="동두천시">동두천시</option>
       <option data-value="102140" id="gyeonggi"value="부천시">부천시</option>
       <option data-value="102150" id="gyeonggi"value="부천시 소사구">부천시 소사구</option>
       <option data-value="102160" id="gyeonggi"value="부천시 오정구">부천시 오정구</option>
       <option data-value="102170" id="gyeonggi"value="부천시 원미구">부천시 원미구</option>
       <option data-value="102180" id="gyeonggi"value="성남시">성남시</option>
       <option data-value="102190" id="gyeonggi"value="성남시 분당구">성남시 분당구</option>
       <option data-value="102190" id="gyeonggi"value="성남시 수정구">성남시 수정구</option>
       <option data-value="102190" id="gyeonggi"value="성남시 중원구">성남시 중원구</option>
       <option data-value="102190" id="gyeonggi"value="수원시">수원시</option>
       <option data-value="102190" id="gyeonggi"value="수원시 권선구">수원시 권선구</option>
       <option data-value="102190" id="gyeonggi"value="수원시 영통구">수원시 영통구</option>
       <option data-value="102190" id="gyeonggi"value="수원시 장안구">수원시 장안구</option>
       <option data-value="102190" id="gyeonggi"value="수원시 팔달구">수원시 팔달구</option>
       <option data-value="102190" id="gyeonggi"value="시흥시">시흥시</option>
       <option data-value="102190" id="gyeonggi"value="안산시">안산시</option>
       <option data-value="102190" id="gyeonggi"value="안산시 단원구">안산시 단원구</option>
       <option data-value="102190" id="gyeonggi"value="안산시 상록구">안산시 상록구</option>
       <option data-value="102190" id="gyeonggi"value="안성시">안성시</option>
       <option data-value="102190" id="gyeonggi"value="안양시">안양시</option>
       <option data-value="102190" id="gyeonggi"value="안양시 동안구">안양시 동안구</option>
       <option data-value="102190" id="gyeonggi"value="안양시 만안구">안양시 만안구</option>
       <option data-value="102190" id="gyeonggi"value="양주시">양주시</option>
       <option data-value="102190" id="gyeonggi"value="양평군">양평군</option>
       <option data-value="102190" id="gyeonggi"value="여주시">여주시</option>
       </select>

        </div>
        
        <div>
        <%-- <c:import url="btype.jsp"/> --%>
        <label for="btypename1">업종1차</label>
        <select name="btypename1" id="btypename1">
        <option ></option>
        </select>
        </div>
        <div>
        <label for="btypename2">업종2차</label>
        
        <select name="btypename2" id="btypename2">
        <option ></option>
        </select>
        </div>
        <div>
        <label for="btypename3">업종3차</label>
         <select name="btypename3" id="btypename3">
        <option ></option>
        </select>
        </div>
        <div>
        <label for="firstname">직종1차</label>
         <select name="firstname" id="firstname">
        <option ></option>
        </select>
     
        </div>
        <div>
        <label for="secondname">직종2차</label>
         <select name="secondname" id="secondname">
        <option ></option>
        </select>
     	
        </div>
        <div>
        <label for="thirdname">직종3차</label>
        <select name="thirdname" id="thirdname">
        <option ></option>
        </select>
        </div>
        <div>
        <label for="hopeworkdate">근무일시</label>
        <select class="form-control" name="hopeworkdate" id="hopeworkdate" >
        	<option value="09시~06시">09시~06시</option>
        	<option value="10시~06시">10시~06시</option>
        	<option value="자율근무제">자율근무제</option>
        </select>
        </div>
        </div>
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
</div>     
</article>
<%@include file="../main/inc/bottom.jsp" %>
      