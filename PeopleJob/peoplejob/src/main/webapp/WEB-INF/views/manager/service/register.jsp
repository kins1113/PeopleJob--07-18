<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>
<style type="text/css">
form[name=serviceRegister]{
width: 400px;
}
</style>

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
								<button type="submit" class="btn btn-primary btn-default">등록하기</button>

							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>