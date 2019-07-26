package com.ez.peoplejob.hopecompany.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.peoplejob.hopecompany.model.FirstOccupationVO;
import com.ez.peoplejob.hopecompany.model.LocationVO;
import com.ez.peoplejob.hopecompany.model.OccupationService;
import com.ez.peoplejob.hopecompany.model.SecondOccupationVO;
import com.ez.peoplejob.hopecompany.model.ThirdOccupationVO;

@Controller
@RequestMapping("/resume/occupation")
public class OccupantionMainController {

	private Logger logger=LoggerFactory.getLogger(OccupantionController.class);
	
	@Autowired OccupationService occupationService;
	
	@RequestMapping("/firstList.do")
	@ResponseBody
	public List<FirstOccupationVO> occupantionFirst(){
		logger.info("ajax - 1차 직종 가져가는 곳 ");
		
		List<FirstOccupationVO> list=occupationService.selectFirst();
		logger.info("first가져온 결과 list.size={}",list.size());
		
		return list;
	}
	
	@RequestMapping("/selectSecond.do")
	@ResponseBody
	public List<SecondOccupationVO> selectSecond(@RequestParam(defaultValue = "0")int firstCode){
		logger.info("ajax - 2차 직종 가져가는 곳, 파라미터 firstCoded={}",firstCode);
		
		List<SecondOccupationVO> list= occupationService.selectSecond(firstCode);
		return list;
	}
		
	@RequestMapping("/selectThird.do")
	@ResponseBody
	public List<ThirdOccupationVO> selectThird(@RequestParam(defaultValue = "0")int secondCode){
		logger.info("ajax - 3차 직종 가져가는 곳, 파라미터 secondCode={}",secondCode);
		
		List<ThirdOccupationVO> list= occupationService.selectThird(secondCode);
		return list;
	}
	
	@RequestMapping("/selectLocation.do")
	@ResponseBody
	public List<LocationVO> selectLocation(){
		logger.info("ajax - 지역정보 가져가기");
		
		List<LocationVO> list = occupationService.selectLocation();
		logger.info("ajax - 지역정보 가져가기 결과 list.size={}",list.size());
		return list;
	}
	@RequestMapping("/selectLocation2.do")
	@ResponseBody
	public List<Map<String,Object>> selectLocation2(@RequestParam(defaultValue = "0")int sidoCode){
		logger.info("ajax - 지역정보2 가져가기 파라미터 sidoCode={}",sidoCode);
		
		List<Map<String, Object>> list= occupationService.selectLocation2(sidoCode);
		logger.info("ajax - 지역정보2 가져가기 결과 list.size={}",list.size());
		return list;
	}
	@RequestMapping("/selectBtype1.do")
	@ResponseBody
	public List<Map<String,Object>> selectBtype1(){
		logger.info("ajax - 1차 업종 가져가기 ");
		
		List<Map<String, Object>> list= occupationService.selectBtype1();
		logger.info("ajax - 1차 업종 가져가기 결과 list.size={}",list.size());
		return list;
	}
	
	@RequestMapping("/selectBtype2.do")
	@ResponseBody
	public List<Map<String,Object>> selectBtype2(@RequestParam(defaultValue = "0")int btypeCode1){
		logger.info("ajax - 2차 업종 가져가기 파라미터 btypeCode1={}",btypeCode1);
		
		List<Map<String, Object>> list= occupationService.selectBtype2(btypeCode1);
		logger.info("ajax - 2차 업종 가져가기  결과 list.size={}",list.size());
		return list;
	}
	
	@RequestMapping("/selectBtype3.do")
	@ResponseBody
	public List<Map<String,Object>> selectBtype3(@RequestParam(defaultValue = "0")int btypeCode2){
		logger.info("ajax - 3차 업종 가져가기  파라미터 btypeCode2={}",btypeCode2);
		
		List<Map<String, Object>> list= occupationService.selectBtype3(btypeCode2);
		logger.info("ajax - 3차 업종 가져가기  결과 list.size={}",list.size());
		return list;
	}
}
