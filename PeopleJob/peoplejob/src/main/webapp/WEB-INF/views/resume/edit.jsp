<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../main/inc/top.jsp" %>
    <style type="text/css">
.divForm {
    width: 900px;
    margin: 0 auto;
    background: white;
    padding: 13px;
}
#editdiv {
    background: #f2f4f7;
}
</style>

<style type="text/css">
.divForm {
    width: 1153px;
    height: 110%;
    margin: 0 auto;
    background: #f2f4f7;
    padding: 13px;
}
#editdiv {
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
section#registerds {
    margin: 12px;
    background: white;
    padding: 20px;
}
h3 {
    color: green;
    font-weight: bold;
}
div#companycheck {
    margin-left: 900px;
}
input[type="submit"] {
    margin-left: 1653px;
}
legend{
    font-weight: bold;
    font-size: 30px;
    margin-left: 10px;
}

button#certification {
    margin-left: 10px;
}
button#langcertbt{
    margin-left: 10px;
}
button#awardbt{
    margin-left: 10px;
}
input.btn.btn-register {
    margin-left: 10px;
}
select#infobox {
    height: 33px;
}
select#locationSiDo {
    height: 30px;
}
select#locationGugun {
    height: 30px;
}
<style>

</style>
<script type="text/javascript">
//1차 직종 가져오기 /manager/occupantion/firstList.do
selectFirst();
//1차 작종 클릭하면 2차직종 가져오기 
$("#selectFirst").change(function(){
	var firstCode=$(this).find("option:selected").val();
	if(firstCode!=0){
		selectSecond(firstCode);
	}
});

//2차 직종 클릭하면 3차직종 가져오기
$("#selectSecond").change(function(){
	var secondCode=$(this).find("option:selected").val();
	if(secondCode!=0){
		selectThird(secondCode);
	}
});

//지역정보를 가져오기 - 시도
getLocation();

//지역정보를 가져오는 
$("#locationSiDo").change(function(){
	var sidoCode=$(this).find("option:checked").val();
	//값을 가져오는 메서드
	getLocation2(sidoCode);
});


//1차 직종 가져오기
function selectFirst(){
$.ajax({
	url:"<c:url value='/resume/occupation/firstList.do'/>",
	type:"post",
	success:function(res){
			settingFirst(res);
	},
	error:function(xhr, status, error){
		alert(status+":"+error);
	}
})
}

//1차직종 뿌리기
//[{"firstCode":1,"firstname":"경영·사무"},{"firstCode":2,"firstname":"영업·고객상담"},{"firstCode":3,"firstname":"생산·제조"},
//{"firstCode":4,"firstname":"IT·인터넷"},{"firstCode":5,"firstname":"전문직"},{"firstCode":6,"firstname":"교육"}
function settingFirst(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>1차 직종</option>")
			var opEl=$("<option value='"+item.firstCode+"'></option>");
			opEl.append(item.firstname);
			$("#selectFirst").html(chEl);
			$("#selectFirst").append(opEl); //최종으로 여기에 넣음
		}else{
			var opEl=$("<option value='"+item.firstCode+"'></option>");
			opEl.append(item.firstname);
			$("#selectFirst").append(opEl); //최종으로 여기에 넣음
		}
	})
}

//2차 직종가져오기 
function selectSecond(firstCode){
$.ajax({
	url:"<c:url value='/resume/occupation/selectSecond.do'/>",
	type:"post",
	data:"firstCode="+firstCode,
	success:function(res){
		settingSecond(res);
	},
	error:function(xhr,status,error){
		alert(status+":"+error);
	}
});
}
//[{"secondCode":101,"secondname":"기획·전략·경영","firstCode":1},
//{"secondCode":102,"secondname":"총무·법무·사무","firstCode":1},.....	]
//2차 직종 세팅하기 함수
function settingSecond(res){
$.each(res,function(idx,item){
	if(idx==0){
		//option태그 만들어서 
		var opEl=$("<option value='"+item.secondCode+"'></option>")
		//값을 넣고 
		opEl.html(item.secondname);
		//append
		$("#selectSecond").html("<option value='0'>2차 직종</option>");
		$("#selectSecond").append(opEl);
	}else{
		//option태그 만들어서 
		var opEl=$("<option value='"+item.secondCode+"'></option>")
		//값을 넣고 
		opEl.append(item.secondname);
		//append
		$("#selectSecond").append(opEl);
	}
});
var thirdEl=$("<option>3차 직종</option>");
$("#selectThird").html(thirdEl);
};

