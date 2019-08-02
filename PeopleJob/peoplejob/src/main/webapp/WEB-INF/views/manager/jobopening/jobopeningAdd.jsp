<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>

<!-- required -->

<style>
	table{width: 100%;}
	h2{font-weight: bold; color: black;padding: 10px;width: 100%;margin-left: 20px;}
	.inputSizeS, table input, .hasDatepicker, select{width: 180px;height: 10px;font-size: 12px;}
	.hasDatepicker{float: left;}
	.float{float: left; font-weight: bold;}
	span.control-indicator {margin-top: 6px;}
	#memberT th{width: 90px;font-size: 15px;font-weight: bold; color: black; height: 34px;}
	#memberT td:nth-last-of-type(1) {width: 500px;}
	label.control.outlined.control-radio.radio-primary.inputSizeS {float: left;width: 105px;line-height: 31px;}
	.FST{width: 210px; margin: 0;height: 30px;font-size: 12px;}
	table input[type=text]{margin: 0;height: 30px;font-size: 12px;}
	span.AED, span.AED2{margin-left: 37px;width: 100%;}
	#certificationtypeT input, #resumeTitle, #introduceT input{width: 100%} 
	textarea{width: 100%;}
	input#addressdetail {height: 30px;font-size: 12px;}
	label.control.control-checkbox.checkbox-primary { width: 120px; margin: 0; float: left; font-size: 12px;}
	input#recruit { float: left;width: 181px;}
	div#recruitDiv { float: left; padding-top: 5px; padding-left: 5px;}
	#divSide{padding: 10px;}
	#divSide select{width: 158px;}
	#divSide td{text-align: center;}
	h3{color: black;  font-size: 1.5em;  margin: 5px 5px 5px 30px; font-weight: bold;}
	.floating { width:315px; position:absolute;top: 11.5%; left: 76%;-webkit-transition: 0.5s ease; transition: 0.5s ease; }
	.floating.on {position:fixed; top:11%; z-index: 999}
	</style>
