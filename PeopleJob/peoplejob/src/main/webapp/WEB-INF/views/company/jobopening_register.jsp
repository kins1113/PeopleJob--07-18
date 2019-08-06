<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>

<script type="text/javascript" src=<c:url value='/resources/js/jquery-3.4.1.min.js'/>></script>
<script type="text/javascript">

</script>

<script type="text/javascript">
/* $(document).ready(function(){
		var a;
		$("input[name='welfare1']").click(function(idx,item){
			if($(this).is(':checked')){
				//alert(1);
				a=$("input[name='welfare']").val();
				$("input[name='welfare']").val(a+","+$(this).val()); 
			}else{
				$("input[name='welfare']").val(a); 
			}
		});
		
	}); */
	$(document).ready(function(){
		//$("#submit2").click(function(){
		$("form[name=boardForm]").submit(function(){ 
			//if(confirm("등록하시겠습니까?")){
				$("form[name=boardForm]").find("input[type=text]").each(function(){
					if ($(this).val().length < 1) {
						var msg = $(this).attr('name'); 
						alert(msg + '칸을 입력해주세요	.');
						$(this).focus();
						event.preventDefault(); 
						return false;
					}else if (!validate_worktime($('#worktime').val())) {
						alert('근무시간을 다시 입력해주세요(입력양식 예 : 52)');
						$('#worktime').focus();
						event.preventDefault();
						return false;
					}else if (!validate_pay($('#pay').val())) {
						alert('급여를 다시 입력해주세요(입력양식 예 : 3000000)');
						$('#pay').focus();
						event.preventDefault();
						return false;
					}else if (!validate_worktime($('#recruit').val())) {
						alert('모집인원을 다시 입력해주세요(입력양식 예 : 9명이면 0명 10~99명이면 00명 100명이상이면 000명 )');
						$('#recruit').focus();
						event.preventDefault();
						return false;
					}
				});
			//}else{
			//	event.preventDefault();
			//	return false;
			//}
		});
		
	});
		
	function validate_worktime(time) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(time);
	}

	//아이디 정규식
	function validate_pay(pay) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(pay);
	}

	//비밀번호 정규식
	function validate_recruit(recruit) {
		var pattern = new RegExp(/^[a-zA-Z0-9]+$/g);
		return pattern.test(recruit);
	}
		
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
</script>
<style type="text/css">
.divList {
    width: 900px;
    margin: 0 auto;
    padding: 10px;
    background: #cccccc;
}
.form-group{
	width:90%;
	padding-left: 100px;
} 
h3, .h3 {
    font-size: 24px;
    padding-left: 100px;
}
select {
    height: 30px;
}
</style>
<article>
	<fieldset>
    
