<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../main/inc/top.jsp" %>
  <c:if test="${!empty param.searchKeyword}">
			<p>
				검색어 : ${param.searchKeyword}, ${pagingInfo.totalRecord}건 검색되었습니다.
			</p>
		</c:if>
<style type="text/css">
.divSearch {
    width: 700px;
    margin: 0 auto;
}	 
</style>
<div class="divSearch"> 
	<!-- 페이징 처리에도 사용 -->
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/peopleinfo/peopleinfolist.do"/>'>
   		<!-- 현재 페이지 hidden에 넣기 -->  
   		<input type="hidden" name='currentPage' value="1" >
		<input type="submit" class="btn btn-primary" value="검색">
		 <label>경력</label><br>
<label><input type="checkbox" id="workcheck" name="workcheck" value="경력">경력</label>
<label><input type="checkbox" id="workcheck" name="workcheck" value="신입">신입</label><br>
 <ul class="wrap_list_value column_two">
                <li><label class="frm_chkbox01" for="career-years01"><input type="checkbox" id="career-years01" name="term01" title="1년 미만" value=",1"><span>1년 <em class="ico_under">이하</em></span></label></li>
                <li><label class="frm_chkbox01" for="career-years02"><input type="checkbox" id="career-years02" name="term02" title="1~3년" value="1,4"><span>1~3년</span></label></li>
                <li><label class="frm_chkbox01" for="career-years03"><input type="checkbox" id="career-years03" name="term03" title="3~5년" value="3,6"><span>3~5년</span></label></li>
                <li><label class="frm_chkbox01" for="career-years04"><input type="checkbox" id="career-years04" name="term04" title="5~10년" value="5,11"><span>5~10년</span></label></li>
                <li><label class="frm_chkbox01" for="career-years05"><input type="checkbox" id="career-years05" name="term05" title="10~15년" value="10,16"><span>10~15년</span></label></li>
                <li><label class="frm_chkbox01" for="career-years06"><input type="checkbox" id="career-years06" name="term06" title="15년 이상" value="15,"><span>15년 <em class="ico_over">이상</em></span></label></li>
            </ul>
             <div class="wrap_detail_panel age_interval" id="gender-age">
        <div class="title_detail_box"><strong>성별·나이</strong></div>
        <div class="box_detail_panel">
            <strong class="title_basic_sub">성별</strong>
            <label class="form_sp frm_chk02" for="male01"><input type="checkbox" id="male01" value="male"><span>남</span></label><label class="form_sp frm_chk02" for="female01"><input type="checkbox" id="female01" value="female"><span>여</span></label>
            <ul class="wrap_list_value column_two">
                <li><label class="frm_chkbox01" for="age-interval01"><input type="checkbox" id="age-interval01" value=",20"><span>20세 <em class="ico_under">이하</em></span></span></label></li>
                <li><label class="frm_chkbox01" for="age-interval02"><input type="checkbox" id="age-interval02" value="21,30"><span>21~30세</span></label></li>
                <li><label class="frm_chkbox01" for="age-interval03"><input type="checkbox" id="age-interval03" value="31,35"><span>31~35세</span></label></li>
                <li><label class="frm_chkbox01" for="age-interval04"><input type="checkbox" id="age-interval04" value="36,40"><span>36~40세</span></label></li>
                <li><label class="frm_chkbox01" for="age-interval05"><input type="checkbox" id="age-interval05" value="41,50"><span>41~50세</span></label></li>
                <li><label class="frm_chkbox01" for="age-interval06"><input type="checkbox" id="age-interval06" value="51,"><span>51세 <em class="ico_over">이상</em></span></label></li>
            </ul>
               <div class="wrap_detail_panel edu_last" id="basic-search-edu-part">
        <div class="title_detail_box"><strong>최종학력</strong></div>
        <div class="box_detail_panel">
            <ul class="wrap_list_value">
                                    <li><label class="frm_chkbox01" for="basic-search-final-edu0"><input type="checkbox" id="basic-search-final-edu0" value="12" ><span>대학교 4년 <em>(216,858)</em></span></label></li>
                                    <li><label class="frm_chkbox01" for="basic-search-final-edu1"><input type="checkbox" id="basic-search-final-edu1" value="11" ><span>대학교 2,3년 <em>(138,198)</em></span></label></li>
                                    <li><label class="frm_chkbox01" for="basic-search-final-edu2"><input type="checkbox" id="basic-search-final-edu2" value="13" ><span>대학원 석/박사 <em>(27,979)</em></span></label></li>
                                    <li><label class="frm_chkbox01" for="basic-search-final-edu3"><input type="checkbox" id="basic-search-final-edu3" value="10" ><span>고등학교 이하 <em>(151,481)</em></span></label></li>
                            </ul>
            <div class="box_option_check">
                <label class="edu-part" for="basic-search-local01">
                    <input type="checkbox" id="basic-search-local01" value="1" >
                    <span>국내</span>
                </label>
                <label class="edu-part" for="basic-search-abroad01">
                    <input type="checkbox" id="basic-search-abroad01" value="2" >
                    <span>해외</span>
                </label>
                <label class="type_block" for="basic-search-edu-status">
                    <input type="checkbox" id="basic-search-edu-status" >
                    <span>재학·휴학·수료·중퇴·자퇴 제외</span>
                </label>
            </div>
        </div>
    </div>
    <div class="wrap_detail_panel area_domestic">
        <div class="title_detail_box"><strong>희망 근무지역</strong></div>
        <div class="box_detail_panel">
            <ul class="wrap_list_value" id="basic-search-location">
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-101000">
                            <input type="checkbox" id="area-domestic-101000" data-name="서울" value="101000" >
                            <span>서울 <em>(216,042)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-102000">
                            <input type="checkbox" id="area-domestic-102000" data-name="경기" value="102000" >
                            <span>경기 <em>(182,643)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-103000">
                            <input type="checkbox" id="area-domestic-103000" data-name="광주" value="103000" >
                            <span>광주 <em>(13,391)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-104000">
                            <input type="checkbox" id="area-domestic-104000" data-name="대구" value="104000" >
                            <span>대구 <em>(35,883)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-105000">
                            <input type="checkbox" id="area-domestic-105000" data-name="대전" value="105000" >
                            <span>대전 <em>(26,640)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-106000">
                            <input type="checkbox" id="area-domestic-106000" data-name="부산" value="106000" >
                            <span>부산 <em>(59,684)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-107000">
                            <input type="checkbox" id="area-domestic-107000" data-name="울산" value="107000" >
                            <span>울산 <em>(22,242)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-108000">
                            <input type="checkbox" id="area-domestic-108000" data-name="인천" value="108000" >
                            <span>인천 <em>(50,877)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-109000">
                            <input type="checkbox" id="area-domestic-109000" data-name="강원" value="109000" >
                            <span>강원 <em>(9,087)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-110000">
                            <input type="checkbox" id="area-domestic-110000" data-name="경남" value="110000" >
                            <span>경남 <em>(41,949)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-111000">
                            <input type="checkbox" id="area-domestic-111000" data-name="경북" value="111000" >
                            <span>경북 <em>(27,918)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-112000">
                            <input type="checkbox" id="area-domestic-112000" data-name="전남" value="112000" >
                            <span>전남 <em>(9,195)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-113000">
                            <input type="checkbox" id="area-domestic-113000" data-name="전북" value="113000" >
                            <span>전북 <em>(12,541)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-114000">
                            <input type="checkbox" id="area-domestic-114000" data-name="충북" value="114000" >
                            <span>충북 <em>(24,155)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-115000">
                            <input type="checkbox" id="area-domestic-115000" data-name="충남" value="115000" >
                            <span>충남 <em>(30,343)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-116000">
                            <input type="checkbox" id="area-domestic-116000" data-name="제주" value="116000" >
                            <span>제주 <em>(5,417)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-118000">
                            <input type="checkbox" id="area-domestic-118000" data-name="세종" value="118000" >
                            <span>세종 <em>(6,503)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-117000">
                            <input type="checkbox" id="area-domestic-117000" data-name="전국" value="117000" >
                            <span>전국 <em>(30,092)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-210000">
                            <input type="checkbox" id="area-domestic-210000" data-name="아시아·중동" value="210000" >
                            <span>아시아·중동 <em>(12,016)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-211200">
                            <input type="checkbox" id="area-domestic-211200" data-name="일본" value="211200" >
                            <span>일본 <em>(1,798)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-211300">
                            <input type="checkbox" id="area-domestic-211300" data-name="중국.홍콩" value="211300" >
                            <span>중국.홍콩 <em>(3,501)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-220000">
                            <input type="checkbox" id="area-domestic-220000" data-name="북·중미" value="220000" >
                            <span>북·중미 <em>(3,020)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-220200">
                            <input type="checkbox" id="area-domestic-220200" data-name="미국" value="220200" >
                            <span>미국 <em>(1,293)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-230000">
                            <input type="checkbox" id="area-domestic-230000" data-name="남미" value="230000" >
                            <span>남미 <em>(430)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-240000">
                            <input type="checkbox" id="area-domestic-240000" data-name="유럽" value="240000" >
                            <span>유럽 <em>(2,362)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-250000">
                            <input type="checkbox" id="area-domestic-250000" data-name="오세아니아" value="250000" >
                            <span>오세아니아 <em>(583)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-260000">
                            <input type="checkbox" id="area-domestic-260000" data-name="아프리카" value="260000" >
                            <span>아프리카 <em>(348)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-270000">
                            <input type="checkbox" id="area-domestic-270000" data-name="남극대륙" value="270000" >
                            <span>남극대륙 <em>(33)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-280000">
                            <input type="checkbox" id="area-domestic-280000" data-name="기타해외" value="280000" >
                            <span>기타해외 <em>(3,095)</em></span>
                        </label>
                    </li>
                            </ul>
        </div>
    </div>
		</form>
		<c:import url="../resume/occupation.jsp"/>
		</div>
			
		<%@include file="../main/inc/bottom.jsp" %>