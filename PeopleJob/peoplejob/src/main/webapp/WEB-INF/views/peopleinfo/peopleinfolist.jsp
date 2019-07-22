<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="frmSearch" method="post" 
   		action='<c:url value="/peopleinfo/peopleinfolist.do"/>'>
   		<!-- 현재 페이지 hidden에 넣기 -->  
   		<input type="hidden" name='currentPage' value="1" >
   		
   		<div class="talent_list">
    <table>
        <caption>인재검색 리스트</caption>
        <colgroup>
            <col width="46">
            <col width="218">
            <col width="549">
            <col width="147">
        </colgroup>
        <thead>
        <tr>
            <th scope="col" class="scrap"><span class="blind">관심인재</span></th>
            <th scope="col" class="name" >이름</th>
            <th scope="col" class="contents">이력서 요약</th>
            <th scope="col" class="update" id="date_type">등록일</th>
            <td id="peoplelist" name="membername">${vo.membername}<br>(${vo.membergender}|${vo.age})</td>
            <td id="peoplelist" name="membername">${vo.membername}</td>
            <td id="peoplelist" name="membername">${vo.membername}</td>
            
        </tr>
        </thead>
        </table>
        </div>
   		</form>
</body>
</html>