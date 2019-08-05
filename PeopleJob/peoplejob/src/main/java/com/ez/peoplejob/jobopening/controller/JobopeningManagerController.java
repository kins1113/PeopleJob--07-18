package com.ez.peoplejob.jobopening.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.common.FileUploadUtility;
import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.hopecompany.model.HopeWorkingVO;
import com.ez.peoplejob.jobopening.model.JobopeningManagerService;
import com.ez.peoplejob.jobopening.model.JobopeningService;
import com.ez.peoplejob.jobopening.model.JobopeningVO;
import com.ez.peoplejob.member.model.MemberVO;

@Controller
@RequestMapping("/manager/jobopening")
public class JobopeningManagerController {
	private Logger logger=LoggerFactory.getLogger(JobopeningController.class);
	@Autowired
	private FileUploadUtility fileUploadUtil;
	@Autowired
	private JobopeningService jobopeningService;
	@Autowired
	private JobopeningManagerService jobManagerService;
	@RequestMapping("/jobopeningList.do")
	public String jobopeningList_post(
			 @RequestParam(defaultValue = "1") int currentPage,
		     @RequestParam(defaultValue = "1") int recordCountPerPage,
		     @RequestParam(required = false, defaultValue = "") String searchStartDay,
		     @RequestParam(required = false, defaultValue = "") String searchEndDay,
		     @RequestParam(required = false, defaultValue = "") String searchKeyword,
		     @RequestParam(required = false, defaultValue = "") String searchCondition,
		     @RequestParam(required = false, defaultValue = "N") String detailCk,
		     @RequestParam(required = false) String careerCk,
		     @ModelAttribute JobopeningVO jobopeningVO,
								     
			Model model) {
		logger.info("체용공고 관리 보여주기 careerCk={}",careerCk);
		logger.info("체용공고 파라미터 startDay={}, endDay={}", searchStartDay, searchEndDay);
		logger.info("체용공고 파라미터 detailCk={}, jobopeningVO={}",detailCk,jobopeningVO);
		logger.info("체용공고 파라미터 searchKeyword={}, searchCondition={}",searchKeyword,searchCondition);
		

		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(5);
		pagingInfo.setCurrentPage(currentPage);
		//밖에서 들어올때는 10개를 기본값으로 
		if(recordCountPerPage==1) {
			pagingInfo.setRecordCountPerPage(10);
		}else {
			pagingInfo.setRecordCountPerPage(recordCountPerPage);
		}
		logger.info("currentPage={}",currentPage);
		logger.info("pagingInfo.getRecordCountPerPage()={}",pagingInfo.getRecordCountPerPage());
		logger.info("pagingInfo.getFirstRecordIndex()={}",pagingInfo.getFirstRecordIndex());
		
		//맵에 저장
		Map<String, Object>map =new HashMap<String, Object>();
		map.put("recordCountPerPage",pagingInfo.getRecordCountPerPage());
		map.put("firstRecordIndex",pagingInfo.getFirstRecordIndex());
		//검색조건들 저장
		map.put("searchStartDay",searchStartDay );
		map.put("searchEndDay", searchEndDay);
		map.put("searchKeyword",searchKeyword );
		map.put("searchCondition",searchCondition );
		map.put("jobopeningVO",jobopeningVO);
		map.put("detailCk", detailCk);
		map.put("careerCk", careerCk);
		
		List<Map<String, Object>>list = jobManagerService.selectJobopeningManager(map);
		logger.info("체용공고 조회 결과 list.size={}",list.size());
		
		//totalCount
		int totalCount=jobManagerService.getTotalCountJobopeningManager(map);
		logger.info("totalCount={}"+totalCount);
		pagingInfo.setTotalRecord(totalCount);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "manager/jobopening/jobopeningList";
	}
	
	@RequestMapping(value = "/jobopeningAdd.do",method = RequestMethod.GET)
	public String jobopeningAdd_get() {
		logger.info("체용공고 추가 보여주기 ");
		
		return "manager/jobopening/jobopeningAdd";
	}
	
	@RequestMapping(value="/jobopeningAdd.do",method = RequestMethod.POST)
	public String jobopeningAdd_post(@ModelAttribute JobopeningVO vo,HttpSession session,
			@ModelAttribute MemberVO memberVo,
			//@RequestParam(required=false) String[] welfare1,
			HttpServletRequest request,Model model) {
		/*
		 * String wel=""; for(int i=0;i<welfare1.size();i++) { if(i!=0) { wel+=","; }
		 * wel+=welfare1.get(i); } vo.setWelfare(wel);
		 */
		/*
		 * String walfare=vo.getWelfare(); String[] arr=walfare.split(",");
		 */
		logger.info("채용공고 등록 파라미터 vo={} \n memberVo={}",vo,memberVo);
		List<Map<String,Object>>list=fileUploadUtil.fileUpload(request,FileUploadUtility.JOBOPENING_UPLOAD);
		 
		String imageURL="";
		for(Map<String,Object>map:list) {
			imageURL=(String)map.get("fileName");
		}
		vo.setCompanyimage(imageURL);
		//logger.info("welfare1={}",welfare1);
		int cnt=jobopeningService.insertJobOpen(vo);
		logger.info("공고등록결과 cnt={}",cnt);
		String msg="",url="/manager/jobopening/jobopeningList/jobopeningAdd.do";
		if(cnt>0) {
			msg="공고등록성공";
			url="/manager/jobopening/jobopeningList.do";
		}else {
			msg="공고등록 실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
		
	}
}
