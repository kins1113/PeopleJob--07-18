package com.ez.peoplejob.peopleinfo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.common.WebUtility;

import com.ez.peoplejob.peopleinfo.model.PeopleInfoService;
import com.ez.peoplejob.resume.model.ResumeService;
import com.ez.peoplejob.resume.model.ResumeVO;

@Controller
@RequestMapping("/peopleinfo")
public class PeopleInfoController {

	private Logger logger=LoggerFactory.getLogger(PeopleInfoController.class);
	@Autowired
	private ResumeService resumeService;
	@Autowired
	private PeopleInfoService peopleinfoService;
	
	@RequestMapping("/peopleinfolist.do")
	public String peopleinfolist(
		 HttpSession session,
			@ModelAttribute SearchVO searchVo,Model model,@RequestParam(required = false) String[] term,@RequestParam(required = false) String[] age,
			@RequestParam(required = false) String[] graduatetype,@RequestParam(required = false) String[] sido,@RequestParam(required = false) String[] gugun,@RequestParam(required = false) String[] btypename1 ,
			@RequestParam(required = false) String[] btypename2,@RequestParam(required = false) String[] btypename3,@RequestParam(required = false) String[] firstname,
			@RequestParam(required = false) String[] secondname,@RequestParam(required = false) String[] thirdname,@RequestParam(value="resumeCode", defaultValue = "0") int resumeCode) {
		String id=(String)session.getAttribute("memberid");
		if(id==null) {
			id="비회원";
		}
		ResumeVO vo1=resumeService.selectByMemverid(id);
		List<ResumeVO> vo=peopleinfoService.selectResumeView(resumeCode);
		logger.info("로그인 vo={}",vo1);
		logger.info("인재정보 리스트");
		//1]PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//2]SearchVo에 페이징 관련 변수 세팅
		searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("셋팅 후 serchVo={}",searchVo);
		
		List<ResumeVO> list=new ArrayList<ResumeVO>();
		Map<String, Object> map= new HashMap<String, Object>();
		logger.info("term={}",term);
		logger.info("age={}",age);
		logger.info("graduatetype={}",graduatetype);
		logger.info("sido={}",sido);
		logger.info("gugun={}",gugun);
		logger.info("btypename1={}",btypename1);
		logger.info("btypename2={}",btypename2);
		logger.info("btypename3={}",btypename3);
		logger.info("firstname={}",firstname);
		logger.info("secondname={}",secondname);
		logger.info("thirdname={}",thirdname);
		map.put("term",term);
		map.put("age",age);
		map.put("graduatetype",graduatetype);
		map.put("sido",sido);
		map.put("gugun",gugun);
		map.put("btypename1",btypename1);
		map.put("btypename2",btypename2);
		map.put("btypename3",btypename3);
		map.put("firstname",firstname);
		map.put("secondname",secondname);
		map.put("thirdname",thirdname);
		map.put("firstRecordIndex", searchVo.getFirstRecordIndex());
		map.put("recordCountPerPage", searchVo.getRecordCountPerPage());
		map.put("resumeCode", resumeCode);
		logger.info("map={}",map);
		list=peopleinfoService.selectPeoplew(map);
		
		logger.debug("조회결과 list.size()={}",list.size());
		
		int totalRecord=0;
		
		totalRecord=peopleinfoService.selectTotalCountPeople(map);
		 
		 logger.info("전체 레코드 개수 조회 결과, totalRecord={}",totalRecord);
		
		
		//5]PaginationInfo에 totalRecord값셋팅
		pagingInfo.setTotalRecord(totalRecord);
		//3
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("vo1", vo1);
		model.addAttribute("vo", vo);
		return "peopleinfo/peopleinfolist";
		
		
		
	}
	@RequestMapping("/peopleinfodetail.do")
	public String peopleinfodetail(@RequestParam(defaultValue = "0") int resumeCode,@RequestParam(required = false) String[] term,@ModelAttribute ResumeVO resumeVo,HttpSession session,Model model) {
		logger.info("resumeCode={}",resumeCode);
		List<ResumeVO> vo=peopleinfoService.selectResumeView(resumeCode);
		String id=(String)session.getAttribute("memberid");
		if(id==null) {
			id="비회원";
		}
		ResumeVO vo1=resumeService.selectByMemverid(id);
		
		
		
		model.addAttribute("회원 정보 vo1={}", vo1);
		model.addAttribute("전체 vo={}", vo);
	
	
		return "peopleinfo/peopleinfodetail";
	}
	@RequestMapping("/peopleinfowhere.do")
	public String peopleinfowhere() {
		logger.info("조건지정");
		return "peopleinfo/peopleinfowhere";
	}		
}

