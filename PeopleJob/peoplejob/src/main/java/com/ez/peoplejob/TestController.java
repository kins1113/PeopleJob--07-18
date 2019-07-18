package com.ez.peoplejob;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	//태스트를 위한 컨트롤러 입니다.~!!!~!~ - 옥환
	
	@RequestMapping("/test/smsTest.do")
	public void smsTestView() {
		System.out.println("sms태스트 화면 보여주기 ");
	}
}
