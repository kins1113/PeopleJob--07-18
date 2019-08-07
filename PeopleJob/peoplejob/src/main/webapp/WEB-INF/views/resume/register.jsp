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

	
	//자격증을 가져오는
	$("#certification").click(function(){
		getCertificate();
	})
	
	//1차 커리어 직종 가져오기 /resume/career/firstList.do
	selectcareer();
	  
	//1차 직종 가져오기 /manager/occupantion/firstList.do
	selectFirst();
	
	//어학을 가져오는
	$("#langcertbt").click(function(){
		getLangcertification();
	})
	
	//전공을 가져오는

	getMajor();
	
	//직급을 가져오는

	getJobgrade();

	//희망 근무 조건
	$("#hopeworkbt").click(function(){
	gethopeworkform();
	})
												
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

/* $(function(){
    $( "#jobgrade" ).autocomplete({
        source : function( request, response ) {
             $.ajax({
                    type: 'post',
                    url: "<c:url value='register.jsp'/>",
                    dataType: "json",
                    //request.term = $("#autocomplete").val()
                    data: { value : request.term },
                    success: function(data) {
                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
                        response(
                            $.map(data, function(item) {
                                return {
                                    label: item.data,
                                    value: item.data
                                }
                            })
                        );
                    }
               });
            },
        //조회를 위한 최소글자수
        minLength: 2,
        select: function( event, ui ) {
            // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
        }
    });
}) */


//전공 가져오기
function getMajor(){
	$.ajax({
		url:"<c:url value='/resume/education/selectMajor.do'/>",
		type:"post",
		success:function(res){
				settingMajor(res);

		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}


//전공 뿌리기
function settingMajor(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>전공</option>")
			var opEl=$("<option value='"+item.academicCode+"'></option>");
			opEl.append(item.major);
			test2.append(item.major);
			$("#selectMajor").html(chEl);
			$("#selectMajor").append(opEl); 
			
		}else{
			var opEl=$("<option value='"+item.academicCode+"'></option>");
			opEl.append(item.major);
			
			$("#selectMajor").append(opEl); 
			
		}
	})
	
}





//직급 가져오기
function getJobgrade(){
	$.ajax({
		url:"<c:url value='/resume/career/selectCareer.do'/>",
		type:"post",
		success:function(res){
				settingJobgrade(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}


//직급 뿌리기
function settingJobgrade(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>직급</option>")
			var opEl=$("<option value='"+item.dvCode+"'></option>");
			opEl.append(item.jobgrade);
			$("#selectBydvCode").html(chEl);
			$("#selectBydvCode").append(opEl); 
		}else{
			var opEl=$("<option value='"+item.dvCode+"'></option>");
			opEl.append(item.jobgrade);
			$("#selectBydvCode").append(opEl); 
		}
	})
	
}



//1차 커리어 직종 가져오기
function selectcareer(){
	$.ajax({
		url:"<c:url value='/resume/career/firstCareer.do'/>",
		type:"post",
		success:function(res){
			settingcareer(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}

//1차 커리어 직종 뿌리기
//[{"firstCode":1,"firstname":"경영·사무"},{"firstCode":2,"firstname":"영업·고객상담"},{"firstCode":3,"firstname":"생산·제조"},
//{"firstCode":4,"firstname":"IT·인터넷"},{"firstCode":5,"firstname":"전문직"},{"firstCode":6,"firstname":"교육"}
function settingcareer(res){
		$.each(res,function(idx,item){
			if(idx==0){
				var chEl=$("<option value='0'>직종</option>")
				var opEl=$("<option value='"+item.dvCode+"'></option>");
				opEl.append(item.chargework);
				$("#selectcareer").html(chEl);
				$("#selectcareer").append(opEl); //최종으로 여기에 넣음
			}else{
				var opEl=$("<option value='"+item.dvCode+"'></option>");
				opEl.append(item.chargework);
				$("#selectcareer").append(opEl); //최종으로 여기에 넣음
			}
		})
}


//자격증 가져오기
function getCertificate(){
	$.ajax({
		url:"<c:url value='/resume/certificate/selectLname.do'/>",
		type:"post",
		success:function(res){
			settingCertificate(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}


//자격증 뿌리기
function settingCertificate(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>자격증명</option>")
			var opEl=$("<option value='"+item.lNo+"'></option>");
			opEl.append(item.lName);
			$("#selectLname").html(chEl);
			$("#selectLname").append(opEl); 
		}else{
			var opEl=$("<option value='"+item.lNo+"'></option>");
			opEl.append(item.lName);
			$("#selectLname").append(opEl); 
		}
	})
	
}


//어학 가져오기
function getLangcertification(){
	$.ajax({
		url:"<c:url value='/resume/langcertification/selectlangcertification.do'/>",
		type:"post",
		success:function(res){
			settingLangcertification(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}

//어학 뿌리기
function settingLangcertification(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>어학</option>")
			var opEl=$("<option value='"+item.langlicenceCode+"'></option>");
			opEl.append(item.langlicencename);
			$("#selectlanglicencename").html(chEl);
			$("#selectlanglicencename").append(opEl); 
		}else{
			var opEl=$("<option value='"+item.langlicenceCode+"'></option>");
			opEl.append(item.langlicencename);
			$("#selectlanglicencename").append(opEl); 
		}
	})
	
}
//희망 근무조건 가져오기
function gethopeworkform(){
	$.ajax({
		url:"<c:url value='/resume/hopeWorking/selecthopework.do'/>",
		type:"post",
		success:function(res){
			settinghopeworkform(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}

//희망 근무조건 뿌리기
function settinghopeworkform(res){
	$.each(res,function(idx,item){
	
			var opEl=$("<option value='"+item.hopeworkCode+"'></option>");
			opEl.append(item.hopeworkform);
			$("#hopeworkform").append(opEl); 
		
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

    </div>
    <div>        
        <label for="membername">이름</label>
        <input type="text" class="form-control"  name="membername" id="membername" value="${vo.membername }" style="ime-mode:active">
    </div>
   <input type="hidden" id="picture" name="picture" />
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
       <label>전공</label>
           <input type="text" class="form-control" placeholder="전공을 입력하세요" name="major" id="major">
       
       
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
	<input type="text" class="form-control"  placeholder="직종을 입력" name="chargework" >
		
        
    </div>
    	
    <div>
    <label for="jobgrade">직급</label>
    <input type="text"  class="form-control"  placeholder="직급을 입력"  name="jobgrade">
   </div>
   </section>

   <button type="button" id="certification" class="btn btn-success" value="자격증">자격증</button>
   <section id="registerds">
   <div id="certificationtype" >
   
   <h3>자격증</h3>

      
   <input class="form-control" name="certificationtype" id="certificationtype" value="자격증/면허증">
         <label for="lName">자격증명</label>
         <input type="text" class="form-control" placeholder="자격증명을 입력하세요" name="lName" >
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
     <label for="institute">시험종류</label>
     	<input type="text" class="form-control" placeholder="시험종류를 입력하세요" name="langlicencename" id="langlicencename">
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
      