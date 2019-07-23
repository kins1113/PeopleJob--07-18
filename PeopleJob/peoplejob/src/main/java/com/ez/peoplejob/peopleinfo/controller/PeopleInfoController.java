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
import com.ez.peoplejob.jobopening.model.JobopeningVO;
import com.ez.peoplejob.member.model.CompanyVO;
import com.ez.peoplejob.member.model.MemberVO;
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
			@RequestParam(required = false) String[] graduatetype,@RequestParam(required = false) String[] sido,@RequestParam(required = false) String[] btypename1 ,
			@RequestParam(required = false) String[] btypename2,@RequestParam(required = false) String[] btypename3,@RequestParam(required = false) String[] firstname,
			@RequestParam(required = false) String[] secondname,@RequestParam(required = false) String[] thirdname) {
		String id=(String)session.getAttribute("memberid");
		if(id==null) {
			id="비회원";
		}
		ResumeVO vo=resumeService.selectByMemverid(id);
		logger.info("로그인 vo={}",vo);
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
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("term={}",term);
		logger.info("age={}",age);
		logger.info("graduatetype={}",graduatetype);
		logger.info("sido={}",sido);
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
		map.put("btypename1",btypename1);
		map.put("btypename2",btypename2);
		map.put("btypename3",btypename3);
		map.put("firstname",firstname);
		map.put("secondname",secondname);
		map.put("thirdname",thirdname);
		map.put("firstRecordIndex", searchVo.getFirstRecordIndex());
		map.put("recordCountPerPage", searchVo.getRecordCountPerPage());
		logger.info("map={}",map);
		list=peopleinfoService.selectCareer(map);
		list=peopleinfoService.selectAge(map);
		list=peopleinfoService.selectGraduatetype(map);
		list=peopleinfoService.selectSido(map);
		list=peopleinfoService.selectBtype(map);
		list=peopleinfoService.selectJobtype(map);
		logger.info("조회결과 list.size()={}",list.size());
		List<ResumeVO> resumelist=new ArrayList<ResumeVO>();
		for(int i=0;i<list.size();i++){
			resumelist.add(resumeService.selectResumeByNo(list.get(i).getResumeCode()));
			logger.info("resumelist[{}]={}",i,resumelist.get(i).getResumeCode());
		}
		logger.info("resumelist.size={}",resumelist.size());
		int totalRecord=0;
		totalRecord=peopleinfoService.selectTotalCountCareer(map);
		totalRecord=peopleinfoService.selectTotalCountAge(map);
		totalRecord=peopleinfoService.selectTotalCountGraduatetype(map);
		totalRecord=peopleinfoService.selectTotalCountSido(map);
		totalRecord=peopleinfoService.selectTotalCountBtype(map);
		totalRecord=peopleinfoService.selectTotalCountJobtype(map);
		
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}",totalRecord);
		
		//5]PaginationInfo에 totalRecord값셋팅
		pagingInfo.setTotalRecord(totalRecord);
		//3
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("resumelist",resumelist);
		model.addAttribute("vo", vo);
		return "peopleinfo/peopleinfolist";
		
		
		
	}
	@RequestMapping("/peopleinfodetail.do")
	public String peopleinfodetail(@RequestParam(required = false) int resumeCode,@RequestParam(required = false) String[] term,@ModelAttribute ResumeVO resumeVo,HttpSession session,Model model) {
		logger.info("resumeCode={}",resumeCode);
		ResumeVO vo=resumeService.selectResumeByNo(resumeCode);
		String id=(String)session.getAttribute("memberid");
		if(id==null) {
			id="비회원";
		}
		List<ResumeVO> list=new ArrayList<ResumeVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("term", term);
		ResumeVO vo1=resumeService.selectByMemverid(id);
		ResumeVO vo2=resumeService.selectBydesiredWorkCode(vo.getDesiredWorkCode());
		ResumeVO vo3=resumeService.selectByacademicCode(vo.getAcademicCode());
		ResumeVO vo4=resumeService.selectBydvCode(vo.getDvCode());
		ResumeVO vo5=resumeService.selectBylanglicenceCode(vo.getLanglicenceCode());
		ResumeVO vo6=resumeService.selectBylicenceCode(vo.getLicenceCode());
		ResumeVO vo7=resumeService.selectBylocation(vo.getLocalCode());
		ResumeVO vo8=resumeService.selectBylocation2(vo.getLocalCode2());
		ResumeVO vo9=resumeService.selectBybtype1(vo.getBtypeCode1());
		ResumeVO vo10=resumeService.selectBybtype2(vo.getBtypeCode2());
		ResumeVO vo11=resumeService.selectBybtype3(vo.getBtypeCode3());
		ResumeVO vo12=resumeService.selectByfirst(vo.getFirstCode());
		ResumeVO vo13=resumeService.selectBysecond(vo.getSecondCode());
		ResumeVO vo14=resumeService.selectBythird(vo.getThirdCode());
		List<ResumeVO> vo15=peopleinfoService.selectCareer(map);
		logger.info("상세보기 결과 vo={}", vo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("vo1", vo1);
		model.addAttribute("vo2", vo2);
		model.addAttribute("vo3", vo3);
		model.addAttribute("vo4", vo4);
		model.addAttribute("vo5", vo5);
		model.addAttribute("vo6", vo6);
		model.addAttribute("vo7", vo7);
		model.addAttribute("vo8", vo8);
		model.addAttribute("vo9", vo9);
		model.addAttribute("vo10", vo10);
		model.addAttribute("vo11", vo11);
		model.addAttribute("vo12", vo12);
		model.addAttribute("vo13", vo13);
		model.addAttribute("vo14", vo14);
		model.addAttribute("vo15", vo15);
	
		return "peopleinfo/peopleinfodetail";
	}
	@RequestMapping("/peopleinfowhere.do")
	public String peopleinfowhere() {
		logger.info("조건지정");
		return "peopleinfo/peopleinfowhere";
	}		
}

