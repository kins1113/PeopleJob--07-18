<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/jquery-ui.min.css'/>">
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-ui.min.js'/>">
</script>
  <script>
  
  $( function() {
	    var availableTags2 = [
	    '관리관         '    ,
	    '교정관         '    ,
	    '교감           '    ,
	    '교위           '    ,
	    '교도           '    ,
	    '교회감         '    ,
	    '교회관         '    ,
	    '교회사         '    ,
	    '교회사보       '    ,
	    '교회원         '    ,
	    '교회원보       '    ,
	    '분류감         '    ,
	    '분류관         '    ,
	    '분류사         '    ,
	    '분류사보       '    ,
	    '분류원         '    ,
	    '분류원보       '    ,
	    '검찰이사관     '    ,
	    '검찰부이사관   '    ,
	    '검찰수사서기관 '    ,
	    '검찰사무관     '    ,
	    '검찰주사       '    ,
	    '검찰주사보     '    ,
	    '검찰서기       '    ,
	    '검찰서기보     '    ,
	    '마약수사사무관 '    ,
	    '마약수사주사   '    ,
	    '마약수사주사보 '    ,
	    '마약수사서기   '    ,
	    '마약수사서기보 '    ,
	    '출입국관리사무관'   ,
	    '출입국관리주사 '    ,
	    '출입국관리주사보'   ,
	    '출입국관리서기 '    ,
	    '출입국관리서기보'   ,
	    '철도공안감     '    ,
	    '철도공안관     '    ,
	    '철도공안사     '    ,
	    '철도공안사보   '    ,
	    '철도공안원     '    ,
	    '철도공안원보   '    ,
	    '이사관         '    ,
	    '부이사관       '    ,
	    '서기관         '    ,
	    '행정사무관     '    ,
	    '행정주사       '    ,
	    '행정주사보     '    ,
	    '행정서기       '    ,
	    '행정서기보     '    ,
	    '세무주사       '    ,
	    '세무주사보     '    ,
	    '세무서기       '    ,
	    '세무서기보     '    ,
	    '관세주사       '    ,
	    '관세주사보     '    ,
	    '관세서기       '    ,
	    '관세서기보     '    ,
	    '사회복지사무관 '    ,
	    '사회복지주사   '    ,
	    '사회복지주사보 '    ,
	    '사회복지서기   '    ,
	    '사회복지서기보 '    ,
	    '통계사무관     '    ,
	    '통계주사       '    ,
	    '통계주사보     '    ,
	    '통계서기       '    ,
	    '통계서기보     '    ,
	    '감사관         '    ,
	    '부감사관       '    ,
	    '감사주사       '    ,
	    '감사주사보     '    ,
	    '감사서기       '    ,
	    '감사서기보     '    ,
	    '사서사무관     '    ,
	    '사서주사       '    ,
	    '사서주사보     '    ,
	    '사서서기       '    ,
	    '사서서기보     '    ,
	    '기계주사       '    ,
	    '농업사무관     '    ,
	    '농업주사       '    ,
	    '농업주사보     '    

	    ];
	    $( "#jobgrade" ).autocomplete({
	      source: availableTags2
	    });
	  } );
  
 
  </script>
</head>
<body>
           <label for="jobgrade">직급</label>
        <input type="text" class="form-control"  name="dvCode" id="jobgrade" style="ime-mode:active" placeholder="직급을 입력하세요">
</body>
</html>