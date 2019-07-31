package com.ez.peoplejob.resume.controller;

import java.io.PrintWriter;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.peoplejob.resume.model.CareerService;
import com.ez.peoplejob.resume.model.CareerVO;

@Controller
@RequestMapping("/career")
public class CareerController {
	private Logger logger=LoggerFactory.getLogger(CareerController.class);
	
	@Autowired
	CareerService careerservice;
	
	@RequestMapping("/selectCareer.do")
	@ResponseBody
	public List<CareerVO> selectBydvCode(@RequestParam(defaultValue = "0")int dvCode){
		logger.info("ajax - 경력정보 가져가기 dvCode={}",dvCode);
		 
		List<CareerVO> list = careerservice.selectBydvCode(dvCode);
		logger.info("ajax - 경력정보 가져가기 결과 list.size={}",list.size());
		return list;
		
	}
}
