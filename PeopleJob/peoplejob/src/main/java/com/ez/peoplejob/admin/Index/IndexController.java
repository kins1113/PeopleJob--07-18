package com.ez.peoplejob.admin.Index;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.peoplejob.popup.model.PopupService;
import com.ez.peoplejob.popup.model.PopupVO;

@Controller
public class IndexController {
	Logger logger = LoggerFactory.getLogger(IndexController.class);
	@Autowired private PopupService popupServie;	
	@Autowired private ConnetService connetService;
	
	
	@RequestMapping("/manager/index.do")
	public String index(Model model) {
		logger.info("index 화면 보여주기");
		
		//활성화 된것만 가져오기
		List<PopupVO> popupList=popupServie.selectUsageY();
		logger.info("popup은 popupList.size={}",popupList.size());
		
		model.addAttribute("popupList", popupList);
		return "manager/index";
	}
	
	@RequestMapping("/inc/date.do")
	public void date(@RequestParam String id, @RequestParam String name) {
	}
	
	@RequestMapping("/manager/index/connet.do")
	@ResponseBody
	public List<ConnetVO> connetSelect(){
		logger.info("접속 통계 가져오기");
		List<ConnetVO> list= connetService.selectConnet();
		return list;
	}
	
	@RequestMapping("/manager/index/memberInfo.do")
	@ResponseBody
	public int[] selectMemberCount(){
		logger.info("회원 통계 가져오기");
		
		int[] result=connetService.selectMemberCount();
		
		return result;
	}
	
}
