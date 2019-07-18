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
<article>
<fieldset>
    <div class="col-md-9">
        <div class="page-header">
            <h3>구인</h3>
        </div>
        <form id="boardForm" class="form-horizontal" role="form" method="post" action="<c:url value='/company/jobopening_register.do'/>"
        enctype="multipart/form-data">
        <!-- ${company_code} -->
        <input type="hidden" name="companyCode" value="${mvo.companyCode }"> 

              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                <label class="control-label">공고제목</label>
                    <input id="jobtitle" name="jobtitle" class="form-control" type="text" />
                </div>
            </div>
             
             <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                <label class="control-label">지역구분</label>
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
                <div class="col-sm-offset-2 col-sm-10">
                <label class="control-label">역정보</label>
                    <input id="subwayinfo" name="subwayinfo" class="form-control" type="text" />
                </div>
            </div>         
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                <label class="control-label">근무형태</label>
                <input id="workform" name="workform" class="form-control" type="text" />
               <!--  <select name="workform">
                		<option value="정규직(경력)">정규직(경력)</option>
                		<option value="정규직(신입)">정규직(신입)</option>
                		<option value="계약직">계약직</option>
                		<option value="인턴">인턴</option>
                </select> -->
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
                <div class="col-sm-offset-2 col-sm-10">
                <label class="control-label">근무요일</label>
                    <input id="dayofweek" name="dayofweek" class="form-control" type="text" />
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                <label class="control-label">근무시간</label>
                    <input id="worktime" name="worktime" class="form-control" type="text" />
                </div>
            </div>
          
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                <label class="control-label">급여방식</label>
                	<select name="payway">
                	<option value="월급">월급</option>
                	<option value="연봉">연봉</option>
                	<option value="주급">주급</option>
                	</select>
                </div>
            </div>
             <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                <label class="control-label">급여</label>
                    <input id="pay" name="pay" class="form-control" type="text" />
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                <label class="control-label">근무방식</label>
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
                <div class="col-sm-offset-2 col-sm-10">
                <label class="control-label">복리후생</label>
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
                <div class="col-sm-offset-2 col-sm-10">
                <label class="control-label">성별</label>
                	<select id="gender" name="gender">
                        <option value="남자">남자</option>
                        <option value="여자">여자</option>
                        <option value="무관">무관</option>
                    </select>
                </div>
            </div>
             <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                <label class="control-label">제한연령</label>
                    <input id="agelimit" name="agelimit" class="form-control" type="text" />
                </div>
             </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                <label class="control-label">학력조건</label> 
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
                <div class="col-sm-offset-2 col-sm-10">
                    <label class="control-label">경력사항</label> 
                    <input id="career" name="career" class="form-control" type="text" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <label class="control-label">우대조건</label> 
                    <input id="sweetener" name="sweetener" class="form-control" type="text" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <label class="control-label">모집인원</label> 
                    <input id="recruit" name="recruit" class="form-control" type="text" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <label class="control-label">모집대상</label> 
                    <input id="recruitment_target" name="recruitmentTarget" class="form-control" type="text" />
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <label class="control-label">접수방법</label> 
                    <input id="receiveway" name="receiveway" class="form-control" type="text" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <label class="control-label">제출서류</label> 
                    <input id="submit" name="submit" class="form-control" type="text" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <label class="control-label">상세모집요강</label> 
                    <input id="applicationhandbook" name="applicationhandbook" class="form-control" type="text" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <label class="control-label">카테고리</label> 
                    <input id="category" name="category" class="form-control" type="text" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <label class="control-label">공고 이미지</label> 
                    <input id="companyimageurl" name="companyimageurl" class="form-control" type="file" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <label class="control-label">활성화여부</label> 
                    <input id="adminagree" name="adminagree"  type="radio" value="Y" checked/>Y
                    <input id="adminagree" name="adminagree"  type="radio" value="N"/>N 
                </div>
            </div>
            <div class="form-group">
                <div class="text-center">
                    <input type="submit" class="btn btn-success btn-mg" value="저장" role="button" />
                    <a href="jobopening_list.do" id="cancelBtn" class="btn btn-default btn-mg" role="button">취소</a>
                </div>
            </div>

        </form> 
    </div>
    </fieldset>
    </article>
<%@include file="../main/inc/bottom.jsp" %>