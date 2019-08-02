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
 
 
 <div class="wraper">
          <div class="container">
          
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
             
				
              </tbody>
            </table>
          </div>
    </div>
    
    

	
</div>
<%@include file="../main/inc/bottom.jsp"%>