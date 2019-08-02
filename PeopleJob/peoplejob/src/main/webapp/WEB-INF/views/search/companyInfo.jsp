<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>    
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <style type="text/css">
form {
    width: 900px;
    margin: 0 auto;
    border:1px;
 
    margin-left: 25%;  
}

button.btn.btn-success {
    margin: 3px;
  
}
  .center {
    margin-left: 46%;
}
div#detail {
    background: #f2f4f7;
    
}
a {
    color: black;
    text-decoration: none;
}
.navbar-dark .navbar-nav .nav-link {
    color: black;
}
section.redetail {
    margin: 5px;
    background: white;
}
img{

    width: 100%;
    height: 100%;

}
div#imgDiv {
    width: 150px;
    height: 170px;
    float: left;
}
p.lead.mb-7 {
    margin: 2px;
    font-family: serif;
}

div #memberinfo {
   border: 1px solid lightgray;
    width: 550px;
    padding: 21px;
    margin-left: 197px;
}
div .memberinfo {
   border: 1px solid lightgray;
    width: 800px;
    padding: 21px;
    
}
.resume-content {
    border: 1px solid lightgray;
    padding: 51px;
   width: 400px;
}
div#hopeworkinfo {
    border: 1px solid lightgray;
    padding: 20px;
}
.certiinfo {
    border: 1px solid lightgray;
        padding: 17px;
}
h2.mb-5 {
    font-weight: bold;
}
span.glyphicon.glyphicon-star {
    padding-bottom: 18px;
}
span.glyphicon.glyphicon-globe {
    margin-left: 0px; 
}
span.glyphicon.glyphicon-user {
    margin-bottom: 22px;
}
span.glyphicon.glyphicon-briefcase {
    margin-bottom: 26px;
}
.divList {
    width: 900px;
    margin: 0 auto;
    padding: 10px;
}
span #companyname{
	font-size: 16px;
	
}
</style>  
<script type="text/javascript">
/* $(window).scroll(function( ){  //스크롤이 움직일때마다 이벤트 발생 
    var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
    $( id ).stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
}); */
//<c:url value='/company/map.do?companyCode=${cvo.companyCode}'/>
	function go(companyCode){ 
		window.open("<c:url value='/company/map.do?companyCode="+companyCode+"'/>","주소로 장소 표시","height=500,width=700,resizable=yes");
	}
</script>



<div id="detail">
<form name="frm1" method="post" 
	action="<c:url value='/resume/resumedetail.do'/>" enctype="multipart/form-data">
	 <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
    <a class="navbar-brand js-scroll-trigger" href="#page-top">
      <span class="d-block d-lg-none">Clarence Taylor</span>
      <span class="d-none d-lg-block">
        <!-- <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="img/profile.jpg" alt=""> -->
      </span>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </nav>
 	<section class="resume-section p-3 p-lg-5 d-flex align-items-center redetail" id="about">
 	<input type="hidden" name="jobopening" value="${vo.jobopening }">
      <div class="w-100">
        <h1 class="mb-0">기업정보
          <span class="text-primary">상세보기</span>
        </h1>
        <hr>      
        <h2 class="mb-5">회사정보</h2>
        <span id="companyname" aria-hidden="true" style="font-size:20px;font-weight: bold;">${cvo.companyname}</span>&nbsp;&nbsp;
        <p class="lead mb-7" style="font-weight: bold;"></p><!-- 공고제목 -->
        <span style="float:right;">회사창립년도:${cvo.establishyear}</span><br><br>
        <div id="imgDiv">
	        <img src="<c:url value='/logo_upload/${cvo.image }'/>" 
							alt="" width="50">
        </div>
		<div id="memberinfo">				
        	&nbsp;&nbsp;<br>   
        <div class="subheading mb-5">
        <span aria-hidden="true"></span>회사 주소:<span>${cvo.companyAddress} ${cvo.companyAddressdetail }</span>
        <%-- <a href="#" onclick="go(${cvo.companyCode})" ><input type="button" id="map2" class="btn btn-default btn-mg" role="button" value="지도보기"></a> --%>
        <br><br>
        <span aria-hidden="true"></span>총 사원 수:<span>${cvo.womannum + cvo.mannum}명</span><br><br>
        <span aria-hidden="true"></span>설립년도:<span>${cvo.establishyear}</span><br><br>
        <span aria-hidden="true"></span>사이트:<span>${cvo.site}</span><br><br>
        <span aria-hidden="true"></span>주요사업:<span>${cvo.majorbusiness}</span><br><br>
        <div id="map" style="width:100%;height:350px;"></div>
        
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5fed5213f5d578ef4fc7c1ea35d204a0&libraries=services"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        //center: new kakao.maps.LatLng(37.519446, 126.843301), // 지도의 중심좌표
		        center: new kakao.maps.LatLng(37.502591, 127.024943), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder(); 
		var address="${cvo.companyAddress}";
		address+="${cvo.companyAddressdetail}";  
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${cvo.companyname}</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		</script>
        
        </div>
      </div>
      </div>
    </section>
</div>

<%@include file="../main/inc/bottom.jsp" %>