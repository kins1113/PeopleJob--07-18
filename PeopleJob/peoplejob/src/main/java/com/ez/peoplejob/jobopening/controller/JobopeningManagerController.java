package com.ez.peoplejob.jobopening.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ez.peoplejob.hopecompany.model.HopeWorkingConditionsVO;
import com.ez.peoplejob.jobopening.model.JobopeningVO;

@Controller
@RequestMapping("/manager/jobopening")
public class JobopeningManagerController {
	private Logger logger=LoggerFactory.getLogger(JobopeningController.class);
	
	@RequestMapping("/jobopeningList.do")
	public String jobopeningList_get() {
		logger.info("체용공고 관리 보여주기 ");
		
		return "manager/jobopening/jobopeningList";
	}
	
	@RequestMapping(value = "/jobopeningAdd.do",method = RequestMethod.GET)
	public String jobopeningAdd_get() {
		logger.info("체용공고 추가 보여주기 ");
		
		return "manager/jobopening/jobopeningAdd";
	}
	
	@RequestMapping(value="/jobopeningAdd.do",method = RequestMethod.POST)
	public String jobopeningAdd_post(@ModelAttribute JobopeningVO jobopeningVo) {
		logger.info("채용공고 등록 파라미터 jobopeningVo={},\n hopeVo={}",jobopeningVo);
		
		
		return "manager/jobopening/jobopeningAdd";
				
		
	}
}
