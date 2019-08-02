package com.ez.peoplejob.resume.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.peoplejob.resume.model.CertificateService;
import com.ez.peoplejob.resume.model.CertificateVO;

@Controller
@RequestMapping("/resume/certificate")
public class CertificateController {
	private Logger logger=LoggerFactory.getLogger(CertificateController.class);
	
	@Autowired
	CertificateService certificateService;
	
	@RequestMapping("/selectLname.do")
	@ResponseBody
	public List<CertificateVO> selectLname(){
		logger.info("ajax - 자격증 정보 가져가기");
		 
		List<CertificateVO> list = certificateService.selectLname();
		logger.info("ajax - 자격증 정보 가져가기 결과 list.size={}",list.size());
		return list;
		
	}
	
}
