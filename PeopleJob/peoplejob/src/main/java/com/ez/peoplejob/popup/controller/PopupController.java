package com.ez.peoplejob.popup.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.peoplejob.popup.model.PopupService;
import com.ez.peoplejob.popup.model.PopupVO;

@Controller
@RequestMapping("/manager/popup")
public class PopupController {
	private Logger logger=LoggerFactory.getLogger(PopupController.class);
	@Autowired private PopupService popupService;
	
	@RequestMapping("/popupList.do")
	public String popupList(Model model) {
		logger.info("팝업 리스트 화면 보여주기");
		
		List<PopupVO> list=popupService.selectPopupAll();
		
		model.addAttribute("list", list);
		logger.info("팝업 조회 결과 list.size={}",list.size());
		return "manager/popup/popupList";
	}
	@RequestMapping(value = "/popupAdd.do",method = RequestMethod.GET)
	public String popupAdd_get() {
		
		return "manager/popup/popupAdd";
	}
	
	@RequestMapping(value = "/popupAdd.do",method = RequestMethod.POST)
	@ResponseBody
	public int popupAdd_post(@ModelAttribute PopupVO popupVo,HttpSession session) {
		int adminCode=(Integer)session.getAttribute("adminCode");
		logger.info("팝업 추가 처리 파라미터 popupVo={} adminCode={}", popupVo,adminCode);
		
		popupVo.setAdminCode(adminCode);
		int result=popupService.insertPopup(popupVo);
		
		return result;
	}
}
