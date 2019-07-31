<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>
<style>
.card-body.PDZ {padding: 0;margin: 0 auto;}
#containerMember{min-width: 310px; height: 450px; max-width: 600px; margin: 0 auto}
</style>

<c:forEach var="popupVo" items="${popupList}">

	<c:set var="popupName" value=" ${popupVo.popupName }"/> 
	<c:set var="popupImg" value="${popupVo.popupImg }"/>
	<c:set var="width" value="${popupVo.width }"/>
	<c:set var="height" value="${popupVo.height }"/>
	<c:set var="left" value="${popupVo.left }"/>
	<c:set var="top" value="${popupVo.top }"/>
	<c:set var="popupImg" value="${popupVo.popupImg}"/>

</c:forEach>
<script type="text/javascript">
$(function(){
	var count = ${fn:length(popupList)}
	for(var i=0;i<count;i++){
		window.open("<c:url value='/manager/popup/popupOpen.do?popupImg=${popupImg}'/>",
			"${popupName}","width=${width},height=${height},left=${left},top=${top}")
			/* window.open("<c:url value='/manager/popup/popupOpen.do'/>",
			"popupNam","width=500,height=600,left=100,top=20") */
	}
})
</script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script type="text/javascript">
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
		      return '<b>' + this.series.name + '</b><br/>' +
		        this.point.y + ' ' + this.point.name.toLowerCase();
		    }
		  }
	});
}
//회원 관련 차트
function highChartsMember(item){
	var memberAll=0;
	var memberWithDraw=0;
	var memberJoin=0;
	var companyAll=0;
	var companyWithDraw=0;
	var companyJoin=0;
	for(var idx=0; idx<=7; idx++){
		if(idx==2) memberAll=item[idx]; 
		if(idx==3) memberWithDraw=item[idx]; 
		if(idx==4) companyAll=item[idx]; 
		if(idx==5) companyWithDraw=item[idx]; 
		if(idx==6) memberJoin=item[idx]; 
		if(idx==7) companyJoin=item[idx]; 
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
		  }]
		});
}

$(function(){
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
});
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
			<div class="col-xl-4 col-md-12">
				<!-- Doughnut Chart -->
				<div class="card card-default" data-scroll-height="450">
					<div class="card-body PDZ">
					<div id="containerMember" ></div>
					</div>
				</div>
			</div>
			<div class="col-xl-2 col-md-12">
				<!-- Doughnut Chart -->
				<div class="card card-default" data-scroll-height="450">
					<div class="card-header justify-content-center">
						<h2>퀵 메뉴</h2>
					</div>
					<div class="card-body">
					
					
					</div>
				</div>
			</div>
		</div>


					</div>
				</div>


<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>


	

