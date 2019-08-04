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
	#divSide tr:nth-of-type(1) select{width: 124px;float: left;}
	#divSide tr:nth-of-type(3) select{    width: 70px;   float: left;   padding: 0;   margin: 0;   height: 29px;}
	#divSide td{text-align: center;}
	h3{color: black;  font-size: 1.5em;  margin: 5px 5px 5px 30px; font-weight: bold;}
	.floating { width:390px; position:absolute;top: 11.5%; left: 71%;-webkit-transition: 0.5s ease; transition: 0.5s ease; }
	.floating.on {position:fixed; top:11%; z-index: 999}
	.floating th {   width: 60px; }
	.floating input[type=text] {    width: 47%;float:left;margin: 4px 4px 0 5px}
	button.mb-1.btn.btn-outline-info { height: 30px; margin-top: 4px; padding: 1px 16px 0 15px} 
	button#jobopeningAdd ,#goJobopeningList {  height: 39px;   width: 100%;   padding: 0;}
	button.mb-1.btn.btn-square.btn-outline-mdi-cloud-search-outline {    margin: 0;    padding: 5px;}
	#infoTable th {text-align: center;    border: 1.5px solid;    padding: 4px;    background: aliceblue;    color: #000000a6;}
	#infoTable td {border-bottom: 1px dashed #204bab91;}
	#infoTable tr:last-of-type td {border-bottom: none;}
	</style>
