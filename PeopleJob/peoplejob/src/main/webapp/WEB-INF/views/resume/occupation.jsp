<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="selected-menu" content="0,0,0">
<meta http-equiv="Content-Type" content="text/html;charset=euc-kr">
<meta http-equiv="imagetoolbar" content="no">
<meta name="robots" content="index,follow">
<meta name="subject" content="#">
<meta name="author" content="#">
<meta name="keywords" content="#">
<meta http-equiv="X-UA-Compatible" content="IE=7;IE=8;IE=9;">
<link href="<c:url value='/resources/css/default.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/resources/css/layer.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" type="text/css">
<style type="text/css">
/* <![CDATA[ */
/* board.css */table th, td {word-break:break-all}.search_form tbody td input,#layer div.category label input {*position:relative; *top:-1px}dd input {*margin-right:-3px}dd img {*top:1px;}span.tab_menu {*zoom:1}span.tab_menu02 {*zoom:1}#content .search_form tbody td.source label {_background-position:16px 0;}  .search_form tr.content td div.notice li {*zoom:1;} .search_form tbody td.cnt_byte div {*zoom:1;}.search_form tbody.penal td ul li input {*top:-5px; *left:-5px;} .search_form tbody td p.check,.search_form tbody td ul.check {*zoom:1;}.search_list tbody.formCo td .coinfo {_height:100%; *min-height:100%;}.search_detail caption.personal_title, x:-moz-any-link, x:default {height:38px; padding:12px 0 0 10px;}table.sch_table tbody td p span {*padding-bottom:3px}.search_contol span.range a.btn img {_margin-top:0px;}.search_contol02 span.range a.btn img {_margin-top:0px;}fieldset.search_penal dl {*zoom:1}fieldset.search_penal p {*zoom:1}fieldset.search_penal02 .penalin {*padding:10px 0 11px 15px; *zoom:1}fieldset.search_penal02 .penalin dl.othercase img {*margin-top:-1px;}span.file_btn strong input {-ms-filter:alpha(opacity=0);filter:alpha(opacity=0);opacity:0;-moz-opacity:0;}@media screen and (-webkit-min-device-pixel-ratio:0){ .search_form tbody td input {position:relative; top:-1px; vertical-align:middle};}/* content.css */.comment {_display:inline-block;}#content ul.list_type li {_position:relative;}ol.decimal li {*margin:0 0 0 25px;}.graybox dl.coun {*zoom:1;}.graybox.chek {_height:60px; _width:660px;}@media screen and (-webkit-min-device-pixel-ratio:0){  #main #content .emplist .samejob {background-position:left 42px;};}/* layout.css */#container {*zoom:1;}#header div.global span.user {*margin-top:-3px;}#header div.global dl {*margin-top:3px;}#header div.global dl dd {*padding:0 10px 0 7px; *background:url(http://www.work.go.kr/images/common/layout/bar_gray.gif) no-repeat scroll right 3px;}#header #tobmenu .moz {*margin-top:0;}#header #tobmenu .myinfo div, x:-moz-any-link, x:default {position:absolute; left:5px; top:-25px;}#header #tobmenu .myinfo div {*top:-26px;}#header #tobmenu .specmenu ul {*zoom:1;}#sidebar ul li ul li ul {*zoom:1;}#sidebar div.banner_empcenter ul.sercenter {*margin-top:14px; _margin-top:12px;}#sidebar div.banner_empcenter ul.sercenter li ul {*top:31px; _top:32px;}#sidebar div.banner_empcenter p {_bottom:10px; _right:9px;}#footer #footin span.family input,#footer #footin span.family img {*margin-top:-5px; _margin-top:-7px;}span#location img, x:-moz-any-link, x:default {position:relative; top:1px}@media screen and (-webkit-min-device-pixel-ratio:0){  #content span#location img {position:relative; top:1px;};}
/* ]]> */
#layer div.category div.multyCheck span input{z-index:20 !important;}
</style>
</head>
<div id="wrapper" >
<!--<script src="http://www.work.go.kr/js/framework/keis.import.js" type="text/javascript" charset="utf-8"></script>-->
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/jquery.listen.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.config.js'/>" type="text/javascript" charset="utf-8"></script>
<script src="<c:url value='/resources/js/keis.str.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.chk.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.combo.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.cookie.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.ajax.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.data.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.date.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.etc.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.msg.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.table.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.validation.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.mdata.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.window.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.message.api.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.util.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/keis.report.js'/>" type="text/javascript"></script>
<script type="text/javascript">