//3차직종 가져오기 
function selectThird(secondCode){
$.ajax({
	url:"<c:url value='/resume/occupation/selectThird.do'/>",
	type:"post",
	data:"secondCode="+secondCode,
	success:function(res){
		settingThird(res);
	},
	error:function(xhr,status,error){
		alert(status+":"+error);
	}
});

} 
//3차 직종 뿌려주기 
function settingThird(res){
$.each(res,function(idx,item){
	if(idx==0){
		//option태그 만들어서 
		var opEl=$("<option value='"+item.thirdCode+"'></option>")
		//값을 넣고 
		opEl.html(item.thirdname);
		//append
		$("#selectThird").html("<option value='0'>3차 직종</option>");
		$("#selectThird").append(opEl);
	}else{
		//option태그 만들어서 
		var opEl=$("<option value='"+item.thirdCode+"'></option>")
		//값을 넣고 
		opEl.append(item.thirdname);
		//append
		$("#selectThird").append(opEl);
	}
});
}
//지역정보를 가져오는 메서드 
function getLocation(){
	$.ajax({
		url:"<c:url value='/resume/occupation/selectLocation.do'/>",
		type:"post",
		success:function(res){
			settingLocation(res);
		},
		error:function(xht,status,error){
			alert(status+":"+error);
		}
	});//ajax
}
//지역정보를 뿌려주는 메서드
function settingLocation(res){
	$.each(res, function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>시/도</option>");
			var opEl=$("<option value='"+item.gugun+"'></option>")
			opEl.html(item.sido);
			$("#locationSiDo").html(chEl);
			$("#locationSiDo").append(opEl);
		}else{
			var opEl=$("<option value='"+item.gugun+"'></option>")
			opEl.html(item.sido);
			$("#locationSiDo").append(opEl);
		}
	});
}

//지역정보를 가져오는 메서드 - 구군
function getLocation2(sidoCode){
	$.ajax({
		url:"<c:url value='/resume/occupation/selectLocation2.do'/>",
		type:"post",
	    dataType: "json",
		data:"sidoCode="+sidoCode,
		success:function(res){
			settingLocation2(res);
		},
		error:function(xht,status,error){
			alert(status+":"+error);
		}
	});//ajax
}
//지역정보를 뿌려주는 메서드 - 구군
function settingLocation2(res){
	$.each(res, function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>구/군</option>");
			var opEl=$("<option value='"+item["LOCAL_CODE2"]+"'></option>")
			opEl.html(item["GUGUN"]);
			$("#locationGugun").html(chEl);
			$("#locationGugun").append(opEl);
		}else{
			//alert("세팅 item[LOCAL_CODE2]="+item["LOCAL_CODE2"]+", item[GUGUN]"+item["GUGUN"])
			var opEl=$("<option value='"+item["LOCAL_CODE2"]+"'></option>")
			opEl.html(item["GUGUN"]);
			$("#locationGugun").append(opEl);
		}
		
	});
}
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
	$("#langcert").hide();
	$("#langcertbt").click(function () {
		$("#langcert").toggle(500);
	});

});
</script>
    <script type="text/javascript">
	$(document).ready(function(){
		$('form[name=frm2]').submit(function(){
			$('#infobox').each(function(idx, item){
				if($(this).val().length<1){
					alert($(this).prev().html()+'를 입력하세요');
					$(this).focus();
					
					event.preventDefault();  //이벤트 진행을 막고
					return false;  //each() 탈출
				}
			});	
		});
		
	});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('address').value = fullRoadAddr;
			}
		}).open();
	}
</script>
<article>
<div id="editdiv">
<div class="divForm">
<form name="frm2" method="post" 
	action="<c:url value='/resume/edit.do'/>">
