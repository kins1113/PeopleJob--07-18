package com.ez.peoplejob.hopecompany;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.peoplejob.hopecompany.model.FirstOccupationVO;
import com.ez.peoplejob.hopecompany.model.OccupationService;

@Controller
@RequestMapping("/manager/occupantion")
public class OccupantionController {

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
}
