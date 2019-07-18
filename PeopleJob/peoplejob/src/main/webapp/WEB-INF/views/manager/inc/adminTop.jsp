<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>Sleek - Admin Dashboard Template</title>


<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500|Poppins:400,500,600,700|Roboto:400,500"
	rel="stylesheet" />
<link
	href="https://cdn.materialdesignicons.com/3.0.39/css/materialdesignicons.min.css"
	rel="stylesheet" />

<!-- PLUGINS CSS STYLE -->
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/plugins/toastr/toastr.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/plugins/nprogress/nprogress.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/plugins/flag-icons/css/flag-icon.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/plugins/jvectormap/jquery-jvectormap-2.0.3.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/plugins/ladda/ladda.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/plugins/select2/css/select2.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/plugins/daterangepicker/daterangepicker.css"
	rel="stylesheet" />

<!-- SLEEK CSS -->
<link id="sleek-css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/assets/css/sleek.css" />


<!-- FAVICON -->
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/img/favicon.png"
	rel="shortcut icon" />

<!--
    HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries
  -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<script	src="${pageContext.request.contextPath}/resources/admin/assets/plugins/nprogress/nprogress.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery-3.4.1.min.js"></script>
</head>
<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script> --%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<body class="sidebar-fixed sidebar-dark header-light header-fixed"
	id="body">
	<script>
      NProgress.configure({ showSpinner: false });
      NProgress.start();
    </script>

	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">

		<!--
          ====================================
          ——— LEFT SIDEBAR WITH FOOTER
          =====================================
        -->
		<aside class="left-sidebar bg-sidebar">
			<div id="sidebar" class="sidebar sidebar-with-footer">
				<!-- Aplication Brand -->
				<div class="app-brand">
					<a href="${pageContext.request.contextPath}/manager/index.do">
						<svg class="brand-icon" xmlns="http://www.w3.org/2000/svg"
							preserveAspectRatio="xMidYMid" width="30" height="33"
							viewBox="0 0 30 33">
                  <g fill="none" fill-rule="evenodd">
                    <path class="logo-fill-blue" fill="#7DBCFF"
								d="M0 4v25l8 4V0zM22 4v25l8 4V0z" />
                    <path class="logo-fill-white" fill="#FFF"
								d="M11 4v25l8 4V0z" />
                  </g>
                </svg> <span class="brand-name">People Job</span>
					</a>
				</div>
				<!-- begin sidebar scrollbar -->
				<div class="sidebar-scrollbar">

					<!-- sidebar menu -->
					<ul class="nav sidebar-inner" id="sidebar-menu">



						<li class="has-sub active expand"><a
							class="sidenav-item-link" href="javascript:void(0)"
							data-toggle="collapse" data-target="#dashboard"
							aria-expanded="false" aria-controls="dashboard"> <i
								class="mdi mdi-view-dashboard-outline"></i> <span
								class="nav-text">사용자 관리</span> <b class="caret"></b>
						</a>
							<ul class="collapse show" id="dashboard"
								data-parent="#sidebar-menu">
								<div class="sub-menu">
									<!-- <li class="active"><a class="sidenav-item-link"
										href="#"> <span class="nav-text">통합 관리</span>
									</a></li> -->
									<li class="active"><a class="sidenav-item-link"
										href="${pageContext.request.contextPath}/manager/member/memberList.do?authorityCk=member"> <span class="nav-text">일반 회원</span>
									</a></li>
									<li><a class="sidenav-item-link" href="${pageContext.request.contextPath}/manager/member/memberList.do?authorityCk=company">
											<span class="nav-text">기업 회원</span>
											 <!-- <span	class="badge badge-success">new</span> -->

									</a></li>
								</div>
							</ul></li>
						<li class="has-sub"><a class="sidenav-item-link"
							href="javascript:void(0)" data-toggle="collapse"
							data-target="#ui-elements" aria-expanded="false"
							aria-controls="ui-elements"> <i
								class="mdi mdi-folder-multiple-outline"></i> <span
								class="nav-text">서비스 관리</span> <b class="caret"></b>
						</a>
							<ul class="collapse" id="ui-elements" data-parent="#sidebar-menu">
								<div class="sub-menu">
									<li class="has-sub"><a class="sidenav-item-link"
										href="#" data-toggle="collapse"
										data-target="#components" aria-expanded="false"
										aria-controls="components"> <span class="nav-text">이력서
												관리</span> 
									</a>
										</li>

									<li class="has-sub"><a class="sidenav-item-link"
										href="#" data-toggle="collapse"
										data-target="#icons" aria-expanded="false"
										aria-controls="icons"> <span class="nav-text">채용공고
												관리</span> <b class="caret"></b>
									</a>
						<!-- 			<ul class="collapse" id="icons">
											<div class="sub-menu">

												<li><a href="#">Material Icon</a></li>

												<li><a href="#">Flag Icon</a></li>

											</div>
										</ul> --></li>
									<!-- 변경하실 수있도록 했어요 편하게 바꿔서 사용하세요 -->
									<li class="has-sub"><a class="sidenav-item-link"
										href="#" data-toggle="collapse"
										data-target="#forms" aria-expanded="false"
										aria-controls="forms"> <span class="nav-text">상품 관리
												</span> <b class="caret"></b>
									</a>
										<ul class="collapse" id="forms">
											<div class="sub-menu">
												<li><a href="basic-input.html">상품 조회</a></li>
												<li><a href="${pageContext.request.contextPath}/manager/service/register.do">상품 등록</a></li>
											</div>
										</ul></li>

									<li class="has-sub"><a class="sidenav-item-link"
										href="javascript:void(0)" data-toggle="collapse"
										data-target="#maps" aria-expanded="false" aria-controls="maps">
											<span class="nav-text">지원 관리</span> <b class="caret"></b>
									</a>
										</li>
								</div>
							</ul></li>
						<li class="has-sub"><a class="sidenav-item-link"
							href="javascript:void(0)" data-toggle="collapse"
							data-target="#charts" aria-expanded="false"
							aria-controls="charts"> <i class="mdi mdi-chart-pie"></i> <span
								class="nav-text">메일</span> <b class="caret"></b>
						</a>
							<ul class="collapse" id="charts" data-parent="#sidebar-menu">
								<div class="sub-menu">
									<li><a class="sidenav-item-link" href="${pageContext.request.contextPath }/manager/email_sms/emailWrite.do">
											<span class="nav-text">메일</span>
									</a>
									</li>
									<li><a class="sidenav-item-link" href="${pageContext.request.contextPath }/manager/email_sms/emailMultWrite.do">	<!-- ${pageContext.request.contextPath} -->
											<span class="nav-text">다중 메일</span>
									</a>
									</li>
								</div>
							</ul>
							</li>
						<li class="has-sub"><a class="sidenav-item-link"
							href="javascript:void(0)" data-toggle="collapse"
							data-target="#pages" aria-expanded="false" aria-controls="pages">
								<i class="mdi mdi-image-filter-none"></i> <span class="nav-text">커뮤니티
									관리</span> <b class="caret"></b>
						</a>
							<ul class="collapse" id="pages" data-parent="#sidebar-menu">
								<div class="sub-menu">
									<li><a class="sidenav-item-link" href="${pageContext.request.contextPath}/manager/notice/list.do"> <span
											class="nav-text">공지사항 관리</span>
									</a></li>
									<li class="has-sub"><a class="sidenav-item-link"
										href="javascript:void(0)" data-toggle="collapse"
										data-target="#authentication" aria-expanded="false"
										aria-controls="authentication"> <span class="nav-text">게시판
												관리</span> <b class="caret"></b>
									</a>
										<ul class="collapse" id="authentication">
											<div class="sub-menu">

												<li><a
													href="${pageContext.request.contextPath}/manager/board/boardList.do">게시판
														리스트</a></li>
												<li><a
													href="${pageContext.request.contextPath}/manager/board/boardAdd.do">게시판
														추가</a></li>

											</div>
										</ul></li>
									<!-- data-target    aria-controls     <ul  class="collapse"  id="abc">의 id 가 같아야함   -->
									<li class="has-sub"><a class="sidenav-item-link"
										href="javascript:void(0)" data-toggle="collapse"
										data-target="#abc" aria-expanded="false" aria-controls="abc">
											<span class="nav-text">게시글 관리</span> <b class="caret"></b>
									</a>
										<ul class="collapse" id="abc">
											<div class="sub-menu">

												<li><a href="<c:url value='/manager/post/postList.do'/>">전체 조회</a></li>

												<li><a href="sign-up.html">변경</a></li>

											</div>
										</ul></li>
								</div>
							</ul></li>
						<li class="has-sub"><a class="sidenav-item-link"
							href="javascript:void(0)" data-toggle="collapse"
							data-target="#documentation" aria-expanded="false"
							aria-controls="documentation"> <i
								class="mdi mdi-book-open-page-variant"></i> <span
								class="nav-text">결제 관리</span> <b class="caret"></b>
						</a>
							<ul class="collapse" id="documentation"
								data-parent="#sidebar-menu">
								<div class="sub-menu">
									<!-- <li class="section-title">
                              Getting Started
                            </li> -->

									<li><a class="sidenav-item-link" href="#">
											<span class="nav-text">통합 관리</span>
									</a></li>

									<li><a class="sidenav-item-link" href="#"> <span
											class="nav-text">결제 내역</span>

									</a></li>

									<li><a class="sidenav-item-link" href="#">
											<span class="nav-text">취소 요청 내역</span>
									</a></li>

									<li><a class="sidenav-item-link" href="#">
											<span class="nav-text">취소 내역</span>
									</a></li>
									
									<li><a class="sidenav-item-link" href="#">
											<span class="nav-text">취소 완료</span>
									</a></li>


								</div>
							</ul></li>
						<li class="has-sub"><a class="sidenav-item-link"
							href="javascript:void(0)" data-toggle="collapse"
							data-target="#Manager" aria-expanded="false"
							aria-controls="Manager"> <i class="mdi mdi-chart-pie"></i> <span
								class="nav-text">Manager</span> <b class="caret"></b>
						</a>
							<ul class="collapse" id="Manager" data-parent="#sidebar-menu">
								<div class="sub-menu">



									<li><a class="sidenav-item-link"
										href="<c:url value='/manager/manager/managerList.do'/>"> <span
											class="nav-text">조회</span>
									</a></li>
									<!-- <li><a class="sidenav-item-link" href="#"> <span
											class="nav-text">권한 보기</span>
									</a></li> -->

								</div>
							</ul></li>
						<li class="has-sub"><a class="sidenav-item-link"
							href="javascript:void(0)" data-toggle="collapse"
							data-target="#popup" aria-expanded="false"
							aria-controls="popup"> <i class="mdi mdi-chart-pie"></i> <span
								class="nav-text">팝업관리</span> <b class="caret"></b>
						</a>
							<ul class="collapse" id="popup" data-parent="#sidebar-menu">
								<div class="sub-menu">

									<li><a class="sidenav-item-link"
										href="${pageContext.request.contextPath}/manager/popup/popupList.do"> <span
											class="nav-text">관리</span>
									</a></li>
									<li><a class="sidenav-item-link"
										href="${pageContext.request.contextPath}/manager/popup/popupAdd.do"> <span
											class="nav-text">등록</span>
									</a></li>
									<!-- <li><a class="sidenav-item-link" href="#"> <span
											class="nav-text">권한 보기</span>
									</a></li> -->

								</div>
							</ul></li>


					</ul>

				</div>

				<!-- <hr class="separator" />

            <div class="sidebar-footer">
              <div class="sidebar-footer-content">
                <h6 class="text-uppercase">
                  Cpu Uses <span class="float-right">40%</span>
                </h6>
                <div class="progress progress-xs">
                  <div
                    class="progress-bar active"
                    style="width: 40%;"
                    role="progressbar"
                  ></div>
                </div>
                <h6 class="text-uppercase">
                  Memory Uses <span class="float-right">65%</span>
                </h6>
                <div class="progress progress-xs">
                  <div
                    class="progress-bar progress-bar-warning"
                    style="width: 65%;"
                    role="progressbar"
                  ></div>
                </div>
              </div>
            </div> -->
			</div>
		</aside>



		<div class="page-wrapper">
			<!-- Header -->
			<header class="main-header " id="header">
				<nav class="navbar navbar-static-top navbar-expand-lg">
					<!-- Sidebar toggle button -->
					<button id="sidebar-toggler" class="sidebar-toggle">
						<span class="sr-only">Toggle navigation</span>
					</button>
					<!-- search form -->
					<div class="search-form d-none d-lg-inline-block">
						<div class="input-group">
							<button type="button" name="search" id="search-btn"
								class="btn btn-flat">
								<i class="mdi mdi-magnify"></i>
							</button>
							<input type="text" name="query" id="search-input"
								class="form-control" placeholder="'button', 'chart' etc."
								autofocus autocomplete="off" />
						</div>
						<div id="search-results-container">
							<ul id="search-results"></ul>
						</div>
					</div>

					<div class="navbar-right ">
						<ul class="nav navbar-nav">
							<!-- Github Link Button -->
							<li class="dropdown notifications-menu">
								<button class="dropdown-toggle" data-toggle="dropdown">
									<i class="mdi mdi-bell-outline"></i>
								</button>
								<ul class="dropdown-menu dropdown-menu-right">
									<li class="dropdown-header">You have 5 notifications</li>
									<li><a href="#"> <i class="mdi mdi-account-plus"></i>
											New user registered <span
											class=" font-size-12 d-inline-block float-right"><i
												class="mdi mdi-clock-outline"></i> 10 AM</span>
									</a></li>
									<li><a href="#"> <i class="mdi mdi-account-remove"></i>
											User deleted <span
											class=" font-size-12 d-inline-block float-right"><i
												class="mdi mdi-clock-outline"></i> 07 AM</span>
									</a></li>
									<li><a href="#"> <i class="mdi mdi-chart-areaspline"></i>
											Sales report is ready <span
											class=" font-size-12 d-inline-block float-right"><i
												class="mdi mdi-clock-outline"></i> 12 PM</span>
									</a></li>
									<li><a href="#"> <i class="mdi mdi-account-supervisor"></i>
											New client <span
											class=" font-size-12 d-inline-block float-right"><i
												class="mdi mdi-clock-outline"></i> 10 AM</span>
									</a></li>
									<li><a href="#"> <i class="mdi mdi-server-network-off"></i>
											Server overloaded <span
											class=" font-size-12 d-inline-block float-right"><i
												class="mdi mdi-clock-outline"></i> 05 AM</span>
									</a></li>
									<li class="dropdown-footer"><a class="text-center"
										href="#"> View All </a></li>
								</ul>
							</li>
							<!-- User Account -->
							<li class="dropdown user-menu">
								<button href="#" class="dropdown-toggle nav-link"
									data-toggle="dropdown">
									<!-- <img src="assets/img/user/user.png" class="user-image"
										alt="User Image" /> --> <span class="d-none d-lg-inline-block">${sessionScope.adminid}님 안녕~!</span>
								</button>
								<ul class="dropdown-menu dropdown-menu-right">
									<!-- User image -->
									<!-- <li class="dropdown-header"><img
										src="assets/img/user/user.png" class="img-circle"
										alt="User Image" />
										<div class="d-inline-block">
											Abdus Salam <small class="pt-1">abdus@gmail.com</small>
										</div></li> -->

									<!-- <li><a href="profile.html"> <i class="mdi mdi-account"></i>
											My Profile
									</a></li>
									<li><a href="email-inbox.html"> <i
											class="mdi mdi-email"></i> Message
									</a></li>
									<li><a href="#"> <i class="mdi mdi-diamond-stone"></i>
											Projects
									</a></li>
									-->
									<li><a href="#" id="chengPwd"> <i class="mdi mdi-settings"></i>
											비밀번호 변경
									</a></li> 

									<li class="dropdown-footer"><a href="${pageContext.request.contextPath}/manager/logout.do"> <i
											class="mdi mdi-logout"></i>로그아웃
									</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
<script type="text/javascript">
	$("#chengPwd").click(function(){
		open("${pageContext.request.contextPath}/manager/login/managerChengPwd.do","비밀번호 변경", "'status=no, height=500, width=500, left='300', top='30" );
	})
</script>

			</header>