<script src="<c:url value='/resources/js/resumeHope.js'/>"></script>	
<script type="text/javascript">
	$(function(){
		$("#goJobopeningList").click(function(){
			location.href="<c:url value='/manager/jobopening/jobopeningList.do'/>";	
		});
		
		$("#jobopeningAdd").click(function(){
			alert("등록버튼"+$("form[name=jobopeningForm]").attr("action"));
			//$("form[name=jobopeningForm]").attr("action","<c:url value='/manager/jobopening/jobopeningAdd.do'/>")
			$("form[name=jobopeningForm]").submit();
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
		//기업 회원 정보 가져오기
		 $.ajax({
			url:"<c:url value='/manager/member/getMemeberCompany.do'/>",
			type:"post",
			success:function(res){
				$.each(res,function(idx,item){
					var opEl=$("<option value='"+item+"'></option>");
					opEl.html(item);
					$("#selectMemberid").append(opEl);
				})
			},
			error:function(xhr,status,error){
				alert(status+" : "+error);
			}
		}); 
		
		//select 선택시 회원전보 가져오는 곳 /manager/member/getMemberSelectId.do
		$("#selectMemberid").change(function(){
		var id=$(this).val();
		alert("id= "+id);
		if(id!="선택하세요"){
			 $.ajax({
					url:"<c:url value='/manager/member/getMemberSelectId.do'/>",
					type:"post",
					data:"id="+id,
					success:function(res){
						$("input[name=companyCode]").val(res.companyCode);
						$("#membername").val(res.membername);
						$("#tel").val(res.tel);
						$("#email").val(res.email);
					},
					error:function(xhr,status,error){
						alert(status+" : "+error);
					}
				});//ajax 
			};//if
		});
			
		
		//사이드에서 검색 버튼
		var count=0;
		$("#btSideSearch").click(function(){
			var con=$("#searchCon").val();
			var key=$("#searchKey").val();
			if(con!="choice"){
				if(key!=''){
					$.ajax({
						url:"<c:url value='/manager/member/getMemberSearchManager.do'/>",
						type:"post",
						data:{"searchCon":con,"searchKey":key},
						success:function(res){
							var infoT=$("#infoTable");
							if(res.length==0){
									var trEl=$("<tr></tr>");
									var tdEl=$("<td colspan='3'></td>");
									tdEl.html("조회된 값이 없습니다...")
									trEl.html(tdEl);
									infoT.html(trEl);
							}else{
//{"MEMBERNAME":"기업1호","MEMBERID":"jfjh234","REGDATE":1563031980000,"ZIPCODE":"7456",
//"MEMBERGENDER":"여","EMAIL":"com1@naver.com","ADDRESSDETAIL":"수성구 921-3번지","ADDRESS":"대구",
//"AUTHORITY_CODE":3,"TEL":"2","BIRTH":"1973-01-03","PWD":"1","MEMBER_CODE":58}
									var trEl1=$("<tr></tr>");
									var infoEl1=$("<th>아이디</th><th>회사명</th><th>사업자번호</th><th>선택</th>");
									trEl1.html(infoEl1);
									infoT.html(trEl1);
								$.each(res,function(idx,item){
									var id=item['MEMBERID'];
									var trEl2=$("<tr></tr>");
									var tdEl1=$("<td>"+item["MEMBERID"]+"</td>");
									var tdEl2=$("<td>"+item["COMPANYNAME"]+"</td>");
									var tdEl3=$("<td>"+item["BUSSINESS_NUMBER"]+"</td>");
									var tdEl4=$('<td><button onclick="setInfo('+item['MEMBER_CODE']+')">등록</button></td>');
									trEl2.html(tdEl1).append(tdEl2).append(tdEl3).append(tdEl4);
									infoT.append(trEl2);
								});
							}
						},
						error:function(request,status,error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
						}
					});
				}else{
					var infoT=$("#infoTable");
					var trEl=$("<tr></tr>");
					var tdEl=$("<td colspan='3'></td>");
					tdEl.html("검색어를 입력하세요...")
					trEl.html(tdEl);
					infoT.html(trEl);
				}
			}else{
				var infoT=$("#infoTable");
				var trEl=$("<tr></tr>");
				var tdEl=$("<td colspan='3'></td>");
				tdEl.html("검색 키워드를 선택하세요")
				trEl.html(tdEl);
				infoT.html(trEl);
			}
		});
	});
	function s_it()
	{
	  var total_str = "";
	  var obj = document.getElementsByName("welfare1");

	  for (i=0; i < obj.length; i++)
	  {
	    if (obj[i].checked == true)
	    {
	      total_str += (total_str != "") ? "," + obj[i].value : obj[i].value;
	    }
	  }
	  document.getElementById("welfare").value = total_str;
	}
	
	function setInfo(mCode){
		alert("mCode="+mCode);
		 $.ajax({
				url:"<c:url value='/manager/member/getMemberSelectMCode.do'/>",
				type:"post",
				data:"mCode="+mCode,
				success:function(res){
					$("input[name=companyCode]").val(res.companyCode);
					$("#membername").val(res.membername);
					$("#tel").val(res.tel);
					$("#email").val(res.email);
				},
				error:function(xhr,status,error){
					alert(status+" : "+error);
				}
			});//ajax 
	}
</script>
	
	
<div class="content-wrapper">
          <div class="content">		
			<div class="row">
<h2>채용공고 등록</h2>
	<div class="col-lg-8">
		<div class="card card-default">
<div class="card-body">
	
<form method="post" name="jobopeningForm" action="<c:url value='/manager/jobopening/jobopeningAdd.do'/>" enctype="multipart/form-data" ><!-- enctype="multipart/form-data" -->
<input type="text" name="companyCode" >
	<table id="memberT">
	<tbody>
		<tr>
			<th><label for="membername">담당자</label></th>
			<td>
				<input type="text" class="form-control inputSizeS" name="membername" id="membername" placeholder="담당자를 입력하세요" >
			</td>
		</tr>
		<!-- <tr>
			<th>사진 변경~!</th>	
			<td>사진 출력 예정</td>
		</tr> -->
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
<!-- <tr>
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
</tr> -->
<tr>
	<th><label for="addressdetail">체용 제목</label></th>
	<td>
		<input type="text" class="form-control" name="jobtitle" id="jobtitle" placeholder="공고 제목을 입력하세요 ">
	</td>
</tr>
<tr>
	<th><label for="addressdetail">지역 구분</label></th>
	<td>
		<select class="custom-select my-1 FST" name="localcheck" id="localcheck">
			<option value="서울특별시">서울</option>
        		<option value="부산광역시">부산</option>
        		<option value="인천광역시">인천</option>
        		<option value="대전">대전</option>
        		<option value="광주">광주</option>
        		<option value="대구">대구</option>
        		<option value="울산">울산</option>
        		<option value="세종">세종</option>
        		<option value="경기도">경기</option>
        		<option value="강원도">강원</option>
        		<option value="충청북도">충북</option>
        		<option value="충청남도">충남</option>
        		<option value="전라북도">전북</option>
        		<option value="전라남도">전남</option>
        		<option value="경상북도">경북</option>
        		<option value="경상남도">경남</option>
        		<option value="제주">제주</option>
		</select>
	</td>
</tr>
<tr>
	<th><label for="subwayinfo">인근 역정보</label></th>
	<td>
		<input type="text" class="form-control" name="subwayinfo" id="subwayinfo" placeholder="인근 지하철 입력하세요 ">
	</td>
</tr>
<tr>
	<th><label for="subwayinfo">근무 형태</label></th>
		<td>
			<select class="custom-select my-1 FST" name="workform" id="workform">
           		<option value="평일">평일</option>
           		<option value="주말">주말</option>
           		<option value="교대근무">교대근무</option>
           </select>
		</td>
</tr>
<tr>
	<th><label>근무기간</label></th>
	<td>
	<c:import url="/inc/date.do">
		<c:param name="name" value="workdate"/>
		<c:param name="id" value="workdate"/>
	</c:import>	
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
	<th><label>근무 요일</label></th>
	<td>
		<label class="control outlined control-radio radio-primary inputSizeS">1일
			<input type="radio" name="dayofweek" value="1일"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">2일
			<input type="radio" name="dayofweek" value="2일"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">3일
			<input type="radio" name="dayofweek" value="3일"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">4일
			<input type="radio" name="dayofweek" value="4일"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">5일
			<input type="radio" name="dayofweek" value="5일"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">6일
			<input type="radio" name="dayofweek" value="6일"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">7일
			<input type="radio" name="dayofweek" value="7일"/>
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
			<input type="radio" name="payway" id="pay" value="월급"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">연봉
			<input type="radio" name="payway" value="연봉"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">주급
			<input type="radio" name="payway" value="주급"/>
			<span class="control-indicator"></span>
		</label>
	</td>
</tr>
<tr>
	<th><label for="pay">급여</label></th>
	<td>
		<input type="text" class="form-control" name="pay" id="pay" placeholder="급여를 입력하세요 ">
	</td>
</tr>
<tr>
	<th><label for="workway">근무 방식</label></th>
	<td>
		<select class="custom-select my-1 FST" name="workway" id="workway">
			<option value="정규직(신입)">정규직(신입)</option>
            <option value="정규직(경력)">정규직(경력)</option>
            <option value="프리랜서(계약직)">프리랜서(계약직)</option>
            <option value="인턴">인턴</option>
		</select>
	</td>
</tr>
<tr>
	<th><label for="addressdetail">복리후생</label></th>
	<td>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="welfare1" onclick="javascript_:s_it()" value="국민연금" />
			<div class="control-indicator"></div>국민연금
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="welfare1" onclick="javascript_:s_it()" value="건강보험" />
			<div class="control-indicator"></div>건강보험
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="welfare1" onclick="javascript_:s_it()" value="고용보험" />
			<div class="control-indicator"></div>고용보험
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="welfare1" onclick="javascript_:s_it()" value="산재보험" />
			<div class="control-indicator"></div>산재보험
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="welfare1" onclick="javascript_:s_it()"  value="야근수당" />
			<div class="control-indicator"></div>야근수당
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="welfare1" onclick="javascript_:s_it()"  value="식대(점심)" />
			<div class="control-indicator"></div>식대(점심)
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="welfare1" onclick="javascript_:s_it()"  value="식대(저녁)" />
			<div class="control-indicator"></div>식대(저녁)
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="welfare1" onclick="javascript_:s_it()" value="교통비" />
			<div class="control-indicator"></div>교통비
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="welfare1" onclick="javascript_:s_it()" value="통신비" />
			<div class="control-indicator"></div>통신비
		</label>
		<label class="control control-checkbox checkbox-primary">
			<input type="checkbox" name="welfare1" onclick="javascript_:s_it()" value="퇴직금" />
			<div class="control-indicator"></div>퇴직금
		</label>
		<input type="hidden" id="welfare" name="welfare"  class="form-control">
	</td>
</tr>
<tr>
	<th><label for="gender">성별</label></th>	
	<td>
		<label class="control outlined control-radio radio-primary inputSizeS">성별무관
			<input type="radio" name="gender" id="gender" value="무관"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">여자
			<input type="radio" name="gender" value="여자"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">남자
			<input type="radio" name="gender" value="남자"/>
			<span class="control-indicator"></span>
		</label>
	</td>
</tr><tr>
	<th><label for="agelimit">제한 연령</label></th>
	<td>
		<label class="control outlined control-radio radio-primary inputSizeS">나이제한없음
			<input type="radio" name="agelimit" id="agelimit" value="나이제한없음" />
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">30세이하
			<input type="radio" name="agelimit"  value="30이하"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">30~40세
			<input type="radio" name="agelimit"  value="30이상40미만"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">40~50세
			<input type="radio" name="agelimit"  value="40이상50미만"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">50~60세
			<input type="radio" name="agelimit" value="50이상60미만"/>
			<span class="control-indicator"></span>
		</label>
	</td>
</tr><tr>
	<th><label for="academicCondition">학력조건</label></th>
	<td>
		<label class="control outlined control-radio radio-primary inputSizeS">학력무관
			<input type="radio" name="academicCondition" value="학력무관"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">고졸
			<input type="radio" name="academicCondition" value="고졸"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">대졸(2,3년)
			<input type="radio" name="academicCondition" value="대졸(2,3년)"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">대졸(4년)
			<input type="radio" name="academicCondition" value="대졸(4년)"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">석사
			<input type="radio" name="academicCondition" value="석사졸업"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">박사
			<input type="radio" name="academicCondition" value="박사졸업"/>
			<span class="control-indicator"></span>
		</label>
	</td>
</tr><tr>
	<th><label for="career">경력사항</label></th>
	<td>
		<label class="control outlined control-radio radio-primary inputSizeS">경력무관
			<input type="radio" name="career" value="경력무관"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">1~3년
			<input type="radio" name="career" value="1~3년"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">4~6년
			<input type="radio" name="career" value="4~6년"/>
			<span class="control-indicator"></span>
		</label>
		<label class="control outlined control-radio radio-primary inputSizeS">7~9년
			<input type="radio" name="career" value="7~9년"/>
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
	<th><label for="receiveway">접수 방법</label></th>
	<td>
		<select class="custom-select my-1 FST" name="receiveway" id="receiveway">
			 <option value="즉시지원">즉시지원</option>
             <option value="이메일지원">이메일지원</option>
             <option value="홈페이지지원">홈페이지지원</option>
		</select>
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
	<tr>
		<th><label for="submit">공고 이미지</label></th>
		<td>
			<input type="file" class="form-control" id="file" name="file" >
		</td>
	</tr>
	<tr>
		<th><label  >활성화</label> </th>
		<td>
			<label class="control outlined control-radio radio-primary inputSizeS">활성화
				<input type="radio" name="adminagree" value="Y"/>
				<span class="control-indicator"></span>
			</label>
			<label class="control outlined control-radio radio-primary inputSizeS">비활성화
				<input type="radio" name="adminagree" value="N"/>
				<span class="control-indicator"></span>
			</label>
       </td>
	</tr>
	</tbody>
</table>
</form>
			
		</div>
	</div>
</div>

<div class="col-lg-4 floating">
<h3>버튼 </h3>
<div class="card card-default">
<div class="card-body" id="divSide">	
	<table>
		<tr>
			<th>불러오기</th>
			<td colspan="2">
				<select class="custom-select my-1" id="selectMemberid">
					<option value="선택하세요">선택하세요</option>
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
			<button type="button" id="jobopeningAdd" class="mb-1 btn btn-outline-primary">
			<i class=" mdi mdi-star-outline mr-1"></i>등록</button>
			</td>		
		</tr>
		<tr>
			<td colspan="2">
			<button type="button" id="goJobopeningList" class="mb-1 btn btn-outline-primary">
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


<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>