$(".multyCheck").prop("checked", false);
$("#thirdJobDiv").prop("checked", false);
if (document.domain.toString().indexOf("yesform.com") != -1) document.domain="yesform.com";

var jobData = new keis.data(); //선택직종을 처리하기위한 커스텀 콜렉션
var searchJobData = new keis.data(); // 검색엔진 통해서 검색된 직종을 처리하기 위한 커스텀 콜렉션
var superJobData = new keis.data(); //선택직종의 1차분류 2차분류를  담기위한 커스텀 콜렉션 "확인버튼 누를시 jobData가 없을시 jobMainData가 있을시 jobMainData를 전송

var division = "|"; //중복선택시 구분자
var elementTarget = "";
var type = 'worknet';
  /**
   * 시군구 Ajax결과를 파싱합니다.
   * @paras jobsCd 부모코드
   * @paras effectTarget 선택표시할 대상 아이디
   * @paras targetDiv 결과출력할 DIV
   * @return
   * f_requestJobSubList('01', 'mainJob0', 'subJob')
   * */
  function f_requestJobSubList(jobsCd, effectTarget, targetDiv){
    elementTarget = targetDiv;

    //Ajax 실행
    var regionAjax = $.ajax({
      type:"post",
      url:"jobs.json",
      dataType:"text",
      success:function(data) {
        $.each(JSON.parse(data), function(key, value) {
          if(key==jobsCd){
            f_responseJobSubList(value);
          }
        });
      }
    });
    //해당버튼을 선택한 이펙트 효과를 준다 (웹접근성)
    if(targetDiv == 'subJob'){
      f_objectClassClear('mainJob', effectTarget);
      f_objectClassClear('subJob', '');
    }else if((targetDiv == 'thirdJob')){
      f_objectClassClear('subJob', effectTarget);
    }

    // 1차분류 2차분류 콜렉션을 초기화 한다.
    superJobData.clear();
    //선택한 1차분류 2차분류를 콜렉션에 담는다
    var jobsNm = document.getElementById(effectTarget + "Nm").value;
    superJobData.add(jobsCd, jobsNm);
  }
  /**
   * 하위 직종분류 Ajax결과를 파싱합니다.
   * @paras resultObj ajax결과
   * @return
   *
   * */
  function f_responseJobSubList(resultObj){
    if(resultObj != null){
      var targetIdv = document.getElementById(elementTarget + "Div");
      targetIdv.innerHTML = "";

      var stringObject = "";
      for(var i = 0 ; i < resultObj.length ; i++) {
        //2차분류
        if(elementTarget == "subJob"){
          stringObject += "<span><input type=\"checkbox\" name=\"" + elementTarget + "\" id=\"" + elementTarget + i + "\" value=\"" + resultObj[i].jobsCd + "\" title=\""+resultObj[i].jobsCdKorNm+"추가\" onClick=\"f_checkJob(this," + i + ");\" />";
          stringObject += "<button type=\"button\" id=\"" + elementTarget + i + "\" name=\"subJob\" onclick=\"f_requestJobSubList('" + resultObj[i].jobsCd + "', '" + elementTarget + i + "' , 'thirdJob')\"><span> " + resultObj[i].jobsCdKorNm + " </span></button></span>";

          stringObject += "<input type=\"hidden\" id=\"" + elementTarget + i + "Nm\" value=\"" + resultObj[i].jobsCdKorNm + "\"/>";
          stringObject += "<input type=\"hidden\" name=\"secondJobName\" id=\"firstJobName" + resultObj[i].jobsCd + "\" value=\"" + resultObj[i].jobsCdKorNm + "\" />";
        }
        //3차분류
        if(elementTarget == "thirdJob"){
          stringObject += "<label for='" + elementTarget + i + "'><input type='checkbox' name='" + elementTarget + "' id='" + elementTarget + i + "' value='" + resultObj[i].jobsCd + "' onClick=\"f_checkJob(this," + i + ");\" />" + resultObj[i].jobsCdKorNm + "</label>";
          stringObject += "<input type='hidden' name='" + elementTarget + "Name' id='" + elementTarget + "Name" + resultObj[i].jobsCd + "' value='" + resultObj[i].jobsCdKorNm + "' />";
        }
      }
      targetIdv.innerHTML = stringObject;

      // 이벤트 발생지가 첫번째 직종일 경우 세번째 하위 직종 코드를 클리어한다.
      if(elementTarget == "subJob"){
        var thirdDiv = document.getElementById("thirdJobDiv");
          thirdDiv.innerHTML = "";
      }

      //기존 선택한 직종이있으면 체크한다.
      f_initCheckbox();
    }
  }
  /**
   * 직종선택시 추가
   * @paras  checked 체크여부
   * @paras  checkValue 체크 value
   * @return
   *
   * */
  function f_checkJob(object, idx){
    var checked = object.checked;
    var checkValue = object.value;

    if(checked){
      if(jobData.size() >= 10){
        alert('직종 선택은 10개 까지 가능합니다.');
        object.checked = "";
        return;
      }
      if(document.getElementById("thirdJobName" + checkValue)){
        var cdKorNm1 = document.getElementById("thirdJobName" + checkValue).value;
        jobData.add(checkValue, cdKorNm1);
      }
      if(document.getElementById("secondJobName" + checkValue)){
        var cdKorNm2 = document.getElementById("secondJobName" + checkValue).value;
        jobData.add(checkValue, cdKorNm2);
      }
      if(document.getElementById("firstJobName" + checkValue)){
        var cdKorNm3 = document.getElementById("firstJobName" + checkValue).value;
        jobData.add(checkValue, cdKorNm3);

        if(checkValue.length == 2) {
          f_requestJobSubList(checkValue, "mainJob"+idx, "subJob");
        }
        else if(checkValue.length == 3) {
          f_requestJobSubList(checkValue, "subJob"+idx, "thirdJob");
        }
      }
    }
    else{
      if(jobData.hasKey(checkValue)) jobData.del(checkValue);
    }

    f_generationJob();
    f_initCheckbox();
  }
  /**
   * 셋팅된 데이터 정보를 토대로 선택직종을 출력한다.
   * @paras  폼
   * @return boolean 수행결과
   *
   * */
  function f_generationJob(){
    var keyList = jobData.getHeader();
    var keyList2 = searchJobData.getHeader();
    var targetId = document.getElementById("selectedId");
    var regionString = "";

    //선택직종 초기화
    $(targetId).html("");

    //기본
    var regionString = "<strong>선택직종 :</strong> ";
    var jobsCdArr = '';
    var jobsNmArr = '';

    for(var i = 0; i < keyList.length; i++){
      regionString += jobData.get(keyList[i]) + "<button type=\"button\" onclick=\"f_deleteJob('" + keyList[i] + "');\">삭제</button>";

      if(jobsCdArr == ''){
        jobsCdArr = keyList[i];
        jobsNmArr = jobData.get(keyList[i]);
      }else{
        jobsCdArr += "," + keyList[i];
        jobsNmArr += "," + jobData.get(keyList[i]);
      }
    }

    for(var i = 0; i < keyList2.length; i++){
      regionString += searchJobData.get(keyList2[i]) + "<button type=\"button\" onclick=\"f_deleteJob('" + keyList2[i] + "');\">삭제</button>";

      if(jobsCdArr == ''){
        jobsCdArr = keyList2[i];
        jobsNmArr = searchJobData.get(keyList2[i]);
      }else{
        jobsCdArr += "," + keyList2[i];
        jobsNmArr += "," + searchJobData.get(keyList2[i]);
      }
    }

    $(targetId).html(regionString);
  }
  /**
   * 선택지역을 삭제합니다.
   * @paras  폼
   * @return boolean 수행결과
   *
   * */
  function f_deleteJob(keyCode){
    if(jobData.hasKey(keyCode)){
      jobData.del(keyCode);

      $("[name=firstJobName]:checked").each(function() {
        if($(this).val() == keyCode) {
          $(this).attr("checked", false);
        }
      });
      $("[name=subJob]:checked").each(function() {
        if($(this).val() == keyCode) {
          $(this).attr("checked", false);
        }
      });
      $("[name=thirdJob]:checked").each(function() {
        if($(this).val() == keyCode) {
          $(this).attr("checked", false);
        }
      });
    }

    if(searchJobData.hasKey(keyCode)) {
      searchJobData.del(keyCode);

      $("[name=chkJobs3depth]:checked").each(function() {
        if($(this).parent().find("input").eq(1).val() == keyCode) {
          $(this).attr("checked", false);
        }
      });
    }

    f_generationJob();
    f_initCheckbox();
  }
  /**
   * 선택한 영역과 체크박스 를 맵핑합니다.
   * @paras  폼
   * @return boolean 수행결과
   *
   * */
  function f_initCheckbox(){

    f_clearCheckbox();

    var elementList = document.getElementsByName("thirdJob");
    var keyList = jobData.getHeader();

    for(var i = 0; i < elementList.length; i++){
      for(var k = 0; k < keyList.length; k++){
        if(keyList[k] == elementList[i].value) elementList[i].checked = "checked";
      }
    }
  }
  /**
   * 체크박스를 클리어합니다.
   * @return boolean 수행결과
   *
   * */
  function f_clearCheckbox(value){
    var elementList = document.getElementsByName("thirdJob");

    for(var i = 0; i < elementList.length; i++){
      elementList[i].checked = "";
    }
  }
  /**
   * 선택결과를 전송합니다.
   * @paras  returnFunction 호출할 openr 펑션
   * @return
   *
   * */
