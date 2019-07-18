<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- <script type="text/javascript" src=<c:url value='/resources/js/jquery-3.4.1.min.js'/>></script>
    <script type="text/javascript">
    $(document).ready(function(){
		var a;
		var b;
		var c; 
		var d;
		$("input[name='localcheck1']").click(function(idx,item){
			if($(this).is(':checked')){
				//alert(1);
				a=$("input[name='localcheck']").val();
				$("input[name='localcheck']").val(a+","+$(this).val()); 
			}else{
				$("input[name='localcheck']").val(a);  
			}
		});
		$("input[name='workway1']").click(function(idx,item){
			if($(this).is(':checked')){
				//alert(1);
				b=$("input[name='workway']").val();
				$("input[name='workway']").val(b+","+$(this).val()); 
			}else{
				$("input[name='workway']").val(b); 
			}
		});
		$("input[name='payway1']").click(function(idx,item){
			if($(this).is(':checked')){
				//alert(1);
				c=$("input[name='payway']").val();
				$("input[name='payway']").val(c+","+$(this).val()); 
			}else{
				$("input[name='payway']").val(c); 
			}
		});
		$("input[name='academicCondition1']").click(function(idx,item){
			if($(this).is(':checked')){
				//alert(1);
				d=$("input[name='academicCondition']").val();
				$("input[name='academicCondition']").val(d+","+$(this).val()); 
			}else{
				$("input[name='academicCondition']").val(d); 
			}
		});
	}); 
    </script> -->
<article>
<fieldset>
<div>
<label>지역구분</label><br>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="서울특별시">서울</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="부산광역시">부산</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="인천광역시">인천</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="대전">대전</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="광주">광주</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="대구">대구</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="울산">울산</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="세종">세종<br></label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="경기도">경기</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="강원도">강원</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="충청북도">충북</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="충청남도">충남</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="전라북도">전북</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="전라남도">전남</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="경상북도">경북</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1"value="경상남도">경남</label>
<label><input type="checkbox" id="localcheck1" name="localcheck1" value="제주">제주</label>
</div>
<br><label>근무방식</label><br>
<label><input type="checkbox" id="workway1" name="workway1" value="정규직(경력)">정규직(경력)</label>
<label><input type="checkbox" id="workway1" name="workway1" value="정규직(신입)">정규직(신입)</label>
<label><input type="checkbox" id="workway1" name="workway1" value="계약직">계약직</label>
<label><input type="checkbox" id="workway1" name="workway1" value="인턴">인턴</label>
<br><label>급여방식</label><br>
<label><input type="checkbox" id="payway1" name="payway1" value="월급">월급</label>
<label><input type="checkbox" id="payway1" name="payway1" value="연봉">연봉</label>
<label><input type="checkbox" id="payway1" name="payway1" value="주급">주급</label>
<br><label>학력</label> <br>
<label><input type="checkbox" id="academicCondition1" name="academicCondition1" value="고졸">고졸</label>
<label><input type="checkbox" id="academicCondition1" name="academicCondition1" value="대졸(2,3년)">대졸(2,3년)</label>
<label><input type="checkbox" id="academicCondition1" name="academicCondition1" value="대졸(4년)">대졸(4년)</label>
<label><input type="checkbox" id="academicCondition1" name="academicCondition1" value="석사졸업">석사졸업</label>
<label><input type="checkbox" id="academicCondition1" name="academicCondition1" value="박사졸업">박사졸업</label>
<label><input type="checkbox" id="academicCondition1" name="academicCondition1" value="학력무관">학력무관</label>
<br><br><hr> 
<input type="button" id="wheresubmit" name="wheresubmit"value="확인">
</fieldset>
</article>
