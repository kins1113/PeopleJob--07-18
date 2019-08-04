<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp"%>


<style type="text/css">
.row{
	margin-top: 100px;
	margin-bottom: 100px;
	width: 120%;
}

</style>
<script type="text/javascript">

function report(no){
	
	 window.open('<c:url value="/board/report.do?no='+no+'"/>',
			 'reportView',
			 "'status=no, height=500, width=400, left='300px', top='300px'");
}
</script>
  <!-- Page Content -->
  <div class="container">

    <div class="row" >

      <!-- Post Content Column -->
      <div class="col-lg-8" style="margin:0 auto;">
	<c:forEach var="map" items="${ postList}">
        <!-- Title -->
        <h1 class="mt-4">${map['BOARDTITLE'] }</h1> <div></div>
		<span>조회수 : ${map['BOARDHITS'] } </span>
        <!-- Author -->
        <p class="lead">
             작성자 : ${map['MEMBERNAME'] }
        </p>
        <hr>
        <!-- Date/Time -->
        <p>등록일 :  ${map['BOARDREGDATE2'] }</p>
        <hr>
        <!-- Preview Image -->
        <img class="img-fluid rounded" src="http://placehold.it/900x300" alt="">
        <hr>
 		<p class="lead">${map['BOARDCONTENT'] } </p>
        <hr>
        <!-- Post Content -->
        <div>
        <c:if test="${sessionScope.membername==map['MEMBERNAME'] }">
<button value="수정하기" onclick="location.href='<c:url value="/board/boardEdit.do?no=${map['BOARD_CODE2'] }"/>'" class="btn btn-primary">수정하기</button>
   </c:if>
<button style="float:left;" onclick="report(${param.no})" class="btn btn-primary">신고하기</button>
       
<button style="float:right;" onclick="location.href='<c:url value="/board/boardByCategory.do?boardCode=${map['BOARD_CODE']}" />' " class="btn btn-primary">목록으로</button>
</div>
</c:forEach>
<br>
        <!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">댓글을 남겨주세요:</h5>
          <div class="card-body">
            <form name="frmCmt" action="<c:url value='/post/postCmt.do'/>" method="post">
            	<input type="hidden" name="boardCode2" value="${param.no}">
              <div class="form-group">
                <textarea class="form-control" rows="3" name="content" ></textarea>
              </div>
              <button type="submit" class="btn btn-primary" style="float:right;">등록</button>
            </form>
          </div>
        </div>

        <!-- Single Comment -->
        <c:if test="${!empty list }">
        <c:forEach var="map" items="${list}">
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">${map['MEMBERNAME'] } | ${map['BOARD_DATE'] }</h5> 
            ${map['CONTENT'] } 
          </div>
        </div>
	<hr>
	</c:forEach>
	</c:if>
        <!-- Comment with nested comments -->
       <!--  <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>


          </div>
        </div> -->


     
	
     

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<%@include file="../main/inc/bottom.jsp"%>