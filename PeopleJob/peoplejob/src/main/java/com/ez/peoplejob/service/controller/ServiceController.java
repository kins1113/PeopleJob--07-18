package com.ez.peoplejob.service.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
			url="/manager/service/list.do";
			
		}else {
			msg="상품등록 실패";
			url="/manager/service/register.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	  @RequestMapping("/manager/service/list.do")
	  public String list(@ModelAttribute ServiceVO vo, Model model ) {
		  //1
		  logger.info("서비스 목록 파라미터 vo={}",vo);
		  	
		  //2
		 List<ServiceVO> list=serviceService.selectAll();
		 logger.info("서비스 목록 결과, list.size={}",list.size()); 
			
			//3
		 model.addAttribute("list", list); 
			return "manager/service/list";
	  }
	  
	  @RequestMapping("/manager/service/serviceDel.do")
	  public String serviceDel(@RequestParam String[] serviceChk, Model model) {
		  
			for(int i=0; i<serviceChk.length;i++) {
				logger.info("{}번째 넘어온값={}",i,serviceChk[i]);
			}
			int cnt=serviceService.deleteService(serviceChk);
			String msg="", url="/manager/service/list.do";
			
			if(cnt>0) {
				msg=cnt+"건 삭제 성공";
			}else {
				msg="삭제 실패";
			}
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
	  }
	  
		@RequestMapping(value="/manager/service/edit.do", method=RequestMethod.GET)
		public String serviceEdit_get(@RequestParam(defaultValue = "0",required = false) int serviceCode, 
				ModelMap model) {
			logger.info("수정화면, 파라미터 serviceCode={}", serviceCode);
			
			if(serviceCode==0) {
				model.addAttribute("msg", "잘못된 url입니다.");
				model.addAttribute("url", "/manager/service/list.do");
				return "common/message";
			}
			
			ServiceVO serviceVo=serviceService.selectServiceByCode(serviceCode);
			logger.info("수정화면 조회 결과, vo={}", serviceVo);
			
			model.addAttribute("vo", serviceVo);
			return "manager/service/edit";
		}
		
		@RequestMapping(value="/manager/service/edit.do", method=RequestMethod.POST)
		public String serviceEdit_post(@ModelAttribute ServiceVO serviceVo, Model model) {
			logger.info("서비스 수정 처리, 파라미터 serviceVo={}", serviceVo);
			
			String msg="", url="/manager/service/edit.do?serviceCode="+serviceVo.getServiceCode();
				int cnt=serviceService.updateService(serviceVo);
				
				if(cnt>0) {
					msg="서비스 수정되었습니다.";
					url="/manager/service/list.do";
				}else {
					msg="서비스 수정 실패.";
				}
		
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		}
	 
}
