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
		 HttpSession session,@RequestParam(required = false) String[] membergender1,
			@ModelAttribute SearchVO searchVo,Model model,@RequestParam(required = false) String[] term1,@RequestParam(required = false) String[] workcheck1,@RequestParam(required = false) String[] age1,
			@RequestParam(required = false) String[] graduatetype1,@RequestParam(required = false) String[] sido1,@RequestParam(required = false) String[] gugun1,@RequestParam(required = false) String[] btypename11 ,
			@RequestParam(required = false) String[] btypename22,@RequestParam(required = false) String[] btypename33,@RequestParam(required = false) String[] firstname1,
			@RequestParam(required = false) String[] secondname1,@RequestParam(required = false) String[] thirdname1,@RequestParam(value="resumeCode", defaultValue = "0") int resumeCode) {
		logger.info("workcheck1={}",workcheck1);
		logger.info("membergender1={}",membergender1);
		logger.info("term1={}",term1);
		logger.info("age1={}",age1);
		logger.info("graduatetype={}",graduatetype1);
		logger.info("sido1={}",sido1);
		logger.info("gugun1={}",gugun1);
		logger.info("btypename11={}",btypename11);
		logger.info("btypename22={}",btypename22);
		logger.info("btypename33={}",btypename33);
		logger.info("firstname1={}",firstname1);
		logger.info("secondname1={}",secondname1);
		logger.info("thirdname1={}",thirdname1);
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
		
		map.put("workcheck1",workcheck1);
		map.put("membergender1",membergender1);
		map.put("term1",term1);
		map.put("age1",age1);
		map.put("graduatetype1",graduatetype1);
		map.put("sido1",sido1);
		map.put("gugun1",gugun1);
		map.put("btypename11",btypename11);
		map.put("btypename22",btypename22);
		map.put("btypename33",btypename33);
		map.put("firstname1",firstname1);
		map.put("secondname1",secondname1);
		map.put("thirdname1",thirdname1);
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

