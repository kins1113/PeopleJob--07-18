package com.ez.peoplejob.service.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.service.model.ServiceService;
import com.ez.peoplejob.service.model.ServiceVO;


@Controller
public class ServiceController {
	private Logger logger=LoggerFactory.getLogger(ServiceController.class);
	@Autowired private ServiceService serviceService;
	@RequestMapping(value="/manager/service/register.do",method = RequestMethod.GET)
	public String register_get() {
		logger.info("상품 등록 화면 보여주기");
		return "manager/service/register";
		
	}
	@RequestMapping(value = "/service/register.do", method = RequestMethod.POST)
	public String register_post(@ModelAttribute ServiceVO vo, Model model) {
		//1
		logger.info("상품 등록 처리 파라미터 vo={}",vo);
		//2
		int cnt=serviceService.insertService(vo);
		logger.info("상품 등록 결과 cnt={}",cnt);
		
		//3
		String msg="", url="";
		if(cnt>0) {
			msg="상품등록 완료";
			url="/manager/service/register.do";
			
		}else {
			msg="상품등록 실패";
			url="/manager/service/register.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	  @RequestMapping("/service/register.do")
	  public String list(@ModelAttribute Model model) {
		  //1
		  	
		  //2
		/* List<Map<String, Object>> list=serviceService.selectAll(); */
		/* logger.info("공지 글 목록 결과, list.size={}",list.size()); */
			
			//3
		/* model.addAttribute("list", list); */
			return "manager/service/register.do";
	  }
	 
}
