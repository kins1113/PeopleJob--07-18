/**
 * 
 */



//1차 직종 가져오기
function selectFirst(){
	$.ajax({
		url:"/peoplejob/manager/occupantion/firstList.do",
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
		url:"/peoplejob/manager/occupantion/selectSecond.do",
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
		url:"/peoplejob/manager/occupantion/selectThird.do",
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
		url:"/peoplejob/manager/occupantion/selectLocation.do",
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
		url:"/peoplejob/manager/occupantion/selectLocation2.do",
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
		url:"/peoplejob/manager/occupantion/selectBtype1.do",
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
		url:"/peoplejob/manager/occupantion/selectBtype2.do",
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
		url:"/peoplejob/manager/occupantion/selectBtype3.do",
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


//1차 직종 가져오기
function selectFirst1(){
	$.ajax({
		url:"/peoplejob/manager/occupantion/firstList.do",
		type:"post",
		success:function(res){
			settingFirst1(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}

//1차 직종 뿌리기
//[{"firstCode":1,"firstname":"경영·사무"},{"firstCode":2,"firstname":"영업·고객상담"},{"firstCode":3,"firstname":"생산·제조"},
//{"firstCode":4,"firstname":"IT·인터넷"},{"firstCode":5,"firstname":"전문직"},{"firstCode":6,"firstname":"교육"}
function settingFirst1(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>1차 직종</option>")
			var opEl=$("<option value='"+item.firstCode+"'></option>");
			opEl.append(item.firstname);
			$("#selectFirst1").html(chEl);
			$("#selectFirst1").append(opEl); //최종으로 여기에 넣음
		}else{
			var opEl=$("<option value='"+item.firstCode+"'></option>");
			opEl.append(item.firstname);
			$("#selectFirst1").append(opEl); //최종으로 여기에 넣음
		}
	})
}

//2차 직종가져오기 
function selectSecond1(firstCode){
	$.ajax({
		url:"/peoplejob/manager/occupantion/selectSecond.do",
		type:"post",
		data:"firstCode="+firstCode,
		success:function(res){
			settingSecond1(res);
		},
		error:function(xhr,status,error){
			alert(status+":"+error);
		}
	});
}
//[{"secondCode":101,"secondname":"기획·전략·경영","firstCode":1},
//{"secondCode":102,"secondname":"총무·법무·사무","firstCode":1},.....	]
//2차 직종 세팅하기 함수
function settingSecond1(res){
	$.each(res,function(idx,item){
		if(idx==0){
			//option태그 만들어서 
			var opEl=$("<option value='"+item.secondCode+"'></option>")
			//값을 넣고 
			opEl.html(item.secondname);
			//append
			$("#selectSecond1").html("<option value='0'>2차 직종</option>");
			$("#selectSecond1").append(opEl);
		}else{
			//option태그 만들어서 
			var opEl=$("<option value='"+item.secondCode+"'></option>")
			//값을 넣고 
			opEl.append(item.secondname);
			//append
			$("#selectSecond1").append(opEl);
		}
	});
	var thirdEl=$("<option>3차 직종</option><option>먼저 2차 직종을 선택하세요</option>");
	$("#selectThird1").html(thirdEl);
};

//3차직종 가져오기 
function selectThird1(secondCode){
	$.ajax({
		url:"/peoplejob/manager/occupantion/selectThird.do",
		type:"post",
		data:"secondCode="+secondCode,
		success:function(res){
			settingThird1(res);
		},
		error:function(xhr,status,error){
			alert(status+":"+error);
		}
	});

} 
//3차 직종 뿌려주기 
function settingThird1(res){
	$.each(res,function(idx,item){
		if(idx==0){
			//option태그 만들어서 
			var opEl=$("<option value='"+item.thirdCode+"'></option>")
			//값을 넣고 
			opEl.html(item.thirdname);
			//append
			$("#selectThird1").html("<option value='0'>3차 직종</option>");
			$("#selectThird1").append(opEl);
		}else{
			//option태그 만들어서 
			var opEl=$("<option value='"+item.thirdCode+"'></option>")
			//값을 넣고 
			opEl.append(item.thirdname);
			//append
			$("#selectThird1").append(opEl);
		}
	});
}

/**
 * 
 */



//1차 직종 가져오기
function selectFirst2(){
	$.ajax({
		url:"/peoplejob/manager/occupantion/firstList.do",
		type:"post",
		success:function(res){
			settingFirst2(res);
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	})
}

//1차 직종 뿌리기
//[{"firstCode":1,"firstname":"경영·사무"},{"firstCode":2,"firstname":"영업·고객상담"},{"firstCode":3,"firstname":"생산·제조"},
//{"firstCode":4,"firstname":"IT·인터넷"},{"firstCode":5,"firstname":"전문직"},{"firstCode":6,"firstname":"교육"}
function settingFirst2(res){
	$.each(res,function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>1차 직종</option>")
			var opEl=$("<option value='"+item.firstCode+"'></option>");
			opEl.append(item.firstname);
			$("#selectFirst2").html(chEl);
			$("#selectFirst2").append(opEl); //최종으로 여기에 넣음
		}else{
			var opEl=$("<option value='"+item.firstCode+"'></option>");
			opEl.append(item.firstname);
			$("#selectFirst2").append(opEl); //최종으로 여기에 넣음
		}
	})
}

//2차 직종가져오기 
function selectSecond2(firstCode){
	$.ajax({
		url:"/peoplejob/manager/occupantion/selectSecond.do",
		type:"post",
		data:"firstCode="+firstCode,
		success:function(res){
			settingSecond2(res);
		},
		error:function(xhr,status,error){
			alert(status+":"+error);
		}
	});
}
//[{"secondCode":101,"secondname":"기획·전략·경영","firstCode":1},
//{"secondCode":102,"secondname":"총무·법무·사무","firstCode":1},.....	]
//2차 직종 세팅하기 함수
function settingSecond2(res){
	$.each(res,function(idx,item){
		if(idx==0){
			//option태그 만들어서 
			var opEl=$("<option value='"+item.secondCode+"'></option>")
			//값을 넣고 
			opEl.html(item.secondname);
			//append
			$("#selectSecond2").html("<option value='0'>2차 직종</option>");
			$("#selectSecond2").append(opEl);
		}else{
			//option태그 만들어서 
			var opEl=$("<option value='"+item.secondCode+"'></option>")
			//값을 넣고 
			opEl.append(item.secondname);
			//append
			$("#selectSecond2").append(opEl);
		}
	});
	var thirdEl=$("<option>3차 직종</option><option>먼저 2차 직종을 선택하세요</option>");
	$("#selectThird2").html(thirdEl);
};

//3차직종 가져오기 
function selectThird2(secondCode){
	$.ajax({
		url:"/peoplejob/manager/occupantion/selectThird.do",
		type:"post",
		data:"secondCode="+secondCode,
		success:function(res){
			settingThird2(res);
		},
		error:function(xhr,status,error){
			alert(status+":"+error);
		}
	});

} 
//3차 직종 뿌려주기 
function settingThird2(res){
	$.each(res,function(idx,item){
		if(idx==0){
			//option태그 만들어서 
			var opEl=$("<option value='"+item.thirdCode+"'></option>")
			//값을 넣고 
			opEl.html(item.thirdname);
			//append
			$("#selectThird2").html("<option value='0'>3차 직종</option>");
			$("#selectThird2").append(opEl);
		}else{
			//option태그 만들어서 
			var opEl=$("<option value='"+item.thirdCode+"'></option>")
			//값을 넣고 
			opEl.append(item.thirdname);
			//append
			$("#selectThird2").append(opEl);
		}
	});
}

//지역정보를 가져오는 메서드 
function getLocation10(){
	$.ajax({
		url:"/peoplejob/manager/occupantion/selectLocation.do",
		type:"post",
		success:function(res){
			settingLocation10(res);
		},
		error:function(xht,status,error){
			alert(status+":"+error);
		}
	});//ajax
}
//지역정보를 뿌려주는 메서드
function settingLocation10(res){
	$.each(res, function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>시/도</option>");
			var opEl=$("<option value='"+item.localCode2+"'></option>")
			opEl.html(item.sido);
			$("#locationSiDo10").html(chEl);
			$("#locationSiDo10").append(opEl);
		}else{
			var opEl=$("<option value='"+item.localCode2+"'></option>")
			opEl.html(item.sido);
			$("#locationSiDo10").append(opEl);
		}
	});
}
//지역정보를 가져오는 메서드 - 구군
function getLocation20(sidoCode){
	$.ajax({
		url:"/peoplejob/manager/occupantion/selectLocation2.do",
		type:"post",
		dataType: "json",
		data:"sidoCode="+sidoCode,
		success:function(res){
			settingLocation20(res);
		},
		error:function(xht,status,error){
			alert(status+":"+error);
		}
	});//ajax
}
//지역정보를 뿌려주는 메서드 - 구군
function settingLocation20(res){
	$.each(res, function(idx,item){
		if(idx==0){
			var chEl=$("<option value='0'>구/군</option>");
			var opEl=$("<option value='"+item["LOCAL_CODE2"]+"'></option>")
			opEl.html(item["GUGUN"]);
			$("#locationGugun20").html(chEl);
			$("#locationGugun20").append(opEl);
		}else{
			//alert("세팅 item[LOCAL_CODE2]="+item["LOCAL_CODE2"]+", item[GUGUN]"+item["GUGUN"])
			var opEl=$("<option value='"+item["LOCAL_CODE2"]+"'></option>")
			opEl.html(item["GUGUN"]);
			$("#locationGugun20").append(opEl);
		}

	});
}