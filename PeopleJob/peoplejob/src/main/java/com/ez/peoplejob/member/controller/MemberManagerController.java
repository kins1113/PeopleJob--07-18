package com.ez.peoplejob.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.manager.member.model.MemberServiceAdmin;
import com.ez.peoplejob.member.model.MemberVO;

@Controller
public class MemberManagerController {

	private Logger logger=LoggerFactory.getLogger(MemberManagerController.class);
	@Autowired
	private MemberServiceAdmin memberserviceAdmin;
	
	@RequestMapping("/manager/member/memberList.do")
	public String manager_memberList(@ModelAttribute MemberVO memberVo,
			@RequestParam(required = false) String startDay,
			@RequestParam(required = false) String endDay,
			@RequestParam(required = false) String filterKey,
			@RequestParam(required = false) String filterCode,
			@RequestParam(required = false) String authorityCk,
			Model model) {
		logger.info("일반회원 관리 보여주기 파라미터 memberVo={}",memberVo);
		logger.info("파라미터 startDay={}, endDay={}",startDay,endDay);
		logger.info("파라미터 filterCode={}, filterKey={}",filterCode,filterKey);
		logger.info("파라미터 authorityCk={}",authorityCk);
		
		Map<String, Object> map = new HashMap<String, Object>();
		//날짜 처리
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		map.put("filterKey", filterKey);
		map.put("filterCode", filterCode);
		map.put("authorityCk", authorityCk);
		
		//페이징 처리
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setCurrentPage(memberVo.getCurrentPage());
		if(memberVo.getRecordCountPerPage()!=0) {
			pagingInfo.setRecordCountPerPage(memberVo.getRecordCountPerPage());
		}else {
			pagingInfo.setRecordCountPerPage(10);
		}
		pagingInfo.setBlockSize(5);
		
		memberVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		memberVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		//검색어 처리
		

		map.put("memberVo", memberVo);
		//리스트 조회
		List<MemberVO> memList=null;
		List<Map<String, Object>> comList=null;
		if("member".equals(authorityCk)) {
			memList =memberserviceAdmin.selectAllManager(map);	
			logger.info("일반 회원 조회 memList.size={}",memList.size());
		}else if("company".equals(authorityCk)) {
			comList=memberserviceAdmin.selectCompanyManager(map);
			logger.info("일반 회원 조회 comList.size={}",comList.size());
		}
			
		
		
		
		//토탈 레코드 조회
		int totalRecord=0;
		if("member".equals(authorityCk)) {
			totalRecord=memberserviceAdmin.getTotalRecord(map);
			logger.info("일반 회원 조회 totalRecord={}",totalRecord);
		}else if("company".equals(authorityCk)) {
			totalRecord=memberserviceAdmin.getTotalRecordCompanyManager(map);
			logger.info("기업 회원 조회 totalRecord={}",totalRecord);
		}
		pagingInfo.setTotalRecord(totalRecord);
		
		
		
		if("member".equals(authorityCk)) {
			model.addAttribute("list",memList);
		}else if("company".equals(authorityCk)) {
			model.addAttribute("list",comList);
		}
		model.addAttribute("pagingInfo", pagingInfo);

		String url="";
		if("member".equals(authorityCk)) {
			url="manager/member/memberList";
		}else if("company".equals(authorityCk)) {
			url="manager/company/companyList";
		}
		logger.info("회원 보여주기 결과 url={}",url);
		
		return url;
	}
		
	@RequestMapping("/manager/member/authorityChange.do")
	@ResponseBody
	public int authorityChange(@RequestParam(defaultValue = "0")int authorityCode,
			@RequestParam(defaultValue = "0") int memberCode) {
		logger.info("기업회원 권한 승인 처리 , 파라미터 authorityCode={}, memberCode={}",authorityCode,memberCode );
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("authorityCode", authorityCode);
		map.put("memberCode", memberCode);
		
		int re=memberserviceAdmin.updateAuthorityManager(map);
		logger.info("권한 승인 처리 결과 re={} ",re);
		if(re>0) {
			if(authorityCode==2) {
				re=MemberServiceAdmin.AUTHORITY_COMPAMY_AFTER;
			}else if(authorityCode==3) {
				re=MemberServiceAdmin.AUTHORITY_COMPANY_BEFOR;
			}
		}
		
		return re;
	}

}