/*
  function f_resultJob(returnFunction, returnKey){
    var jobsCd = keis.util.getRadaioBoxValue("thirdJob");

    if(jobsCd != ''){
      var jobsCdKorNm = document.getElementById("thirdJobName" + jobsCd).value;
      var rArray = [jobsCd, jobsCdKorNm, returnKey];
      eval("parent." + returnFunction + "(rArray)");
      window.closePopup();
    }
    else alert('선택된 항목이 없습니다.');
  }
*/
  /**
   * 선택결과를 전송합니다.
   * @paras  폼
   * @return boolean 수행결과
   *
   * */
  function f_resultJob(){

    if(jobData.size() > 0 || superJobData.size() > 0){
      var rArray;
      //3차분류 5개선택시 3차분류
      if(jobData.size() > 0){
        rArray = f_dataToArrayString(jobData);
      }else if(jobData.size() == 0 && superJobData.size() > 0){
        rArray = f_dataToArrayString(superJobData);
      }
    $("#f_resultJobsCodeInfo", parent.document).val(rArray[0]);
    $("#f_resultJobsNameInfo", parent.document).val(rArray[1]);
    $("#Jobarea",parent.document).hide();

    } else alert('선택하신 직종이 없습니다.');
  }
  /**
   * 팝업을 닫는다.
   */
  function f_popupClose() {
    $("#Jobarea",parent.document).hide();
  }

  /**
   * 해당 오브젝트의 class를 초기화 하고 지정한 오브젝트의 클래스를 selected합니다.
   * @paras  elementName 클리어할 오브젝트 name
   * @paras  elementId selected할 오브젝트 id
   *
   * */
  function f_dataToArrayString(colData){

    var keyList = colData.getHeader();
    var fieldString = division;
    var nameString = ", ";
    var codeString = "";
    var codeNmString = "";

    for(var i = 0; i < keyList.length; i++){
      if(keyList.length == 1){
        fieldString = "";
        nameString = "";
      }
      if(i + 1 == keyList.length){
        fieldString = "";
        nameString = "";
      }
      codeString += keyList[i] + fieldString;
      codeNmString += colData.get(keyList[i]) + nameString;
    }

    return [codeString, codeNmString];
  }
  /**
   * 해당 오브젝트의 class를 초기화 하고 지정한 오브젝트의 클래스를 selected합니다.
   * @paras  elementName 클리어할 오브젝트 name
   * @paras  elementId selected할 오브젝트 id
   *
   * */
  function f_objectClassClear(elementName, elementId){
    var elementList = document.getElementsByName(elementName);

    for(var i = 0; i < elementList.length; i++){
      elementList[i].className = "";

      if(elementList[i].id == elementId)
      {
        elementList[i].className = "selected";
      }
    }
  }

  function replaceAll(str, srchStr, replStr) {
    return str.split(srchStr).join(replStr);
  }


  function fn_clickSearchResult(jobsNm, jobsCd) {
    // 10개 이상 선택 불가능 체크
    if(jobData.size() >= 10){
      alert('직종 선택은 10개 까지 가능합니다.');
      object.checked = "";
      return;
    }

    // 파라미터 설정
    jobData.add(jobsCd, jobsNm);
    // 선택직종에 표시
    f_generationJob();
    // 레이어 팝업 닫기
    $("#btnCloseLayer").click();
  }


  function fn_clickJobs3depth(idx, object) {
    var jobSize = jobData.size() + searchJobData.size();

    if(jobSize > 10){
      alert('직종 선택은 10개 까지 가능합니다.');
      $(object).attr("checked", false);
      return false;
    }
    else {
      //var jobsCdObj = $("[name=hdJobs3depthCd]");
      //var jobsNmObj = $("[name=hdJobs3depthNm]");
      //var checkObj = $("[name=chkJobs3depth]");
      //searchJobData.clear();
      $("[name=chkJobs3depth]:checked").each(function(index) {
        var jobsCd = $(this).parent().find("input").eq(1).val();
        var jobsNm = $(this).parent().find("input").eq(2).val();

        if(jobData.hasKey(jobsCd) == false) {
          searchJobData.add(jobsCd, jobsNm);
        }
      });

      f_generationJob();
    }

  }

