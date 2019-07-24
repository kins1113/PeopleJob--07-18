<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/manager/inc/adminTop.jsp"%>

<style type="text/css">
a{color: black;}
#pageDiv {width: 30%;}
.serDiv {float: right;margin-top: 9px;}
input.form-control {	margin-top: 4px;}
input.btn.btn-secondary.btn-default {margin-top: 4px;}
#boardTable {font-size: 1.0em;}
#cardBoduPostList {margin: 0 5px 5px 5px;padding: 0 5px 5px 5px;}
#btGroup {margin-right: 20px;}
#pageSize {	float: left;margin-left: 20px;margin-top: 9px;}
#startDay, #endDay{width: 120px;}
#btGroup button{margin-top: 4px;}
div#searchDiv {overflow: hidden;margin: 20px auto 0 auto;padding-top: 23px;border: 1.6px solid;
				width: 97.5%;background: #f5f6fa;}
div#searchDtDiv{background: white;width: 95.5%;    margin: 0 auto;}
div#searchGrDiv{margin-right: 26%;}
input[name=searchKeyword]{width: 400px;margin-right: 3px;}
#searchDtDiv table th{width: 70px;padding: 5px;border: 1px solid silver;}
#searchDtDiv table tr{border-bottom: 0.1px solid #dbdce0eb;}
#searchDtDiv table tr:nth-last-of-type(2) td:nth-last-of-type(1) {width: 27%}
#searchDtDiv table tr:nth-last-of-type(2) td:nth-last-of-type(2) {width: 12%}
#searchDtDiv table tr:nth-last-of-type(2) td:nth-last-of-type(3) {width: 42%}
#searchDtDiv table tr:nth-last-of-type(3) td{width: 32%}
#searchDtDiv table {border: 2px solid #4c84ff9e;width:100%;}
#dateSearchShow input{height: 33px;padding: 0 9px 0 5px;font-size: 13px;}
.dateSearchShow{float: left;margin-left: 5px;}
.FST{height: 33px;padding: 0 9px 0 5px;font-size: 13px;}
.float{float: left;}
.genderShow{width: 85px;margin: 10px 0 10px 5px;float: left;}
.labelFont{width: 160px;}
</style>
<script type="text/javascript">
	$(document).ready(function (){
		//맨위에 체크박스 누르면 전체 선택
		$("#memberCkAll").click(function(){
			$("input[name=memberCk]").prop("checked",this.checked)
		});
		$("#pageSize select[name=recordCountPerPage]").change(function(){
			$("form[name=postList]").submit();
		});
		
		//상세보기 누르면 searchDtDiv 보여주기
		$("#searchDtDiv").hide();
		$("#postSearchDtCg").hide();
		$("#postSearchDt").click(function(){
			$("#searchDtDiv").show();
			$("#postSearchDtCg").show();
			$(this).hide();
		});
		$("#postSearchDtCg").click(function(){
			$("#searchDtDiv").hide();
			$("#postSearchDt").show();
			$(this).hide();
			
		});
		
		//1차 직종 가져오기 /manager/occupantion/firstList.do
		selectFirst();
		
		
	});
	
	function selectFirst(){
		$.ajax({
			url:"<c:url value='/manager/occupantion/firstList.do'/>",
			type:"post",
			success:function(res){
 				settingFirst(res);
			},
			error:function(xhr, status, error){
				alert(status+":"+error);
			}
		})
	}
	
	//[{"firstCode":1,"firstname":"경영·사무"},{"firstCode":2,"firstname":"영업·고객상담"},{"firstCode":3,"firstname":"생산·제조"},
	//{"firstCode":4,"firstname":"IT·인터넷"},{"firstCode":5,"firstname":"전문직"},{"firstCode":6,"firstname":"교육"}
	function settingFirst(res){
			$.each(res,function(idx,item){
				//alert(idx+"인 것의 이름 = "+item.firstname+", 코드는 ="+item.firstCode);
				var opEl=$("<option value="+item.firstCode+"></option>");
				opEl.append(item.firstname);
				$("#selectFirst").append(opEl); //최종으로 여기에 넣음
			})
	}
	
	//페이지 처리 함수
	function pageFunc(curPage){
		$("input[name=currentPage]").val(curPage);
		$("form[name=memberList]").attr("action","<c:url value='/manager/member/memberList.do?authorityCk=member'/>");
		$("form[name=memberList]").submit();
	}
	
</script>
<form name="memberList" method="post" 
		 enctype="multipart/form-data" >