<div class="divList" style="min-height: 630px">
        <div class="page-header">
            <h3>구인</h3>
        </div>
        <form id="boardForm" name="boardForm" class="form-horizontal" role="form" method="post" action="<c:url value='/company/jobopening_register.do'/>"
        enctype="multipart/form-data">
        <!-- ${company_code} -->
        <input type="hidden" name="companyCode" value="${mvo.companyCode }"> 

              <div class="form-group">
                <div  >
                <label  >공고제목</label>
                    <input id="jobtitle" name="jobtitle" class="form-control" type="text" />
                </div>
              </div>
             
             <div class="form-group">
                <div >
                <label >지역구분</label>
                	<select name="localcheck">
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
                </div>
            </div>
             
            <div class="form-group">
                <div >
                <label >역정보</label>
                    <input id="subwayinfo" name="subwayinfo" class="form-control" type="text" />
                </div>
            </div>         
              <div class="form-group">
                <div  >
                <label  >근무형태</label>
               <select name="workform">
                		<option value="평일">평일</option>
                		<option value="주말">주말</option>
                		<option value="교대근무">교대근무</option>
                </select>
                </div>
            </div>
            <c:import url="jobopening_date.jsp"/>
            <!-- 
             <div class="form-group">
                <label class="col-sm-2 control-label">근무기간</label>
                <div class="col-sm-6">
                    <div class="input-group">
                        <input id="start" name="start" class="form-control" placeholder="YYYYMMDD" type="text" />
                        <span class="input-group-addon">~</span>
                        <input id="end" name="start" class="form-control" placeholder="YYYYMMDD" type="text" />
                    </div>
                </div>
            </div>
             -->
             <div class="form-group">
                <div  >
                <label  >근무요일</label>
                    <select name="dayofweek">
                		<option value="1일">1일</option>
                		<option value="2일">2일</option>
                		<option value="3일">3일</option>
                		<option value="4일">4일</option>
                		<option value="5일">5일</option>
                		<option value="6일">6일</option>
                		<option value="7일">7일</option>
                </select>
                </div>
            </div>
            
            <div class="form-group">
                <div  >
                <label  >근무시간</label>
                    <input id="worktime" name="worktime" class="form-control" type="text" />
                </div>
            </div>
          
              <div class="form-group">
                <div  >
                <label  >급여방식</label>
                	<select name="payway">
                	<option value="월급">월급</option>
                	<option value="연봉">연봉</option>
                	<option value="주급">주급</option>
                	</select>
                </div>
            </div>
             <div class="form-group">
                <div  >
                <label  >급여</label>
                    <input id="pay" name="pay" class="form-control" type="text" />
                </div>
            </div>
            
            <div class="form-group">
                <div  >
                <label  >근무방식</label>
                    <select name="workway">
                        <option value="정규직(신입)">정규직(신입)</option>
                        <option value="정규직(경력)">정규직(경력)</option>
                        <option value="프리랜서(계약직)">프리랜서(계약직)</option>
                        <option value="인턴">인턴</option>
                    </select>
                </div>
            </div>
              <!-- name="welfare" -->
               <div class="form-group">
                <div  >
                <label  >복리후생</label>
                <br>  
                    <label><input type="checkbox" name="welfare1" id="welfare1" value="국민연금" onclick="javascript_:s_it()"/> 국민연금</label>
                    <label><input type="checkbox" name="welfare1" id="welfare1"value="건강보험" onclick="javascript_:s_it()"/> 건강보험</label>
                    <label><input type="checkbox" name="welfare1" id="welfare1"value="고용보험" onclick="javascript_:s_it()"/> 고용보험</label><br>
                    <label><input type="checkbox" name="welfare1" id="welfare1"value="산재보험" onclick="javascript_:s_it()"/> 산재보험</label>
                    <label><input type="checkbox" name="welfare1" id="welfare1"value="야근수당"onclick="javascript_:s_it()"/> 야근수당</label>
                    <label><input type="checkbox" name="welfare1" id="welfare1"value="식대(점심)"onclick="javascript_:s_it()"/> 식대(점심)</label><br>
                    <label><input type="checkbox" name="welfare1" id="welfare1"value="식대(저녁)"onclick="javascript_:s_it()"/> 식대(저녁)</label>
                    <label><input type="checkbox" name="welfare1" id="welfare1"value="교통비"onclick="javascript_:s_it()"/> 교통비</label>
                    <label><input type="checkbox" name="welfare1" id="welfare1"value="통신비" onclick="javascript_:s_it()"/> 통신비</label><br>
                    <label><input type="checkbox" name="welfare1" id="welfare1"value="퇴직금"onclick="javascript_:s_it()"/> 퇴직금</label>
                   <input type="hidden" id="welfare" name="welfare"  class="form-control">
                </div>
            </div>
             <div class="form-group">
                <div  >
                <label  >성별</label>
                	<select id="gender" name="gender">
                        <option value="남자">남자</option>
                        <option value="여자">여자</option>
                        <option value="무관">무관</option>
                    </select>
                </div>
            </div>
             <div class="form-group">
                <div  >
                <label  >제한연령</label>
                    <select id="agelimit" name="agelimit">
                        <option value="나이제한없음">나이제한없음</option>
                        <option value="30이하">30이하</option>
                        <option value="30이상40미만">30이상40미만</option>
                        <option value="40이상50미만">40이상50미만</option>
                        <option value="50이상60미만">50이상60미만</option>
                    </select>
                </div>
             </div>

            <div class="form-group">
                <div  >
                <label  >학력조건</label> 
                    <select id="academicCondition" name="academicCondition">
                        <option value="고졸">고졸</option>
                        <option value="대졸(2,3년)">대졸(2,3년)</option>
                        <option value="대졸(4년)">대졸(4년)</option>
                        <option value="석사졸업">석사졸업</option>
                        <option value="박사졸업">박사졸업</option>
                        <option value="학력무관">학력무관</option>
                    </select>
                </div>
            </div>
            
            <div class="form-group">
                <div  >
                    <label  >경력사항</label> 
                    <select id="career" name="career">
                        <option value="경력무관">경력무관</option>
                        <option value="1~3년">1~3년</option>
                        <option value="4~6년">4~6년</option>
                        <option value="7~9년">7~9년</option>
                    </select>

                </div>
            </div>
            <div class="form-group">
                <div  >
                    <label  >우대조건</label> 
                    <input id="sweetener" name="sweetener" class="form-control" type="text" />
                </div>
            </div>
            <div class="form-group">
                <div  >
                    <label  >모집인원</label> 
                    <input id="recruit" name="recruit" class="form-control" type="text" />
                </div>
            </div>
            <div class="form-group">
                <div  >
                    <label  >모집대상</label> 
                    <input id="recruitment_target" name="recruitmentTarget" class="form-control" type="text" />
                </div>
            </div>
            
            <div class="form-group">
                <div  >
                    <label  >접수방법</label> 
                    <select id="receiveway" name="receiveway">
                        <option value="즉시지원">즉시지원</option>
                        <option value="이메일지원">이메일지원</option>
                        <option value="홈페이지지원">홈페이지지원</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div  >
                    <label  >제출서류</label> 
                    <input id="submit" name="submit" class="form-control" type="text" />
                </div>
            </div>
            <div class="form-group">
                <div  >
                    <label  >상세모집요강</label> 
                    <input id="applicationhandbook" name="applicationhandbook" class="form-control" type="text" />
                </div>
            </div>
            <!-- <div class="form-group">
                <div  >
                    <label  >카테고리</label> 
                    <input id="category" name="category" class="form-control" type="text" />
                </div>
            </div> -->
            <div class="form-group">
                <div  >
                    <label  >공고 이미지</label> 
                    <input id="companyimageurl" name="companyimageurl" class="form-control" type="file" />
                </div>
            </div>
            <div class="form-group">
                <div  >
                    <label  >활성화여부(회원들에게 보여줄지 말지를 결정)</label> 
                    <input id="adminagree" name="adminagree"  type="radio" value="Y" checked/>활성화
                    <input id="adminagree" name="adminagree"  type="radio" value="N"/>비활성화
                </div>
            </div>
            <div class="form-group">
                <div class="text-center">
                    <input type="submit" class="btn btn-success btn-mg" id="submit2" value="등록" role="button" />
                    <a href="jobopening_list.do" id="cancelBtn" class="btn btn-default btn-mg" role="button">취소</a>
                </div>
            </div>

        </form> 
    </div>
    </fieldset>
    </article>
<%@include file="../main/inc/bottom.jsp" %>