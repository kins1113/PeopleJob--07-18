<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
   $(function(){
      $('#comAttach').change(function(){
         var fileName = $(this).val();
         $(this).next().html(fileName);
         //$('#fileInfo').html(fileName);
         //$('#fileInfo').append("<br>"+ fileName.subString(fileName.lastIndexOf("\\")+1));
      });
   });
</script>
<style>
.divList {
    width: 900px;
    margin: 0 auto;
    padding: 10px;
    background: #cccccc;
}
select {
    height: 30px;
}
</style>
<br>
<div class="divList">
<div class="container">
   <h2 class="mb-10"> 1:1 문의 수정</h2>
   <br><br>
   <form name="frmWrite" method="post" action="<c:url value='/custext/custextEdit.do'/>" enctype="multipart/form-data">
    <fieldset>
      <legend></legend>
      <input type="hidden" value=${vo.custextCode } name="custextCode">
           <div class="form-group">
              <label for="custextcategory">카테고리</label>
              <select id="custextcategory" name="custextcategory">
              	<option value="기업문의"
              	<c:if test="${vo.custextcategory=='개인문의' }">
              	selected
              	</c:if>
              	>개인문의</option>
              	<option value="기업문의"
              	<c:if test="${vo.custextcategory=='기업문의' }">
              	selected
              	</c:if>
              	>기업문의</option>
              	<option value="후원문의"
              	<c:if test="${vo.custextcategory=='후원문의' }">
              	selected
              	</c:if>
              	>후원문의</option>
              </select>
              
           </div>
           <div class="form-group">
              <label for="custitle">제목</label>
               <input type="text" id="custitle" name="custitle" class="form-control" maxlength="100" required="required" value="${vo.custitle }"/>
           </div>
              <label for="cuscontent">내용</label>        
           <div class="form-group">  
             <textarea id="cuscontent" name="cuscontent" rows="8" class="form-control" required="required">${vo.cuscontent}</textarea>
           </div>
           <div class="form-group">
             <img src="">
           </div>
           <!-- <div class="form-group">
              <div class="custom-file">
                  <input type="file" id="comAttach" name="comAttach" class="custom-file-input" />
                  <label class="custom-file-label" for="comAttach">첨부 이미지</label>
              </div>
           </div> -->
           <br><br>
           <div class="text-center">
               <input type = "submit" value="수정" class="btn btn-primary"/>&nbsp;&nbsp;
               <a href="<c:url value='/custext/custext_view.do?custextCode=${vo.custextCode }'/>"><input type = "button" value="뒤로가기" class="btn btn-danger"></a>&nbsp;&nbsp;
           </div>
       </fieldset>
   </form>
   <br>
   <br>
</div>
</div>

<%@include file="../main/inc/bottom.jsp" %>