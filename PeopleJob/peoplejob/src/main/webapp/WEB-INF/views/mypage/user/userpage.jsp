<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../main/inc/top.jsp" %>

 <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="<c:url value='/resources/main/assets/css/bootstrap.min.css'/>" rel="stylesheet" />
  <link href="<c:url value='/resources/main/assets/css/paper-dashboard.css?v=2.0.0'/>" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="<c:url value='/resources/main/assets/demo/demo.css'/>" rel="stylesheet" />
<style type="text/css">
/* .square{
	width: 700px;
    height: 150px;
    border: 1px solid lightgray;
    margin-top: 30px;
}
 */

.summary_wrap .dashboard .activity_list li {
    display: inline-block;
    margin: 0 10px;
    padding-top: 20px;
    width: 130px;
    height: 130px;
    border-radius: 50%;
    box-sizing: border-box;
}

a{
    color: inherit;
    font-family: inherit;
    font-size: inherit;
    text-decoration: inherit;
}

.img{
	position: relative;
    float: left;
     margin-right: 34px; 
    text-align: center;
    vertical-align: middle;
   /*  margin-right: -7px; */
}
.text{
	position: absolute;
    top: 10%;
    left: 20%;
    /* font-weight: bold;  */
    font-size: 1.1em;
}
.doing {
    display: block;
    font-size: 3em; 
}

span.sname {
    font-size: 1.3em;
    font-family: monospace;
}

ul.p-t-35 {
    padding-top: 10px;
    margin-left: -25px;
}


li.how-bor3.p-rl-4 {
    font-size: 1.1em;
}

.p-table .btn {
    border-radius: 25px;
    margin-top: 10px;
    font-size: 16px;
    text-transform: uppercase;
}
.p-red .btn:hover { 
    background: #fb787a;
    border-color: #fb787a;
}



.card .card-footer .stats i {
    margin-right: 5px;
    position: relative;
    top: 0;
    color: #66615b;
}
.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.one{
    width: 45%;
    float: left;
    height: 50%;
    margin: 10px;
}

 .dashboard{
 	   /*  border: 1px solid lightgray; */
 	    margin-top: 30px;
 	    height: 320px;
 	    width: 107%;
 }
 
