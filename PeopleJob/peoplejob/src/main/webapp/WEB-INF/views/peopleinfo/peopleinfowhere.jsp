<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
  
<script type="text/javascript">
$(document).ready(function (){




	
		//지역정보를 가져오기 - 시도
		getLocation();

		//지역정보를 가져오는 
		$("#locationSiDo").change(function(){
			var sidoCode=$(this).find("option:checked").val();
			//값을 가져오는 메서드
			getLocation2(sidoCode);
		});
		
		  
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

//지역정보를 가져오는 메서드 
function getLocation(){
	$.ajax({
		url:"<c:url value='/peopleinfo/where/selectLocation.do'/>",
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
		url:"<c:url value='/peopleinfo/where/selectLocation2.do'/>",
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

//1차 직종 가져오기
function selectFirst(){
	$.ajax({
		url:"<c:url value='/peopleinfo/where/firstList.do'/>",
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
	alert("res="+res);
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
		url:"<c:url value='/peopleinfo/where/selectSecond.do'/>",
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
		url:"<c:url value='/peopleinfo/where/selectThird.do'/>",
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
//1차 업종가져오기
function getBtype1(){
	$.ajax({
		url:"<c:url value='/peopleinfo/where/selectBtype1.do'/>",
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
		url:"<c:url value='/peopleinfo/where/selectBtype2.do'/>",
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
		url:"<c:url value='/peopleinfo/where/selectBtype3.do'/>",
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

</script>
<style type="text/css">
.divSearch {
  width: 1080px;
    margin: 0 auto;
    
}	
input.btn.btn-primary {
    position: absolute;
        bottom: 166px;
    right: 534px;
}

strong.title_basic_sub {
    float: right;
}

div#woman {
    float: right;
    margin-top: -17px;
    margin-right: 49px;
}

#title{
 color:green;
}
</style>
	<!-- 페이징 처리에도 사용 -->
   <h2>인재정보 찾기</h2>
<div class="divSearch"> 
		<div style="border: 1px solid #63b752;
    float: left;
    width: 9%;
   	padding: 8px;
    margin: 10px;
    height: 450px;">
		 <label id="title">경력</label><br>
<label><input type="checkbox" id="workcheck" name="workcheck" value="경력">경력</label>
<label><input type="checkbox" id="workcheck" name="workcheck" value="신입">신입</label><br>
 <ul class="wrap_list_value column_two">
                <li><label class="frm_chkbox01" for="career-years01"><input type="checkbox" id="career-years" name="term" title="1년 미만" value=",1"><span>1년 <em class="ico_under">이하</em></span></label></li>
                <li><label class="frm_chkbox01" for="career-years02"><input type="checkbox" id="career-years" name="term" title="1~3년" value="1,4"><span>1~3년</span></label></li>
                <li><label class="frm_chkbox01" for="career-years03"><input type="checkbox" id="career-years" name="term" title="3~5년" value="3,6"><span>3~5년</span></label></li>
                <li><label class="frm_chkbox01" for="career-years04"><input type="checkbox" id="career-years" name="term" title="5~10년" value="5,11"><span>5~10년</span></label></li>
                <li><label class="frm_chkbox01" for="career-years05"><input type="checkbox" id="career-years" name="term" title="10~15년" value="10,16"><span>10~15년</span></label></li>
                <li><label class="frm_chkbox01" for="career-years06"><input type="checkbox" id="career-years" name="term" title="15년 이상" value="15,"><span>15년 <em class="ico_over">이상</em></span></label></li>
            </ul>
            </div>
        <div class="box_detail_panel" style="border: 1px solid #63b752;
    float: left;
    width:  9%;
    margin: 10px;
    height: 450px;
    padding-top: 10px;
    padding: 4px;">
        <strong id="title">성별</strong>
            <strong class="title_basic_sub" id="title">나이</strong><br>
            <input type="checkbox" id="male01" value="남">
            <label class="form_sp frm_chk02" for="male01">
            <span>남</span></label>
            <div id="woman">
            <input type="checkbox" id="female01" value="여">
            <label class="form_sp frm_chk02" for="female01">
            <span>여</span></label>
            </div>
            <ul class="wrap_list_value column_two">
                <li><label class="frm_chkbox01" for="age-interval01"><input type="checkbox" id="age" name="age" value=",20"><span>20세 <em class="ico_under">이하</em></span></label></li>
                <li><label class="frm_chkbox01" for="age-interval02"><input type="checkbox" id="age" name="age" value="21,30"><span>21~30세</span></label></li>
                <li><label class="frm_chkbox01" for="age-interval03"><input type="checkbox" id="age" name="age" value="31,35"><span>31~35세</span></label></li>
                <li><label class="frm_chkbox01" for="age-interval04"><input type="checkbox" id="age" name="age" value="36,40"><span>36~40세</span></label></li>
                <li><label class="frm_chkbox01" for="age-interval05"><input type="checkbox" id="age" name="age" value="41,50"><span>41~50세</span></label></li>
                <li><label class="frm_chkbox01" for="age-interval06"><input type="checkbox" id="age" name="age" value="51,"><span>51세 <em class="ico_over">이상</em></span></label></li>
            </ul>
            </div>
        <div class="box_detail_panel" style="border: 1px solid #63b752; float: left; width:  11%; margin: 10px; height: 450px; padding-top: 10px;">
        
        <strong id="title">최종학력</strong>
            <ul class="wrap_list_value">
                                    <li><label class="frm_chkbox01" for="basic-search-final-edu0"><input type="checkbox" id="graduatecheck" value="대학교졸업(4년)" ><span>대학교 4년 </span></label></li>
                                    <li><label class="frm_chkbox01" for="basic-search-final-edu1"><input type="checkbox" id="graduatecheck" value="대학졸업(2,3년)" ><span>대학교 2,3년 </span></label></li>
                                    <li><label class="frm_chkbox01" for="basic-search-final-edu2"><input type="checkbox" id="graduatecheck" value="석사졸업" ><span>대학원 석사 </span></label></li>
                                    <li><label class="frm_chkbox01" for="basic-search-final-edu2"><input type="checkbox" id="graduatecheck" value="박사졸업" ><span>대학원 박사 </span></label></li>
                                    <li><label class="frm_chkbox01" for="basic-search-final-edu3"><input type="checkbox" id="graduatecheck" value="고등학교졸업" ><span>고등학교 졸업 </span></label></li>
                                    <li><label class="frm_chkbox01" for="basic-search-final-edu3"><input type="checkbox" id="graduatecheck" value="중학교졸업" ><span>중학교 졸업 </span></label></li>
                                    <li><label class="frm_chkbox01" for="basic-search-final-edu3"><input type="checkbox" id="graduatecheck" value="초등학교졸업" ><span>초등학교 졸업 </span></label></li>
                                    <li><label class="frm_chkbox01" for="basic-search-final-edu3"><input type="checkbox" id="graduatecheck" value="학력무관" ><span>학력무관</span></label></li>
                            </ul>
            
        </div>
    <div id="hopelocal" style="border: 1px solid #63b752; float: left; width: 19%; margin: 10px; height: 450px; padding-top: 10px;">
       <table>
      <tr>
				<th id="title">희망 근무 지역</th>
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
       
     
        <div id="jobtype" style="border: 1px solid #63b752;
    float: left;
    width: 42%;
    margin: 10px;
    height: 450px;
    padding-top: 10px;">
         <table>
       <tr>
		<th id="title">직종</th>
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
								
								<th id="title">업종</th>
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
    </div>
     <!--  <div class="choice_wrap new mt20 mb10"> -->
  <div class="choice_inner">
  인재정보 조건 : <span id="selected"></span><br/>
  </div><!-- end choice_inner -->
<!-- </div> -->
	<div>
		<input type="submit" class="btn btn-primary" value="검색">	
    </div>
		