<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../main/inc/top.jsp" %>
<style type="text/css">
/* .square{
	width: 700px;
    height: 150px;
    border: 1px solid lightgray;
    margin-top: 30px;
}
 */
 .dashboard{
 	    border: 1px solid lightgray;
 	    margin-top: 30px;
 	    height: 160px;
 }
 
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
			
			<div style="border: 1px solid lightgray; width:200px;float: left;margin-top:29px;">
			<div name="photo" style="height: 300px; border:1px solid lightgray;">
				<img alt="회원이미지" src="<c:url value='/resources/main/images/people.PNG'/>" width="100%">
				${sessionScope.memberName }<span>님</span>
			</div>
				<div class="p-l-10 p-rl-0-sr991 p-t-70" style="padding-top: 29px;float:left;">						
						<!-- Category -->
						<div class="p-b-60">
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
									<a href="#" class="dis-block f1-s-10 text-uppercase cl2 hov-cl10 trans-03 p-tb-13" id="jobopening" onclick="jobopening()">
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
									<a href="#" class="dis-block f1-s-10 text-uppercase cl2 hov-cl10 trans-03 p-tb-13">
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
						</div>

					</div>
				</div>
				
				
				<div class="col-md-10 col-lg-8 p-b-30" style="float: left;">
					<div class="p-r-10 p-r-0-sr991">
						<!-- Blog Detail -->
						
						<div class="p-b-70">
						
							<div class="dashboard">
            <ul class="activity_list"> 
                   <li class="img">
                        <a href=""<c:url value='/apply/apply_list.do'/>" onclick="" onmousedown="try{n_trackEvent('myhome', 'dashboard' , 'resume-manage', '');}catch(e){};">
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
                        <a href="<c:url value='/mypage/corp/paymentDetail.do'/>" onmousedown="try{n_trackEvent('myhome', 'dashboard' , 'resume-manage', '');}catch(e){};">
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
                        <a href="<c:url value='/resume/list.do'/>" onclick="" onmousedown="try{n_trackEvent('myhome', 'dashboard' , 'resume-manage', '');}catch(e){};">
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
                                   
                                   
                            
                            </ul>
        </div>

							<div class="wrap-pic-max-w p-b-30">
							이력서 리스트 띄우기
							</div>

							<table class="table table-bordered" style="margin-top: 15px; " id="priceList">
		<thead>
			<tr> 
				<th scope="col" colspan="4">이력서 리스트 완성 시 띄우기</th>
				
			</tr>
		</thead>
		<tbody>
		
			<tr>
				<td id="servicName" colspan="4">이력서 리스트 완성 시 띄우기</td>
				
			</tr>
		</tbody>
		</table>
							
							<!-- share -->	
								<div class="flex-wr-s-s size-w-0">
									<a href="#" class="dis-block f1-s-13 cl0 bg-facebook borad-3 p-tb-4 p-rl-18 hov-btn1 m-r-3 m-b-3 trans-03">
										<i class="fab fa-facebook-f m-r-7"></i>
										Facebook
									</a>

									<a href="#" class="dis-block f1-s-13 cl0 bg-twitter borad-3 p-tb-4 p-rl-18 hov-btn1 m-r-3 m-b-3 trans-03">
										<i class="fab fa-twitter m-r-7"></i>
										Twitter
									</a>

									<a href="#" class="dis-block f1-s-13 cl0 bg-google borad-3 p-tb-4 p-rl-18 hov-btn1 m-r-3 m-b-3 trans-03">
										<i class="fab fa-google-plus-g m-r-7"></i>
										Google+
									</a>

									<a href="#" class="dis-block f1-s-13 cl0 bg-pinterest borad-3 p-tb-4 p-rl-18 hov-btn1 m-r-3 m-b-3 trans-03">
										<i class="fab fa-pinterest-p m-r-7"></i>
										Pinterest
									</a>
								</div>
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