<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp"%>
<style type="text/css">

.body{
	width:70%;
	min-height: 629px;
	margin: 0 auto;
}
img{
	width: 150px;
}
/* .fab {
    font-family: Font Awesome\ 5 Brands;
}
.fa-youtube {
    content: "\f167";
} */

button{
	width: 150px;
}

table{
	border: 1px solid lightgray;
    width: 55%;
    height: 580px;
    margin: 0 auto;
    margin-top: 100px;
}

table tr td{
	/* display: block; */
}

.table{
	width: 70%;
	margin: 0 auto;
}
</style>
<div class="body">
	<div class="table">
						<div style="display: inline-block;">
								<div class="wrap-pic-w pos-relative">
									<img src="<c:url value='/resources/main/images/videosample.jpg'/>" alt="video1"
									style="width: 290px;">

									<button class="s-full ab-t-l flex-c-c fs-32 cl0 hov-cl10 trans-03" 
									data-toggle="modal" data-target="#modal-video-01" style="width: 290px;">
										<span class="fab fa-youtube"></span>
									</button>
								</div>

								<div class="p-tb-16 p-rl-25 bg3" style="width: 290px;">
									<h5 class="p-b-5">
										<a href="#" class="f1-m-3 cl0 hov-cl10 trans-03">
											Music lorem ipsum dolor sit amet consectetur 
										</a>
									</h5>

									<span class="cl15">
										<a href="#" class="f1-s-4 cl8 hov-cl10 trans-03">
											by John Alvarado
										</a>

										<span class="f1-s-3 m-rl-3">
											-
										</span>

										<span class="f1-s-3">
											Feb 18
										</span>
									</span>
								</div>
							</div>	
	</div> <!-- table -->
</div><!-- body -->
<%@include file="../main/inc/bottom.jsp"%>