//]]>
</script>

<div style="border: 1px solid gold; float: left; width: 20%; margin: 10px; height:414px;  overflow: auto;">
<h1>직종 찾기 <span></span></h1>
<ul class="infobox mb15">
  <li>직종 : 최대 10개의 직종 선택이 가능합니다. 원하시는 직종을 선택하세요.</li>
  <li>‘체크박스’를 클릭하면 직종이 선택되고, 명칭별 검색에 직종명을 입력하면 다른 직종을 입력할 수 있습니다.</li>
</ul>


<div class="job_select_box">
  <div class="category first">
    <!-- 변경없음 -->
    <h3>1차 분류</h3>
    <div class="multyCheck">

        <span><input name="firstJobName" title="관리자, 공학기술자(엔지니어) 추가" id="firstJobName0" onclick="f_checkJob(this,0);" type="checkbox" value="01">
        <button name="mainJob" id="mainJob0" onclick="f_requestJobSubList('01', 'mainJob0', 'subJob')" type="button"><span>관리자, 공학기술자(엔지니어)</span></button></span>
        <input name="firstJobName" id="firstJobName01" type="hidden" value="관리자, 공학기술자(엔지니어)">
        <input id="mainJob0Nm" type="hidden" value="관리자, 공학기술자(엔지니어)">

        <span><input name="firstJobName" title="경영·사무·금융·보험 추가" id="firstJobName1" onclick="f_checkJob(this,1);" type="checkbox" value="02">
        <button name="mainJob" id="mainJob1" onclick="f_requestJobSubList('02', 'mainJob1', 'subJob')" type="button"><span>경영·사무·금융·보험</span></button></span>
        <input name="firstJobName" id="firstJobName02" type="hidden" value="경영·사무·금융·보험">
        <input id="mainJob1Nm" type="hidden" value="경영·사무·금융·보험">

        <span><input name="firstJobName" title="교육·연구·법률 추가" id="firstJobName2" onclick="f_checkJob(this,2);" type="checkbox" value="03">
        <button name="mainJob" id="mainJob2" onclick="f_requestJobSubList('03', 'mainJob2', 'subJob')" type="button"><span>교육·연구·법률</span></button></span>
        <input name="firstJobName" id="firstJobName03" type="hidden" value="교육·연구·법률">
        <input id="mainJob2Nm" type="hidden" value="교육·연구·법률">

        <span><input name="firstJobName" title="의료·보건·사회복지 추가" id="firstJobName3" onclick="f_checkJob(this,3);" type="checkbox" value="04">
        <button name="mainJob" id="mainJob3" onclick="f_requestJobSubList('04', 'mainJob3', 'subJob')" type="button"><span>의료·보건·사회복지</span></button></span>
        <input name="firstJobName" id="firstJobName04" type="hidden" value="의료·보건·사회복지">
        <input id="mainJob3Nm" type="hidden" value="의료·보건·사회복지">

        <span><input name="firstJobName" title="문화·예술·신문방송·디자인·캐드 추가" id="firstJobName4" onclick="f_checkJob(this,4);" type="checkbox" value="05">
        <button name="mainJob" id="mainJob4" onclick="f_requestJobSubList('05', 'mainJob4', 'subJob')" type="button"><span>문화·예술·신문방송·디자인·캐드</span></button></span>
        <input name="firstJobName" id="firstJobName05" type="hidden" value="문화·예술·신문방송·디자인·캐드">
        <input id="mainJob4Nm" type="hidden" value="문화·예술·신문방송·디자인·캐드">

        <span><input name="firstJobName" title="영업·판매·TM·고객상담 추가" id="firstJobName5" onclick="f_checkJob(this,5);" type="checkbox" value="06">
        <button name="mainJob" id="mainJob5" onclick="f_requestJobSubList('06', 'mainJob5', 'subJob')" type="button"><span>영업·판매·TM·고객상담</span></button></span>
        <input name="firstJobName" id="firstJobName06" type="hidden" value="영업·판매·TM·고객상담">
        <input id="mainJob5Nm" type="hidden" value="영업·판매·TM·고객상담">

        <span><input name="firstJobName" title="미용·여행·숙박·오락·스포츠·음식·경비청소 추가" id="firstJobName6" onclick="f_checkJob(this,6);" type="checkbox" value="07">
        <button name="mainJob" id="mainJob6" onclick="f_requestJobSubList('07', 'mainJob6', 'subJob')" type="button"><span>미용·여행·숙박·오락·스포츠·음식·경비청소</span></button></span>
        <input name="firstJobName" id="firstJobName07" type="hidden" value="미용·여행·숙박·오락·스포츠·음식·경비청소">
        <input id="mainJob6Nm" type="hidden" value="미용·여행·숙박·오락·스포츠·음식·경비청소">

        <span><input name="firstJobName" title="무역·물류·운전·운송 추가" id="firstJobName7" onclick="f_checkJob(this,7);" type="checkbox" value="08">
        <button name="mainJob" id="mainJob7" onclick="f_requestJobSubList('08', 'mainJob7', 'subJob')" type="button"><span>무역·물류·운전·운송</span></button></span>
        <input name="firstJobName" id="firstJobName08" type="hidden" value="무역·물류·운전·운송">
        <input id="mainJob7Nm" type="hidden" value="무역·물류·운전·운송">

        <span><input name="firstJobName" title="건설·건축·토목·환경·에너지·산업안전 추가" id="firstJobName8" onclick="f_checkJob(this,8);" type="checkbox" value="09">
        <button name="mainJob" id="mainJob8" onclick="f_requestJobSubList('09', 'mainJob8', 'subJob')" type="button"><span>건설·건축·토목·환경·에너지·산업안전</span></button></span>
        <input name="firstJobName" id="firstJobName09" type="hidden" value="건설·건축·토목·환경·에너지·산업안전">
        <input id="mainJob8Nm" type="hidden" value="건설·건축·토목·환경·에너지·산업안전">

        <span><input name="firstJobName" title="기계·금속·재료 추가" id="firstJobName9" onclick="f_checkJob(this,9);" type="checkbox" value="10">
        <button name="mainJob" id="mainJob9" onclick="f_requestJobSubList('10', 'mainJob9', 'subJob')" type="button"><span>기계·금속·재료</span></button></span>
        <input name="firstJobName" id="firstJobName10" type="hidden" value="기계·금속·재료">
        <input id="mainJob9Nm" type="hidden" value="기계·금속·재료">

        <span><input name="firstJobName" title="전기·전자 추가" id="firstJobName10" onclick="f_checkJob(this,10);" type="checkbox" value="11">
        <button name="mainJob" id="mainJob10" onclick="f_requestJobSubList('11', 'mainJob10', 'subJob')" type="button"><span>전기·전자</span></button></span>
        <input name="firstJobName" id="firstJobName11" type="hidden" value="전기·전자">
        <input id="mainJob10Nm" type="hidden" value="전기·전자">

        <span><input name="firstJobName" title="화학·섬유·식품 추가" id="firstJobName11" onclick="f_checkJob(this,11);" type="checkbox" value="12">
        <button name="mainJob" id="mainJob11" onclick="f_requestJobSubList('12', 'mainJob11', 'subJob')" type="button"><span>화학·섬유·식품</span></button></span>
        <input name="firstJobName" id="firstJobName12" type="hidden" value="화학·섬유·식품">
        <input id="mainJob11Nm" type="hidden" value="화학·섬유·식품">

        <span><input name="firstJobName" title="IT·정보통신·웹 추가" id="firstJobName12" onclick="f_checkJob(this,12);" type="checkbox" value="13">
        <button name="mainJob" id="mainJob12" onclick="f_requestJobSubList('13', 'mainJob12', 'subJob')" type="button"><span>IT·정보통신·웹</span></button></span>
        <input name="firstJobName" id="firstJobName13" type="hidden" value="IT·정보통신·웹">
        <input id="mainJob12Nm" type="hidden" value="IT·정보통신·웹">

        <span><input name="firstJobName" title="인쇄·목재·가구·종이·공예·상하수·재활용·농림어업·군인 추가" id="firstJobName13" onclick="f_checkJob(this,13);" type="checkbox" value="14">
        <button name="mainJob" id="mainJob13" onclick="f_requestJobSubList('14', 'mainJob13', 'subJob')" type="button"><span>인쇄·목재·가구·종이·공예·상하수·재활용·농림어업·군인</span></button></span>
        <input name="firstJobName" id="firstJobName14" type="hidden" value="인쇄·목재·가구·종이·공예·상하수·재활용·농림어업·군인">
        <input id="mainJob13Nm" type="hidden" value="인쇄·목재·가구·종이·공예·상하수·재활용·농림어업·군인">

        <span><input name="firstJobName" title="생산직·단순노무·경비·청소 추가" id="firstJobName14" onclick="f_checkJob(this,14);" type="checkbox" value="15">
        <button name="mainJob" id="mainJob14" onclick="f_requestJobSubList('15', 'mainJob14', 'subJob')" type="button"><span>생산직·단순노무·경비·청소</span></button></span>
        <input name="firstJobName" id="firstJobName15" type="hidden" value="생산직·단순노무·경비·청소">
        <input id="mainJob14Nm" type="hidden" value="생산직·단순노무·경비·청소">

    </div>
    <!-- //변경없음 -->
  </div>
  <!-- 이미지 삭제 <img src="http://www.work.go.kr/images/common/next_step.gif" class="next" alt="다음단계"> -->
  <div class="category">

    <!-- 변경없음 -->
    <h3>2차 분류</h3>
    <div class="multyCheck" id="subJobDiv">
    </div>
    <!-- //변경없음 -->
  </div>

  <!-- 이미지 삭제 <img src="http://www.work.go.kr/images/common/next_step.gif" class="next" alt="다음단계"> -->
  <div class="category jobly">
    <!-- 변경없음 -->
    <h3>3차 분류</h3>
    <div id="thirdJobDiv">
    </div>
    <!-- //변경없음 -->
  </div>
</div>
<!--  class="choice_wrap new mt20 mb10" 변경& 그 외 변경 없음 -->
<div class="choice_wrap new mt20 mb10">
  <div class="choice_inner">
    <p class="selected" id="selectedId">
      <strong>선택직종 :</strong> 선택하신 직종이 없습니다.
    </p>
  </div><!-- end choice_inner -->
</div>
<div class="btn">
  <a onclick="f_resultJob();return false;" href="#"><img alt="적용하기" src="http://www.work.go.kr/images/common/btn/btn_apply04.gif"></a>
   <button class="layer-close" onclick="javascript:f_popupClose();" type="button">닫기</button>
</div>
</div>

    