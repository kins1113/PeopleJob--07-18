package com.ez.peoplejob.resume.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.hopecompany.model.HopeWorkingVO;
import com.ez.peoplejob.resume.model.CareerVO;
import com.ez.peoplejob.resume.model.CertificateVO;
import com.ez.peoplejob.resume.model.EducationVO;
import com.ez.peoplejob.resume.model.LangCertificationVO;
import com.ez.peoplejob.resume.model.ResumeManagerVO;
import com.ez.peoplejob.resumeManager.model.ResumeManagerService;

@Controller
@RequestMapping("/manager/resume")
public class ResumeManagerController {
	
	private Logger logger=LoggerFactory.getLogger(ResumeManagerController.class);
	@Autowired
	private ResumeManagerService resumeServiceMN;
	
	@RequestMapping("/resumeList.do")
	public String resumeList_get() {
		logger.info("이력서 관리 보여주기 ");
		
		return "manager/resume/resumeList";
	}
	
	@RequestMapping(value="/resumeAdd.do",method = RequestMethod.GET)
	public String resumeAdd_get() {
		logger.info("이력서 추가 화면 보여주기");
		return "manager/resume/resumeAdd";
	}
	
	@RequestMapping(value="/resumeAdd.do",method = RequestMethod.POST)
	public String resumeAdd_post(@ModelAttribute ResumeManagerVO resumeMaVo, 
								 @ModelAttribute HopeWorkingVO hopeVo,
								 @ModelAttribute CertificateVO certificateVO, 
							 	 @ModelAttribute EducationVO educationVo,
						  		 @ModelAttribute LangCertificationVO langVo,
								 @ModelAttribute CareerVO careerVo,
								 @RequestParam(required = false) int[] localCode,
								 @RequestParam(required = false) int[] thirdCode) {
	
		String lCode="";
		for(int i=0;i<localCode.length;i++) {
			if(i<localCode.length) {
				 lCode+=localCode[i]+",";
			}else {
				lCode+=localCode[i];
			}
			//logger.info(i+", localCode[]={}"+localCode[i]);
		}
		logger.info("lCode={}",lCode);
		hopeVo.setLocalCode(lCode);
		
		String tCode="";
		for(int i=0;i<thirdCode.length;i++) {
			if(i<thirdCode.length) {
				tCode+=thirdCode[i]+",";
			}else {
				tCode+=thirdCode[i];
			}
			//logger.info(i+", thirdCode[]={}"+thirdCode[i]);
		}
		logger.info("tCode={}",tCode);
		hopeVo.setThirdCode(tCode);
		
		logger.info("이력서 추가 처리 파라미터 \n\nresumeMaVo={} \n\n hopeVo={}\n\n",resumeMaVo,hopeVo);
		logger.info("파라미터 certificateVO={} \n\neducationVo={} \n\n",certificateVO,educationVo);
		logger.info("파라미터 langVo={} \n\n careerVo={} \n\n",langVo,careerVo);
		
		
		int re=resumeServiceMN.insertResumeMN(hopeVo, certificateVO, educationVo, langVo, careerVo, resumeMaVo);
		logger.info("이력서 등록 결과 re={}",re);
		
		return "manager/resume/resumeAdd";
	}
}
