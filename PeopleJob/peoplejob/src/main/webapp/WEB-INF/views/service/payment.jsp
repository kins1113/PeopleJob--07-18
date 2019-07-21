<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../main/inc/top.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/payment.css'/>" />
<style type="text/css">
table.table.table-bordered {
    font-size: 1.5em;
    text-align: center;
}
input[type="submit"] {float: right;font-size: 2em;width: 100px;padding: 5px;}
</style>
<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>

<!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script type="text/javascript">
  $(function(){
	  
		  
	  $('#pay').click(function(){
		  
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
				  /*
				  var IMP = window.IMP; // 생략해도 괜찮습니다.
				  IMP.init("imp49241177"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
				  
				   IMP.request_pay({
					  	pg : 'inicis', // version 1.1.0부터 지원.
					    pay_method : 'card',
					    merchant_uid : 'peoplejob_' + new Date().getTime(),
					    name : 'PEOPLEJOB 채용공고 vvip관',
					    amount : 10,
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
					        location.href="<c:url value='/service/success.do'/>";
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += ' : ' + rsp.error_msg;
					    }
					    alert(msg);
					}); */
					//window.open("<c:url value='/service/ListForPay.do'/>", "listForPay","width=570, height=350, resizable=yes");
			  	$('#cardBoduPostList').show();
			  }else if(${sessionScope.author_code==3 && fn:length(list)<1}){   
				  alert('등록된 채용공고가 없습니다. 채용공고를 먼저 등록해주세요');
				  location.href="<c:url value='/company/jobopening_register.do'/>";  
			  }
		  }//로그인해서 아이디 있을 때
		  
		 
	  });//pay1
  
 $('#pay2').click(function(){ 
		   
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
				  var IMP = window.IMP; // 생략해도 괜찮습니다.
				  IMP.init("imp49241177"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
				  
				  IMP.request_pay({
					  	pg : 'inicis', // version 1.1.0부터 지원.
					    pay_method : 'card',
					    merchant_uid : 'peoplejob_' + new Date().getTime(),
					    name : 'PEOPLEJOB 채용공고 vip관',
					    amount : 10,
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
					        location.href="<c:url value='/service/success.do'/>";
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += ' : ' + rsp.error_msg;
					    }
					    alert(msg);
					});
			  }else if(${sessionScope.author_code==3 && fn:length(list)<1}){   
				  alert('등록된 채용공고가 없습니다. 채용공고를 먼저 등록해주세요');
				  location.href="<c:url value='/company/jobopening_register.do'/>";  
			  }
		  }//로그인해서 아이디 있을 때
		  
		 
	  });//pay2
	 //////////////////////////////////
	  var lists=[];
	  $(".check:checked").each(function(){
		 
		  lists.push($(this).val());
		  
	  });
	  
	  var cnt=0;
	  $(".check").change(function(){
		  if($(".check").is(":checked")){
			  cnt++;
		  }else {
			  cnt--;
		  }
	  $('#chklength').text(cnt);
	  });
	  
  
	  $('input[type=submit]').click(function(){ 
		  if($('input[type=checkbox]:checked').length<1){
				alert('결제할 채용공고를 먼저 선택하세요');
				event.preventDefault();
				return;
			}else{
				//$('form[name=frmList]').prop('action','<c:url value="/service/payList.do"/>');
				//$('form[name=frmList]').submit();
				
				var param=$("form[name=frmList]").serialize();
				$.ajax({
					url : "<c:url value='/service/ajaxpayList.do'/>",
					type : "post",
					//traditional : true,
					data : param,
					dataType:"json",
					async: false,
					success : function(res) {
						 if(res){
							if(confirm('결제 진행하시겠습니까?')){
							
								location.href="<c:url value='/service/successpay.do'/>";
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
<div class="container" style="margin-top: 30px; margin-bottom: 30px;min-height: 550px; ">
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
                    <button type="button" class="btn btn-lg btn-primary" id="pay">결제하기</button>
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
                    <button type="button" class="btn btn-lg btn-primary" id="pay2">결제하기</button>
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
                    <button type="button" class="btn btn-lg btn-primary">결제하기</button>
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
                    <button type="button" class="btn btn-lg btn-primary">결제하기</button>
                </div>
            </div>
        </div>
        
        <!-- 결제하기 버튼 누르면  -->
        <div class="card-body" id="cardBoduPostList" style="min-height: 300px; display: none; ">
	<table class="table table-bordered">
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
				<form name="frmList">
				
						<input type="hidden" value="${memberVo.memberCode }" name="memberCode">
						<input type="hidden" value="${serviceVo1.serviceCode }" name="serviceCode">
						<input type="hidden" value="${jobopeningVo.jobopening }" name="jobno">
					<tr>
						<td align="center"><input type="checkbox" name="jobItems[${idx }].jobopening" value="${jobopeningVo.jobopening }" class="check"></td>
						<td align="center">${no }</td>
						<td align="center">${jobopeningVo.jobtitle }</td>
						<td align="center">${jobopeningVo.workdate } ~ ${jobopeningVo.endDate }
						</td> 
						
 					</tr> 
				  <c:set var="idx" value="${idx+1 }"/> 
				  <c:set var="no" value="${no+1 }"/> 
				  </c:forEach> 
			</c:if>
			<!-- 반복 끝 -->
		</tbody>
	</table>
	checkbox 확인 : <span id="multiPrint"></span><br>
	checkbox 개수: <span id="chklength"></span><br>
	<input type="submit" value="결제하기">
	</form>

</div>

    </div>
</div>
<%@include file="../main/inc/bottom.jsp" %>