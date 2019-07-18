<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>People Job-index</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<c:url value='/resources/main/images/icons/icon.PNG'/>"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/vendor/bootstrap/css/bootstrap.min.css'/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/fonts/fontawesome-5.0.8/css/fontawesome-all.min.css'/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/fonts/iconic/css/material-design-iconic-font.min.css'/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/vendor/animate/animate.css'/>">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/vendor/css-hamburgers/hamburgers.min.css'/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/vendor/animsition/css/animsition.min.css'/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/util.min.css'/>">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/main.css'/>">
<!--===============================================================================================-->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style type="text/css">
.pos-relative.size-a-2.bo-1-rad-22.of-hidden.bocl11.m-tb-6 {
    margin-left: 140px;
}

.banner-header {
    margin-top: -10px;
}

h2 {
        font-size: 18px;
        margin: 0 0 15px;
    }
    
    .loginWrap {
    margin-left: 20px;
    height: 110px;
    border: 1px solid #e3e4e8;
    background-color: #f3f4f6;
    box-sizing: border-box;
}

.blind {
    position: absolute;
    overflow: hidden;
    width: 1px;
    height: 1px;
    clip: rect(0 0 0 0);
    margin: -1px;
}

.memberType {
    width: 262px;
    margin: -1px 0 0 -1px;
    border: 1px solid #e3e4e8;
    background-color: #fff;
    box-sizing: border-box;
}

#point .pointWrap button {
    font-family: inherit;
    outline: none;
}

.memberType > li .tab {
    position: relative;
    display: block;
    vertical-align: top;
    line-height: 70px;
}
.memberType > li {
    float: left;
    width: 50%;
    height: 50px;
    text-align: center;
}
li {
    list-style: none;
}
button {
    overflow: visible;
    background: transparent;
    cursor: pointer;
}

