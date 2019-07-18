<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>
<form action="<c:url value='/manager/email_sms/emailWrite.do'/>" method="post"
				enctype="multipart/form-data">
<div class="content-wrapper">
	<div class="content">
		<div class="row">

			<div class="col-lg-12">
				<div class="card card-default">
					<div class="card-header card-header-border-bottom">
						<h2>메일 보내기</h2>
					</div>
					<div class="card-body">
							<div class="form-group">
								<label for="exampleFormControlInput1">메일 주소</label> <input
									type="email" name="emailAddress" class="form-control" 
									placeholder="Email Address"> <span class="mt-2 d-block">입력하세요.</span>
							</div>
							<div class="form-group">
								<label for="exampleFormControlPassword">메일 제목</label> <input
									type="text" class="form-control"
									name="title" placeholder="title">
							</div>
							<div>
								<c:import url="/manager/smarteditorTestjsp.do">
									<c:param name="name" value="coment"></c:param>
								</c:import>
								<input type="file" name="sendFile"> 
							</div>
							<div>
								<input type="submit" class="btn btn-primary btn-default" value="보내기">
								<input type="reset" class="btn btn-secondary btn-default" value="취소">
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>

