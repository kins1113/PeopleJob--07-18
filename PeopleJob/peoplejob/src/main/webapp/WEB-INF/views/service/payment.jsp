<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../main/inc/top.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/payment.css'/>" />
<style type="text/css">
table.table.table-bordered {
    font-size: 1.5em;
    text-align: center;
    border:1px solid black;
}
input[type="submit"] {
float: right;
font-size: 2em;
width: 100px;
padding: 5px;  
  background-color: coral;
  color:white;
  }
</style>
<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>

<!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script type="text/javascript">
  $(function(){
	  
	  $('#hideList').click(function(){
			$('#cardBoduPostList').hide();
	  });
	  
	  function check(){
		var length=  $('.check:checked').length;
		$('#chklength').text(length);
	  }
	  check();
	  
	  $('.check').click(check);
	  
		  
	  $('button[name=pay]').click(function(){
		  $('input[type=checkbox]:checked').each(function(){
				  $(this).prop("checked",false);
		  });
			  
		  
		  
		  $('#cardBoduPostList').hide();
		  
		  if(${sessionScope.memberid==null}){   
			  alert('로그인을 해주세요');
			  location.href="<c:url value='/login/login.do'/>";
		  }else{ //로그인을 했을 때  
			  if(${sessionScope.author_code!=3}){
				  if(${sessionScope.author_code==2}){
				 	 alert('기업회원 승인을 받은 후 서비스 이용가능합니다.');
					   
				  }else if(${sessionScope.author_code==1}){
				 	 alert('기업회원만 이용가능한 상품입니다.');
				  }     
			  }else if(${sessionScope.author_code==3 && fn:length(list)>=1}){ //승인받은 기업회원 일 때 
				  $('#cardBoduPostList').hide();
			  	$('#cardBoduPostList').show();
			  
			  }else if(${sessionScope.author_code==3 && fn:length(list)<1}){   
				  alert('등록된 채용공고가 없습니다. 채용공고를 먼저 등록해주세요');
				  location.href="<c:url value='/company/jobopening_register.do'/>";  
			  }
		  }//로그인해서 아이디 있을 때
		  
		 
	  });//pay1
  
 
	  /* var cnt=0;
	  $(".check").change(function(){
		  if($(".check").is(":checked")){
			  cnt++;
		  }else {
			  cnt--;
		  }
	  	$('#chklength').text(cnt);
	  }); */
	  
	  $("#frmList").submit(function(){ 
		  if($('input[type=checkbox]:checked').length<1){
				alert('결제할 채용공고를 먼저 선택하세요');
				event.preventDefault();
				return;
			}else if($('#agree:checked').length<1){
				alert('개인정보 수집 및 이용에 동의해 주십시오.');
				$('#agree').focus();
				event.preventDefault();
				return false;
				
			} else{ 
				//$('form[name=frmList]').prop('action','<c:url value="/service/payList.do"/>');
				//$('form[name=frmList]').submit();
				
			        var jobno = new Array(); // 배열 선언
			 
			        $('.check:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
			            jobno.push(this.value);
			        });
				
				var param=$("#frmList").serialize();
				var length=  $('.check:checked').length;
				$.ajax({
					url : "<c:url value='/service/ajaxpayList.do'/>",
					type : "POST",
					//cache: false,
					traditional : true,
					data : param,
					dataType:"json",
					//async: false,
					success : function(res) {
						 if(res){
							if(confirm(length+'개 채용광고를 결제하시겠습니까?')){
							
								var IMP = window.IMP; // 생략가능
								  IMP.init("imp49241177"); 
								  
								  IMP.request_pay({
									  	pg : 'inicis', // version 1.1.0부터 지원.
									    pay_method : 'card',
									    merchant_uid : 'peoplejob_' + new Date().getTime(),
									    name : 'PEOPLEJOB 채용공고 vvip관',
									    amount : 10*length,
									    buyer_email : '${memberVo.email}',
									    buyer_name : '${sessionScope.memberName}',
									    buyer_tel : '${memberVo.tel}',
									    buyer_addr : '${companyVo.companyAddress}',
									    buyer_postcode : '${companyVo.companyZipcode}',
									    m_redirect_url : '<c:url value="/service/payment.do"/>' //모바일 결제 후 이동될 주소
									}, function(rsp) {
									    if ( rsp.success ) {
									        var msg = '결제가 완료되었습니다.\n';
									        msg+='결제일로부터 30일간 이용가능합니다.\n';
									        msg += '고유ID : ' + rsp.imp_uid;
									        msg += '상점 거래ID : ' + rsp.merchant_uid;
									        msg += '결제 금액 : ' + rsp.paid_amount+'원';
									        msg += '카드 승인번호 : ' + rsp.apply_num;
									        
									        $('#frmList').prop('action','<c:url value="/service/paysuccess.do"/>');
											$('#frmList').submit();
									        //location.href="<c:url value='/service/success.do?jobno="+jobno+"'/>";
									    } else {
									        var msg = '결제에 실패하였습니다.';
									        msg += ' : ' + rsp.error_msg;
									    }
									    alert(msg);
									    
									}); 
							}
						 }else{
							alert('이미 결제완료한 채용공고 상품입니다.');
							event.preventDefault();
						} 

					},
					error : function(xhr, status, error) {
						alert(status + ":" + error);
					}
				});
				
			}
		  event.preventDefault();
	  }); //submit 

	  
	  //전부 체크
	  $("#chkAll").click(function(){

			if($(this).is(":checked")){
				$(".check").prop("checked","checked");
				
			}else{
				$(".check").prop("checked",false);  
			}
	});
	  
	  var str = "";  // 여러개가 눌렸을 때 전부 출력이 될 수 있게 하나의 객체에 담는다.
		$(".check").each(function(){  
			if($(this).is(":checked"))  
				str += $(this).val() + " ";  // 체크된 객체를 str에 저장한다.
		$("#multiPrint").text(str);  // #multiPrint에 체크된 원소를 출력한다.
		});

  });
  
