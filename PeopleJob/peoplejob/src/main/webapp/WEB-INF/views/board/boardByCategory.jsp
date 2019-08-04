<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp"%>

<style type="text/css">
.wraper{
	height: 400px;
	margin-top: 100px;
	min-height: 629px;
}

.text-center {
  text-align: center;
}


.pagination {
  display: inline-block;
  padding-left: 0;
  margin: 20px 0;
  border-radius: 4px;
}
.pagination > li {
  display: inline;
}
.pagination > li > a,
.pagination > li > span {
  position: relative;
  float: left;
  padding: 6px 12px;
  margin-left: -1px;
  line-height: 1.42857143;
  color: #F7E7AD;
  text-decoration: none;
  background-color: #fff;
  border: 1px solid #ddd;
}
.pagination > li:first-child > a,
.pagination > li:first-child > span {
  margin-left: 0;
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.pagination > li:last-child > a,
.pagination > li:last-child > span {
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}

.pagination-lg > li > a,
.pagination-lg > li > span {
  padding: 10px 16px;
  font-size: 18px;
}
.pagination-lg > li:first-child > a,
.pagination-lg > li:first-child > span {
  border-top-left-radius: 6px;
  border-bottom-left-radius: 6px;
}
.pagination-lg > li:last-child > a,
.pagination-lg > li:last-child > span {
  border-top-right-radius: 6px;
  border-bottom-right-radius: 6px;
}
.pagination-sm > li > a,
.pagination-sm > li > span {
  padding: 5px 10px;
  font-size: 12px;
}
.pagination-sm > li:first-child > a,
.pagination-sm > li:first-child > span {
  border-top-left-radius: 3px;
  border-bottom-left-radius: 3px;
}
.pagination-sm > li:last-child > a,
.pagination-sm > li:last-child > span {
  border-top-right-radius: 3px;
  border-bottom-right-radius: 3px;
}

</style>

<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
 <script type="text/javascript">
 $(function(){
		$('.write').click(function(){
			 if(${sessionScope.memberid==null}){
				 alert('로그인을 해주세요');
			 }else{
				 location.href='<c:url value= "/board/boardWrite.do?boardCode=${param.boardCode}"/>';
			 } 
		});
 });
 
 function pageFunc1(curPage){
		$("input[name=currentPage]").val(curPage);
		$("form[name=frmSearch]").submit();
		}
 
 </script>
 
 
 <div class="wraper" style="min-height: 710px;">
          <div class="container" style="height: 96%;">
  
				
				    <%--  <div class="form-group" id='pageSize'>
					<select class="custom-select my-1 mr-sm-2" name="recordCountPerPage">
						<option value="10"
							<c:if test="${param.recordCountPerPage==10 }">
								selected="selected"
							</c:if>>10개씩
						</option>
						<option value="20"
							<c:if test="${param.recordCountPerPage==20 }">
								selected="selected"
							</c:if>>20개씩
						</option>
						<option value="30"
							<c:if test="${param.recordCountPerPage==30 }">
								selected="selected"
							</c:if>>30개씩
						</option>
						<option value="50"
							<c:if test="${param.recordCountPerPage==50 }">
								selected="selected"
							</c:if>>50개씩
						</option>
					</select>
				</div>    --%>
				
				<form class="form-inline" action="<c:url value="/board/boardByCategory.do?boardCode=${param.boardCode }"/>" method="get">

							<select class="custom-select my-1 mr-sm-2" name="searchCondition">

								<option value="boardtitle"
									<c:if test="${param.searchCondition=='boardtitle'}">
            		selected="selected"
            	</c:if>>제목</option>
								<option value="boardcontent"
									<c:if test="${param.searchCondition=='boardcontent'}">
            		selected="selected"
            	</c:if>>내용</option>

							</select>

							<div class="input-group mb-2 mr-sm-2">


								<input type="text" name="searchKeyword" class="form-control"
									placeholder="검색어" value="${param.searchKeyword }">
							</div>
							<button type="submit" class="btn btn-primary mb-2">검색</button>
						</form>
						
						<div> 
						<c:if test="${param.searchCondition=='boardtitle'}">
							제목으로 ${param.searchKeyword} 검색결과
						</c:if>
						<c:if test="${param.searchCondition=='boardcontent'}"> 
							내용으로 ${param.searchKeyword} 검색결과 
						</c:if>
						
						</div>
						
						<div class="divSearch">
							<!-- 페이징 처리에도 사용 -->

							<form name="frmSearch" method="post"
								action='<c:url value="/board/boardByCategory.do?boardCode=${param.boardCode }"/>'>
								<!-- 현재 페이지 hidden에 넣기 -->
								<input type="hidden" name='currentPage' value="1">


							</form>
						</div>
			<form name="frmList" method="post"
							action="">
          <h2></h2>
          <div class="row">
            <table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
              <thead>
                <tr>
                  <th style="background-color:#eeeeee; text-align: center;">번호</th>
                  <th style="background-color:#eeeeee; text-align: center;">제목</th>
                  <th style="background-color:#eeeeee; text-align: center;">작성자</th>
                  <th style="background-color:#eeeeee; text-align: center;">등록일</th>
                  <th style="background-color:#eeeeee; text-align: center;">조회수</th>
                </tr>
              </thead>
              <tbody>
              <c:if test="${empty list }">
                <tr style="background: white;">
				   	<td colspan="5">등록된 게시글이 없습니다.</td>
				</tr>
              </c:if>
              
              <c:if test="${!empty list }">
              <c:set var="i" value="1"/>
              <c:forEach var="map" items="${list }">
                <tr style="background: white;">
				   	<td>${i }</td>
				   	<td><a href="<c:url value='/post/countUpdate.do?pk=${map["BOARD_CODE2"]}&boardCode=${map["BOARD_CODE"] }'/>" style="color:black;">
				   	
				   	<c:if test="${fn:length(map['BOARDTITLE'])>=30 }">
						${fn:substring(map['BOARDTITLE'],0,30) }...</c:if>
						<c:if test="${fn:length(map['BOARDTITLE'])<30 }">
						${map['BOARDTITLE']}
						
						</a><c:if test="${map['COMMENTCNT']!=0 }">
						<span style="color:green;">&nbsp;&nbsp;	( ${map['COMMENTCNT'] } ) </span>
						</c:if>
						 </c:if>
						</td>
				   	<td>
					   	<c:if test="${map['ADMIN_CODE']!=0 && map['MEMBERNAME'] ==NULL}">
					   		관리자
					   	</c:if>
					   	<c:if test="${map['MEMBERNAME'] !=NULL && map['ADMIN_CODE']==NULL}">
					   		${map['MEMBERNAME'] }
					   	</c:if>
					   		<c:if test="${map['MEMBER_CODE']==0 && map['ADMIN_CODE']==0}">
					   		비회원
					   	</c:if>
				   	</td>
				   	<td><fmt:formatDate value="${map['BOARDREGDATE2'] }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				   	<td>${map['BOARDHITS'] }</td>
				</tr>
				
          	
              <c:set var="i" value="${i+1 }"/>
				</c:forEach>
              </c:if>
				
              </tbody>
            </table>
          </div>
          </form>
          
          <input type="button" value="글쓰기" style="float:right;" class="write">
          <!-- 페이지 처리 -->
          
          <div class="divPage">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
										<!-- 이전블럭으로 이동하기 -->
										<li class="page-item"><c:if
												test="${pagingInfo.firstPage>1 }">
												<li class="page-item"><a class="page-link" href="#"
													aria-label="Previous"
													onclick="pageFunc1(${pagingInfo.firstPage-1})"> <span
														aria-hidden="true" class="mdi mdi-chevron-left"></span> <span
														class="sr-only">Previous</span>
												</a></li>
											</c:if></li>
										<!-- 페이지 번호 추가 -->
										<!-- [1][2][3][4][5][6][7][8][9][10] -->
										<c:forEach var="i" begin="${pagingInfo.firstPage }"
											end="${pagingInfo.lastPage }">
											<c:if test="${i==pagingInfo.currentPage }">
												<li class="page-item active"><a class="page-link"
													href="#">${i}</a></li>
											</c:if>

											<c:if test="${i!=pagingInfo.currentPage }">
												<li class="page-item"><a class="page-link" href="#"
													onclick="pageFunc1(${i})">${i}</a></li>
											</c:if>
										</c:forEach>
										<!--  페이지	 번호 끝 -->


										<!-- 다음 블럭으로 이동하기 -->
										<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
											<li class="page-item"><a class="page-link" href="#"
												aria-label="Next"
												onclick="pageFunc1(${pagingInfo.lastPage+1})"> <span
													aria-hidden="true" class="mdi mdi-chevron-right"></span> <span
													class="sr-only">Next</span>
											</a></li>
										</c:if>
									</ul>
								</nav>
							</div>
				<div class="divSearch"></div>
			</div>
		</div>
          <!-- <div class="flex-wr-s-c m-rl--7 p-t-15" style="margin: 0 auto;display: table;">
						<a href="#" class="flex-c-c pagi-item hov-btn1 trans-03 m-all-7 pagi-active" style="    float: left;">1</a>
						<a href="#" class="flex-c-c pagi-item hov-btn1 trans-03 m-all-7">2</a>
					</div> -->
    </div>
    
    

	
</div>
<%@include file="../main/inc/bottom.jsp"%>