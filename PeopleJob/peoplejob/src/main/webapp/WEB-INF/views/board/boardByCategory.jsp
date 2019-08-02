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
	 
 });
 
 </script>
 
 
 <div class="wraper" style="">
          <div class="container" style="height: 96%;">
          
          <h2>${param.boardName }</h2>
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
              <c:forEach var="postVo" items="${list }">
                <tr style="background: white;">
				   	<td>${i }</td>
				   	<td><a href="<c:url value='/post/countUpdate.do?no=${postVo.boardCode2}&name=${postVo.boardCode }'/>">
				   	
				   	<c:if test="${fn:length(postVo.boardtitle)>=30 }">
						${fn:substring(postVo.boardtitle,0,30) }...</c:if>
						<c:if test="${fn:length(postVo.boardtitle)<30 }">
						${postVo.boardtitle}</c:if>
						</td>
				   	<td>
					   	<c:if test="${postVo.memberCode==0 && postVo.adminCode!=0}">
					   		관리자
					   	</c:if>
					   	<c:if test="${postVo.memberCode!=0 && postVo.adminCode==0 }">
					   		${postVo.memberCode }
					   	</c:if>
				   	</td>
				   	<td><fmt:formatDate value="${postVo.boardregdate2 }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				   	<td>${postVo.boardhits }</td>
				</tr>
				
              <c:set var="i" value="${i+1 }"/>
				</c:forEach>
              </c:if>
				
              </tbody>
            </table>
          </div>
          <div class="flex-wr-s-c m-rl--7 p-t-15">
						<a href="#" class="flex-c-c pagi-item hov-btn1 trans-03 m-all-7 pagi-active">1</a>
						<a href="#" class="flex-c-c pagi-item hov-btn1 trans-03 m-all-7">2</a>
					</div>
          	<input type="button" value="글쓰기" style="float:right;" onclick="location.href='/board/boardWrite.do?${postVo.boardCode}' ">
    </div>
    
    

	
</div>
<%@include file="../main/inc/bottom.jsp"%>