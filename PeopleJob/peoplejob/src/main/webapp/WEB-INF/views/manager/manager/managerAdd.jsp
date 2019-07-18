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
<link href="${pageContext.request.contextPath}/resources/admin/assets/plugins/toastr/toastr.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/admin/assets/plugins/nprogress/nprogress.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/admin/assets/plugins/flag-icons/css/flag-icon.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/admin/assets/plugins/jvectormap/jquery-jvectormap-2.0.3.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/admin/assets/plugins/ladda/ladda.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/admin/assets/plugins/select2/css/select2.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/admin/assets/plugins/daterangepicker/daterangepicker.css"
	rel="stylesheet" />

<!-- SLEEK CSS -->
<link id="sleek-css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/assets/css/sleek.css" />

<!-- FAVICON -->
<link href="${pageContext.request.contextPath}/resources/admin/assets/img/favicon.png"
	rel="shortcut icon" />
	

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDCn8TFXGg17HAUcNpkwtxxyT9Io9B_NcM"
	defer></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/plugins/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/plugins/toastr/toastr.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/plugins/slimscrollbar/jquery.slimscroll.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/plugins/charts/Chart.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/plugins/ladda/spin.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/plugins/ladda/ladda.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/plugins/jquery-mask-input/jquery.mask.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/plugins/select2/js/select2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/plugins/jvectormap/jquery-jvectormap-2.0.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/plugins/jvectormap/jquery-jvectormap-world-mill.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/plugins/daterangepicker/moment.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/plugins/daterangepicker/daterangepicker.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/plugins/jekyll-search.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/js/sleek.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/js/chart.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/js/date-range.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/js/map.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/js/custom.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery-3.4.1.min.js"></script>
	
<script rc="${pageContext.request.contextPath}/resources/admin/assets/plugins/nprogress/nprogress.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function managerAdd(){
		var id=$("#validationServer01").val();
		var pwd=$("#validationServer02").val();
		var at=$("#exampleFormControlSelect1").val();
		if(id.length < 1){
			alert("아이디를 입력하세요");
			event.prevantDefault();
		}
		if(pwd.length <1){
			alert("비밀번호를 입력하세요");
			event.prevantDefault();
		}
		if(at=="not"){
			alert("권한을 선택하세요");
			event.prevantDefault();
		}		
		$("input[name=close]").val("close");
		$("form[name=managerAddForm]").submit();
	}
	$(function(){
		if($("input[name=close]").val()=="close"){
			opener.parent.location.reload();
			window.close();		
		};
	})
	
</script>
</head>
<body>

	<div class="content-wrapper">
		<div class="content">
			<div class="row">
				<div class="col-lg-6">
					<div class="card card-default">
						<div class="card-header card-header-border-bottom">
							<h2>관리자 추가 </h2>
						</div>
	<div class="card-body">
		<form action="<c:url value='/manager/manager/managerAdd.do'/>" 
				method="post" name="managerAddForm">
				<!-- 창닫기를 하기위한 hidden -->
				<input type="hidden" name="close"  value="${param.close}">
			<div class="form-row">
				<div class="col-md-12 mb-3">
					<label for="validationServer01">아이디</label> 
					<input
						type="text" class="form-control managerAdd" id="validationServer01"
						placeholder="Id"  name="adminid"
						 >
					<div class="valid-feedback">아이디를 입력하세요</div>
				</div>
				<div class="col-md-12 mb-3">
					<label for="validationServer02">비밀번호</label> <input
						type="password" class="form-control managerAdd" id="validationServer02"
						placeholder="Password"   name="adminpwd" 
						>
					<div class="valid-feedback">비밀번호를 입력하세요</div>
				</div>
				<div class="col-md-12 mb-3">
				<div class="form-group">
								<label for="exampleFormControlSelect1">Authority</label>
								<select class="form-control" id="exampleFormControlSelect1"
										name="authority" >
									<option value="not">권한을 선택하세요</option>
									<!-- <option value="GM">GM    : 최고관리자</option> -->
									<option value="Master"
									>Master: 중간관리자</option>
									<option value="Admin" 
									>Admin : 일반 관리자</option>
								</select>
							</div>
					<!-- <label for="validationServerUsername">권한</label> <input
						type="text" class="form-control"
						id="validationServerUsername" placeholder="Authority"
						aria-describedby="inputGroupPrepend3" > required -->
					<div class="invalid-feedback">Please choose a username.
					</div>
				</div>
			</div>
				<button class="btn btn-primary" type="button" onclick="managerAdd()">Add</button>
		</form>
	</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>



</html>