package com.ez.peoplejob.scrap.controller;

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
import com.ez.peoplejob.jobopening.model.JobopeningService;
import com.ez.peoplejob.jobopening.model.JobopeningVO;
import com.ez.peoplejob.member.model.CompanyService;
import com.ez.peoplejob.member.model.CompanyVO;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.member.model.MemberVO;
import com.ez.peoplejob.scrap.model.ScrapService;
import com.ez.peoplejob.scrap.model.ScrapVO;
@RequestMapping("/scrap")
@Controller
public class ScrapController {
	private Logger logger=LoggerFactory.getLogger(ScrapController.class);
	@Autowired ScrapService scrapService;
	@Autowired MemberService memberService;
	@Autowired JobopeningService jobopeningService;
	@Autowired CompanyService companyService;
	@RequestMapping("/insertscrap.do")
	public String insert_scrap(@RequestParam int jobopening,
			@RequestParam int member_code,
			Model model) {
		logger.info("스크랩 추가");
		ScrapVO vo=new ScrapVO();
		vo.setJobopeningCode(jobopening);
		vo.setScrapmemberCode(member_code);
		int cnt=scrapService.insertScrap(vo);
		String msg="",url="/scrap/scrap_list.do";
		if(cnt>0) {
			msg="추가성공";
		}else {
			msg="추가실패";
			url="/company/jobopening_view.do?jobopening="+jobopening;
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	@RequestMapping("/scrap_list.do")
	public String scrap_list(
		@RequestParam(required=false) String[] localcheck1,
		@RequestParam(required=false) String[] workway1,
		@RequestParam(required=false) String[] payway1,
		@RequestParam(required=false) String[] academicCondition1, HttpSession session,
		@ModelAttribute SearchVO searchVo,
		Model model) {
		String id=(String)session.getAttribute("memberid");
		if(id==null) {
			id="비회원";
		}
		MemberVO mvo=memberService.selectByUserid(id);
		logger.info("로그인한 회원정보 mvo={}",mvo);
		List<ScrapVO> slist=scrapService.selectScrap(mvo.getMemberCode());
		int[] jobopening = new int[slist.size()];
		for(int i=0;i<slist.size();i++) {
			jobopening[i]=slist.get(i).getJobopeningCode();
			logger.info("jobopening={}",jobopening[i]);
		}
		logger.info("회원이 스크랩한 slist={}",slist);
		logger.info("마이 스크랩 리스트");
		//1]PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//2]SearchVo에 페이징 관련 변수 세팅
		searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("셋팅 후 serchVo={}",searchVo);
		List<JobopeningVO> list=new ArrayList<JobopeningVO>();
		int totalRecord=0;
		List<CompanyVO> clist=new ArrayList<CompanyVO>();
		if(slist.size()!=0) {
			Map<String, Object> map = new HashMap<String, Object>();
			logger.info("localcheck1={},workway1={}",localcheck1,workway1);
			logger.info("payway1={},academicCondition1={}",payway1,academicCondition1);
			logger.info("jobopening={}",jobopening);
			logger.info("searchVo.getFirstRecordIndex()={},getRecordCountPerPage={}",searchVo.getFirstRecordIndex(),searchVo.getRecordCountPerPage());
			map.put("localcheck1", localcheck1);
			map.put("workway1", workway1);
			map.put("payway1", payway1);
			map.put("academicCondition1", academicCondition1);
			map.put("firstRecordIndex", searchVo.getFirstRecordIndex());
			map.put("recordCountPerPage", searchVo.getRecordCountPerPage());
			map.put("jobopening",jobopening);
			logger.info("map={}",map);
			list = scrapService.selectScrapJobOpen(map);
			logger.debug("상품 검색 결과: list.size()={}",list.size());		
			for(int i=0;i<list.size();i++){
				clist.add(companyService.selectcompany(list.get(i).getCompanyCode()));
				logger.info("clist[{}]={}",i,clist.get(i).getCompanyname());
			}
			//list=jobopeningService.selectJobOpen(searchVo);
			//logger.info("공고 list.size={}",list.size());
			totalRecord=scrapService.selectTotalCount(map);
			//totalRecord=jobopeningService.selectTotalCount(map);
			logger.info("전체 레코드 개수 조회 결과, totalRecord={}",totalRecord);
		}else {
			list=null;
		}
		
		
		//5]PaginationInfo에 totalRecord값셋팅
		pagingInfo.setTotalRecord(totalRecord);
		//3
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("mvo", mvo);
		model.addAttribute("clist",clist);
		return "scrap/scrap_list";
	}
	
	@RequestMapping("/deletescrap.do")
	public String del_scrap(@RequestParam int[]jobopening,Model model) {
		logger.info("스크랩 삭제 파라미터 jobopening={}",jobopening);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("jobopening", jobopening);
		int cnt=scrapService.deleteScrap(map);
		String msg="",url="/scrap/scrap_list.do";
		if(cnt>0) {
			msg="삭제성공";
		}else {
			msg="삭제실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
		
	}
}