.card-stats:hover{
	box-shadow: 5px 5px 5px grey;
}
</style>
<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	var author_code="${sessionScope.author_code}";
	function jobopening(){
		if(author_code==2){
			alert('기업회원은 관리자의 승인을 받은 후 채용공고를 등록할 수 있습니다.');
		}else if(author_code==3){
			location.href="<c:url value='/company/my_jobopening_list.do?companycode1=${memberVo.companyCode}'/>";
		}
	} 

	function company(){
		if(author_code==2){
			alert('기업회원은 관리자의 승인을 받은 후 기업정보를 등록할 수 있습니다.');
		}else if(author_code==3){
			location.href="<c:url value='/login/c_update.do'/>";
		}
	} 

});
</script>
	<!-- Content -->
	<section class="bg0 p-b-140 p-t-10"> 
		<div class="container" style="max-width: 1285px;width: 1270px; margin: 0 auto;">
			<div class="row justify-content-center" style="width: 1250px;">
			
			<div style="border: 1px solid lightgray; width:260px;float: left;margin-top:29px;">
			<div name="photo" style="border-bottom: 1px solid lightgray;width:260px;
    height: 285px;">
				<img alt="회원이미지" src="<c:url value='/resources/main/images/people.PNG'/>" width="100%"
				style="    max-width: 69%;
    border-radius: 3px;
    margin-left: 42px;
    display: block;">
				<span style="margin:0 auto; font-size: 1.1em; display: table;">${sessionScope.memberName }님</span>
				<br><br>
				<input type="button" value="사진 등록" style="    margin: 0 auto;
    width: 100px;
    height: 30px;
    background: #808080;
    color: white;">
			</div>
				<div class="p-l-10 p-rl-0-sr991 p-t-70" style="padding-top: 29px;float:left;">						
						<!-- Category -->
						<%-- <div class="p-b-60">
							<div class="how2 how2-cl4 flex-s-c">
								<h3 class="f1-m-2 cl3 tab01-title">
									마이페이지
								</h3>
							</div>

							<ul class="p-t-35">
								<li class="how-bor3 p-rl-4">
									<c:if test="${sessionScope.author_code==1 }" >
									<a href="<c:url value='/resume/list.do'/>" class="dis-block f1-s-10 text-uppercase cl2 hov-cl10 trans-03 p-tb-13">
										이력서 관리
									</a>
									</c:if>
									<c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }" > <!-- 나중에 3으로 바꿀것, 바꾼 후 2이면 못들어가게 막기 -->
									<a href="<c:url value='/company/my_jobopening_list.do?companycode1=${sessionScope.companyCode}'/>" class="dis-block f1-s-10 text-uppercase cl2 hov-cl10 trans-03 p-tb-13" id="jobopening" onclick="jobopening()">
										채용공고 관리
									</a>
									</c:if>
								</li>

								<li class="how-bor3 p-rl-4">
								<c:if test="${sessionScope.author_code==1 }" >
									<a href="<c:url value='/scrap/scrap_list.do'/>" class="dis-block f1-s-10 text-uppercase cl2 hov-cl10 trans-03 p-tb-13">
										스크랩 정보
									</a>
								</c:if>
								</li>
								
								<li class="how-bor3 p-rl-4"> 
								<c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3}" >
									<a href="" class="dis-block f1-s-10 text-uppercase cl2 hov-cl10 trans-03 p-tb-13">
										스크랩 정보
									</a>
								</c:if>
								</li>
								

								<li class="how-bor3 p-rl-4">
									<c:if test="${sessionScope.author_code==1 }" >
									<a href="<c:url value='/apply/apply_list.do'/>" class="dis-block f1-s-10 text-uppercase cl2 hov-cl10 trans-03 p-tb-13">
										지원 현황
									</a>
									</c:if>
									<c:if test="${sessionScope.author_code==2|| sessionScope.author_code==3 }" > <!-- 나중에 3으로 바꿀것, 바꾼 후 2이면 못들어가게 막기 -->
									<a href="<c:url value='/mypage/corp/paymentDetail.do'/>" class="dis-block f1-s-10 text-uppercase cl2 hov-cl10 trans-03 p-tb-13">
										결제 내역
									</a>
									</c:if>
								</li>

								<li class="how-bor3 p-rl-4">
										<c:if test="${sessionScope.author_code==1 }" >
									<a href="<c:url value='/login/person_update.do'/>" class="dis-block f1-s-10 text-uppercase cl2 hov-cl10 trans-03 p-tb-13">
										내 정보 관리
									</a>
									</c:if>
									<c:if test="${sessionScope.author_code==2|| sessionScope.author_code==3 }" >
									<a href="#" class="dis-block f1-s-10 text-uppercase cl2 hov-cl10 trans-03 p-tb-13" onclick="company()">
										기업정보 관리
									</a>
									</c:if>
								</li>

								<li class="how-bor3 p-rl-4">
									<a href="<c:url value='/login/changePwd.do'/>" class="dis-block f1-s-10 text-uppercase cl2 hov-cl10 trans-03 p-tb-13">
										비밀번호 변경
									</a>
								</li>
								
									<li class="how-bor3 p-rl-4">
									<a href="<c:url value='/login/memberOut.do'/>" class="dis-block f1-s-10 text-uppercase cl2 hov-cl10 trans-03 p-tb-13">
										회원 탈퇴
									</a>
									
								</li>
							</ul>
						</div> --%>
						 <ul class="nav">
          <li class="active" style="    width: 100%;">
          <c:if test="${sessionScope.author_code==1 }">
            <a href="./dashboard.html" style="height: 100%;">
              <i class="nc-icon nc-zoom-split" style="margin-right:10px; float:left;margin-top: 3px;"></i>
              <p style="float:left; font-size: 1.1em;">이력서 관리</p>
            </a>
            </c:if>
          <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">
            <a href="./dashboard.html" style="height: 100%;">
              <i class="nc-icon nc-zoom-split" style="margin-right:10px; float:left;margin-top: 3px;"></i>
              <p style="float:left; font-size: 1.1em;">채용공고 관리</p>
            </a>
            </c:if>
          </li>
          <li class="active" style="    width: 100%;">
            <a href="./dashboard.html" style="height: 100%;">
              <i class="nc-icon nc-email-85" style="margin-right:10px; float:left;margin-top: 3px;"></i>
              <p style="float:left; font-size: 1.1em;">지원 현황</p>
            </a>
          </li>
           <li class="active" style="    width: 100%;">
            <a href="./dashboard.html" style="height: 100%;">
              <i class="nc-icon nc-tag-content" style="margin-right:10px; float:left;margin-top: 3px;"></i>
              <p style="float:left; font-size: 1.1em;">스크랩 정보</p>
            </a>
          </li>
           <li class="active" style="    width: 100%;">
            <c:if test="${sessionScope.author_code==1 }">
            <a href="./dashboard.html" style="height: 100%;">
              <i class="nc-icon nc-tap-01" style="margin-right:10px; float:left;margin-top: 3px;"></i>
              <p style="float:left; font-size: 1.1em;">맞춤 채용 정보</p>
            </a>
            </c:if>
            <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">
            <a href="./dashboard.html" style="height: 100%;">
              <i class="nc-icon nc-money-coins" style="margin-right:10px; float:left;margin-top: 3px;"></i>
              <p style="float:left; font-size: 1.1em;">결제 내역</p>
            </a>
            </c:if>
          </li>
           <li class="active" style="    width: 100%;">
            <a href="<c:url value='/custext/mycustext.do'/>" style="height: 100%;">
              <i class="nc-icon nc-chat-33" style="margin-right:10px; float:left;margin-top: 3px;"></i>
              <p style="float:left; font-size: 1.1em;">문의 내역</p>
            </a>
          </li>
          <li class="active" style="    width: 100%;">
            <a href="./dashboard.html" style="height: 100%;">
              <i class="nc-icon nc-bullet-list-67" style="margin-right:10px; float:left;margin-top: 3px;"></i>
              <p style="float:left; font-size: 1.1em;">내가 쓴 글</p>
            </a>
          </li>
            <li class="active" style="    width: 100%;">
            <c:if test="${sessionScope.author_code==1 }">
            <a href="./dashboard.html" style="height: 100%;">
              <i class="nc-icon nc-circle-10" style="margin-right:10px; float:left;margin-top: 3px;"></i>
              <p style="float:left; font-size: 1.1em;">회원 정보 수정</p>
            </a>
            </c:if>
            <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">
            <a href="./dashboard.html" style="height: 100%;">
              <i class="nc-icon nc-bank" style="margin-right:10px; float:left;margin-top: 3px;"></i>
              <p style="float:left; font-size: 1.1em;">기업 정보 수정</p>
            </a>
            </c:if>
          </li>
          <li class="active" style="    width: 100%;">
            <a href="./dashboard.html" style="height: 100%;">
              <i class="nc-icon nc-key-25" style="margin-right:10px; float:left;margin-top: 3px;"></i>
              <p style="float:left; font-size: 1.1em;">비밀번호 변경</p>
            </a>
          </li>
          <li class="active" style="    width: 100%;">
            <a href="./dashboard.html" style="height: 100%;">
              <i class="nc-icon nc-lock-circle-open" style="margin-right:10px; float:left;margin-top: 3px;"></i>
              <p style="float:left; font-size: 1.1em;">회원 탈퇴</p>
            </a>
          </li>
        </ul>

					</div>
				</div>
				
				
				<div class="col-md-10 col-lg-8 p-b-30" style="float: left;">
					<div class="p-r-10 p-r-0-sr991">
						<!-- Blog Detail -->
						
						<div class="p-b-70">  
						
							<div class="dashboard">
							<div class="one" style="">
							
							 <div class="card card-stats" style="box-shadow: 3px 3px 3px grey;">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-email-85 text-warning"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">지원현황</p>
                      <c:if test="${sessionScope.author_code==1 }">
                     	 <p class="card-title">${applycount }
                      </c:if>
                      <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">
                     	 <p class="card-title">0
                      </c:if>
                        <p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-refresh"></i> 자세히보기
                </div>
              </div>
            </div>
            
							</div>
							<div class="one">
							 <div class="card card-stats" style="box-shadow: 3px 3px 3px grey;">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-tag-content text-success"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">스크랩</p>
                       <c:if test="${sessionScope.author_code==1 }">
                     	 <p class="card-title"> ${fn:length(scraplist) }
                      </c:if>
                      <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">
                     	 <p class="card-title">0
                      </c:if>
                     
                        <p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-calendar-o"></i> 상세보기
                </div>
              </div>
            </div>
							</div>
							<div class="one">
							<div class="card card-stats" style="box-shadow: 3px 3px 3px grey;">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                    <c:if test="${sessionScope.author_code==1 }">
                      <i class="nc-icon nc-single-02 text-danger"></i>
					</c:if>
                    <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">
                      <i class="nc-icon nc-money-coins text-danger"></i>
					</c:if>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                    <c:if test="${sessionScope.author_code==1 }">
                      <p class="card-category">내가 쓴 글</p>
                      <p class="card-title"> ${fn:length(postlist) }
                      </c:if>
                    <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">
                      <p class="card-category">결제 내역</p>
                      <p class="card-title"> ${fn:length(paylist) }
                      </c:if>
                        <p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-clock-o"></i> 목록보기
                </div>
              </div>
            </div>
							</div>
							<div class="one">
							 <div class="card card-stats" style="box-shadow: 3px 3px 3px grey;">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-ruler-pencil text-primary"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                    <c:if test="${sessionScope.author_code==1 }">
                      <p class="card-category">이력서 관리</p>
                      <p class="card-title">${fn:length(resumelist) }
                      </c:if>
                    <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">
                      <p class="card-category">채용공고 </p>
                      <p class="card-title">${fn:length(joblist) }
                      </c:if>
                        <p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-refresh"></i> 자세히 보기
                </div>
              </div>
            </div>
							</div>
							
          <%--   <ul class="activity_list"> 
                   <li class="img">
                   <c:if test="${sessionScope.author_code==1 }">
                        <a href="<c:url value='/apply/apply_list.do'/>" onclick="" onmousedown="try{n_trackEvent('myhome', 'dashboard' , 'resume-manage', '');}catch(e){};">
                     </c:if>
                   <c:if test="${sessionScope.author_code==2 }">
                        <a href="" onclick="alert('관리자의 승인을 받은 기업회원만 이용가능합니다.')" onmousedown="try{n_trackEvent('myhome', 'dashboard' , 'resume-manage', '');}catch(e){};">
                     </c:if>
                   <c:if test="${sessionScope.author_code==3 }">
                        <a href="<c:url value='/apply/Capply_list.do'/>" onclick="" onmousedown="try{n_trackEvent('myhome', 'dashboard' , 'resume-manage', '');}catch(e){};">
                     </c:if>
                      
                           <img src="<c:url value='/resources/main/images/circle.PNG'/>"></img>
                           <div class="text">
                          <!--  <button type="button" class="btn btn-lg btn-primary" id="pay">신청하기</button>  -->
                           <span class="doing"><em> 0 </em> </span>
                            <span class="sname">지원현황</span> 
                           </div>
                        </a>
                    </li>
                        <li class="img">
                         <c:if test="${sessionScope.author_code==1 }">
                       		 <a href="<c:url value='/scrap/scrap_list.do'/>" onmousedown="try{n_trackEvent('myhome', 'dashboard' , 'resume-manage', '');}catch(e){};">
                          </c:if>
                         <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3  }">
                       		 <a href="#" onmousedown="try{n_trackEvent('myhome', 'dashboard' , 'resume-manage', '');}catch(e){};">
                          </c:if>
                           <img src="<c:url value='/resources/main/images/circle.PNG'/>"></img>
                           <div class="text">
                            <span class="doing"><em> ${fn:length(scraplist) }</em> </span>
                            <span class="sname">스크랩</span>
                           </div> 
                        </a>
                    </li> 
                    
                    <li class="img">
                    <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">
                        <a href="<c:url value='/mypage/corp/paymentDetail.do'/>" onmousedown="try{n_trackEvent('myhome', 'dashboard' , 'resume-manage', '');}catch(e){};">
                    </c:if>
                    <c:if test="${sessionScope.author_code==1}">
                        <a href="" onmousedown="try{n_trackEvent('myhome', 'dashboard' , 'resume-manage', '');}catch(e){};">
                    </c:if>
                           <img src="<c:url value='/resources/main/images/circle.PNG'/>"></img>
                           <div class="text">
                           <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">
                            <span class="doing"><em> ${fn:length(list)}  </em> </span>
                            <span class="sname">결제내역</span>
                            </c:if>
                           <c:if test="${sessionScope.author_code==1 }">
                            <span class="doing"><em> 0  </em> </span>
                            <span class="sname">관심기업</span>
                            </c:if>
                           </div>
                        </a>
                    </li> 
                    
                    <li class="img">
                      <c:if test="${sessionScope.author_code==1 }">
                        <a href="<c:url value='/resume/list.do'/>" onclick="" onmousedown="try{n_trackEvent('myhome', 'dashboard' , 'resume-manage', '');}catch(e){};">
                      </c:if>
                      <c:if test="${sessionScope.author_code==2 }">
                        <a href="" onclick="alert('관리자의 승인을 받은 기업회원만 이용가능합니다.')" onmousedown="try{n_trackEvent('myhome', 'dashboard' , 'resume-manage', '');}catch(e){};">
                      </c:if>
                      <c:if test="${sessionScope.author_code==3 }">
                        <a href="<c:url value='/company/my_jobopening_list.do?companycode1=${sessionScope.companyCode}'/>" onclick="" onmousedown="try{n_trackEvent('myhome', 'dashboard' , 'resume-manage', '');}catch(e){};">
                      </c:if>
                           <img src="<c:url value='/resources/main/images/circle.PNG'/>"></img>
                           <div class="text">
                           <c:if test="${sessionScope.author_code==1}">
                            <span class="doing"><em> 0  </em> </span>
                            <span class="sname">이력서</span> 
                            </c:if>
                           <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">
                            <span class="doing"><em> 0  </em> </span>
                            <span class="sname">채용공고</span>
                            </c:if>
                           </div>
                        </a>
                    </li> 
                                   
                                   
                            
                            </ul> --%>
        </div>
        