.lyLoginForm {
    display: none;
    position: absolute;
    left: 0;
    top: 0;
    width: 260px;
    height: 364px;
    padding: 40px 13px 13px 13px;
    border: 1px solid #565d79;
    background-color: #fff;
    text-align: left;
    box-sizing: border-box;
    letter-spacing: -1px;
    z-index: 10;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

button {
    overflow: visible;
    background: transparent;
    cursor: pointer;
}
    
 /* ul.main-menu {
    border-bottom: 5px solid #379d37ed;
} */
 
 ul.main-menu {
    border-bottom: 4px solid darkseagreen;
}
</style>
<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">

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
</script>
</head>
<body class="animsition">
	
	<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="container-menu-desktop" style="height: 150px; margin-bottom: 30px;">
 
			<!-- Header Mobile -->
			

			<!-- Menu Mobile -->
			
			<div class="wrap-logo container">
				<!-- Logo desktop -->		
				<div class="logo">
					<a href="<c:url value='/main/mainindex.do'/>"><img src="<c:url value='/resources/main/images/peoplejob_logo.JPG'/>" alt="LOGO"></a>
				</div>	
			<div class="pos-relative size-a-2 bo-1-rad-22 of-hidden bocl11 m-tb-6" style="width: 500px">
				<input class="f1-s-1 cl6 plh9 s-full p-l-25 p-r-45" type="text" name="search" placeholder="Search">
				<button class="flex-c-c size-a-1 ab-t-r fs-20 cl2 hov-cl10 trans-03">
					<i class="zmdi zmdi-search"></i>
				</button>
			</div>
				<!-- Banner -->
				<div class="banner-header">
					<a href="https://themewagon.com/themes/free-bootstrap-4-html5-news-website-template-magnews2/">
					<img src="<c:url value='/resources/main/images/banner_.png'/>" alt="IMG" ></a>
				</div>
			</div>	
			
			<!--  -->
			<div class="wrap-main-nav">
				<div class="main-nav"> 
					<!-- Menu desktop -->
					<nav class="menu-desktop">
						<a class="logo-stick" href="<c:url value='/main/mainindex.do'/>">
							<img src="<c:url value='/resources/main/images/peoplejob_logo.JPG'/>" alt="LOGO">
						</a>

						<ul class="main-menu" style="
    width: 1274px;
    margin-left: -98px;
">
							<li class="main-menu-active">
								<a href="#">채용정보</a>
								<ul class="sub-menu">
									<li><a href="<c:url value='/company/jobopening_list.do'/>">직종별</a></li>
									<li><a href="<c:url value='/company/jobopening_list.do'/>">지역별</a></li>
									<li><a href="<c:url value='/company/jobopening_list.do'/>">업무별</a></li>
								</ul>
							</li>

							<li class="mega-menu-item">
								<a href="<c:url value='/peopleinfo/peopleinfolist.do'/>">인재정보</a>
							</li>

							<li>
								<a href="#">자료실</a>
								<ul class="sub-menu">
									<li><a href="category-01.html">이력서 양식</a></li>
									<li><a href="category-02.html">취업 뉴스</a></li>
									
								</ul>
							</li>

							<li class="mega-menu-item">
								<a href="<c:url value='/resume/list.do'/>">이력서관리</a>

							</li>

							<li class="mega-menu-item">
								<a href="category-02.html">채용공고 관리</a>

							</li>

							<li>
								<a href="#">게시판</a>
								<ul class="sub-menu">
									<li><a href="category-01.html">자유게시판</a></li>
									<li><a href="category-02.html">QnA</a></li>
									<li><a href="category-02.html">공지사항</a></li>
								</ul>
							</li>
							
							<li style="margin-left: 188px;">
								<a href="<c:url value='/mypage/user/userpage.do'/>">
								<img src="<c:url value='/resources/main/images/icons/my.png'/>" 
								name="mypage" style="width: 40px;margin-left: 65px;">
								</a>
								<ul class="sub-menu">
								<c:if test="${!empty sessionScope.memberid }">
									<li style="text-align: center; font-size: 1.4em;">${sessionScope.memberName }님, 환영합니다</li>
									<li><a href="<c:url value='/login/logout.do'/>">로그아웃</a></li>
								</c:if>
								<c:if test="${empty sessionScope.memberid }">
									<li><a href="<c:url value='/login/login.do'/>">로그인</a></li>
									<li><a href="<c:url value='/login/registerU.do'/>">회원가입</a></li>
								</c:if>
								<c:if test="${sessionScope.author_code==1 }">
									<li><a href="#">이력서 관리</a></li>
								</c:if>
								<c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">
									<li><a href="" onclick="jobopening()">채용공고 관리</a></li>
								</c:if>
								<%-- <c:if test="${sessionScope.author_code==1 }">
									<li><a href="#">지원현황</a></li>
								</c:if> --%>
								 <!-- 일반회원 -->
                        <c:if test="${sessionScope.author_code==1 }">
                           <li><a href="<c:url value='/apply/apply_list.do'/>">지원현황</a></li>
                        </c:if>
                        <!-- 기업회원 -->
                        <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }"> 
                           <li><a href="<c:url value='/apply/Capply_list.do'/>">지원현황</a></li>
                        </c:if>
                        <c:if test="${sessionScope.author_code==1 }">
                           <li><a href="<c:url value='/scrap/scrap_list.do'/>">스크랩현황</a></li>
                        </c:if>
                        <c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }"> 
                           <li><a href="#">스크랩현황</a></li>
                        </c:if>
                        
								<c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">
									<li><a href="<c:url value='/mypage/corp/paymentDetail.do'/>">결제/이용 내역</a></li>
									</c:if>
								<!-- 일반회원 -->
								<c:if test="${sessionScope.author_code==1 }">
									<li><a href="<c:url value='/apply/apply_list.do'/>">지원현황</a></li>
								</c:if>
								<!-- 기업회원 -->
								<c:if test="${sessionScope.author_code==2 || sessionScope.author_Code==3 }">
									<li><a href="<c:url value='/apply/Capply_list.do'/>">지원현황</a></li>
								</c:if>
								<c:if test="${sessionScope.author_code==1 }">
									<li><a href="<c:url value='/scrap/scrap_list.do'/>">스크랩현황</a></li>
								</c:if>
								<c:if test="${sessionScope.author_code==2 || sessionScope.author_Code==3 }">
									<li><a href="#">결제/이용 내역</a></li>
								</c:if>
								<c:if test="${sessionScope.author_code==1 }">
									<li><a href="<c:url value='/login/person_update.do'/>">내 정보 관리</a></li>
								</c:if>
								<c:if test="${sessionScope.author_code==2 || sessionScope.author_code==3 }">
									<li><a href="" onclick="company()">기업 정보 관리</a></li>
								</c:if>
									<li><a href="<c:url value='/login/changePwd.do'/>">비밀번호 변경</a></li>
									<li><a href="<c:url value='/login/memberOut.do'/>">회원 탈퇴</a></li>
								</ul>
							</li>
							
								<li>
									<ul class="sub-menu">
										<li><a href="category-01.html">자유게시판</a></li>
										<li><a href="category-02.html">QnA</a></li>
										<li><a href="category-02.html">공지사항</a></li>
									</ul>
								</li>
						</ul>
					</nav>
				</div>
			</div>	
		</div>
	</header>