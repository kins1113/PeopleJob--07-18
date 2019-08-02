<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>
<style>
.card-body.PDZ {padding: 0;margin: 0 auto;}
#containerMember{min-width: 310px; height: 450px; max-width: 600px; margin: 0 auto}
#floatMenu {    position: absolute;   left: 81%;   top: 118px;   color: #fff;}
.card-body.reJob {padding: 2px;}
.card-body.reJob table{ width: 100%;height: 100%; }
.card-body.reJob table tbody th {width: 124px;border: 1px solid #795548;background: aliceblue;text-align: center;}
.card-body.reJob table tbody tr:nth-of-type(1) {background: aliceblue;}
.card-body.reJob table thead th, #custextTable thead th, #popupTable thead th {width: 124px;background: #f7f7f7; font-size: 1.1em; font-weight: bold;text-align: right; }
.card-body.reJob table td {  width: 20%; border: 1px solid #795548;text-align: center;}
.card-body.reJob table tbody {  border: 1px solid #795548;}
span#todaySpan {color: #3F51B5;font-size: 0.8em;}
.card-body.CusDiv, .card-body.popup { padding: 2px;}
#custextTable, #popupTable{height:100%; width: 100%}
#custextTable thead {  border-bottom: 2px solid #54504e;}
#custextTable tbody tr { border-bottom: 1px dotted silver;height: 22px; font-size: 12px;}
#custextTable tbody th { text-align: center;width: 70px;padding-right: 4px;}
.moreShow {font-size: 0.7em;color: silver;    float: right;  margin-top: 4px; margin-left: 20px;}
.col-md-12, .col-xl-6{  position: relative;  width: 100%;  min-height: 1px;  padding-right: 5px;    padding-left: 5px;}
.card-default {  margin-bottom: 0.5rem;}
.col-xl-3 {   flex: 0 0 25%;  max-width: 27%;}
.card-body.quickMenu {  padding: 6px;}
.card-header.justify-content-center {    padding: 20px;}
button.mb-1.btn.btn-pill.btn-lg.btn-outline-primary {     line-height: 0.5em;    font-size: 13px;    width: 100%;}
.card-body.popup table tbody th {border: 1px solid #795548;background: aliceblue;text-align: center;}
.card-body.popup table tbody tr{height: 30px;}
#popupTable td { border: 1px solid #795548;  text-align: center;}
</style>

<%-- <c:forEach var="popupVo" items="${popupList}">

	<c:set var="popupName" value=" ${popupVo.popupName }"/> 
	<c:set var="popupImg" value="${popupVo.popupImg }"/>
	<c:set var="width" value="${popupVo.width }"/>
	<c:set var="height" value="${popupVo.height }"/>
	<c:set var="left" value="${popupVo.left }"/>
	<c:set var="top" value="${popupVo.top }"/>
	<c:set var="popupImg" value="${popupVo.popupImg}"/>

</c:forEach> --%>
<c:forEach var="popupVo" items="${popupList}">
	<script type="text/javascript">
		$(function(){
			
			var count = ${fn:length(popupList)}
			for(var i=0;i<count;i++){
				window.open("<c:url value='/manager/popup/popupOpen.do?popupImg=${popupVo.popupImg }'/>",
					"${popupVo.popupName }","width=${popupVo.width },height=${popupVo.height},left=${popupVo.left},top=${popupVo.top}")
					/* window.open("<c:url value='/manager/popup/popupOpen.do'/>",
					"popupNam","width=500,height=600,left=100,top=20") */
			}
	})
	</script>
</c:forEach>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />


<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<script type="text/javascript">

$(function(){
	$("#popupTable tbody").find("tr").eq(1).click(function(){
		alert("asd");
	})
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
		 $("#floatMenu").css('top', newPosition);
		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);
	}).scroll();
	
	//popup관련 정보 가져오는 ajax /manager/index/popup.do
	$.ajax({
		url:"<c:url value='/manager/index/popup.do'/>",
		type:"post",
		success:function(res){
			popupSetting(res);
		},
		error:function(xht, status, error){
			alert(status+" : "+error);
		}
	});	
	//결제 완료 가져가는 ajax /manager/index/payment.do
	$.ajax({
		url:"<c:url value='/manager/index/payment.do'/>",
		type:"post",
		success:function(res){
			paymentSetting(res);
		},
		error:function(xht, status, error){
			alert(status+" : "+error);
		}
	});	
		
	//문의사항 가져오는 ajax /manager/index/custextReg5.do
	$.ajax({
		url:"<c:url value='/manager/index/custextReg5.do'/>",
		type:"post",
		success:function(res){
			custextSetting(res);
		},
		error:function(xht, status, error){
			alert(status+" : "+error);
		}
	});	
		
	//날짜별 방문자수 가져오는 ajax	/manager/index/connet.do
	$.ajax({
		url:"<c:url value='/manager/index/connet.do'/>",
		type:"post",
		success:function(res){
			var count=0;
			$.each(res,function(idx,item){
				//alert("성공"+item.count+", : "+item.connetDay);
				if(idx<7){
					var trEl=$("<tr></tr>");
					trEl.html("<th>"+item.connetDay+"</th>");
					trEl.append("<td>"+item.count+"</td>");
					$("#datatable tbody").append(trEl);	//여기에 추가
				}else{
					var tdEl=$("<td>"+item.count+"</td>");
					$("#datatable tbody").find("tr").eq(count).append(tdEl);
					count=count+1;
				}				
				highChartsConnet();
			})
			
		},
		error:function(thx,status,error){
			alert(status+":"+error);
		}
	});
	
	//회원 차트 관련 ajax  /manager/index/memberInfo.do
	$.ajax({
		url:"<c:url value='/manager/index/memberInfo.do'/>",
		type:"post",
		success:function(res){
			highChartsMember(res);
		},
		error:function(xth,status,error){
			alert(status+" : "+error);
		}
	});
	
	//인재/체용 관련 ajax  /manager/index/reJobInfo.do
	$.ajax({
		url:"<c:url value='/manager/index/reJobInfo.do'/>",
		type:"post",
		success:function(res){
			reJobSetting(res);
		},
		error:function(xth,status,error){
			alert(status+" : "+error);
		}
	});
	
	//퀵 메뉴 누르면 넘어가기
	$(".quickMenu button").click(function(){
		var type=$(this).html();
		if(type=='이력서 등록'){
			location.href="<c:url value='/manager/resume/resumeAdd.do?showKey=resume'/>";
		}else if(type=='채용공고 등록'){
			location.href="<c:url value='/manager/jobopening/jobopeningAdd.do?showKey=resume'/>";
		}else if(type=='상품 등록'){
			location.href="<c:url value='/manager/service/register.do?showKey=service'/>";
		}else if(type=='팝업 등록'){
			location.href="<c:url value='/manager/popup/popupAdd.do?showKey=popup'/>";
		}else if(type=='메일보내기'){
			location.href="<c:url value='/manager/email_sms/emailWrite.do?showKey=mail'/>";
		}else if(type=='게시글 쓰기'){
			location.href="<c:url value='/manager/post/postWrite.do?showKey=post'/>";
		}
			
	});
	
});

//결제완료 세팅
function paymentSetting(res){
	var tableEl=$("#paymentTable tbody").find("tr").eq(1);
	$.each(res,function(idx, item){
		var tdEl=$("<td></td>").html(item);
		tableEl.append(tdEl);
	})
}
//접속자수 관련 
function highChartsConnet(){	
	Highcharts.chart('container', {
		  data: {
		    table: 'datatable'
		  },
		  chart: {
		    type: 'column'
		  },
		  title: {
		    text: '<b>회원 접속 현황</b>'
		  },
		  yAxis: {
		    allowDecimals: false,
		    title: {
		      text: '회 원 수'
		    }
		  },
		  tooltip: {
		        formatter: function () {
		            return  this.point.y;
		        }
		  }
	});
}
//회원 관련 차트
function highChartsMember(item){
	var memberAll=0;
	var memberWithDraw=0;
	var memberJoin=0;
	var memberTW=0;
	var companyAll=0;
	var companyWithDraw=0;
	var companyJoin=0;
	var companyTW=0;
	for(var idx=0; idx<=7; idx++){
		if(idx==2) memberAll=item[idx]; 
		if(idx==3) memberWithDraw=item[idx]; 
		if(idx==4) companyAll=item[idx]; 
		if(idx==5) companyWithDraw=item[idx]; 
		if(idx==6) memberJoin=item[idx]; 
		if(idx==7) companyJoin=item[idx]; 
		if(idx==8) memberTW=item[idx]; 
		if(idx==9) companyTW=item[idx]; 
	};
	Highcharts.chart('containerMember', {

		  chart: {
		    type: 'column'
		  },

		  title: {
		    text: '<b>회원 현황</b>'
		  },

		  xAxis: {
		    categories: ['일반', '기업']
		  },

		  yAxis: {
		    allowDecimals: false,
		    min: 0,
		    title: {
		      text: '회 원 수'
		    }
		  },

		  tooltip: {
		    formatter: function () {
		      return '<b>' + this.x + '</b><br/>' +
		        this.series.name + ': ' + this.y + '<br/>' +
		        'Total: ' + this.point.stackTotal;
		    }
		  },

		  plotOptions: {
		    column: {
		      stacking: 'normal'
		    }
		  },
		  series: [{
		    name: '전체',
		    data: [memberAll, companyAll],
		    stack: 'male'
		  }, {
		    name: '오늘가입',
		    data: [memberJoin, companyJoin],
		    stack: 'female'
		  }, {
		    name: '탈퇴',
		    data: [memberWithDraw, companyWithDraw],
		    stack: 'female'
		  }, {
		    name: '오늘탈퇴',
		    data: [memberTW, companyTW],
		    stack: 'female'
		  }]
		});
}

	//인재 /채용관련 정보 세팅
	function reJobSetting(res){
		$.each(res,function(idx,item){
			//alert(idx+"인 item은 ="+item);
			var resume=$("#reJobTable tbody").find("tr").eq(1);
			var jobopening=$("#reJobTable tbody").find("tr").eq(2);
			var tdEl=$("<td>"+item+"</td>")
			if(idx==0 || idx%2==0){//짝수 체용공고
				jobopening.append(tdEl);
			}else{//이력서
				resume.append(tdEl);
			}
		})
	}
	//popup정보 세팅
	function popupSetting(res){
		$.each(res,function(idx,item){
			var tdEl=$("<td></td>");
			tdEl.html(item);
			$("#popupTable tbody").find("tr").eq(1).append(tdEl);
		})
	}
	
	//문의사항 세팅 custextTable
	function custextSetting(res){
		$.each(res,function(idx, item){
			var trEl=$("<tr></tr>");
			var thEl=$("<th></th>");
			var tdEl=$("<td></td>");
			thEl.html(item.custextcategory);
			tdEl.html("<a href='#'>"+item.custitle+"</a>");
			trEl.html(thEl).append(tdEl);
			$("#custextTable tbody").append(trEl);
			
		})
	}

</script>
          
          <!-- 여기가 top이였음 -->

<div class="content-wrapper">
	<div class="content">
		<!-- Top Statistics -->
		<div class="row">
			<div class="col-xl-6 col-md-12">
				<!-- Sales Graph -->
				<div class="card card-default" data-scroll-height="450">
					<!-- <div class="card-header">
						<h2>접속 현황</h2>
					</div> -->
					<div class="card-body">
					
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

<table id="datatable">
  <thead>
    <tr>
      <th></th>
      <th>이번주</th>
      <th>지난주</th>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
					
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-md-12">
				<!-- Doughnut Chart -->
				<div class="card card-default" data-scroll-height="450">
					<div class="card-body PDZ">
					<div id="containerMember" ></div>
					</div>
				</div>
			</div>
			<div class="col-xl-1 col-md-12">
			</div>
			<div class="col-xl-2 col-md-12" id="floatMenu">
				<!-- Doughnut Chart -->
				<div class="card card-default" data-scroll-height="300">
					<div class="card-header justify-content-center">
						<h2>퀵 메뉴</h2>
					</div>
					<div class="card-body quickMenu">
						<button type="button" class="mb-1 btn btn-pill btn-lg btn-outline-primary" >이력서 등록</button>
						<button type="button" class="mb-1 btn btn-pill btn-lg btn-outline-primary" >채용공고 등록</button>
						<button type="button" class="mb-1 btn btn-pill btn-lg btn-outline-primary" >상품 등록</button>
						<button type="button" class="mb-1 btn btn-pill btn-lg btn-outline-primary" >팝업 등록</button>
						<button type="button" class="mb-1 btn btn-pill btn-lg btn-outline-primary" >메일보내기</button>
						<button type="button" class="mb-1 btn btn-pill btn-lg btn-outline-primary" >게시글 쓰기</button>
					
					</div>
				</div>
					
			</div>
			<div class="col-xl-6 col-md-12">
				<!-- Doughnut Chart -->
				<div class="card card-default" data-scroll-height="150">
					<div class="card-body reJob">
						<table id="reJobTable">
							<thead><tr><th colspan="5">인재/채용현황 <span id="reJobSpan">(오늘 <span id="todaySpan"><c:out value="${today}"/></span>)</span><a href="<c:url value='/manager/resume/resumeList.do?showKey=resume'/>" class="moreShow">더 보기</a></th></tr></thead>
							<tbody>
								<tr>
									<th></th>
									<th>오늘</th>
									<th>어제</th>
									<th>이번주</th>
									<th>지난주</th>
								</tr>
								<tr>
									<th>이력서&nbsp;</th>
								</tr>
								<tr>
									<th>채용공고&nbsp;</th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>				
			<div class="col-xl-3 col-md-12">
				<!-- Doughnut Chart -->
				<div class="card card-default" data-scroll-height="150">
					<div class="card-body CusDiv">
						<table id="custextTable">
						 	<thead><tr><th colspan="2">문의사항 <span id="reJobSpan">(오늘 <span id="todaySpan"><c:out value="${today}"/></span>)</span><a href="#" class="moreShow">더 보기</a></th></tr></thead>
						 	<tbody>
						  	</tbody>
						</table>
					</div>
				</div>
			</div>				
			<div class="col-xl-6 col-md-12">
				<!-- Doughnut Chart -->
				<div class="card card-default" data-scroll-height="130">
					<div class="card-body reJob">
						<table id="paymentTable">
							<thead><tr><th colspan="5">서비스 결제 현황 <span id="reJobSpan">(오늘 <span id="todaySpan"><c:out value="${today}"/></span>)</span><a href="<c:url value='/manager/payment/list.do'/>"  class="moreShow">더 보기</a></th></tr></thead>
							<tbody>
								<tr>
									<th></th>
									<th>오늘</th>
									<th>어제</th>
									<th>이번주</th>
									<th>지난주</th>
								</tr>
								<tr>
									<th>결제완료</th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>				
			<div class="col-xl-3 col-md-12">
				<!-- Doughnut Chart -->
				<div class="card card-default" data-scroll-height="130">
					<div class="card-body popup">
					<table id="popupTable">
							<thead><tr><th colspan="5">팝업 현황 <span id="reJobSpan">(오늘 <span id="todaySpan"><c:out value="${today}"/></span>)</span><a href="<c:url value='/manager/popup/popupList.do?showKey=popup'/>"  class="moreShow">더 보기</a></th></tr></thead>
							<tbody>
								<tr>
									<th></th>
									<th>진행중</th>
									<th>마감직전</th>
									<th>미사용</th>
								</tr>
								<tr>
									<th>수량</th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>				
				
			
		</div>
	</div>
</div>


<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>