</script> 
<div class="container" style="margin-top: 30px; margin-bottom: 30px;min-height: 629px; ">

<div class="info" style="font-size: 1.7em;
    margin-top: 10px;
    margin-bottom: -25px;">
	PEOPLEJOB 첫 페이지 메인 상단에 노출되는 로고/배너 광고 상품입니다.<br>
	업계 최대 로고사이즈 및 다양한 옵션으로 최상의 주목도 및 노출 효과를 보장합니다.
</div>
    <div class="row" style="    margin-top: 50px;">
        <div class="col-12 col-md-6 col-lg-3">
            <div class="card text-center p-table p-red">
                <div class="card-header">
                    <h3 class="p-name p-name">VVIP</h3>
                    <h4 class="p-price">1,000,000원 </h4>
                    <small class="text-muted">매월</small>
                </div>
                <div class="card-body">

                    <ul class="list-unstyled"> 
                        <li>메인 채용정보 VVIP</li>
                        <li>노출위치 : VVIP채용관</li>
                        <li>부가서비스 : 채용관 상단고정</li>
                        <li>PC웹: VVIP채용관</li>
                        <li>모바일 : 모바일 홈 VVIP</li>
                        <li>매월1일</li>
                    </ul>
                    <button type="button" class="btn btn-lg btn-primary" id="pay" title="vvip" name="pay">신청하기</button>
                </div>
            </div>
        </div>

        <div class="col-12 col-md-6 col-lg-3">
            <div class="card text-center p-table p-green">
                <div class="card-header">
                    <h3 class="p-name p-name">VIP</h3>
                    <h4 class="p-price">700,000원 </h4>
                    <small class="text-muted">매월</small> 
                </div>
                <div class="card-body">

                    <ul class="list-unstyled">
                        <li>메인 채용정보 VVIP</li>
                        <li>노출위치 : VVIP채용관</li>
                        <li>부가서비스 : 채용관 상단고정</li>
                        <li>PC웹: VVIP채용관</li>
                        <li>모바일 : 모바일 홈 VVIP</li>
                        <li>매월1일</li>
                    </ul>
                    <button type="button" class="btn btn-lg btn-primary" id="pay" title="vip" name="pay">신청하기</button>
                </div>
            </div>
        </div>

        <div class="col-12 col-md-6 col-lg-3">
            <div class="card text-center p-table p-blue">
                <div class="card-header">
                     <h3 class="p-name p-name">Premium</h3>
                    <h4 class="p-price">500,000원 </h4>
                    <small class="text-muted">매월</small>
                </div>
                <div class="card-body">

                   <ul class="list-unstyled">
                        <li>메인 채용정보 VVIP</li>
                        <li>노출위치 : VVIP채용관</li>
                        <li>부가서비스 : 채용관 상단고정</li>
                        <li>PC웹: VVIP채용관</li>
                        <li>모바일 : 모바일 홈 VVIP</li>
                        <li>매월1일</li>
                    </ul>
                    <button type="button" class="btn btn-lg btn-primary" id="pay" title="premium" name="pay">신청하기</button>
                </div>
            </div>
        </div> 

        <div class="col-12 col-md-6 col-lg-3">
            <div class="card text-center p-table p-violet">
                <div class="card-header">
                     <h3 class="p-name p-name">Grand</h3>
                    <h4 class="p-price">300,000원 </h4>
                    <small class="text-muted">매월</small>
                </div>
                <div class="card-body">

                   <ul class="list-unstyled">
                        <li>메인 채용정보 VVIP</li>
                        <li>노출위치 : VVIP채용관</li>
                        <li>부가서비스 : 채용관 상단고정</li>
                        <li>PC웹: VVIP채용관</li>
                        <li>모바일 : 모바일 홈 VVIP</li>
                        <li>매월1일</li>
                    </ul>
                    <button type="button" class="btn btn-lg btn-primary" id="pay" title="grand" name="pay">신청하기</button>
                </div>
            </div>
        </div>
        
        <!-- 결제하기 버튼 누르면  -->
        <button value="▼" id="showList" style="display: none;"></button>
        <button value="▲"></button>
        <div class="card-body" id="cardBoduPostList" style="min-height: 300px; display: none; background-color: #26323824; "> 
        <span id="hideList" style="cursor: pointer;font-size:1.5em;" >채용공고 리스트 목록 닫기 ▲</span>
	<table class="table table-bordered" style="margin-top: 15px; ">
		<thead>
			<tr> 
				<th scope="col"><input type="checkbox" id="chkAll" style="margin: 0 auto;"></th>
				<th scope="col">번호</th>
				<th scope="col">채용공고 제목</th>
				<th scope="col">채용기간</th>
				
			</tr>
		</thead>
		<tbody>
			<!--  반복 시작  --> 
			<c:if test="${empty list }">
				<td colspan="10" align="center">결제하신 상품이 없습니다.</td>
			</c:if>
			
			<c:if test="${!empty list }">
			<c:set var="idx" value="0"/>
			<c:set var="no" value="1"/>
				
				<c:forEach var="jobopeningVo" items="${list }">
				<form id="frmList" method="post" name="frmList">
				
						<input type="hidden" value="${memberVo.memberCode }" name="memberCode">
						<input type="hidden" value="${serviceVo1.serviceCode }" name="serviceCode">
						<input type="hidden" value="${jobopeningVo.jobopening }" name="jobno" id="jobnoparam">
					<tr>
						<td align="center">
						<input type="checkbox" name="jobItems[${idx }].jobopening" value="${jobopeningVo.jobopening }" class="check">
						</td>
						<td align="center">${no }</td>
						<td align="center">${jobopeningVo.jobtitle }</td>
						<td align="center">
						${fn:substring(jobopeningVo.workdate,0,10) }
						 ~ 	${fn:substring(jobopeningVo.endDate,0,10) } </td>  
						
 					</tr> 
				  <c:set var="idx" value="${idx+1 }"/> 
				  <c:set var="no" value="${no+1 }"/> 
				  </c:forEach> 
			</c:if>
			<!-- 반복 끝 -->
		</tbody>
	</table>
	<!-- checkbox 확인 : <span id="multiPrint"></span><br> -->
	<!-- <span>checkbox 개수: <span id="chklength"></span></span> <br> -->
	
	<div class="agreement" style="font-size: 1.5em;margin-top: 10px;margin-bottom: 10px;">
	< 개인정보 수집 및 이용동의  > <span><input type="checkbox" id="agree" style="display: inline-block;"></span><br>
수집 항목 기업회원 ID, 기업명, 담당자 이름, 이메일 주소, 연락처 <br>
수집 목적 기업의 광고상품 문의에 따른 원활한 상담 제공 <br>
보유 기간 문의처리 후 1년간 보관 <br>
</div>

	<input type="submit" value="결제하기">
	</form>

</div>

    </div>
</div>
<%@include file="../main/inc/bottom.jsp" %>