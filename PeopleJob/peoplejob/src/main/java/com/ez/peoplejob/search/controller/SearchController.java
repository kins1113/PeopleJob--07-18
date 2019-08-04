package com.ez.peoplejob.search.controller;

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

import com.ez.peoplejob.common.FileUploadUtility;
import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.common.WebUtility;
import com.ez.peoplejob.jobopening.controller.JobopeningController;
import com.ez.peoplejob.jobopening.model.JobopeningService;
import com.ez.peoplejob.jobopening.model.JobopeningVO;
import com.ez.peoplejob.member.model.CompanyService;
import com.ez.peoplejob.member.model.CompanyVO;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.member.model.MemberVO;
import com.ez.peoplejob.tableaply.model.TableaplyService;
@RequestMapping("/search")
@Controller
public class SearchController {
	private Logger logger=LoggerFactory.getLogger(JobopeningController.class);
	@Autowired JobopeningService jobopeningService;
	@Autowired MemberService memberService;
	@Autowired CompanyService companyService;
	@Autowired TableaplyService tableaplyService;
	@Autowired SearchService searchService;
	@RequestMapping("/search_list.do")
	public String jobopening_list(
			@RequestParam(required=false) String[] localcheck1,
			@RequestParam(required=false) String[] workway1,
			@RequestParam(required=false) String[] payway1,
			@RequestParam(required=false) String[] academicCondition1,
			@RequestParam(required = false) String[] career1,
			@RequestParam(required=false,defaultValue = "10") int recordCountPerPage,
			@RequestParam(required=false) String keyword,
			HttpSession session,
			@ModelAttribute SearchVO searchVo,//채용공고
			@ModelAttribute SearchVO searchVo2,//기업정보 
			Model model) {
		String id=(String)session.getAttribute("memberid");
		if(id==null) {
			id="비회원";
		}
		
		MemberVO mvo=memberService.selectByUserid(id);
		logger.info("로그인한 회원정보 mvo={}",mvo);
		logger.info("채용공고 리스트");
		//1]PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(recordCountPerPage);
		//pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		//pagingInfo.setRecordCountPerPage(searchVo.getRecordCountPerPage());
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		PaginationInfo pagingInfo2=new PaginationInfo();
		pagingInfo2.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo2.setRecordCountPerPage(recordCountPerPage);
		//pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		//pagingInfo.setRecordCountPerPage(searchVo.getRecordCountPerPage());
		pagingInfo2.setCurrentPage(searchVo2.getCurrentPage());
		
		//2]SearchVo에 페이징 관련 변수 세팅
		searchVo.setRecordCountPerPage(recordCountPerPage);
		//searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		searchVo2.setRecordCountPerPage(recordCountPerPage);
		//searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		searchVo2.setFirstRecordIndex(pagingInfo2.getFirstRecordIndex());
		logger.info("셋팅 후 serchVo={}",searchVo);
		logger.info("셋팅 후 serchVo2={}",searchVo2);
		
		List<JobopeningVO> list=new ArrayList<JobopeningVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		logger.info("localcheck1={},workway1={}",localcheck1,workway1);
		logger.info("payway1={},academicCondition1={}",payway1,academicCondition1);
		logger.info("career1={}",career1);
		logger.info("searchVo.getFirstRecordIndex()={},getRecordCountPerPage={}",searchVo.getFirstRecordIndex(),searchVo.getRecordCountPerPage());
			map.put("localcheck1", localcheck1);
			map.put("workway1", workway1);
			map.put("payway1", payway1);
			map.put("academicCondition1", academicCondition1);
			map.put("career1", career1);
			map.put("firstRecordIndex", searchVo.getFirstRecordIndex());
			map.put("recordCountPerPage", searchVo.getRecordCountPerPage());
			map.put("keyword", keyword);
			logger.info("map={}",map);
		logger.info("searchVo2.getFirstRecordIndex()={},getRecordCountPerPage={}",searchVo2.getFirstRecordIndex(),searchVo2.getRecordCountPerPage());
		map2.put("firstRecordIndex", searchVo2.getFirstRecordIndex());
		map2.put("recordCountPerPage", searchVo2.getRecordCountPerPage());
		map2.put("keyword", keyword);
		logger.info("map2={}",map2);
		list = searchService.searchjobopen(map);
		logger.info("공고 검색 결과: list.size()={}",list.size());
		//list=jobopeningService.selectJobOpen(searchVo);
		//logger.info("공고 list.size={}",list.size());
		List<CompanyVO> clist=new ArrayList<CompanyVO>();
		for(int i=0;i<list.size();i++){
			clist.add(companyService.selectcompany(list.get(i).getCompanyCode()));
			logger.info("clist[{}]={}",i,clist.get(i).getCompanyname());
		}
		logger.info("clist.size={}",clist.size());
		List<CompanyVO> comlist=searchService.searchcompany(map2);
		int totalRecord=0;
		//totalRecord=jobopeningService.selectTotalCount(map);
		totalRecord=searchService.cntsearch(map);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}",totalRecord);
		
		int totalRecord2=0;
		//totalRecord=jobopeningService.selectTotalCount(map);
		totalRecord2=searchService.cntcompany(map2);
		logger.info("전체 레코드 개수 조회 결과, totalRecord2={}",totalRecord2);
		
		//5]PaginationInfo에 totalRecord값셋팅
		pagingInfo.setTotalRecord(totalRecord);
		pagingInfo2.setTotalRecord(totalRecord2);
		//3
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("pagingInfo2", pagingInfo2);
		model.addAttribute("list",list);
		model.addAttribute("clist",clist);
		model.addAttribute("comlist",comlist);
		model.addAttribute("mvo", mvo);
		return "search/search_list";
	}
	@RequestMapping("/companyInfo.do")
	public String jobopening_view(@RequestParam (defaultValue = "0")int companyCode,HttpSession session,Model model) {
		logger.info("기업정보보기 파라미터 jobopening={}",companyCode);
		String id=(String)session.getAttribute("memberid");
		if(id==null) {
			id="비회원";
		}
		MemberVO mvo=memberService.selectByUserid(id);
		CompanyVO cvo=companyService.selectcompany(companyCode);
		logger.info("로그인한 회원 정보 mvo={}",mvo);
		logger.info("해당기업정보 cvo={}",cvo);
		model.addAttribute("mvo", mvo);
		model.addAttribute("cvo", cvo);
		return "search/companyInfo";
	}
}