<fieldset>
	<legend style="font-weight: bold">이력서수정</legend>
	<!-- hidden필드에 no 넣기 -->
		<input type="hidden" name="resumeCode" value="${param.resumeCode}" />
		<input type="hidden" name="memberCode" value="${vo1.memberCode}" />
		<input type="hidden" name="langlicenceCode" value="${vo5.langlicenceCode}">
		<input type="hidden" name="licenceCode" value="${vo6.licenceCode}">
		<input type="hidden" name="dvCode" value="${vo4.dvCode}">
		<input type="hidden" name="academicCode" value="${vo3.academicCode}">
		<input type="hidden" name="desiredWorkCode" value="${vo2.desiredWorkCode}">
		<div>
		<!--이력서 사진 https://kuzuro.blogspot.com/2018/10/11.html  -->
		 <div id="imgDiv">
	        <img src="<c:url value='/peoplejob_upload/${vo.picture }'/>" 
							alt="${vo1.membername }" width="50">
        </div>
		</div>
		<section id="registerds">
	<div>        
        <h3>이력서 제목</h3>
        <input type="text" class="form-control" placeholder="이력서 제목을 입력하세요" name="resumeTitle" id="infobox" value="${vo.resumeTitle }"  style="ime-mode:active">
    </div>
    <hr>
    <h3>기본정보</h3>
    <div>        
        <label for="membername">이름</label>
        <input type="text" class="form-control"  name="membername" id="infobox" value="${vo1.membername }" style="ime-mode:active">
    </div>
    <div>        
        <label for="birth">생년월일</label>
        <input type="text" class="form-control"  name="birth" id="infobox" value="${vo1.birth}" style="ime-mode:active">
    	
    </div>
    
   
    <div>
        <label for="email">이메일 주소</label>
        <input type="text" class="form-control"  name="email"  id="infobox" value="${vo1.email }" title="이메일주소 앞자리">
    </div>
    
    <div>
        <label for="address">주소</label>
        <input type="text" class="form-control"  name="zipcode" id="zipcode" ReadOnly  
        	title="우편번호" class="width_80" value="${vo1.zipcode}">
        
       <div class="row">
		&nbsp;<input type="button" value="우편번호 찾기" class="btn btn-register"
	onclick="execDaumPostcode()">
									</div>
        <br />
        <span class="sp1">&nbsp;</span>
        <input type="text"  class="form-control" id="address" name="address" value="${vo1.address }" ReadOnly title="주소"  class="width_350"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text"  class="form-control" id="infobox" name="addressdetail" value="${vo1.addressdetail }" title="상세주소"  class="width_350">
    </div>
    <div>
        <label for="tel">핸드폰</label>&nbsp;
       
        <input type="text"  class="form-control"   name="tel" id="infobox" value="${vo1.tel}" maxlength="12" title="휴대폰 번호"
        	class="width_80">
    </div>
    </section>
    <section id="registerds">
    <h3>학력사항</h3>
    <div>
        <label for="education">학력사항</label>&nbsp;
       
       
       <label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="초등학교졸업" <c:if test="${vo3.graduatetype=='초등학교졸업'}">            	
            		checked="checked"
            	</c:if>> 초등학교졸업
		</label>
		
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="중학교졸업" <c:if test="${vo3.graduatetype=='중학교졸업'}">            	
            		checked="checked"
            	</c:if>> 중학교졸업
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="고등학교졸업" <c:if test="${vo3.graduatetype=='고등학교졸업'}">            	
            		checked="checked"
            	</c:if>> 고등학교졸업
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="대학졸업 (2,3년)" <c:if test="${vo.graduatetype=='대학졸업 (2,3년)'}">            	
            		checked="checked"
            	</c:if>> 대학졸업 (2,3년)
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="대학교졸업 (4년)" <c:if test="${vo.graduatetype=='대학교졸업 (4년)'}">            	
            		checked="checked"
            	</c:if>> 대학교졸업 (4년)
		</label>
		<label class="radio-inline">
  		<input type="radio" name="graduatetype" id="graduatetype" value="석사졸업이상" <c:if test="${vo.graduatetype=='석사졸업이상'}">            	
            		checked="checked"
            	</c:if>> 석사졸업이상
		</label>
		<hr>
	</div>
		
		<div>
		 <label for="element">학교명</label>&nbsp;
			    
        <input type="text"  class="form-control" placeholder="학교명을 입력"  name="schoolname" id="infobox" 
        	class="width_80" value=${vo3.schoolname }>
        </div>
        <div>
		 <label for="schoollocal">지역</label>&nbsp;
			<select class="form-control" name="schoollocal" id="infobox" >
        	<option value="서울" <c:if test="${vo3.schoollocal=='서울'}">            	
            		selected="selected"
            	</c:if>>서울</option>
        	<option value="경기" <c:if test="${vo3.schoollocal=='경기'}">            	
            		selected="selected"
            	</c:if>>경기</option>
        	<option value="광주" <c:if test="${vo3.schoollocal=='광주'}">            	
            		selected="selected"
            	</c:if>>광주</option>
        	<option value="대구" <c:if test="${vo3.schoollocal=='대구'}">            	
            		selected="selected"
            	</c:if>>대구</option>
        	<option value="대전" <c:if test="${vo3.schoollocal=='대전'}">            	
            		selected="selected"
            	</c:if>>대전</option>
        	<option value="부산" <c:if test="${vo3.schoollocal=='부산'}">            	
            		selected="selected"
            	</c:if>>부산</option>
        	<option value="울산" <c:if test="${vo3.schoollocal=='울산'}">            	
            		selected="selected"
            	</c:if>>울산</option>
        	<option value="인천" <c:if test="${vo3.schoollocal=='인천'}">            	
            		selected="selected"
            	</c:if>>인천</option>
        	<option value="강원" <c:if test="${vo3.schoollocal=='강원'}">            	
            		selected="selected"
            	</c:if>>강원</option>
        	<option value="경남" <c:if test="${vo3.schoollocal=='경남'}">            	
            		selected="selected"
            	</c:if>>경남</option>
        	<option value="경북" <c:if test="${vo3.schoollocal=='경북'}">            	
            		selected="selected"
            	</c:if>>경북</option>
        	<option value="전남" <c:if test="${vo3.schoollocal=='전남'}">            	
            		selected="selected"
            	</c:if>>전남</option>
        	<option value="전북" <c:if test="${vo3.schoollocal=='전북'}">            	
            		selected="selected"
            	</c:if>>전북</option>
        	<option value="충북" <c:if test="${vo3.schoollocal=='충북'}">            	
            		selected="selected"
            	</c:if>>충북</option>
        	<option value="충남" <c:if test="${vo3.schoollocal=='충남'}">            	
            		selected="selected"
            	</c:if>>충남</option>
        	<option value="제주" <c:if test="${vo3.schoollocal=='제주'}">            	
            		selected="selected"
            	</c:if>>제주</option>
        	<option value="세종" <c:if test="${vo3.schoollocal=='세종'}">            	
            		selected="selected"
            	</c:if>>세종</option>
        	
        </select>   
       </div>
       <div>
       <label>전공</label>
  		<input type="text"  class="form-control"  name="major" id="major"value="${vo3.major }" >
       
       </div>
       <div>
       <label>학위</label>
  		<input type="text"  class="form-control"  name="degree" id="degree"value="${vo3.degree }" >
       
       </div>
       <div>
		 <label for="graduate">졸업년도</label>&nbsp;
		 <c:import url="resume_date2.jsp"/>
         <select class="form-control" name="graduatecheck" id="infobox" >
        	<option value="졸업여부" <c:if test="${vo3.graduatecheck=='졸업여부'}">            	
            		selected="selected"
            	</c:if>>졸업여부</option>
        	<option value="졸업" <c:if test="${vo3.graduatecheck=='졸업'}">            	
            		selected="selected"
            	</c:if>>졸업</option>
        	<option value="중퇴" <c:if test="${vo3.graduatecheck=='중퇴'}">            	
            		selected="selected"
            	</c:if>>중퇴</option>
        </select>
       </div>
       </section>	
    <section id="registerds">
    <h3>경력사항</h3>
    <div>
    <label for="workcheck">경력구분</label>&nbsp;
       
       <label class="radio-inline">
  		<input type="radio" name="workcheck" id="infobox" value="신입" <c:if test="${vo4.workcheck=='신입'}">            	
            		checked="checked"
            	</c:if>>신입
		</label>
		
		<label class="radio-inline">
  		<input type="radio" name="workcheck" id="infobox" value="경력" <c:if test="${vo4.workcheck=='경력'}">            	
            		checked="checked"
            	</c:if>>경력
		</label>
    </div>
    <hr>
    <div>        
        <label for="companyname">회사명</label>
        <input type="text" class="form-control" placeholder="회사명 입력" name="companyname" value="${vo4.companyname }" id="infobox" style="ime-mode:active">
    </div>
    <div>
        <label for="workterm">근무기간</label>
		<input type="text" class="form-control" name="workterm" value="${vo4.workterm }" id="infobox">~ 
  		<input type="text" class="form-control" name="workterm2" value="${vo4.workterm2 }" id="infobox">
  		&nbsp;
		<select class="form-control" name="workcondition" id="infobox" >
        	<option value="재직중" <c:if test="${vo4.workcondition=='재직중'}">            	
            		selected="selected"
            	</c:if>>재직중</option>
        	<option value="퇴사" <c:if test="${vo4.workcondition=='퇴사'}">            	
            		selected="selected"
            	</c:if>>퇴사</option>
        </select>
	</div>
	<div>
        <label for="chargework">직종</label>
        <input type="text" class="form-control"  name="chargework" id="infobox" value="${vo4.chargework }" style="ime-mode:active">
    </div>	
    <div>
        <label for="jobgrade">직급</label>
        <input type="text" class="form-control"  name="jobgrade" id="infobox" value="${vo4.jobgrade }" style="ime-mode:active">
   </div>
  </section>
   