<script src="<c:url value='/resources/js/resumeHope.js'/>"></script>	
<script type="text/javascript">
	$(function(){
		$("#jobopeningAdd").click(function(){
			$("form[name=jobopeningForm]").attr("action","<c:url value='/manager/jobopening/jobopeningAdd.do'/>")
			$("form[name=jobopeningForm]").submit();
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
	
<div class="content-wrapper">
          <div class="content">		
			<div class="row">
<h2>채용공고 등록</h2>
	<div class="col-lg-9">
		<div class="card card-default">
<div class="card-body">
	
	<table id="memberT">
	<tbody>
		<tr>
			<th><label for="membername">담당자</label></th>
			<td>
				<input type="text" class="form-control inputSizeS" name="membername" id="membername" placeholder="담당자를 입력하세요" >
			</td>
		</tr>
		<tr>
			<th>사진 변경~!</th>	
			<td>사진 출력 예정</td>
		</tr>
		<tr>
			<th><label for="email">이메일</label></th>
			<td>
			<input type="text" class="form-control inputSizeS" name="email" id="email" placeholder="이메일을 입력하세요">
	</td>	
</tr>
<tr>
	<th><label for="tel">전화번호</label></th>
	<td>
		<input type="text" class="form-control inputSizeS" name="tel" id="tel" placeholder="010-0000-0000">
	</td>
</tr>
<tr>
	<th><label for="site">홈페이지</label></th>
	<td>
		<input type="text" class="form-control inputSizeS" name="site" id="site" placeholder="홈페이지 주소를 입력하세요">
	</td>
</tr>
<tr>
	<th><label for="companyname">근무회사</label></th>
	<td>
		<input type="text" class="form-control inputSizeS" name="companyname" id="companyname" placeholder="회사명을 입력하세요">
	</td>
</tr>
<tr>
	<th><label for="addressdetail">체용 제목</label></th>
	<td>
		<input type="text" class="form-control" name="addressdetail" id="addressdetail" placeholder="공고 제목을 입력하세요 ">
	</td>
</tr>
<tr>
	<th>
		<label for="selectBtype1">업종</label>
	</th>
	<td>
		<select class="custom-select my-1 FST" name="selectBtype1" id="selectBtype1">
			<option>1차 업종</option>
		</select>
		<select class="custom-select my-1 FST" name="selectBtype2" id="selectBtype2">
			<option>2차 업종</option>
		</select>
		<select class="custom-select my-1 FST" name="selectBtype3" id="selectBtype3" name="btypeCode3">
			<option>3차 업종</option>
		</select>
	</td>
</tr>
<tr>
	<th><label for="selectFirst">직종</label></th>
	<td>
		<select class="custom-select my-1 FST" name="selectFirst" id="selectFirst">
			<option>1차 직종</option>
		</select>
		<select class="custom-select my-1 FST" name="selectSecond" id="selectSecond">
		
			<option>2차 직종</option>
		</select>
		<select class="custom-select my-1 FST" name="selectThird" id="selectThird" name="thirdCode">
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
	<th><label for="addressdetail">근무지 주소</label></th>
	<td>
		<input type="text" class="form-control" name="addressdetail" id="address" placeholder="member테이블에서 가져와서 뿌리기 ">
	</td>
</tr>
<tr>
	<th><label for="subwayinfo">인근 지하철</label></th>
	<td>
		<input type="text" class="form-control" name="subwayinfo" id="subwayinfo" placeholder="인근 지하철 입력하세요 ">
	</td>
</tr>
<tr>
	<th><label>근무기간</label></th>
	<td>
		<label class="control outlined control-radio radio-primary inputSizeS">하루
		<input type="radio" name="workdate" />
		<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">1주일 이하
			<input type="radio" name="workdate"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">1주일~1개월
			<input type="radio" name="workdate" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">1개월~3개월
			<input type="radio" name="workdate"/>
			<span class="control-indicator"></span>
		</label>
			<label class="control outlined control-radio radio-primary inputSizeS">3개월~6개월
			<input type="radio" name="workdate" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">6개월~1년
			<input type="radio" name="workdate"/>
			<span class="control-indicator"></span>
		</label>
			<label class="control outlined control-radio radio-primary inputSizeS">1년이상
			<input type="radio" name="workdate" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">기간협의
			<input type="radio" name="workdate"/>
			<span class="control-indicator"></span>
		</label>
	</td>
</tr>
<tr>
	<th><label>근무 요일</label></th>
	<td>
		<label class="control outlined control-radio radio-primary inputSizeS">월~일
			<input type="radio" name="dayofweek" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">월~토
			<input type="radio" name="dayofweek"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주말(토,일)
			<input type="radio" name="dayofweek" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주 6일
			<input type="radio" name="dayofweek"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주 5일
			<input type="radio" name="dayofweek" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주 4일
			<input type="radio" name="dayofweek"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주 3일
			<input type="radio" name="dayofweek" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주 2일
			<input type="radio" name="dayofweek"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주 1일
			<input type="radio" name="dayofweek"/>
			<span class="control-indicator"></span>
		</label>
	</td>
</tr>
<tr>
	<th><label for="worktime">근무 시간</label></th>
	<td>
		<input type="text" class="form-control" name="worktime" id="worktime" placeholder="근무시간을 입력하세요 ">
	</td>
</tr>
<tr>
	<th><label for="pay">급여 방식</label></th>
	<td>
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
	<th><label for="addressdetail">복리후생</label></th>
	<td>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="memberCk" id="memberCk" value="국민연금" />
			<div class="control-indicator"></div>국민연금
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="memberCk" id="memberCk" value="건강보험" />
			<div class="control-indicator"></div>건강보험
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="memberCk" id="memberCk" value="고용보험" />
			<div class="control-indicator"></div>고용보험
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="memberCk" id="memberCk" value="산재보험" />
			<div class="control-indicator"></div>산재보험
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="memberCk" id="memberCk" value="건강보험" />
			<div class="control-indicator"></div>건강보험
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="memberCk" id="memberCk" value="야근수당" />
			<div class="control-indicator"></div>야근수당
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="memberCk" id="memberCk" value="식대(점심)" />
			<div class="control-indicator"></div>식대(점심)
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="memberCk" id="memberCk" value="식대(저녁)" />
			<div class="control-indicator"></div>식대(저녁)
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="memberCk" id="memberCk" value="교통비" />
			<div class="control-indicator"></div>교통비
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="memberCk" id="memberCk" value="통신비" />
			<div class="control-indicator"></div>통신비
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="memberCk" id="memberCk" value="퇴직금" />
			<div class="control-indicator"></div>퇴직금
		</label>
	</td>
</tr>
<tr>
	<th><label for="gender">성별</label></th>	
	<td>
		<label class="control outlined control-radio radio-primary inputSizeS">성별무관
			<input type="radio" name="gender" id="gender" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">여자
			<input type="radio" name="gender"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">남자
			<input type="radio" name="gender"/>
			<span class="control-indicator"></span>
		</label>
	</td>
</tr><tr>
	<th><label for="agelimit">연령</label></th>
	<td>
		<label class="control outlined control-radio radio-primary inputSizeS">나이 무관
			<input type="radio" name="agelimit" id="agelimit" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">30세이하
			<input type="radio" name="agelimit"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">30~40세
			<input type="radio" name="agelimit"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">40~50세
			<input type="radio" name="agelimit"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">50~60세
			<input type="radio" name="agelimit"/>
			<span class="control-indicator"></span>
		</label>
	</td>
</tr><tr>
	<th><label for="academicCondition">학력조건</label></th>
	<td>
		<label class="control outlined control-radio radio-primary inputSizeS">학력무관
			<input type="radio" name="academicCondition"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">고졸
			<input type="radio" name="academicCondition"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">대졸(2,3년)
			<input type="radio" name="academicCondition"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">대졸(4년)
			<input type="radio" name="academicCondition"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">석사
			<input type="radio" name="academicCondition"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">박사
			<input type="radio" name="academicCondition"/>
			<span class="control-indicator"></span>
		</label>
	</td>
</tr><tr>
	<th><label for="career">경력사항</label></th>
	<td>
		<label class="control outlined control-radio radio-primary inputSizeS">경력무관
			<input type="radio" name="career"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">1~3년
			<input type="radio" name="career"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">4~6년
			<input type="radio" name="career"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">7~9년
			<input type="radio" name="career"/>
			<span class="control-indicator"></span>
		</label>
	</td>
</tr><tr>
	<th><label for="sweetener">우대조건</label></th>
	<td>
		<input type="text" class="form-control" name="sweetener" id="sweetener" placeholder="우대조건을 입력하세요 ">
	</td>
</tr><tr>
	<th><label for="recruit">모집인원</label></th>
	<td>
		<input type="text" class="form-control" name="recruit" id="recruit" placeholder="모집인원"><div id="recruitDiv">명</div>
	</td>
</tr><tr>
	<th><label for="recruitmentTarget">모집대상</label></th>
	<td>
		<input type="text" class="form-control" name="recruitmentTarget" id="recruitmentTarget" placeholder="모집대상을 입력하세요 ">
	</td>
</tr>
<tr>
	<th><label for="endDate">모집종료일</label></th>
	<td>
		<c:import url="/inc/date.do">
	<c:param name="name" value="endDate"/>
	<c:param name="id" value="endDate"/>
</c:import>	

	</td>
</tr>
<tr>
	<th><label for="receiveway">접수방법</label></th>
	<td>
		<input type="text" class="form-control" name="receiveway" id="receiveway" placeholder="접수방법을 입력하세요 ">
					</td>
				</tr>
				<tr>
					<th><label for="submit">제출서류</label></th>
					<td>
						<input type="text" class="form-control" name="submit" id="submit" placeholder="제출서류를 입력하세요 ">
					</td>
				</tr>
				<tr>
					<th><label for="applicationhandbook">상세모집요강</label></th>
					<td>
						<input type="text" class="form-control" name="applicationhandbook" id="applicationhandbook" placeholder="상세모집요강을 입력하세요 ">
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
			<th>불러오기</th>
			<td>
				<select class="custom-select my-1 FST" >
					<option>선택하세요</option>
				</select>
			</td>		
		</tr>
		<tr>
			<td colspan="2">
				<button id="jobopeningAdd">등록</button>
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