/**
 * member.js
 */
	var contextPath="/peoplejob";

	//아이디
	$('#memberid').keyup(function() {
		if (validate_userid($('#memberid').val())&& $('#memberid').val().length >= 2) {
			//정상일 때

			$.ajax({
				url : "<c:url value='/login/ajaxDupUserid.do'/>",
				type : "get",
				data : "memberid=" + $('#memberid').val(),
				success : function(res) {
					var str = "";
					if (res) {
						str = "사용가능한 아이디";
						$('#chkmemberid').val('Y');
					} else {
						str = "이미 등록된 아이디";
						$('#chkmemberid').val('N');
					}
					$('.error').html(str);
					$('.error').show();

				},
				error : function(xhr, status, error) {
					alert(status + ":" + error);
				}
			});

		} else {
			$('.error').html("아이디 규칙에 맞지 않습니다.");
			$('.error').show();
			$('#chkmemberid').val('N');
		}
	});

	
	function validate_hp(hp){
		var pattern=new RegExp(/^[0-9]*$/g);
		return pattern.test(hp);
	 	/*  정규식  /^[0-9]*$/g
		0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 
		(^는 시작, $는 끝을 의미)
		닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복	  */
	}
	
	function validate_userid(userid){
		var pattern=new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(userid);
		
		/* 정규식  /^[a-zA-Z0-9_]+$/g
		a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 숫자나 _로 시작하거나 
		끝나야 한다는 의미
		닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 그 이상 반복된다는 의미 */

	}
	
	//비밀번호 정규식
	function validate_pwd(pwd) {
		var pattern = new RegExp(/^[a-zA-Z0-9]+$/g);
		return pattern.test(pwd);
	}
	
	//이메일 인증용
	$('#emailcertificate').click(function() {
						var contextPath = "/peoplejob";
						var email = $('#email').val();
						if (email == null || email == '') {
							alert('이메일을 입력해주세요!');

						} else {
							window.open(contextPath+ "/login/registeremail.do?email="+ email,'emailcertificate',
											'left=300, top=300, location=yes, width=500, height=300, resizable=no');

						}
					});
	
	