<button type="button" id="certification" class="btn btn-success" value="자격증">자격증</button>
   
   &nbsp;&nbsp;
   <section id="registerds">
   <div id="certificationtype">
     
   <h3>자격증/면허증</h3>
     <div>
        <label for="lName">자격증명</label>
        <input type="text" class="form-control"  name="lName" id="lName" value="${vo6.lName}" style="ime-mode:active">
    </div>
    <div>    
        <label for="lInstitution">발행처/기관</label>
        <input type="text" class="form-control"  name="lInstitution" id="lInstitution" value="${vo6.lInstitution }" style="ime-mode:active">
    </div>
    <div>
    	<c:import url="resume_date3.jsp"/>
    </div> 
   
    </div>
    </section>
    &nbsp;
    <button type="button" id="langcertbt" class="btn btn-success" value="어학">어학</button>
    <section id="registerds">
    <div id="langcert">
    
    <h3>어학시험</h3>  
    <div>	
        <label for="language">언어</label>
        <input type="text" class="form-control"  name="language" id="language" value="${vo5.language }" style="ime-mode:active">
    </div>
     <div>
        <label for="institution">발행처/기관</label>
        <input type="text" class="form-control"  name="institution" id="institution" value="${vo5.institution }" style="ime-mode:active">
     </div>
     <div>
        <label for="langlicencename">시험종류</label>
        <input type="text" class="form-control"  name="langlicencename" id="langlicencename" value="${vo5.langlicencename }" style="ime-mode:active">
     </div> 
     <div>
        <label for="langpoint">점수</label>
        <input type="text" class="form-control"  name="langpoint" id="langpoint" value="${vo5.langpoint }" style="ime-mode:active">
     </div>
     
     <div>
        <label for="langGrade">급수</label>
        <input type="text" class="form-control"  name="langGrade" id="langGrade" value="${vo5.langGrade }" style="ime-mode:active">
     </div>
     <div>
     	<c:import url="resume_date4.jsp"/>             
	</div>
    
     </div>
	</section>

     &nbsp;
     
  	 <section id="registerds">
    <div class="well" id="award">
     <c:if test="${!empty vo.award}">
     <h3>수상내역</h3>
      <label for="award">수상명</label>
        <input type="text" class="form-control"  name="award" id="award" value="${vo.award }" style="ime-mode:active">
        </c:if>
        </div>
        </section>
     &nbsp;
 <section id="registerds">
     <h3>자기소개서</h3>
      <div>	
    	<!-- <label for="introduce">자기소개서</label>
        <textarea class="form-control" rows="3"></textarea> -->
        
        <c:import url="/main/smarteditorTestjsp.do">
			<c:param name="name" value="${vo.introduce }"></c:param>
		</c:import>
        
        
   </div>
   </section>
      &nbsp;
	 <button type="button" id="hopeworkbt" class="btn btn-success" value="희망근무">희망근무</button>
       <section id="registerds">
	 <div  id="hopework">
      <h3>희망근무 선택</h3>
      <div>	
    	<label for="hopeworkform">근무형태</label>
    	<select class="form-control" name="hopeworkform" id="hopeworkform" >
        	<option value="근무형태 선택" <c:if test="${vo2.hopeworkform=='근무형태 선택'}">            	
            		selected="selected"
            	</c:if>>근무형태 선택</option>
        	<option value="정규직" <c:if test="${vo2.hopeworkform=='정규직'}">            	
            		selected="selected"
            	</c:if>>정규직</option>
        	<option value="교육생 (정규직 전환가능)" <c:if test="${vo2.hopeworkform=='교육생 (정규직 전환가능)'}">            	
            		selected="selected"
            	</c:if>>교육생</option>
        	<option value="별정직" <c:if test="${vo2.hopeworkform=='별정직'}">            	
            		selected="selected"
            	</c:if>>별정직</option>
        	<option value="파트" <c:if test="${vo2.hopeworkform=='파트'}">            	
            		selected="selected"
            	</c:if>>파트</option>
        	<option value="전임" <c:if test="${vo2.hopeworkform=='전임'}">            	
            		selected="selected"
            	</c:if>>전임</option>
        	<option value="계약직 (정규직 전환가능)" <c:if test="${vo2.hopeworkform=='계약직 (정규직 전환가능)'}">            	
            		selected="selected"
            	</c:if>>계약직</option>
        	<option value="병역특례" <c:if test="${vo2.hopeworkform=='병역특례'}">            	
            		selected="selected"
            	</c:if>>병역특례</option>
        	<option value="인턴직 (정규직 전환가능)" <c:if test="${vo2.hopeworkform=='인턴직 (정규직 전환가능)'}">            	
            		selected="selected"
            	</c:if>>인턴직</option>
        	<option value="아르바이트" <c:if test="${vo2.hopeworkform=='아르바이트'}">            	
            		selected="selected"
            	</c:if>>아르바이트</option>
        	<option value="파견직" <c:if test="${vo2.hopeworkform=='파견직'}">            	
            		selected="selected"
            	</c:if>>파견직</option>
        	<option value="해외취업" <c:if test="${vo2.hopeworkform=='해외취업'}">            	
            		selected="selected"
            	</c:if>>해외취업</option>
        	<option value="위촉직" <c:if test="${vo2.hopeworkform=='위촉직'}">            	
            		selected="selected"
            	</c:if>>위촉직</option>
        	<option value="프리랜서" <c:if test="${vo2.hopeworkform=='프리랜서'}">            	
            		selected="selected"
            	</c:if>>프리랜서</option>
        </select>
       </div>
       <div>
    	<label for="hopepay">희망연봉</label>
    	<select class="form-control" name="hopepay" id="hopepay" >
        	<option value="회사내규에 따름" <c:if test="${vo2.hopepay=='회사내규에 따름'}">            	
            		selected="selected"
            	</c:if>>회사내규에 따름</option>
        	<option value="1400만원이하" <c:if test="${vo2.hopepay=='1400만원이하'}">            	
            		selected="selected"
            	</c:if>>1400만원이하</option>
        	<option value="1400~1600만원" <c:if test="${vo2.hopepay=='1400~1600만원'}">            	
            		selected="selected"
            	</c:if>>1400~1600만원</option>
        	<option value="1600~1800만원"  <c:if test="${vo2.hopepay=='1600~1800만원'}">            	
            		selected="selected"
            	</c:if>>1600~1800만원</option>
        	<option value="1800~2000만원"  <c:if test="${vo2.hopepay=='1800~2000만원'}">            	
            		selected="selected"
            	</c:if>>1800~2000만원</option>
        	<option value="2000~2200만원"  <c:if test="${vo2.hopepay=='2000~2200만원'}">            	
            		selected="selected"
            	</c:if>>2000~2200만원</option>
        	<option value="2200~2400만원" <c:if test="${vo2.hopepay=='2200~2400만원'}">            	
            		selected="selected"
            	</c:if>>2200~2400만원</option>
        	<option value="2400~2600만원" <c:if test="${vo2.hopepay=='2400~2600만원'}">            	
            		selected="selected"
            	</c:if>>2400~2600만원</option>
        	<option value="2600~2800만원" <c:if test="${vo2.hopepay=='2600~2800만원'}">            	
            		selected="selected"
            	</c:if>>2600~2800만원</option>
        	<option value="2800~3000만원" <c:if test="${vo2.hopepay=='2800~3000만원'}">            	
            		selected="selected"
            	</c:if>>2800~3000만원</option>
        	<option value="3000~4000만원" <c:if test="${vo2.hopepay=='3000~4000만원'}">            	
            		selected="selected"
            	</c:if>>3000~4000만원</option>
        	<option value="4000~5000만원" <c:if test="${vo2.hopepay=='4000~5000만원'}">            	
            		selected="selected"
            	</c:if>>4000~5000만원</option>
        	<option value="5000~6000만원" <c:if test="${vo2.hopepay=='5000~6000만원'}">            	
            		selected="selected"
            	</c:if>>5000~6000만원</option>
        	<option value="6000~7000만원" <c:if test="${vo2.hopepay=='6000~7000만원'}">            	
            		selected="selected"
            	</c:if>>6000~7000만원</option>
        	<option value="7000~8000만원" <c:if test="${vo2.hopepay=='7000~8000만원'}">            	
            		selected="selected"
            	</c:if>>7000~8000만원</option>
        	<option value="8000~9000만원" <c:if test="${vo2.hopepay=='8000~9000만원'}">            	
            		selected="selected"
            	</c:if>>8000~9000만원</option>
        	<option value="9000~1억원" <c:if test="${vo2.hopepay=='9000~1억원'}">            	
            		selected="selected"
            	</c:if>>9000~1억원</option>
        	<option value="면접 후 결정" <c:if test="${vo2.hopepay=='면접 후 결정'}">            	
            		selected="selected"
            	</c:if>>면접 후 결정</option>
        	
        </select>
       </div>
       
       
       <h3>희망근무지역</h3>
        <div>
       
       <label for="시도">시도</label>
       	<select class="form-control" name="sido" id="locationSiDo" style="ime-mode:active" >
   			<option value="${vo7.sido }">시도</option>
        	
        </select>   
        </div>
       	<div>
       
       <label for="구군">구군</label>
       <select class="form-control" name="gugun" id="locationGugun" style="ime-mode:active" >
       	<option value="${vo8.gugun }">구군</option>
       </select>

        </div>
       
        <div>
        <%-- <c:import url="btype.jsp"/> --%>
        <label for="btypename1">업종1차</label>
        <select name="btypename1" id="btypename1" >
        <option value="${vo9.btypename1 }" >업종1차</option>
        </select>
        </div>
        <div>
        <label for="btypename2">업종2차</label>
        
        <select name="btypename2" id="btypename2" >
        <option value="${vo10.btypename2 }" >업종2차</option>
        </select>
        </div>
        <div>
        <label for="btypename3">업종3차</label>
         <select name="btypename3" id="btypename3">
        <option value="${vo11.btypename3 }">업종3차</option>
        </select>
        </div>
        <div>
        <label for="firstname">직종1차</label>
         <select name="firstname" id="selectFirst">
        <option value="${vo12.firstname }">직종1차</option>
        </select>
     
        </div>
        <div>
        <label for="secondname">직종2차</label>
         <select name="secondname" id="selectSecond">
        <option value="${vo13.secondname }">직종2차</option>
        </select>
     	
        </div>
        <div>
        <label for="thirdname">직종3차</label>
        <select name="thirdname" id="selectThird">
        <option value="${vo14.thirdname }" >직종3차</option>
        </select>
        </div>
        
        <div>
        <label for="hopeworkdate">근무일시</label>
        <select class="form-control" name="hopeworkdate" id="hopeworkdate" >
        	<option value="09시~06시"  <c:if test="${vo2.hopeworkdate=='09시~06시'}">            	
            		selected="selected"
            	</c:if>>09시~06시</option>
        	<option value="10시~06시"  <c:if test="${vo2.hopeworkdate=='10시~06시'}">            	
            		selected="selected"
            	</c:if>>10시~06시</option>
        	<option value="자율근무제"  <c:if test="${vo2.hopeworkdate=='자율근무제'}">            	
            		selected="selected"
            	</c:if>>자율근무제</option>
        </select>
        </div>
        </div>
        </section>
 
   &nbsp;
    <div id="companycheck">
    <label>기업 인사담당자의 입사제의 및 면접제의를 받으시겠어요?</label>
    <label class="radio-inline">
  		<input type="radio" name="opencheck" id="opencheck" value="${vo.opencheck}" <c:if test="${vo.opencheck=='Y'}">            	
            		checked="checked"
            	</c:if>>공개
		</label>
		
		<label class="radio-inline">
  		<input type="radio" name="opencheck" id="opencheck" value="${vo.opencheck}" <c:if test="${vo.opencheck=='N'}">            	
            		checked="checked"
            	</c:if>>비공개
	</label>
    </div>
    <br>
</fieldset> 
</form>
</div> 
    <input class="btn btn-success" type="submit" value="이력서 수정">
</div>      
</article>
<%@include file="../main/inc/bottom.jsp" %>

