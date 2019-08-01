package com.ez.peoplejob.hopecompany.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.peoplejob.hopecompany.model.HopeWorkingService;
import com.ez.peoplejob.hopecompany.model.HopeWorkingVO;

@Controller
@RequestMapping("/resume/hopeWorking")
public class HopeWorkingController {

	private Logger logger=LoggerFactory.getLogger(HopeWorkingController.class);
	
	@Autowired HopeWorkingService HopeWorkingService;
	
	@RequestMapping("/selecthopework.do")
	@ResponseBody
	public List<HopeWorkingVO> selecthopeWorking(){
		logger.info("ajax - 희망 근무조건 가져가는 곳 ");
		
		List<HopeWorkingVO> list=HopeWorkingService.selecthopeWorking();
		logger.info("희망 근무조건 가져온 결과 list.size={}",list.size());
		
		return list;
	}
	
	
}
