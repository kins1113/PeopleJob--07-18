package com.ez.peoplejob.resume.controller;

import java.util.List;

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
@RequestMapping("/resume/career")
public class CareerController {
	private Logger logger=LoggerFactory.getLogger(CareerController.class);
	
	@Autowired
	CareerService careerservice;
	
	@RequestMapping("/selectCareer.do")
	@ResponseBody
	public List<CareerVO> selectBydvCode(){
		logger.info("ajax - 경력정보 가져가기");
		 
		List<CareerVO> list = careerservice.selectBydvCode();
		logger.info("ajax - 경력정보 가져가기 결과 list.size={}",list.size());
		return list;
		
	}
	
	@RequestMapping("/firstCareer.do")
	@ResponseBody
	public List<CareerVO> selectFirst(){
		logger.info("ajax - 1차 직종 가져가는 곳 ");
		
		List<CareerVO> list=careerservice.selectcareer();
		logger.info("first가져온 결과 list.size={}",list.size());
		
		return list;
	}
	
	@RequestMapping("/selectSecond.do")
	@ResponseBody
	public List<CareerVO> selectSecond(@RequestParam(defaultValue = "")String chargework){
		logger.info("ajax - 2차 직종 가져가는 곳, 파라미터 chargework={}",chargework);
		
		List<CareerVO> list= careerservice.selectSecond(chargework);
		return list;
	}
		
	@RequestMapping("/selectThird.do")
	@ResponseBody
	public List<CareerVO> selectThird(@RequestParam(defaultValue = "")String chargework2 ){
		logger.info("ajax - 3차 직종 가져가는 곳, 파라미터 chargework2={}",chargework2);
		
		List<CareerVO> list= careerservice.selectThird(chargework2);
		return list;
	}
}
