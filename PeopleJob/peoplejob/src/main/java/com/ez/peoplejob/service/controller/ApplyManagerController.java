package com.ez.peoplejob.service.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/service")
public class ApplyManagerController {

	private Logger logger=LoggerFactory.getLogger(ApplyManagerController.class);
	
	@RequestMapping("/applyList.do")
	public String applyList() {
		logger.info("지원 현황 보기 ");
		
		return "manager/service/applyList";
	}
}
