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
	$(function(){
		$("#checkSpan").hide();
		$("#managerChengPwd").click(function(){
			if($("#newPwd1").val()==$("#newPwd2").val()){
				$("form[name=managerAddForm]").attr("action","<c:url value='/manager/manger/managerChengPwd.do'/>");
				$("form[name=managerAddForm]").submit();
			}else{
				$("#checkSpan").show();
				event.prevantDefault();
			}
		});
	});

	function managerCheckPwd(){
		var pwd=$("#validationServer02").val();
			if(pwd.length <1){
				alert("비밀번호를 입력하세요");
				event.prevantDefault();
			}
		
		$("form[name=managerAddForm]").attr("action","<c:url value='/manager/manger/managerCheckPwd.do'/>");
		$("form[name=managerAddForm]").submit();
		
	}	
	
	function managerEdit(){
		if(confirm("수정 하시겠습니까?")){
			$("form[name=managerAddForm]").submit();
		}
	}
	
</script>
</head>
<body>


	<div class="content-wrapper">
		<div class="content">
			<div class="row">
				<div class="col-lg-6">
					<div class="card card-default">
						<div class="card-header card-header-border-bottom">
							<h2>관리자 비밀번호 수정</h2>
						</div>
	<div class="card-body">
		<form action="<c:url value='/manager/manager/managerEdit.do'/>" 		
				method="post" name="managerAddForm">
			<div class="form-row">
			<!-- 비밀번호 체크 전 -->
				<c:if test="${empty count or count!='1' }">
				
				<div class="col-md-12 mb-3">
					<label for="validationServer02">비밀번호</label> <input
						type="password" class="form-control managerAdd" id="validationServer02"
						placeholder="Password"   name="adminpwd" 
						>
					  <c:if test="${!empty count and count=='0'}">
					  	<span>비밀번호가 틀립니다.</span>
					  </c:if>
				</div>
				</c:if>
			<!-- 비밀번호 체크 후 -->
				<c:if test="${count=='1'}">
				<div class="col-md-12 mb-3">
					 <label for="newPwd1">비밀번호</label>
					  <input type="text" class="form-control" name="newPwd1"	id="newPwd1" placeholder="Password"	aria-describedby="inputGroupPrepend3" >
				</div> 
				<div class="col-md-12 mb-3">
					 <label for="newPwd2">비밀번호 확인</label>
					  <input type="text" class="form-control" name="newPwd2"	id="newPwd2" placeholder="Password Check" aria-describedby="inputGroupPrepend3" ><br>
					  <span id="checkSpan">비밀번호를 일치 시키세요...</span>
				</div> 
				</c:if>
			</div>
			<c:if test="${empty count or count=='0'}">
				<button class="btn btn-primary" type="button" onclick="managerCheckPwd()">비밀번호 체크</button>
			</c:if>
				<button class="btn btn-primary" type="button" id="managerChengPwd">변경</button>
		</form>
	</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>



</html>