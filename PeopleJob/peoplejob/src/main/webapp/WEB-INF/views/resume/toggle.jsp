<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html >
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Accordion - No auto height</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#accordion" ).accordion({
      heightStyle: "content"
    });
  } );
  </script>
</head>
<body>
 
<div id="accordion">
  <h3>Section 1</h3>
  <div>
     <h3>자격증/어학</h3>
        <label for="certificationtype">항목선택</label>
        <select class="form-control" name="certificationtype" id="certificationtype" >
        	<option value="자격증/면허증">자격증/면허증</option>
        	<option value="어학시험">어학시험</option>
        </select>
     <div>
   <h5>자격증/면허증</h5>
        <label for="lName">자격증명</label>
        <input type="text" class="form-control"  name="lName" id="lName" style="ime-mode:active">
    </div>
    <div>    
        <label for="lInstitution">발행처/기관</label>
        <input type="text" class="form-control"  name="lInstitution" id="lInstitution" style="ime-mode:active">
    </div>
    <div>
    </div> 
    &nbsp;
    <div>	
    <h5>어학시험</h5>  
        <label for="language">언어</label>
        <input type="text" class="form-control"  name="language" id="language" style="ime-mode:active">
    </div>
     <div>
        <label for="institute">발행처/기관</label>
        <input type="text" class="form-control"  name="institute" id="institute" style="ime-mode:active">
     </div>
     <div>
        <label for="langlicencename">시험종류</label>
        <input type="text" class="form-control"  name="langlicencename" id="langlicencename" style="ime-mode:active">
     </div> 
     <div>
        <label for="langpoint">점수</label>
        <input type="text" class="form-control"  name="langpoint" id="langpoint" style="ime-mode:active">
     </div>
     
     <div>
        <label for="langGrade">급수</label>
        <input type="text" class="form-control"  name="langGrade" id="langGrade" style="ime-mode:active">
     </div>
     <div>             
	</div>
     &nbsp;
  </div>
  <h3>Section 2</h3>
  <div>
    <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna. </p>
  </div>
  <h3>Section 3</h3>
  <div>
    <p>Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui. </p>
    <ul>
      <li>List item</li>
      <li>List item</li>
      <li>List item</li>
      <li>List item</li>
      <li>List item</li>
      <li>List item</li>
      <li>List item</li>
    </ul>
  </div>
</div>
 
 
</body>
</html>