<!-- 페이지 처리를 위한 hidden  -->
<input type="hidden" name="currentPage"
	<c:if test="${param.currentPage!=null }">
	 	value="${param.currentPage }"
	</c:if>
	<c:if test="${param.currentPage==null }">
		value='1';
	</c:if>
 >
 
<!-- 회사인지 일반인지 구분하기 위한 hidden -->
<input type="hidden" name="authorityCk" value="${param.authorityCk }">
<!-- 필터링을 위한 hidden -->
<input type="hidden" name="filterCode" value="${param.filterCode }">
<input type="hidden" name="filterKey" value="${param.filterKey}">

<!-- 삭제 수정 처리를 위한 hidden -->
<input type="hidden" name="deletecheck" value="N">
<input type="hidden" name="boardCode2" value="0">
<div class="row">
	<div class="col-lg-12">
		<div class="card card-default">
			<div class="card-header card-header-border-bottom">
				<h2>이력서 관리</h2>
			</div>
			<!-- 해더 부분 버튼 그룹 시작  -->
			<div>
				<div id="searchDiv" align="absmiddle">
				
				
					<div id="searchDtDiv">
						<table>
							<tr>
								<th>등록일</th>
								<td id="dateSearchShow" colspan="5">
										<div class="incDate dateSearchShow" id="endDay">
											 <c:import url="../../inc/date.jsp">
												<c:param name="name" value="endDay"></c:param>
												<c:param name="id" value="workdate2"></c:param>
											</c:import> 				
										</div>
										<div class="dateSearchShow">
											<br><b> ~ </b>
										</div>
										<div class="incDate dateSearchShow" id="startDay">
											 <c:import url="../../inc/date.jsp">
												<c:param name="name" value="startDay"></c:param>
												<c:param name="id" value="workdate1"></c:param>
											</c:import>				
										</div>
										<div class="dateSearchShow">
											<input type="submit" class="btn btn-secondary btn-default" id="postSearch"value="오늘">
											<input type="submit" class="btn btn-secondary btn-default" id="postSearch"value="이번주">
											<input type="submit" class="btn btn-secondary btn-default" id="postSearch"value="이번달">
											<input type="submit" class="btn btn-secondary btn-default" id="postSearch"value="1주일">
											<input type="submit" class="btn btn-secondary btn-default" id="postSearch"value="15일">
											<input type="submit" class="btn btn-secondary btn-default" id="postSearch"value="1개월">
											<input type="submit" class="btn btn-secondary btn-default" id="postSearch"value="3개월">
											<input type="submit" class="btn btn-secondary btn-default" id="postSearch"value="9개월">
										</div>
								</td>
							</tr>
							<tr>
								<th>직종</th>
								<td colspan="3">
									<select class="custom-select my-1 FST" id="selectFirst">
										<option>1차 직종</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST">
										<option>2차 직종</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST">
										<option>3차 직종</option>
									</select>
								</td>
								<th>지역</th>
								<td>
									<select class="custom-select my-1 mr-sm-2 FST">
										<option>시/도</option>
									</select>
									<select class="custom-select my-1 mr-sm-2 FST">
										<option>구/군</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>경력</th>
								<td>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>신입
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>1~3년
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>3~5년
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>5~10년
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>10년이상
									</label>
								</td>
								<th>성별</th>
								<td>
									<label class="control control-checkbox checkbox-primary genderShow">
										<input type="checkbox" name="memberGender" id="memberGenderG" />
										<div class="control-indicator float"></div>여자
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>남자
									</label>
								</td>
								<th>연령</th>
								<td>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>20대
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>30대
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>40대
									</label>
									<label class="control control-checkbox checkbox-primary genderShow">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>50이상
									</label>
								</td>
							</tr>
							<tr>
								<th>최종학력</th>
								<td colspan="5">
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>학력무관
									</label>
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>초등학교 졸업
									</label>
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>중학교 졸업
									</label>
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>고등학교 졸업
									</label>
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>대학교(2,3년재) 졸업
									</label>
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>대학교(4년재) 졸업
									</label>
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float"></div>대학교 석사
									</label>
									<label class="control control-checkbox checkbox-primary genderShow labelFont">
											<input type="checkbox" name="memberGender" id="memberGenderM" />
											<div class="control-indicator float "></div>대학교 박사
									</label>
									
								</td>
							</tr>
						</table>			
					</div>
				
				
				<div id="searchGrDiv">
						<div class="form-group serDiv">
							<input type="button" class="btn btn-secondary btn-default" id="postSearchDt"value="상세검색">&nbsp;
							<input type="button" class="btn btn-secondary btn-default" id="postSearchDtCg"value="간편검색">&nbsp;
						</div>
						<div class="form-group serDiv">
							<input type="submit" class="btn btn-secondary btn-default" id="postSearch"value="검색">&nbsp;
						</div>
						<div class="form-group serDiv">
							<input type="text" class="form-control" placeholder="검색어"
								name="searchKeyword" value="${param.searchKeyword }">&nbsp;
						</div>
						<div class="form-group serDiv">
							<select class="custom-select my-1 mr-sm-2" name="searchCondition">
								<option value="all">통합검색</option>
								<option value="memberid"
									<c:if test="${param.searchCondition=='memberid' }">
									selected="selected"
									</c:if>>아이디
								</option>
								<option value="membername"
									<c:if test="${param.searchCondition=='membername' }">
									selected="selected"
									</c:if>>이름
								</option>
								<option value="address,addressdetail"
									<c:if test="${param.searchCondition=='address,addressdetail' }">
									selected="selected"
								</c:if>>주소
								</option>
								<option value="tel"
									<c:if test="${param.key=='tel' }">
									selected="selected"
								</c:if>>번호</option>
								<option value="email"
									<c:if test="${param.key=='email' }">
									selected="selected"
								</c:if>>메일</option>
							</select>
						</div>
					</div>
				</div>
				<div align="right" class="form-group serDiv" id="btGroup">
					<input type="button" class="btn btn-secondary btn-default" id="btMultMail" value="선택 삭제">
					<input type="button"class="btn btn-secondary btn-default" id="" value="이력서 등록"> 
				</div>
				<div class="form-group" id='pageSize'>
					<select class="custom-select my-1 mr-sm-2" name="recordCountPerPage">
						<option value="10"
							<c:if test="${param.recordCountPerPage==10 }">
								selected="selected"
							</c:if>>10개씩
						</option>
						<option value="20"
							<c:if test="${param.recordCountPerPage==20 }">
								selected="selected"
							</c:if>>20개씩
						</option>
						<option value="30"
							<c:if test="${param.recordCountPerPage==30 }">
								selected="selected"
							</c:if>>30개씩
						</option>
						<option value="50"
							<c:if test="${param.recordCountPerPage==50 }">
								selected="selected"
							</c:if>>50개씩
						</option>
					</select>
				</div>
			</div>
			<!-- 해더 부분 버튼 그룹 끝 -->
			<div class="card-body" id="cardBoduPostList">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th><label class="control control-checkbox checkbox-primary">
									<input type="checkbox" name="memberCkAll" id="memberCkAll" />
									<div class="control-indicator"></div>
							</label></th>
							<th scope="col"><a href="#" class="fileterCode" id="member_Code">회원코드</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="member_Code">이름/성별/나이/아이디</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="birth">이력서</a></th>
							<th scope="col"><a href="#" class="fileterCode" id="membergender">편집</a></th>
						</tr>
					</thead>
					<tbody>
					<!--  반복 시작  -->
					<c:if test="${empty list }">
						<td colspan="11" align="center">만족하는 사용자가 없습니다....</td>
					</c:if>
					<c:if test="${!empty list }">
						<c:forEach var="memberVo" items="${list}">
							<tr>
								<td>
									<label class="control control-checkbox checkbox-primary">
											<input type="checkbox" name="memberCk" id="memberCk" value="${memberVo.email}" />
											<div class="control-indicator"></div>
									</label>
								</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- 반복 끝 -->
					</tbody>
				</table>
				<div class="divPage" align="center">
					<!-- 이전블럭으로 이동하기 -->
					<c:if test="${pagingInfo.firstPage>1 }">
						<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> <img
							src="<c:url value='/resources/images/first.JPG'/>"
							alt="이전블럭으로 이동">
						</a>
					</c:if>
					<!-- 페이지 번호 추가 -->
					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage }"
						end="${pagingInfo.lastPage }">
						<c:if test="${i==pagingInfo.currentPage }">
							<span style="color: blue; font-size: 1em">${i }</span>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<a href="#" onclick="pageFunc(${i})">[${i}]</a>
						</c:if>
					</c:forEach>
					<!--  페이지 번호 끝 -->

					<!-- 다음 블럭으로 이동하기 -->
					<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
						<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> <img
							src="<c:url value='/resources/images/last.JPG'/>"
							alt="다음블럭으로 이동">
						</a>
					</c:if>
				</div>
				<div class="divSearch"></div>
			</div>
		</div>
		</div></div>
</form>




<%@include file="/WEB-INF/views/manager/inc/adminBottom.jsp"%>	