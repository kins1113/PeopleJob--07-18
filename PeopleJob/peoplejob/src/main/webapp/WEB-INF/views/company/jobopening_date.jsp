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
    <script type="text/javascript">
    $(document).ready(function($){
		$('#workdate').datepicker({
			dateFormat:"yy-mm-dd",
			changeYear:true,
			dayNamesMin:["일","월","화","수","목","금","토"],
			monthNames:["1월","2월","3월","4월","5월","6월",
					"7월","8월","9월","10월","11월","12월"]
		});
		$('#end_date').datepicker({
			dateFormat:"yy-mm-dd",
			changeYear:true,
			dayNamesMin:["일","월","화","수","목","금","토"],
			monthNames:["1월","2월","3월","4월","5월","6월",
					"7월","8월","9월","10월","11월","12월"]
		});
    });
    </script>
</head>
<body>
<div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                <label class="control-label">근무기간(date)</label>
                    <input id="workdate" name="workdate" class="form-control" type="text" readonly/>
                </div>
            </div>
            
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                <label class="control-label">모집종료일(date) :</label> 
                    <input id="end_date" name="endDate" class="form-control" type="text" readonly/>
                </div>
            </div> 
</body>
</html>
    
