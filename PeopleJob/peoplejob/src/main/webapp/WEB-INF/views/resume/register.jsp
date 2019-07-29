<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../main/inc/top.jsp" %>




<style type="text/css">
.divForm {
   width: 1279px;
    height: 120%;
    margin: 0 auto;
    background: #f2f4f7;
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
input[type="submit"] {
    margin-left: 1014px;
}


</style>

<script type="text/javascript">
$(document).ready(function (){
	
	//1차 직종 가져오기 /manager/occupantion/firstList.do
	selectFirst();
	//1차 직종 클릭하면 2차직종 가져오기 
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

//1차 직종 뿌리기
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
	var thirdEl=$("<option>3차 직종</option><option>먼저 2차 직종을 선택하세요</option>");
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
			var opEl=$("<option value='"+item.localCode2+"'></option>")
			opEl.html(item.sido);
			$("#locationSiDo").html(chEl);
			$("#locationSiDo").append(opEl);
		}else{
			var opEl=$("<option value='"+item.localCode2+"'></option>")
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

//1차 업종가져오기
function getBtype1(){
	$.ajax({
		url:"<c:url value='/resume/occupation/selectBtype1.do'/>",
		type:"post",
		success:function(res){
				settingBtype1(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}

//1차 업종 뿌리기
function settingBtype1(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>1차 업종</option>")
			var opEl=$("<option value='"+item["BTYPE_CODE1"]+"'></option>");
			opEl.append(item['BTYPENAME1']);
			$("#selectBtype1").html(chEl);
			$("#selectBtype1").append(opEl);
		}else{
			var opEl=$("<option value='"+item["BTYPE_CODE1"]+"'></option>");
			opEl.append(item['BTYPENAME1']);
			$("#selectBtype1").append(opEl); //최종으로 여기에 넣음
		}
	})
}
//2차 업종 가져오기
function getBtype2(btypeCode1){
	$.ajax({
		url:"<c:url value='/resume/occupation/selectBtype2.do'/>",
		type:"post",
		data:"btypeCode1="+btypeCode1,
		success:function(res){
				settingBtype2(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}
//2차 업종 뿌리기
function settingBtype2(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>2차 업종</option>")
			var opEl=$("<option value='"+item["BTYPE_CODE2"]+"'></option>");
			opEl.append(item['BTYPENAME2']);
			$("#selectBtype2").html(chEl);
			$("#selectBtype2").append(opEl); 
		}else{
			var opEl=$("<option value='"+item["BTYPE_CODE2"]+"'></option>");
			opEl.append(item['BTYPENAME2']);
			$("#selectBtype2").append(opEl); 
		}
	})
	var chEl=$("<option value='0'>3차 업종</option><option>먼저 2차 업종을 선택하세요</option>")
	$("#selectBtype3").html(chEl);
}
//2차 업종 가져오기
function getBtype3(btypeCode2){
	$.ajax({
		url:"<c:url value='/resume/occupation/selectBtype3.do'/>",
		type:"post",
		data:"btypeCode2="+btypeCode2,
		success:function(res){
				settingBtype3(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}
//3차 업종 뿌리기
function settingBtype3(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>3차 업종</option>")
			var opEl=$("<option value='"+item["BTYPE_CODE3"]+"'></option>");
			opEl.append(item['BTYPENAME3']);
			$("#selectBtype3").html(chEl);
			$("#selectBtype3").append(opEl); 
		}else{
			var opEl=$("<option value='"+item["BTYPE_CODE3"]+"'></option>");
			opEl.append(item['BTYPENAME3']);
			$("#selectBtype3").append(opEl); 
		}
	})
}
//직급을 가져오기 - 직급

var dvCode=$('#jobgrade').val();
//값을 가져오는 메서드
getjobgrade(dvCode);
//직급 가져오기
function getjobgrade(dvCode){
	$.ajax({
		url:"<c:url value='/career/selectCareer.do'/>",
		type:"post",
		data:"dvCode="+dvCode,
		success:function(res){
				settingjobgrade(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}
//직급 뿌리기
function settingjobgrade(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<input type='text' value='0'>직급")
			var opEl=$("<input type='text' value='"+item["dv_code"]+"'>");
			opEl.append(item['jobgrade']);
			$("#jobgrade").html(chEl);
			$("#jobgrade").append(opEl); 
		}else{
			var opEl=$("<input type='text' value='"+item["dv_code"]+"'>");
			opEl.append(item['jobgrade']);
			$("#jobgrade").append(opEl); 
		}
	})
	
}





</script>
<script type="text/javascript">

$(document).ready(function (){
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

<article>
<div id="registerdiv">
<div class="divForm">
<form name="frm1" method="post" 
	action="<c:url value='/resume/register.do'/>" enctype="multipart/form-data">
<fieldset>
	<legend style="font-weight: bold">이력서등록</legend>
	<section id="registerds">
	<div>        
        <h3 >이력서 제목</h3>
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
    <div class="divStaff">
    <div >
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
		<button class="btn btn-success" name="addStaff">학력 추가</button>
   
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
       <c:import url="autosearch.jsp"/><!-- 전공 -->
       
       
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
       </div>
       <script>
       $('#graduate').datepicker({
			dateFormat:"yy-mm-dd",
			changeYear:true,
			dayNamesMin:["일","월","화","수","목","금","토"],
			monthNames:["1월","2월","3월","4월","5월","6월",
					"7월","8월","9월","10월","11월","12월"]
});
$('#graduate2').datepicker({
			dateFormat:"yy-mm-dd",
			changeYear:true,
			dayNamesMin:["일","월","화","수","목","금","토"],
			monthNames:["1월","2월","3월","4월","5월","6월",
					"7월","8월","9월","10월","11월","12월"]
		});
$( function() {
    var availableTags1 = [
    	
    '가공     '   ,
    '가구디자인'         ,
    '가스냉동 '          ,
    '가정     '          ,
    '가정경제 '          ,
    '가정과교육'         ,
    '가정관리 '          ,
    '가정관리학'         ,
    '가정교육 '          ,
    '가정복지 '          ,
    '가정의학 '          ,
    '가정학   '          ,
    '가족관계 '          ,
    '가축질병학'         ,
    '가축학   '          ,
    '간호     '          ,
    '간호교육 '          ,
    '간호교육학'         ,
    '간호학   '          ,
    '간호행정 '          ,
    '간호행정학'         ,
    '감사행정학'         ,
    '개발행정 '          ,
    '개발행정학'         ,
    '건강관리학'         ,
    '건강교육 '          ,
    '건강생활체육   '    ,
    '건강식품       '    ,
    '건설           '    ,
    '건설경영학     '    ,
    '건설공학       '    ,
    '건설관리학     '    ,
    '건설시공관리   '    ,
    '건설시스템공학 '    ,
    '건설안전       '    ,
    '건축           '    ,
    '건축계         '    ,
    '건축계획       '    ,
    '건축계획설계   '    ,
    '건축공예학     '    ,
    '건축공학       '    ,
    '건축공학교육   '    ,
    '건축관리       '    ,
    '건축구조       '    ,
    '건축디자인     '    ,
    '건축물관리     '    ,
    '건축미술       '    ,
    '건축미술학     '    ,
    '건축및도시설계 '    ,
    '건축설계       '    ,
    '건축설비       '    ,
    '건축장식       '    ,
    '건축재료시공   '    ,
    '건축제도       '    ,
    '건축조경학     '    ,
    '건축학         '    ,
    '게르만어       '    ,
    '격기학         '    ,
    '견섬유         '    ,
    '결정학         '    ,
    '경기           '    ,
    '경기지도       '    ,
    '경기지도학     '    ,
    '경영           '    ,
    '경영계         '    ,
    '경영공학       '    ,
    '경영과학       '    ,
    '경영관리       '    ,
    '경영.관광학    '    ,
    '경영관리학     '    ,
    '경영교육       '    ,
    '경영.무역학    '    ,
    '경영이론       '    ,
    '경영정보       '    ,
    '경영정보관리   '    ,
    '경영정보관리학 '    ,
    '경영정보처리학 '    ,
    '경영정보학     '    ,
    '경영정책       '    ,
    '경영지도       '    ,
    '경영학         '    ,
    '경영회계       '    ,
    '경전사상       '    ,
    '경제           '    ,
    '경제개발       '    ,
    '경제경영학     '    ,
    '경제계획       '    ,
    '경제.국제경제학'    ,
    '경제기획       '    ,
    '경제동물자원   '    ,
    '경제.무역학    '    ,
    '경제사         '    ,
    '경제이론       '    ,
    '경제작물재배학 '    ,
    '경제정책       '    ,
    '경제학         '    ,
    '경제행정론     '    ,
    '경제행정학     '    ,
    '경찰사법행정   '    ,
    '경찰행정       '    ,
    '경찰행정학     '    ,
    '계산통계학     '    ,
    '계산학         '    ,
    '계측공학       '    ,
    '계측제어       '    ,
    '계측제어공학   '    ,
    '계측제어학     '    ,
    '계획학         '    ,
    '계획행정       '    ,
    '고고미술사학   '    ,
    '고고미술학     '    ,
    '고고인류학     '    ,
    '고고학         '    ,
    '고분자공학     '    ,
    '고분자학       '    ,
    '고분자화학     '    ,
    '고생물학       '    ,
    '고전문학       '    ,
    '고전압재료학   '    ,
    '고체물리학     '    ,
    '곤충학         '    ,
    '골프레저       '    ,
    '공공정책       '    ,
    '공법           '    ,
    '공법학         '    ,
    '공산권연구     '    ,
    '공산권지역     '    ,
    '공안행정       '    ,
    '공안행정학     '    ,
    '공업경영       '    ,
    '공업경영학     '    ,
    '공업경제       '    ,
    '공업계측       '    ,
    '공업교육       '    ,
    '공업교육학     '    ,
    '공업기계       '    ,
    '공업기술교육   '    ,
    '공업도안       '    ,
    '공업디자인     '    ,
    '공업디자인학   '    ,
    '공업분석화학   '    ,
    '공업재료       '    ,
    '공업토목       '    ,
    '공업학         '    ,
    '공업화학',
    '공업화학교육',
    '공업화학.섬유고분자.화학공학',
    '공업회계',
    '공예',
    '공예경영',
   '	공예교육       '   ,
   '	공예관리학     '   ,
   '	공예디자인     '   ,
   '	공예미술학     '   ,
   '	공예학         '   ,
   '	공장자동화     '   ,
   '	공정공학       '   ,
   '	공정관리       '   ,
   '	공중보건학     '   ,
   '	공중안전관리공학'  ,
   '	공학계         '   ,
   '	공해관리학     '   ,
   '	과수원예       '   ,
   '	과수학         '   ,
   '	과학교육       '   ,
   '	과학교육학     '   ,
   '	과학사및과학철학'  ,
   '	관광           '   ,
   '	관광개발학     '   ,
   '	관광경영       '   ,
   '	관광경영학     '   ,
   '	관광공예       '   ,
   '	관광관리학     '   ,
   '	관광노어통역   '   ,
   '	관광사업       '   ,
   '	관광스포츠     '   ,
   '	관광사진예술   '   ,
   '	관광영어       '   ,
   '	관광영어통역   '   ,
   '	관광일어       '   ,
   '	관광일어통역   '   ,
   '	관광자원       '   ,
   '	관광자원개발   '   ,
   '	관광조경학     '   ,
   '	관광중국어통역 '   ,
   '	관광정보처리   '   ,
   '	관광통역       '   ,
   '	관광학         '   ,
   '	관광행정       '   ,
   '	관광행정학     '   ,
   '	관광호텔경영   '   ,
   '	관광호텔조리   '   ,
   '	관광홍보       '   ,
   '	관리경제학     '   ,
   '	관리회계       '   ,
   '	관리영양       '   ,
   '	관상원예       '   ,
   '	관상원예학     '   ,
   '	관세           '   ,
   '	관악           '   ,
   '	관현악         '   ,
   '	광고           '   ,
   '	광고관리       '   ,
   '	광고기획       '   ,
   '	광고디자인     '   ,
   '	광고사진       '   ,
   '	광고창작       '   ,
   '	광고홍보학     '   ,
   '	광고학         '   ,
   '	광고피알       '   ,
   '	광금           '   ,
   '	광물학         '   ,
   '	광보학         '   ,
   '	광산           '   ,
   '	광산기계       '   ,
   '	광산기전       '   ,
   '	광산토목       '   ,
   '	광학           '   ,
   '	광학공학       '   ,
   '	교과교육학     '   ,
   '	교도행정       '   ,
   '	교양           '   ,
   '	교육경영       '   ,
   '	교육공학       '   ,
   '	교육과정       '   ,
   '	교육방법       '   ,
   '	교육사         '   ,
   '	교육사회학     '   ,
   '	교육상담       '   ,
   '	교육심리       '   ,
   '	교육심리및교육'    ,
   '	교육심리학     '   ,
   '	교육재정       '   ,
   '	교육지도       '   ,
   '	교육철학       '   ,
   '	교육철학및교육사'  ,
   '	교육평가       '   ,
   '	교육학         '   ,
   '	교육학계       '   ,
   '	교육행정       '   ,
   '	교육행정학     '   ,
   '	교정보호행정   '   ,
   '	교정학         '   ,
   '	교직           '   ,
   '	교통           '   ,
   '	교통개발       '   ,
   '	교통경제       '   ,
   '	교통계획       '   ,
   '	교통공학       '   ,
   '	교통관리       '   ,
   '	교통학         '   ,
   '	교통행정학     '   ,
   '	교회법         '   ,
   '	교회사         '   ,
   '	교회음악       '   ,
   '	교회음악학     '   ,
   '	구강외과       '   ,
   '	구미지역       '   ,
   '	구약학         '   ,
   '	구조공학       '   ,
   '	구조시스템공학 '   ,
   '	국문학         '   ,
   '	국민윤리       '   ,
   '	국민윤리교육   '   ,
   '	국민윤리교육학 '   ,
   '	국민윤리학     '   ,
   '	국방관리       '   ,
   '	국방정책       '   ,
   '	국방정책학     '   ,
   '	국방행정       '   ,
   '	국사           '   ,
   '	국사교육       '   ,
   '	국사학         '   ,
   '	국악           '   ,
   '	국악학         '   ,
   '	국어           '   ,
   '	국어교육       '   ,
   '	국어교육학     '   ,
   '	국어국문학     '   ,
   '	국어학         '   ,
   '	국어한문       '   ,
   '	국제개발       '   ,
   '	국제개발학     '   ,
   '	국제경영       '   ,
   '	국제경영학     '   ,
   '	국제경제       '   ,
   '	국제경제학     '   ,
   '	국제공법       '   ,
   '	국제관계       '   ,
   '	국제교양       '   ,
   '	국제관계학     '   ,
   '	국제관계연구   '   ,
   '	국제금융       '   ,
   '	국제기구       '   ,
   '	국제농업개발학 '   ,
   '	국제무역       '   ,
   '	국제무역학     '   ,
   '	국제법         '   ,
   '	국제상법       '   ,
   '	국제자원개발학 '   ,
   '	국제정치       '   ,
   '	국제정보통신   '   ,
   '	국제정치학     '   ,
   '	국제조리       '   ,
   '	국제운송실무   '   ,
   '	국제지역연구학 '   ,
   '	국제축산개발   '   ,
   '	국제학         '   ,
   '	국제협력       '   ,
   '	국제회의산업   '   ,
   '	국토개발       '   ,
   '	군사학         '   ,
   '	귀금속         '   ,
   '	귀금속디자인   '   ,
   '	귀금속공예     '   ,
   '	그래픽디자인   '   ,
   '	극작           '   ,
   '	금속           '   ,
   '	금속공업       '   ,
   '	금속공예       '   ,
   '	금속공예디자인 '   ,
   '	금속공예학     '   ,
   '	금속공학       '   ,
   '	금속공학교육   '   ,
   '	금속디자인     '   ,
   '	금속.무기재료공'   ,
   '	금속및재료공학 '   ,
   '	금속재료공학   '   ,
   '	금융           '   ,
   '	금융보험       '   ,
   '	금융보험론     '   ,
   '	금융보험학     '   ,
   '	금융전산       '   ,
   '	금융정보학     '   ,
   '	금융증권       '   ,
   '	금융학         '   ,
   '	금형           '   ,
   '	금형공학       '   ,
   '	금형설계       '   ,
   '	금형설계학     '   ,
   '	금형설비'           ,         
   '	기계     '          ,         
   '	기계공작            '        ,
   '	기계공학            '        ,
   '	기계공학계          '        ,
   '	기계공학교육        '        ,
   '	기계공학.기계설계학 '        ,
   '	기계교육            '        ,
   '	기계및금속재료공학  '        ,
   '	기계.설계.항공우주공'        ,
   '	기계설계            '        ,
   '	기계설계공학        '        ,
   '	기계설계공학교육    '        ,
   '	기계설계학          '        ,
   '	기계.정밀기계공학   '        ,
   '	기계정비            '        ,
   '	기계.정밀.설계.자동공학'     ,
   '	기계제도            '        ,
   '	기계제조            '        ,
   '	기계조립            '        ,
   '	기관                '        ,
   '	기관공학            '        ,
   '	기관학              '        ,
   '	기독교교육          '        ,
   '	기독교교육학        '        ,
   '	기독교사회복지학    '        ,
   '	기독교윤리          '        ,
   '	기독교학            '        ,
   '	기상과학            '        ,
   '	기상학              '        ,
   '	기생충학            '        ,
   '	기술개발학          '        ,
   '	기술경영학          '        ,
   '	기술교육            '        ,
   '	기악                '        ,
   '	기악학              '        ,
   '	기업경영            '        ,
   '	기업경영학          '        ,
   '	기업법              '        ,
   '	기업복지            '        ,
   '	기업재무            '        ,
   '	기초간호학          '        ,
   '	기초학부            '        ,
   '	기하학              '        ,
   '	낙농                '        ,
   '	낙농업              '        ,
   '	낙농자원학          '        ,
   '	낙농학              '        ,
   '	내과                '        ,
   '	내과학              '        ,
   '	내국세              '        ,
   '	냉동건조            '        ,
   '	냉동공조공학        '        ,
   '	냉동공학            '        ,
   '	냉동학              '        ,
   '	네델란드어          '        ,
   '	노동경제            '        ,
   '	노동법              '        ,
   '	노동정책            '        ,
   '	노동행정            '        ,
   '	노르웨이어          '        ,
   '	노무관계학          '        ,
   '	노무관리            '        ,
   '	노문학              '        ,
   '	노사                '        ,
   '	노사관계            '        ,
   '	노사관리            '        ,
   '	노사관리학          '        ,
   '	노사인력관리학      '        ,
   '	노사인력학          '        ,
   '	노사조정            '        ,
   '	노사지도            '        ,
   '	노사행정학          '        ,
   '	노서                '        ,
   '	노서아어            '        ,
   '	노어                '        ,
   '	노어노문학          '        ,
   '	노인복지            '        ,
   '	노어학              '        ,
   '	노인복지학          '        ,
   '	녹지조경학          '        ,
   '	농가정              '        ,
   '	농가정학            '        ,
   '	농경제학            '        ,
   '	농공                '        ,
   '	농공기술            '        ,
   '	농공학              '        ,
   '	농기계              '        ,
   '	농림학              '        ,
   '	농림학계            '        ,
   '	농산가공학          '        ,
   '	농산제조            '        ,
   '	농생물학            '        ,
   '	농약학              '        ,
   '	농업                '        ,
   '	농업가정            '        ,
   '	농업건축            '        ,
   '	농업경영            '        ,
   '	농업경영학          '        ,
   '	농업경제학          '        ,
   '	농업공학            '        ,
   '	농업과학            '        ,
   '	농업교육            '        ,
   '	농업기계            '        ,
   '	농업기계공학        '        ,
   '	농업기계학          '        ,
   '	농업기계화          '        ,
   '	농업생물학          '        ,
   '	농업원예            '        ,
   '	농업전산            '        ,
   '	농업제조            '        ,
   '	농업토목            '        ,
   '	농업협동조합        '        ,
   '	농예화학            '        ,
   '	농작물이용학        '        ,
   '	농촌개발            '        ,
   '	농촌과학            '        ,
   '	농촌사회            '        ,
   '	농촌사회교육        '        ,
   '	농촌지도            '        ,
   '	농토                '        ,
   '	농학                '        ,
   '	농화학              '        ,
   '	농화학.식품공학     '        ,
   '	대기오염            '        ,
   '	대기오염방지        '        ,
   '	대기과학            '        ,
   '	대수학              '        ,
   '	대중소통디자인      '        ,
   '	도금                '        ,
   '	도서관              '        ,
   '	도서관교육          '        ,
   '	도서관정보학        '        ,
   '	도서관학            '        ,
   '	도시개발            '        ,
   '	도시개발학          '        ,
   '	도시개발행정        '        ,
   '	도시계획            '        ,
   '	도시계획공학        '        ,
   '	도시계획학          '        ,
   '	도시공학            '        ,
   '	도시및지방행정      '        ,
   '	도시및지역개발학    '        ,
   '	도시및지역개발행정  '        ,
   '	도시및지역계획학    '        ,
   '	도시및지역정책학    '        ,
   '	도시설계            '        ,
   '	도시재정            '        ,
   '	도시지방행정        '        ,
   '	도시행정            '        ,
   '	도시행정및개발학    '        ,
   '	도시행정학          '        ,
   '	도시환경            '        ,
   '	도시환경행정학      '        ,
   '	도안                '        ,
   '	도업                '        ,
   '	도예                '        ,
   '	도예학              '        ,
   '	도자공예            '        ,
   '	도자공예디자인      '        ,
   '	도자기              '        ,
   '	도자기공예          '        ,
   '	도자기공예디자인    '        ,
   '	도장공학            '        ,
   '	독문학              '        ,
   '	독어                '        ,
   '	독어교육            '        ,
   '	독어교육학          '        ,
   '	독어독문학          '        ,
   '	독어학              '        ,
   '	독일어              '        ,
   '	독일학              '        ,
   '	동구어              '        ,
   '	동구지역연구학      '        ,
   '	동력공학            '        ,
   '	동력기계공학        '        ,
   '	동물분류학          '        ,
   '	동물생리학          '        ,
   '	동물자원            '        ,
   '	동물자원과학        '        ,
    

    ];
    $( "#major" ).autocomplete({
      source: availableTags1
    });
  } );

       //추가 버튼
$(document).on("click","button[name=addStaff]",function(){
      
    var addStaffText = '<div class="divStaff">'+ '<div>'+
	'<label for="schoolname">학교명</label>&nbsp'+
	    
     '<input type="text"  class="form-control" placeholder="학교명을 입력"  name="schoolname" id="schoolname">'+
     '</div>'+
     '<div>'+
		 '<label for="schoollocal">지역</label>&nbsp'+
			'<select class="form-control" name="schoollocal" id="schoollocal" >'+
     	'<option data-value="101000" value="서울">서울</option>'+
     '<option data-value="102000" value="경기">경기</option>'  +
     '<option data-value="103000" value="광주">광주</option>'  +
     '<option data-value="104000" value="대구">대구</option>'  +
     '<option data-value="105000" value="대전">대전</option>'  +
     '<option data-value="106000" value="부산">부산</option>'  +
     '<option data-value="107000" value="울산">울산</option>'  +
     '<option data-value="108000" value="인천">인천</option>'  +
     '<option data-value="109000" value="강원">강원</option>'  +
     '<option data-value="110000" value="경남">경남</option>'  +
     '<option data-value="111000" value="경북">경북</option>'  +
     '<option data-value="112000" value="전남">전남</option>'  +
     '<option data-value="113000" value="전북">전북</option>'  +
     '<option data-value="114000" value="충북">충북</option>'  +
     '<option data-value="115000" value="충남">충남</option>'  +
     '<option data-value="116000" value="제주">제주</option>'  +
     '<option data-value="118000" value="세종">세종</option>'  +
     	
  '</select>'+ 
  '</div>'+
  '<div>'+
  '<label>전공</label>'+
  		'<input type="text"  class="form-control" placeholder="전공을 입력하세요" name="major" id="major" >'+<!-- 전공 -->
  '</div>'+
  '<div>'+
  '<label>학위</label> '+
'<input type="text"  class="form-control" placeholder="학위를 입력하세요" name="degree" id="degree" >'+
  
  '</div>'+
 
  ' <label class="control-label">입학일</label>'+
	'<input id="graduate" name="graduate" class="form-control" type="text"  readonly/>'+
	'<label class="control-label">졸업일</label>'+
     '<input id="graduate2" name="graduate2" class="form-control" type="text" readonly/>'+        
  '<div>' +
  '<select class="form-control" name="graduatecheck" id="graduatecheck" >'+
  '<option value="졸업여부">졸업여부</option>'+
  '<option value="졸업">졸업</option>'+
  '<option value="중퇴">중퇴</option>'+
  '</select> ' +                                                                
 
  '</div>'	+
  '<button class="btn btn-default" name="delStaff">삭제</button>'+ 
  '</div>';
              
    $( ".divStaff:last" ).append(addStaffText); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
      
    //마지막 trStaff명 뒤에 붙인다.
     var trHtml = $( ".divStaff:last" ); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
          
        trHtml.after(addStaffText); //마지막 trStaff명 뒤에 붙인다.
      
});
  
//삭제 버튼
$(document).on("click","button[name=delStaff]",function(){
      
    var trHtml = $(this).parent().parent();
      
    trHtml.remove(); //tr 테그 삭제
      
});	
</script>
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
       <c:import url="autosearch2.jsp"/><!-- 직급 -->
   </div>
   </section>

   <button type="button" id="certification" class="btn btn-success" value="자격증">자격증</button>
   <section id="registerds">
   <div id="certificationtype" name="certificationtype">
   
   <h3>자격증</h3>

        
   <input class="form-control" name="certificationtype" id="certificationtype" value="자격증/면허증">
        <c:import url="autosearch3.jsp"/> <!-- 자격증명 -->
    <div>    
        <label for="lInstitution">발행처/기관</label>
        <input type="text" class="form-control"  name="lInstitution" placeholder="발행처/기관을 입력하세요" id="lInstitution" style="ime-mode:active">
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
    <input class="form-control" name="certificationtype" id="certificationtype" value="어학시험">
    <div> 
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
	</div>
	</section>
   <button type="button" id="awardbt" class="btn btn-success" value="수상내역">수상내역</button>
  
   <section id="registerds">
    <div class="well" id="award">
     <h3>수상내역</h3>
      <label for="award">수상명</label>
        <input type="text" class="form-control"  name="award" id="award" style="ime-mode:active">
  </div>
  </section>
     &nbsp;
     <section id="registerds">
     <h3>자기소개서</h3>
      <div>	
    	<!-- <label for="introduce">자기소개서</label>
        <textarea class="form-control" rows="3"></textarea> -->
        
        <c:import url="/main/smarteditorTestjsp.do">
			<c:param name="name" value="introduce"></c:param>
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
       <table>
      <tr>
				<th>지역</th>
								<td>
									<select class="custom-select my-1 mr-sm-2 FST" name="localCode" id="locationSiDo">
										<option>시/도</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" name="localCode2" id="locationGugun">
										<option>구/군</option>
										<option>먼저 시/도를 선택하세요</option>
									</select>
								</td>
								</tr>
					</table>
        </div>
        
        <div>
        <%-- <c:import url="btype.jsp"/> --%>
        <table>
       <tr>
								<th>직종</th>
								<td colspan="1">
									<select class="custom-select my-1 FST" name="firstCode" id="selectFirst">
										<option>1차 직종</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" name="secondCode" id="selectSecond">
										<option>2차 직종</option>
										<option>먼저 1차 직종을 선택하세요</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" name="thirdCode" id="selectThird">
										<option>3차 직종</option>
										<option>먼저 2차 직종을 선택하세요</option>
									</select>
								</td>
								<th>업종</th>
								<td colspan="2">
									<select class="custom-select my-1 FST" name="btypeCode1" id="selectBtype1">
										<option>1차 업종</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" name="btypeCode2" id="selectBtype2">
										<option>2차 업종</option>
										<option>먼저 1차 업종을 선택하세요</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" name="btypeCode3" id="selectBtype3">
										<option>3차 업종</option>
										<option>먼저 2차 업종을 선택하세요</option>
									</select>
								</td>
							</tr>
							</table>
							
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
        </section>
        
        
   &nbsp;
    <div id="companycheck">
    <label>기업 인사담당자의 입사제의 및 면접제의를 받으시겠어요?</label>
    <label class="radio-inline">
    	
  		<input type="radio" name="opencheck" id="opencheck" value="Y">공개
		</label>
		
		<label class="radio-inline">
  		<input type="radio" name="opencheck" id="opencheck" value="N">비공개
	</label>
    </div>
    <br>
   
    
    </fieldset>
     <input class="btn btn-success" type="submit" value="이력서 저장">
    </form>
    
</div>  
</div> 
  
</article>

<%@include file="../main/inc/bottom.jsp" %>
      