<br><br>
							<div class="wrap-pic-max-w p-b-30" style="margin-top:30px; padding-bottom: 0px;">
							<c:if test="${sessionScope.author_code==1 }">
							<h3 style="display: inline-block; margin-right:10px;">내 이력서 목록</h3> <span style="font-size: 2em;">${fn:length(resumelist) }</span><span style="margin-left: 5px; color: gray;">/ 10</span>
							
							<a href="<c:url value='/resume/register.do'/>" class="dis-block f1-s-13 cl0 bg-twitter borad-3 p-tb-4 p-rl-18 hov-btn1 m-r-3"
							style="display:inline-block;float: right; height: 40px; padding-top: 8px;">
										 <i class="nc-icon nc-single-02" style="color:white;">
										이력서 등록
										</i>
									</a>
							</c:if>
							<c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">
							<h3 style="display: inline-block; margin-right:10px;">채용공고 목록</h3> <span style="font-size: 2em;color:orangered;">${fn:length(joblist) }</span>
							
							<a href="<c:url value='/company/jobopening_register.do'/>" class="dis-block f1-s-13 cl0 bg-twitter borad-3 p-tb-4 p-rl-18 hov-btn1 m-r-3"
							style="display:inline-block;float: right; height: 40px; padding-top: 8px;">
										 <i class="nc-icon nc-single-02" style="color:white;">
										채용공고 등록
										</i>
									</a>
							</c:if>
							</div>

							<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
              <thead>
                <tr>
                  <th style="background-color:#f8f8f8; text-align: center;">번호</th>
                  <th style="background-color:#f8f8f8; text-align: center;">
         <c:if test="${sessionScope.author_code==1 }">         
                  이력서 제목
                  </c:if>
         <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">         
                  채용공고 제목
                  </c:if>
                  </th>
                  <th style="background-color:#f8f8f8; text-align: center; width: 50%;">
                  
                    <c:if test="${sessionScope.author_code==1 }">         
                 	이력서 관리
                  </c:if>
         <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">         
                  모집 기간
                  </c:if>
                  
                  </th>
                  <th style="background-color:#f8f8f8; text-align: center;">공개 설정</th>
                </tr>
              </thead>
              <tbody>
              <c:if test="${(sessionScope.author_code==2 || sessionScope.author_code==3) && empty joblist }">
              	<tr>
              		<td colspan="4">등록된 채용공고가 없습니다</td>
              	</tr>
              </c:if>
              <c:if test="${sessionScope.author_code==1 && empty resumelist }">
              	<tr>
              		<td colspan="4">등록된 이력서가 없습니다</td>
              	</tr>
              </c:if>
              
              <!-- 개인회원 -->
              <c:if test="${sessionScope.author_code==1 && !empty resumelist }">
              <c:set var="i" value="1"/>
              	<c:forEach var="map" items="${resumelist}">
                <tr style="background: white;">
				   	<td>${i }</td>
				   	<td><a href="<c:url value='/resume/resumedetail.do?resumeCode=${map["RESUME_CODE"] }'/>" style="color:black;">
						${map['RESUMETITLE'] }
						</a>
						</td>
				   	<td>
				   		<input type="button" value="복사" style="background:  white; border: 1px solid lightgray;
	    font-weight: bold; margin: 0 auto; cursor: pointer; width: 50px; height: 30px; display: inline-block;" class="btnmore" 
	    onclick="location.href='<c:url value="/user/copyresume.do?resumeCode=${map['RESUME_CODE'] }"/>'">
	   
				   		<input type="button" value="수정" style="background: white; border: 1px solid lightgray; display: inline-block;
	    font-weight: bold; cursor: pointer; width: 50px; height: 30px;" class="btnmore"
	    onclick="location.href='<c:url value=" /resume/edit.do?resumeCode=${map['RESUME_CODE'] }"/>'">
				   		<input type="button" value="삭제" style="background: white; border: 1px solid lightgray; display: inline-block;
	    font-weight: bold; cursor: pointer; width: 50px; height: 30px;" class="btnmore"
	     onclick="location.href='<c:url value=" /resume/delete.do?resumeCode=${map['RESUME_CODE'] }"/>'">
	    </td>
	    			<td>
				   		<span>
				   		<c:if test="${map['OPENCHECK']=='Y' }">공개</c:if>
				   		<c:if test="${map['OPENCHECK']=='N' }"> 미공개</c:if>
				   		</span>
				   	</td>
				</tr>
				<c:set var="i" value="${i+1 }"/>
				</c:forEach>
				</c:if>
				
				<!-- 기업회원 -->
              <c:if test="${(sessionScope.author_code==2 || sessionScope.author_code==3) && !empty joblist }">
              <c:set var="i" value="1"/>
              	<c:forEach var="jobVo" items="${joblist}">
                <tr style="background: white;">
				   	<td>${i }</td>
				   	<td><a href="<c:url value='/company/jobopening_view.do?jobopening=${jobVo.jobopening }'/>" style="color:black;">
						${jobVo.jobtitle }
						</a>
						</td>
				   	<td>
				   		${fn:substring(jobVo.workdate,0,10) } ~ ${fn:substring(jobVo.endDate,0,10) }
	    </td>
	    			<td>
				   		<span>
				   		<c:if test="${jobVo.adminagree=='Y' }">공개</c:if>
				   		<c:if test="${jobVo.adminagree=='N' }"> 미공개</c:if>
				   		</span>
				   	</td>
				</tr>
				<c:set var="i" value="${i+1 }"/>
				</c:forEach>
				</c:if>
              </tbody>
            </table>
								
							</div>
						</div>

						
					</div>
				</div>
				
				<!-- Sidebar -->
					
			</div>
		</div>
	</section>

<%@include file="../../main/inc/bottom.jsp" %>
</body>
</html>