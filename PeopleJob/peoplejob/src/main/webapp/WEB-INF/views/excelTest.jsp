<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<script type="text/javascript">
    function doExcelUploadProcess(){
        var f = new FormData(document.getElementById('form1'));
        event.preventDefault();
        $.ajax({
            url: "<c:url value='/uploadExcelFile.do'/>",
            data: f,
            processData: false,
            contentType: false,
            type: "POST",
            success: function(data){
                console.log(data);
                document.getElementById('result').innerHTML = JSON.stringify(data);
            }
        })
    }
    
    function doExcelDownloadProcess(){
        var f = document.form1;
        f.action = "<c:url value='/downloadExcelFile.do'/>";
        f.submit();
    }
</script>
<form id="form1" name="form1" method="post" enctype="multipart/form-data">
    <input type="file" id="fileInput" name="fileInput">
    <button type="button" onclick="doExcelUploadProcess()">엑셀업로드 작업</button>
    <button type="button" onclick="doExcelDownloadProcess()">엑셀다운로드 작업</button>
</form>
<div id="result">
</div>
</body>
</html>
