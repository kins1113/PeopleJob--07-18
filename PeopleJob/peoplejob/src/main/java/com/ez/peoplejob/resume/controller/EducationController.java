package com.ez.peoplejob.resume.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.peoplejob.resume.model.EducationService;
import com.ez.peoplejob.resume.model.EducationVO;


@Controller
@RequestMapping("/resume/education")
public class EducationController {
	private Logger logger=LoggerFactory.getLogger(EducationController.class);
	
	@Autowired
	EducationService educationservice;
	
	@RequestMapping("/selectMajor.do")
	@ResponseBody
	public List<EducationVO> selectMajor(){
		logger.info("ajax - 전공정보 가져가기");
		
		List<EducationVO> list = educationservice.selectMajor();
		logger.info("ajax - 전공정보 가져가기 결과 list.size={}",list.size());
		return list;
		
	}
	@RequestMapping("/selectMajor2.do")
	@ResponseBody
	public List<EducationVO> selectMajor2(int academicCode){
		logger.info("ajax - 전공정보 가져가기");
		
		List<EducationVO> list = educationservice.selectMajor2(academicCode);
		logger.info("ajax - 전공정보 가져가기 결과 list.size={}",list.size());
		return list;
		
	}
}
