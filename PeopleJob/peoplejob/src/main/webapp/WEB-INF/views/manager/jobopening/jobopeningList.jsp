<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>


<style type="text/css">
a{color: black;}
#pageDiv {width: 30%;}
.serDiv {float: right;margin-top: 9px;}
input.form-control {	margin-top: 4px;}
input.btn.btn-secondary.btn-default {margin-top: 4px;}
#boardTable {font-size: 1.0em;}
#cardBoduPostList {margin: 0 5px 5px 5px;padding: 0 5px 5px 5px;}
#btGroup {margin-right: 20px;}
#pageSize {	float: left;margin-left: 20px;margin-top: 9px;}
#startDay, #endDay{width: 120px;}
#btGroup button{margin-top: 4px;}
div#searchDiv {overflow: hidden;margin: 20px auto 0 auto;padding-top: 23px;border: 1.6px solid;
				width: 97.5%;background: #f5f6fa;}
div#searchDtDiv{background: white;width: 95.5%;    margin: 0 auto;}
div#searchGrDiv{margin-right: 26%;}
input[name=searchKeyword]{width: 400px;margin-right: 3px;}
#searchDtDiv table th{width: 70px;padding: 5px;border: 1px solid silver;}
#searchDtDiv table tr{border-bottom: 0.1px solid #dbdce0eb;}
/* #searchDtDiv table tr:nth-last-of-type(2) td:nth-last-of-type(1) {width: 27%}
#searchDtDiv table tr:nth-last-of-type(2) td:nth-last-of-type(2) {width: 12%}
#searchDtDiv table tr:nth-last-of-type(2) td:nth-last-of-type(3) {width: 42%}
#searchDtDiv table tr:nth-last-of-type(3) td{width: 32%} */
#searchDtDiv table {border: 2px solid #4c84ff9e;width:100%;}
#dateSearchShow input, #eeDay input{height: 33px;padding: 0 9px 0 5px;font-size: 13px;}
.dateSearchShow{float: left;margin-left: 5px;}
.FST{height: 33px;padding: 0 9px 0 5px;font-size: 13px;}
.float{float: left;}
.genderShow{width: 95px;margin: 10px 0 10px 5px;float: left;}
.labelFont{width: 160px;}
</style>
<script type="text/javascript">
	$(document).ready(function (){
		//맨위에 체크박스 누르면 전체 선택
		$("#memberCkAll").click(function(){
			$("input[name=memberCk]").prop("checked",this.checked)
		});
		$("#pageSize select[name=recordCountPerPage]").change(function(){
			$("form[name=postList]").submit();
		});
		
		//상세보기 누르면 searchDtDiv 보여주기
		$("#searchDtDiv").hide();		//주석 풀기
		$("#postSearchDtCg").hide();
		$("#postSearchDt").click(function(){
			$("#searchDtDiv").show();
			$("#postSearchDtCg").show();
			$(this).hide();
		});
		$("#postSearchDtCg").click(function(){
			$("#searchDtDiv").hide();
			$("#postSearchDt").show();
			$(this).hide();
			
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
		
		//날짜 옆에 버튼 누르면 값 세팅되기
		$(".SDButton").click(function(){
			var SDVal=$(this).val();
			//input[name=endDay]의 값을 확인 있나없나
		
			var endDay;
			if($("input[name=endDay]").val()==''){
				//값이 없으면 오늘 날짜
				endDay=getToday();
			}else {
				//값이 있으면 그 값
				endDay=$("input[name=endDay]").val();
			}
			
			var type=getType(SDVal);
			var trem=getTrem(SDVal);
			var startDay=getStartDay(endDay,type,trem)
			//alert("클릭 이벤트에서 startDay="+startDay+", endDay="+endDay+", type="+type+", trem="+trem);
			startDay=fmtDay(startDay)
			//alert("클릭 이벤트에서 포멧후 startDay="+startDay);
			//세팅하기
				setingDate(startDay, endDay)
		})
		
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
		
		//경력이 선택되면 콤보박스 보여주기
		$("#selectCareer").hide();
		
		$("#careerY").click(function(){
			if($(this).is(":checked")){
				$("#selectCareer").show();	
			}else{
				$("#selectCareer").hide();
			}
		});
	});
	
	//1차 직종 가져오기
	function selectFirst(){
		$.ajax({
			url:"<c:url value='/manager/occupantion/firstList.do'/>",
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
			url:"<c:url value='/manager/occupantion/selectSecond.do'/>",
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
			url:"<c:url value='/manager/occupantion/selectThird.do'/>",
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
	//오늘날짜 구하는 메서드
	function getToday(){
		var nowday=new Date();
		var day=nowday.getDate();
		var month=nowday.getMonth()+1;
		var year=nowday.getFullYear();
		var today=year+"-"+AddZero(month,"m")+"-"+AddZero(day,"d");
		
		return today;
	}
	//오늘날짜 구하는 메서드
	function fmtDay(pDay){
		var day=pDay.getDate();
		var month=pDay.getMonth()+1;
		var year=pDay.getFullYear();
		var today=year+"-"+AddZero(month,"m")+"-"+AddZero(day,"d");
		return today;
	}
	//시작날짜 구하는 메서드
	function getType(SDVal){
		var type;
		if(SDVal=="오늘"){type="d";
		}else if(SDVal=="이번주"){type="day";
		}else if(SDVal=="이번달"){type="month";
		}else if(SDVal=="1주일"){type="d";
		}else if(SDVal=="15일"){type="d";
		}else if(SDVal=="1개월"){type="m";
		}else if(SDVal=="3개월"){type="m";
		}else if(SDVal=="9개월"){type="m";
		}
		return type;
	}
	//버튼에 맞는 텀 구하는 메서드
	function getTrem(SDVal){
		var trem;
		if(SDVal=="오늘"){trem="1";
		}else if(SDVal=="이번주"){trem="1";
		}else if(SDVal=="이번달"){trem="1";
		}else if(SDVal=="1주일"){trem="7";
		}else if(SDVal=="15일"){trem="16";
		}else if(SDVal=="1개월"){trem="1";
		}else if(SDVal=="3개월"){trem="3";
		}else if(SDVal=="9개월"){trem="9";
		}
		return trem;
	}
	//이번주 이번달 구하는 메서드
	function getDayMonth(day,type){
		
	}
	 
	//날이 10일 이하면 0앞에 붙이는 메서드
	function AddZero(d, type){
		if(type=="m"){
			if(d<10){
				d="0"+d;
				return d;
			}
		}else if(type=="d"){
			if(d<10){
				d="0"+d;
				return d;
			}
		}
		return d; 
	}
	
	function setingDate(startDay, endDay){
		$("input[name=startDay]").val(startDay);
		$("input[name=endDay]").val(endDay);
	}
	
	function getStartDay(endDate,type, term){
		var arr=endDate.split('-');
		var date = new Date(arr[0],arr[1]-1,arr[2]); //(2019,6,8)
		if(type=="day"){
			getMonday(date);
		}else if(type=="month"){
			//alert("date.getFullYear()="+date.getFullYear()+", date.getMonth()+1="+date.getMonth()+1);
			date= new Date(date.getFullYear(),date.getMonth(),1);
		}else if(type=="d"){
			date.setDate(date.getDate()-term);
		}else if(type="m"){
			date.setMonth(date.getMonth()-term);
		}
		//alert("getStartDay에서 결과값 date="+date);
		return date;
	}	
	
	//이번주 월요일을 가져오는 메서드 
	function getMonday(endDay){
		 var day = endDay.getDay() || 7;  
		    if( day !== 1 ) 
		    	endDay.setHours(-24 * (day - 1)); 
		    return endDay;
	}
	
	//지역정보를 가져오는 메서드 
	function getLocation(){
		$.ajax({
			url:"<c:url value='/manager/occupantion/selectLocation.do'/>",
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
			url:"<c:url value='/manager/occupantion/selectLocation2.do'/>",
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
			url:"<c:url value='/manager/occupantion/selectBtype1.do'/>",
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
			url:"<c:url value='/manager/occupantion/selectBtype2.do'/>",
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
			url:"<c:url value='/manager/occupantion/selectBtype3.do'/>",
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
	
	//메서드추가
	
	//페이지 처리 함수
	function pageFunc(curPage){
		$("input[name=currentPage]").val(curPage);
		$("form[name=memberList]").attr("action","<c:url value='/manager/member/memberList.do?authorityCk=member'/>");
		$("form[name=memberList]").submit();
	}
	
</script>
<form name="memberList" method="post" 
		 enctype="multipart/form-data" >
<!-- 페이지 처리를 위한 hidden  -->
<input type="hidden" name="currentPage"
	<c:if test="${param.currentPage!=null }">
	 	value="${param.currentPage }"
	</c:if>
	<c:if test="${param.currentPage==null }">
		value='1';
	</c:if>
 >
 
<!-- 회사인지 일반인지 구분하기 위한 hidden -->
<input type="hidden" name="authorityCk" value="${param.authorityCk }">
<!-- 필터링을 위한 hidden -->
<input type="hidden" name="filterCode" value="${param.filterCode }">
<input type="hidden" name="filterKey" value="${param.filterKey}">

<!-- 삭제 수정 처리를 위한 hidden -->
<input type="hidden" name="deletecheck" value="N">
<input type="hidden" name="boardCode2" value="0">
<div class="row">
	<div class="col-lg-12">
		<div class="card card-default">
			<div class="card-header card-header-border-bottom">
				<h2>채용공고 관리</h2>
			</div>
			<!-- 해더 부분 버튼 그룹 시작  -->
			<div>
				<div id="searchDiv" align="absmiddle">
				
				
					<div id="searchDtDiv">
						<table>
							<tr>
								<th>등록일</th>
								<td id="dateSearchShow" colspan="5">
										<div class="incDate dateSearchShow" id="startDay">
											 <c:import url="../../inc/date.jsp">
												<c:param name="name" value="startDay"></c:param>
												<c:param name="id" value="workdate1"></c:param>
											</c:import>				
										</div>
										<div class="dateSearchShow">
											<br><b> ~ </b>
										</div>
										<div class="incDate dateSearchShow" id="endDay">
											 <c:import url="../../inc/date.jsp">
												<c:param name="name" value="endDay"></c:param>
												<c:param name="id" value="workdate2"></c:param>
											</c:import> 				
										</div>
										<div class="dateSearchShow">
											<input type="button" class="btn btn-secondary btn-default SDButton" value="오늘">
											<input type="button" class="btn btn-secondary btn-default SDButton" value="이번주">
											<input type="button" class="btn btn-secondary btn-default SDButton" value="이번달">
											<input type="button" class="btn btn-secondary btn-default SDButton" value="1주일">
											<input type="button" class="btn btn-secondary btn-default SDButton" value="15일">
											<input type="button" class="btn btn-secondary btn-default SDButton" value="1개월">
											<input type="button" class="btn btn-secondary btn-default SDButton" value="3개월">
											<input type="button" class="btn btn-secondary btn-default SDButton" value="9개월">
										</div>
								</td>
							</tr>
							<tr>
								<th>직종</th>
								<td colspan="2">
									<select class="custom-select my-1 FST" id="selectFirst">
										<option>1차 직종</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" id="selectSecond">
										<option>2차 직종</option>
										<option>먼저 1차 직종을 선택하세요</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" id="selectThird">
										<option>3차 직종</option>
										<option>먼저 2차 직종을 선택하세요</option>
									</select>
								</td>
								<th>업종</th>
								<td colspan="2">
									<select class="custom-select my-1 FST" id="selectBtype1">
										<option>1차 업종</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" id="selectBtype2">
										<option>2차 업종</option>
										<option>먼저 1차 업종을 선택하세요</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" id="selectBtype3">
										<option>3차 업종</option>
										<option>먼저 2차 업종을 선택하세요</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>지역</th>
								<td colspan="2">
									<select class="custom-select my-1 mr-sm-2 FST" id="locationSiDo">
										<option>시/도</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST" id="locationGugun">
										<option>구/군</option>
										<option>먼저 시/도를 선택하세요</option>
									</select>
								</td>
								
								<th>연령</th>
								<td colspan="2">
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>20대
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>30대
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>40대
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>50이상
									</label>
								</td>
							</tr>
							<tr>
							<th>성별</th>
								<td colspan="2">
									<label class="control control-checkbox checkbox-primary genderShow">
										<input type="checkbox" name="memberGender" id="memberGenderG" />
										<div class="control-indicator float"></div>무관
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
										<input type="checkbox" name="memberGender" id="memberGenderG" />
										<div class="control-indicator float"></div>여자
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>남자
									</label>
									
								</td>
								
								<th>경력</th>
								<td colspan="2">
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="careerNull" />
											<div class="control-indicator float"></div>경력 무관
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="careerN" />
											<div class="control-indicator float"></div>신입
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="careerY" />
											<div class="control-indicator float"></div>경력
									</label>
									<select class="custom-select my-1 mr-sm-2 FST " id="selectCareer">
										<option>1~3년</option>
										<option>3~5년</option>
										<option>5~10년</option>
										<option>10년이상</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>최종학력</th>
								<td colspan="5">
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>학력무관
									</label>
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>초등학교 졸업
									</label>
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>중학교 졸업
									</label>
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>고등학교 졸업
									</label>
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>대학교(2,3년재) 졸업
									</label>
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>대학교(4년재) 졸업
									</label>
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>대학교 석사
									</label>
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float "></div>대학교 박사
									</label>
									
								</td>
							</tr>
							<tr>
							<th>채용마감</th>
								<td colspan="5">
									 <div class="incDate dateSearchShow" id="eeDay">
										 <c:import url="../../inc/date.jsp">
											<c:param name="name" value="startDay"></c:param>
											<c:param name="id" value="workdate1"></c:param>
										</c:import>
									</div>	
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="careerNull" />
											<div class="control-indicator float"></div>상시모집
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="careerN" />
											<div class="control-indicator float"></div>채용시까지
									</label>
								</td>
							</tr>
						</table>			
					</div>
				
				
				<div id="searchGrDiv">
						<div class="form-group serDiv">
							<input type="button" class="btn btn-secondary btn-default" id="postSearchDt"value="상세검색">&nbsp;
							<input type="button" class="btn btn-secondary btn-default" id="postSearchDtCg"value="간편검색">&nbsp;
						</div>
						<div class="form-group serDiv">
							<input type="submit" class="btn btn-secondary btn-default" id="postSearch"value="검색">&nbsp;
						</div>
						<div class="form-group serDiv">
							<input type="text" class="form-control" placeholder="검색어"
								name="searchKeyword" value="${param.searchKeyword }">&nbsp;
						</div>
						<div class="form-group serDiv">
							<select class="custom-select my-1 mr-sm-2" name="searchCondition">
								<option value="all">통합검색</option>
								<option value="memberid"
									<c:if test="${param.searchCondition=='memberid' }">
									selected="selected"
									</c:if>>아이디
								</option>
								<option value="membername"
									<c:if test="${param.searchCondition=='membername' }">
									selected="selected"
									</c:if>>이름
								</option>
								<option value="address,addressdetail"
									<c:if test="${param.searchCondition=='address,addressdetail' }">
									selected="selected"
								</c:if>>채용공고
								</option>
							</select>
						</div>
					</div>
				</div>
				<div align="right" class="form-group serDiv" id="btGroup">
					<input type="button" class="btn btn-secondary btn-default" id="btMultMail" value="선택 삭제">
					<input type="button"class="btn btn-secondary btn-default" id="" value="채용공고 등록"> 
				</div>
				<div class="form-group" id='pageSize'>
					<select class="custom-select my-1 mr-sm-2" name="recordCountPerPage">
						<option value="10"
							<c:if test="${param.recordCountPerPage==10 }">
								selected="selected"
							</c:if>>10개씩
						</option>
						<option value="20"
							<c:if test="${param.recordCountPerPage==20 }">
								selected="selected"
							</c:if>>20개씩
						</option>
						<option value="30"
							<c:if test="${param.recordCountPerPage==30 }">
								selected="selected"
							</c:if>>30개씩
						</option>
						<option value="50"
							<c:if test="${param.recordCountPerPage==50 }">
								selected="selected"
							</c:if>>50개씩
						</option>
					</select>
				</div>
			</div>
			<!-- 해더 부분 버튼 그룹 끝 -->
			<div class="card-body" id="cardBoduPostList">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th><label class="control control-checkbox checkbox-primary">
									<input type="checkbox" name="memberCkAll" id="memberCkAll" />
									<div class="control-indicator"></div>
							</label></th>
							<th scope="col"><a href="#" class="fileterCode" id="member_Code">회원코드</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="member_Code">회사명/담당자/아이디</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="birth">채용정보</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="birth">서비스 정보</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="membergender">편집</a></th>
						</tr>
					</thead>
					<tbody>
					<!--  반복 시작  -->
					<c:if test="${empty list }">
						<td colspan="11" align="center">만족하는 사용자가 없습니다....</td>
					</c:if>
					<c:if test="${!empty list }">
						<c:forEach var="memberVo" items="${list}">
							<tr>
								<td>
									<label class="control control-checkbox checkbox-primary">
											<input type="checkbox" name="memberCk" id="memberCk" value="${memberVo.email}" />
											<div class="control-indicator"></div>
									</label>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- 반복 끝 -->
					</tbody>
				</table>
				<div class="divPage" align="center">
					<!-- 이전블럭으로 이동하기 -->
					<c:if test="${pagingInfo.firstPage>1 }">
						<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> <img
							src="<c:url value='/resources/images/first.JPG'/>"
							alt="이전블럭으로 이동">
						</a>
					</c:if>
					<!-- 페이지 번호 추가 -->
					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage }"
						end="${pagingInfo.lastPage }">
						<c:if test="${i==pagingInfo.currentPage }">
							<span style="color: blue; font-size: 1em">${i }</span>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<a href="#" onclick="pageFunc(${i})">[${i}]</a>
						</c:if>
					</c:forEach>
					<!--  페이지 번호 끝 -->

					<!-- 다음 블럭으로 이동하기 -->
					<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
						<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> <img
							src="<c:url value='/resources/images/last.JPG'/>"
							alt="다음블럭으로 이동">
						</a>
					</c:if>
				</div>
				<div class="divSearch"></div>
			</div>
		</div>
		</div></div>
</form>




<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>