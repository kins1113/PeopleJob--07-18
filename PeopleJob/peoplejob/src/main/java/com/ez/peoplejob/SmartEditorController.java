package com.ez.peoplejob;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SmartEditorController {

	@RequestMapping("/manager/smarteditorTestjsp.do")
	public String smartEditorShow() {
		return "manager/inc/incSE2";
	}
	@RequestMapping("/main/smarteditorTestjsp.do")
	public String smartEditorShow_main() {
		return "inc/incSE2";
	}
}
/*
param태그 name에 controller에서 받을 name을 입력해서 넣어준다. 
 	
<c:import url="/manager/smarteditorTestjsp.do">
	<c:param name="name" value="이름이다"></c:param>
</c:import>
*/
