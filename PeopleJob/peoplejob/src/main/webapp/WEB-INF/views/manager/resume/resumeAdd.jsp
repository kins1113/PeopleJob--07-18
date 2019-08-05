<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>
<style>
	table{width: 100%;}
	h2{font-weight: bold; color: black;padding: 10px;width: 100%;margin-left: 20px;}
	.inputSizeS, table input, .hasDatepicker, select{width: 180px;height: 10px;font-size: 12px;}
	.hasDatepicker{float: left;}
	.float{float: left; font-weight: bold;}
	span.control-indicator {margin-top: 6px;}
	#memberT th{width: 130px;font-size: 15px;font-weight: bold; color: black; height: 34px;}
	label.control.outlined.control-radio.radio-primary.inputSizeS {float: left;width: 105px;line-height: 31px;}
	.FST{width: 210px; margin: 0;height: 30px;font-size: 12px;}
	table input[type=text]{margin: 0;height: 30px;font-size: 12px;}
	span.AED, span.AED2{margin-left: 37px;width: 100%;}
	#certificationtypeT input, #resumeTitle, #introduceT input{width: 100%} 
	textarea{width: 100%;}
	input#addressdetail {height: 30px;font-size: 12px;}
	label.control.control-checkbox.checkbox-primary { width: 120px; margin: 6px; float: left; font-size: 12px;}
	div#recruitDiv { float: left; padding-top: 5px; padding-left: 5px;}
	td.td1 { width: 470px;}
	tdMemberImg{border: 1px solid silver;}
	#divSide{padding: 10px;}
	#divSide tr:nth-of-type(1) select{width: 124px;float: left;}
	#divSide tr:nth-of-type(3) select{    width: 70px;   float: left;   padding: 0;   margin: 0;   height: 29px;}
	#divSide td{text-align: center;}
	h3{color: black;  font-size: 1.5em;  margin: 5px 5px 5px 30px; font-weight: bold;}
	.floating { width:395px; position:absolute;top: 10%; left: 76%;-webkit-transition: 0.5s ease; transition: 0.5s ease; }
	.floating.on {position:fixed; top:11%; z-index: 999}
	.necessary{    color: #4c84ff;  font-size: 0.7em;}
	.necessaryInfo{color: #4c84ff; font-size: 1.2em;}
	.info{font-weight: bold;color: black;text-align: left;padding-left: 20px;}
	#infoTable th {text-align: center;    border: 1.5px solid;    padding: 4px;    background: aliceblue;    color: #000000a6;}
	#infoTable td {border-bottom: 1px dashed #204bab91;}
	#infoTable tr:last-of-type td {border-bottom: none;}
	input#searchKey {   width: 50%;   float: left; margin-top: 4px;height: 32px;}
	select#searchCon {    float: left;    margin: 0 5px 0 0;    height: 32px;}
	button#btSideSearch {    padding: 0;   margin-top: 7px;}
	#resumeAdd,#resumeList {width: 100%;    height: 30px;    padding: 0;}
</style>



<script src="<c:url value='/resources/js/resumeHope.js'/>"></script>

<script type="text/javascript">
$(function(){
	$("#resumeAdd").click(function(){
		$("form[name=jobopeningForm]").attr("action","<c:url value='/manager/resume/resumeAdd.do'/>")
		$("form[name=jobopeningForm]").submit();
	});
	//사이드에 멤버 정보를 가져오는 ajax 
	//["user1234","231123","kins1113","kk1","k1231","ki423413".....]
	$.ajax({
		url:"<c:url value='/manager/member/getMemeberCompany.do'/>",
		type:"post",
		data:"type=1",
		success:function(res){
			$.each(res, function(idx,item){
				var opEl=$("<option value='"+item+"'></option>");
				opEl.html(item);
				$("#selectMemberId").append(opEl);
			})
		},
		error:function(htx,status,error){
			alert(status+":"+error);
		}
	});
	//아이디 선택 시 기본 정보가져오기
	/* {"searchCondition":"","searchKeyword":"","searchUseYn":"","currentPage":1,"blockSize":0,
		"firstRecordIndex":1,"lastRecordIndex":1,"recordCountPerPage":0,"memberCode":34,
		"memberid":"kins1113","regdate":1562756746000,"membername":"김옥환","zipcode":"557-587",
		"address":"송파구 ","addressdetail":"서초동 123-3","withdrawaldate":null,"pwd":"9138366",
		"birth":"1992-11-13","membergender":"남","email":"kins1113@naver.com","tel":"01045029213",
		"authorityCode":1,"companyCode":0} */
	$("#selectMemberId").change(function(){
		var id=$(this).val();
		alert("아이디 선택~! id="+id);
		$.ajax({
			url:"<c:url value='/manager/member/getMemberSelectId.do'/>",
			type:"post",
			data:"id="+id,
			success:function(res){
				$("#membername").val(res.membername);
				$("#birth").val(res.birth);
				$("#email").val(res.email);
				$("#tel").val(res.tel);
				$("#address").val(res.address);
				$("#addressdetail").val(res.addressdetail);
			},
			error:function(htx,status,error){
				alert(status+":"+error);
			}
		});
	});
	
	//1차 직종 가져오기 /manager/occupantion/firstList.do
	selectFirst();
	selectFirst1();
	selectFirst2();
	//1차 직종 클릭하면 2차직종 가져오기 
	$("#selectFirst").change(function(){
		var firstCode=$(this).find("option:selected").val();
		if(firstCode!=0){
			selectSecond(firstCode);
		}
	});
	$("#selectFirst1").change(function(){
		var firstCode=$(this).find("option:selected").val();
		if(firstCode!=0){
			selectSecond1(firstCode);
		}
	});
	$("#selectFirst2").change(function(){
		var firstCode=$(this).find("option:selected").val();
		if(firstCode!=0){
			selectSecond2(firstCode);
		}
	});
	//2차 직종 클릭하면 3차직종 가져오기
	$("#selectSecond").change(function(){
		var secondCode=$(this).find("option:selected").val();
		if(secondCode!=0){
			selectThird(secondCode);
		}
	});
	$("#selectSecond1").change(function(){
		var secondCode=$(this).find("option:selected").val();
		if(secondCode!=0){
			selectThird1(secondCode);
		}
	});
	$("#selectSecond2").change(function(){
		var secondCode=$(this).find("option:selected").val();
		if(secondCode!=0){
			selectThird2(secondCode);
		}
	});
	
	//1차 업종 가져오기
	getBtype1();
	//1차업종 change 2차 업종 가져오기
	$("#selectBtype1").change(function(){
		var bytpeCode1=$(this).find("option:checked").val();
		getBtype2(bytpeCode1);
	});
	//2차업종 change 3차 업종 가져오기
	$("#selectBtype2").change(function(){
		var bytpeCode3=$(this).find("option:checked").val();
		getBtype3(bytpeCode3);
	});
	
	//지역정보를 가져오기 - 시도
	getLocation();
	getLocation10();
	
	//지역정보를 가져오는 
	$("#locationSiDo").change(function(){
		var sidoCode=$(this).find("option:checked").val();
		//값을 가져오는 메서드
		getLocation2(sidoCode);
	});
	$("#locationSiDo10").change(function(){
		var sidoCode=$(this).find("option:checked").val();
		//값을 가져오는 메서드
		getLocation20(sidoCode);
	});
	//사이드 메뉴 위치 조정
	 if ($("div.floating").length > 0) {
		    var obj = $("div.floating").offset().top;
		    var subConH = $(".sub_contents").height();
		 
		    function sclTop() {
		        var sclTop = $(this).scrollTop();
		        var sclThis = $("div.floating");
		 
		        if (sclTop > obj)
		        {
		            sclThis.addClass('on');
		 
		        }
		        else
		        {
		            sclThis.removeClass('on');
		        }
		    }
		    $(window).scroll(function () {
		        sclTop();
		    });
		}
});
	
</script>

	<form method="post" name="jobopeningForm">
	<!-- 멤버 코드 -->
	<input type="text" name="memberCode" value="57"/>
	
<div class="content-wrapper">
          <div class="content">		
			<div class="row">
<h2>이력서 등록</h2>
	<div class="col-lg-9">
		<div class="card card-default">
<div class="card-body">
	
	<table id="memberT">
	<tbody>
	<tr>
		<th><label for="membername">이름<span class="necessary">*</span></label></th>
		<td class="td1">
			<input type="text" class="form-control inputSizeS" name="membername" id="membername" placeholder="이름을 입력하세요" >
		</td>
		<th>사진 변경~!</th>	
		<td rowspan="5" id="tdMemberImg">사진 출력 예정</td><!--  picture  -->
	</tr>
		<tr>
		<th><label for="birth">생년월일<span class="necessary">*</span></label></th>
		<td colspan="2">
		<c:import url="/inc/date.do">
			<c:param name="name" value="birth"/>
			<c:param name="id" value="birth"/>
		</c:import>
</td>	
	<tr>
		<th><label for="email">이메일<span class="necessary">*</span></label></th>
		<td colspan="2">
		<input type="text" class="form-control inputSizeS" name="email" id="email" placeholder="이메일을 입력하세요">
	</td>	
</tr>
<tr>
	<th><label for="tel">전화번호<span class="necessary">*</span></label></th>
	<td colspan="2">
		<input type="text" class="form-control inputSizeS" name="tel" id="tel" placeholder="010-0000-0000">
	</td>
</tr>
<tr>
	<th><label for="address">주소<span class="necessary">*</span></label></th>
	<td colspan="2">
		<input type="text" class="form-control inputSizeS" name="address" id="address" placeholder="주소를 입력하세요">
	</td>
</tr>
<tr>
	<th><label for="addressdetail">상세 주소<span class="necessary">*</span></label></th>
	<td colspan="2">
		<input type="text" class="form-control inputSizeS" name="addressdetail" id="addressdetail" placeholder="상세주소를 입력하세요">
	</td>
</tr>
<tr>
	<th><label for=resumeTitle>이력서 제목<span class="necessary">*</span></label></th>
	<td colspan="3">
		<input type="text" class="form-control" name="resumeTitle" id="resumeTitle" placeholder="제목을 입력하세요 ">
	</td>
</tr>
<tr>
	<th rowspan="2">
		<label for="selectBtype1">근무지<span class="necessary">*</span></label>
	</th>
	<td colspan="3">
		<select class="custom-select my-1 FST" id="locationSiDo">
			<option>시/도</option>
		</select>
		<select class="custom-select my-1 FST" name="localCode" id="locationGugun">
			<option>구/군</option>
		</select>
	</td>
</tr>
<tr>
	<td colspan="3">
		<select class="custom-select my-1 FST"  id="locationSiDo10">
			<option>시/도</option>
		</select>
		<select class="custom-select my-1 FST" name="localCode" id="locationGugun20">
			<option>구/군</option>
		</select>
	</td>
</tr>

<tr>
	<th>
		<label for="selectBtype1">업종<span class="necessary">*</span></label>
	</th>
	<td colspan="3">
		<select class="custom-select my-1 FST" id="selectBtype1">
			<option>1차 업종</option>
		</select>
		<select class="custom-select my-1 FST" id="selectBtype2">
			<option>2차 업종</option>
		</select>
		<select class="custom-select my-1 FST" name="btypeCode3" id="selectBtype3" name="btypeCode3">
			<option>3차 업종</option>
		</select>
	</td>
</tr>
<tr>
	<th><label for="selectFirst">직종<span class="necessary">*</span></label></th>
	<td colspan="3">
		<select class="custom-select my-1 FST" id="selectFirst">
			<option>1차 직종</option>
		</select>
		<select class="custom-select my-1 FST" id="selectSecond">
			<option>2차 직종</option>
		</select>
		<select class="custom-select my-1 FST" id="selectThird" name="thirdCode">
			<option>3차 직종</option>
		</select>
		<select class="custom-select my-1 FST" id="selectFirst1">
			<option>1차 직종</option>
		</select>
		<select class="custom-select my-1 FST" id="selectSecond1">
			<option>2차 직종</option>
		</select>
		<select class="custom-select my-1 FST" id="selectThird1" name="thirdCode">
			<option>3차 직종</option>
		</select>
		<select class="custom-select my-1 FST" id="selectFirst2">
			<option>1차 직종</option>
		</select>
		<select class="custom-select my-1 FST" id="selectSecond2">
			<option>2차 직종</option>
		</select>
		<select class="custom-select my-1 FST" id="selectThird2" name="thirdCode">
			<option>3차 직종</option>
		</select> 
	</td>
</tr>
<tr>
	<th><label for="hopepay"></label>희망 연봉<span class="necessary">*</span></th>
	<td colspan="3">
		<input type="text" class="form-control" name="hopepay" id="hopepay" placeholder="희망 급여를 입력하세요">
	</td>
</tr>
<tr>
	<th><label>근무기간(이것은 없는 듯...)<span class="necessary">*</span></label></th>
	<td colspan="3">
		<label class="control outlined control-radio radio-primary inputSizeS">하루
		<input type="radio" name="hopeworkform" value="하루" />
		<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">1주일 이하
			<input type="radio" name="hopeworkform" value="1주일 이하"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">1주일~1개월
			<input type="radio" name="hopeworkform" value="1주일~1개월" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">1개월~3개월
			<input type="radio" name="hopeworkform" value="1개월~3개월"/>
			<span class="control-indicator"></span>
		</label>
			<label class="control outlined control-radio radio-primary inputSizeS">3개월~6개월
			<input type="radio" name="hopeworkform" value="3개월~6개월" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">6개월~1년
			<input type="radio" name="hopeworkform" value="6개월~1년"/>
			<span class="control-indicator"></span>
		</label>
			<label class="control outlined control-radio radio-primary inputSizeS">1년이상
			<input type="radio" name="hopeworkform" value="1년이상" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">기간협의
			<input type="radio" name="hopeworkform" value="기간협의"/>
			<span class="control-indicator"></span>
		</label>
	</td>
</tr>
<tr>
	<th><label for="hopeworkdate">근무 일시<span class="necessary">*</span></label></th>
	<td colspan="3">
		<label class="control outlined control-radio radio-primary inputSizeS">월~일
			<input type="radio" name="hopeworkdate" value="월~일"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">월~토
			<input type="radio" name="hopeworkdate" value="월~토"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주말(토,일)
			<input type="radio" name="hopeworkdate" value="주말(토,일)" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주 6일
			<input type="radio" name="hopeworkdate" value="주 6일"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주 5일
			<input type="radio" name="hopeworkdate"  value="주 5일"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주 4일
			<input type="radio" name="hopeworkdate" value="주 4일"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주 3일
			<input type="radio" name="hopeworkdate" value="주 3일" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주 2일
			<input type="radio" name="hopeworkdate" value="주 2일"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주 1일
			<input type="radio" name="hopeworkdate" value="주 1일"/>
			<span class="control-indicator"></span>
		</label>
	</td>
</tr>
<tr>
	<th><label for="education">최종학력</label></th>
	<td colspan="3">
		<select class="custom-select my-1 FST" id="education" name="education">
		<option value="">선택하세요</option>
		<option value="초등학교">초등학교</option>
		<option value="중학교">중학교</option>
		<option value="고등학교">고등학교</option>
		<option value="대학교">대학교</option>
	</select>
	</td>
</tr>
<tr>
	<th><label for="schoolName">학교명</label></th>
	<td class="td1">
		<input type="text" class="form-control" name="schoolName" id="schoolName" placeholder="학교명을 입력하세요 ">
	</td>
	<th><label for="schoollocal">지역</label></th>
	<td>
	<select class="custom-select my-1 FST" name="schoollocal" id="schoollocal" >
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
	</td>
</tr>
<tr>
	<th><label for="graduate">졸업년도</label></th>
	<td colspan="3">
		<c:import url="/inc/date.do">
			<c:param name="name" value="graduate"/>
			<c:param name="id" value="graduate"/>
		</c:import>	
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="graduatecheck" id="graduatecheck" value="졸업" />
			<div class="control-indicator"></div>졸업여부
		</label>
	</td>
</tr>
<tr>
	<th><label for="pay">급여 방식<span class="necessary">*</span></label></th>
	<td colspan="3">
		<label class="control outlined control-radio radio-primary inputSizeS">월급
			<input type="radio" name="pay" id="pay" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">연봉
			<input type="radio" name="pay"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주급
			<input type="radio" name="pay"/>
			<span class="control-indicator"></span>
		</label>
	</td>
</tr>
<tr>
	<th><label for="gender">성별<span class="necessary">*</span></label></th>	
	<td colspan="3">
		<label class="control outlined control-radio radio-primary inputSizeS">여자
			<input type="radio" name="gender"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">남자
			<input type="radio" name="gender"/>
			<span class="control-indicator"></span>
		</label>
	</td>
</tr>
<tr>
	<th><label for="agelimit">연령<span class="necessary">*</span></label></th>
	<td colspan="3">
		<input type="text" class="form-control" name="sweetener" id="sweetener" placeholder="나이를 입력하세요 ">
	</td>
</tr>
<tr>
	<th><label for="workcheck">경력사항</label></th>
	<td colspan="3">
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="workcheck" id="workcheck" value="경력" />
			<div class="control-indicator"></div>경력있음
		</label>
	</td>
</tr>
<tr>
	<th><label for="academicCondition">회사명</label></th>
	<td colspan="3"><input type="text" class="form-control" name="sweetener" id="sweetener" placeholder="회사명을 입력하세요 "></td>
</tr>
<tr>
	<th><label for="career">제직기간</label></th>
	<td colspan="3">
		<c:import url="/inc/date.do">
			<c:param name="name" value="workterm"/>
			<c:param name="id" value="workterm"/>
		</c:import>	
		<c:import url="/inc/date.do">
			<c:param name="name" value="workterm2"/>
			<c:param name="id" value="workterm2"/>
		</c:import>	
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="workcondition" id="workcondition" value="재직중" />
			<div class="control-indicator"></div>재직여부
		</label>
	</td>
</tr>
<tr>
	<th><label for="jobgrade">직급</label></th>
	<td colspan="3"><input type="text" class="form-control" name="jobgrade" id="jobgrade" placeholder="직급을 입력하세요 "></td>
</tr>

<tr>
	<th><label for="chargeWork">담당 업무</label></th>
	<td colspan="3">
		<textarea rows="5" cols="200" name="chargeWork" id="chargeWork"></textarea>
	</td>
</tr>

<tr>
	<th><label for="introduce">자기소개서<span class="necessary">*</span></label></th>
	<td colspan="3">
		<textarea rows="13" cols="200" name="introduce" id="introduce"></textarea>
	</td>
</tr>
<tr>
	<th><label for="award">수상내역</label></th>
	<td colspan="3">
		<input type="text" class="form-control" name="award" id="award" placeholder="수상내역을 입력하세요"><div id="recruitDiv"></div>
	</td>
</tr>
<tr>
	<th><label for="lName">자격증 이름</label></th>
	<td colspan="3">
		<input type="text" class="form-control" name="lName" id="lName" placeholder="자격증을 입력하세요"><div id="recruitDiv"></div>
	</td>
</tr>
<tr>
	<th><label for="lGetdate">취득일</label></th>
	<td colspan="3">
		<c:import url="/inc/date.do">
			<c:param name="name" value="lGetdate"/>
			<c:param name="id" value="lGetdate"/>
		</c:import>	
	</td>
</tr>
<tr>
	<th><label for="lInstitution">발행기관</label></th>
	<td colspan="3">
		<input type="text" class="form-control" name="lInstitution" id="lInstitution" placeholder="발행기관을 입력하세요"><div id="recruitDiv"></div>
	</td>
</tr>
				</tbody>
			</table>
			
		</div>
	</div>
</div>

<div class="col-lg-3 floating">
<h3>버튼 </h3>
<div class="card card-default">
<div class="card-body" id="divSide">	
	<table>
		<tr>
			<td colspan="2">
				<span class="necessaryInfo">*</span><span class="info">표시된 것은 필수입니다.</span>
			</td>
		</tr>
		<tr>
			<th>불러오기</th>
			<td>
				<select class="custom-select my-1 FST" id="selectMemberId">
					<option>선택하세요</option>
				</select>
			</td>		
		</tr>
		<tr>
			<th>검색</th>
		</tr>
		<tr>
			<td colspan="2">
				<select class="custom-select my-1" id="searchCon">
					<option value="choice">선택</option>
					<option value="company">회사명</option>
					<option value="id">아이디</option>
				</select>
				<input type="text" class="form-control" 
				id="searchKey" placeholder="검색어를 입력하세요 ">
				<button type="button" id="btSideSearch" class="mb-1 btn btn-square btn-outline-mdi-cloud-search-outline">
			<i class=" mdi mdi-cloud-search-outline"></i>검색</button>
			</td>
		</tr>
		<tr>
			<table id="infoTable">
			</table>			
		</tr>	
		<tr>
			<td colspan="2">
			<button id="resumeAdd" class="mb-1 btn btn-outline-primary">
			<i class=" mdi mdi-star-outline mr-1"></i>등록</button>
			</td>		
		</tr>
		<tr>
			<td colspan="2">
			<button type="button" id="resumeList" class="mb-1 btn btn-outline-primary">
			<i class=" mdi mdi-star-outline mr-1"></i>목록으로</button>
			</td>		
		</tr>
	</table>
</div>
</div>
</div>
		</div>
	</div>
</div>
</form>


	

<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>