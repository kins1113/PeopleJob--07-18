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
</head>
<body>
<style type="text/css">
form[name=serviceRegister]{
width: 400px;
}
</style>
<script type="text/javascript">
function closeWin() {
	if(confirm("등록하시겠습니까?")){
		$("form[name=serviceRegister]").submit();
		window.close();
	}
	opener.parent.location.reload();
}
</script>

<div class="content-wrapper">
	<div class="content">
		<div class="row">
			<div class="col-lg-6">
				<div class="card card-default">
					<div class="card-header card-header-border-bottom">
						<form name="serviceRegister" method="post" action="<c:url value='/service/register.do'/>">
							<div class="form-group">
								<label for="serviceName">서비스명</label> <input type="text" 
									class="form-control" id="serviceName" name="serviceName" /> <label
									for="servicePrice">가격</label> <input type="text"
									class="form-control" id="servicePrice" name="servicePrice" /> <label
									for="serviceContent">서비스내용</label>
									<input type="text"
									class="form-control" id="serviceContent" name="serviceContent" />
								<label for="serviceDay">서비스일</label> <input type="text"
									class="form-control" id="serviceDay" name="serviceDay" /> <br>
								<button type="button" onclick="closeWin()" class="btn btn-primary btn-default">등록하기</button>

							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>