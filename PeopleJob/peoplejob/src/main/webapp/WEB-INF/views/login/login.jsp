<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/login.css'/>" />
<style type="text/css">
 
</style>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/main/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
$(function() {

	$('input[type=submit]').click(function(){
		if($('#memberId').val()==''){
			alert('아이디를 입력하세요');
			$('#memberId').focus();
			event.preventDefault();
			return false;
		}else if($('#pwd').val()==''){
			alert('비밀번호를 입력하세요');
			$('#pwd').focus();
			event.preventDefault();
			return false;
		}
	});

});

public JsonNode getAccessToken(String autorize_code) {
	 
    final String RequestUrl = "https://kauth.kakao.com/oauth/token";

    final List<NameValuePair> postParams = new ArrayList<NameValuePair>();

    postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));

    postParams.add(new BasicNameValuePair("client_id", "2cf3b4aff785f5ac3fea03db7cc7efdd"));

    postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:9090/peoplejob/oauth"));

    postParams.add(new BasicNameValuePair("code", autorize_code));

    final HttpClient client = HttpClientBuilder.create().build();

    final HttpPost post = new HttpPost(RequestUrl);

    JsonNode returnNode = null;

    try {

        post.setEntity(new UrlEncodedFormEntity(postParams));

        final HttpResponse response = client.execute(post);

        ObjectMapper mapper = new ObjectMapper();

        returnNode = mapper.readTree(response.getEntity().getContent());

    } catch (UnsupportedEncodingException e) {

        e.printStackTrace();

    } catch (ClientProtocolException e) {

        e.printStackTrace();

    } catch (IOException e) {

        e.printStackTrace();

    } finally {

    }

    return returnNode;

}


</script>

<div class="body" style="background-color: #f5f6f8;">
<div class="container" style="min-height: 550px;padding:8px;">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
						
							<div class="col-xs-6" style="text-align: center;font-weight: bold;color: green;  margin: 0 auto;font-size: 1.5em;">
								로그인
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="<c:url value='/login/login.do'/>" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="memberId" id="memberId" tabindex="1" class="form-control" placeholder="ID"
										 value="${cookie.ck_memberid.value}">
									</div>
									<div class="form-group">
										<input type="password" name="pwd" id="pwd" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
									<div class="row" style="margin-left:-1px">
										<input type="checkbox" name="saveId" id="saveId"
										
										<c:if test="${!empty cookie.ck_memberid }">
											checked="checked"
										</c:if>>
										<label for="saveId" style="font-weight: 600;font-size: 1.1em;color: #2b2525c4;">아이디 저장</label>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-register" value="로그인" style="    font-size: 1.2em;">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="<c:url value='/login/findId.do'/>" >ID</a>/<a href="<c:url value='/login/findPwd.do'/>">PW찾기</a>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="<c:url value='/login/registerU.do'/>">회원가입</a>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													 <a id="kakao-login-btn"></a>
    												<a href="http://developers.kakao.com/logout"></a>
												</div>
											</div>
										</div>
									</div>
									<script type='text/javascript'>
        //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('1bcb7cf50cc23edaa4993201da8c52b7');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
            container: '#kakao-login-btn',
            success: function (authObj) {
                alert(JSON.stringify(authObj));
            },
            fail: function (err) {
                alert(JSON.stringify(err));
            }
        });
      //]]>
    </script>
								</form>
								
								
								<c:if test="${userId eq null}">
        <a href="https://kauth.kakao.com/oauth/authorize
            ?client_id=2cf3b4aff785f5ac3fea03db7cc7efdd
            &redirect_uri=http://localhost:9090/peoplejob/login
            &response_type=code"> kaokaoLogin
        </a>
    </c:if>
    <c:if test="${userId ne null}">
        <h1>로그인 성공입니다</h1>
    </c:if>
    
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>   
</div> 
	<%@include file="../main/inc/bottom.jsp" %>                     