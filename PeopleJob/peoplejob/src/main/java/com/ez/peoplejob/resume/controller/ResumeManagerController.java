package com.ez.peoplejob.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/resume")
public class ResumeManagerController {
	
	private Logger logger=LoggerFactory.getLogger(ResumeManagerController.class);
	
	@RequestMapping("/resumeList.do")
	public String resumeList_get() {
		logger.info("이력서 관리 보여주기 ");
		
		return "manager/resume/resumeList";
	}
}
