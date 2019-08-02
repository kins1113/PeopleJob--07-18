package com.ez.peoplejob.resume.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.peoplejob.resume.model.LangCertificationVO;
import com.ez.peoplejob.resume.model.LangcertificationService;

@Controller
@RequestMapping("/resume/langcertification")
public class langcertificationController {
	private Logger logger=LoggerFactory.getLogger(langcertificationController.class);
	
	@Autowired
	LangcertificationService langcertificationService;
	
	@RequestMapping("/selectlangcertification.do")
	@ResponseBody
	public List<LangCertificationVO> selectlanglicencename(){
		logger.info("ajax - 어학정보 가져가기");
		 
		List<LangCertificationVO> list = langcertificationService.selectlanglicencename();
		logger.info("ajax - 어학정보 가져가기 결과 list.size={}",list.size());
		return list;
		
	}
	
}
