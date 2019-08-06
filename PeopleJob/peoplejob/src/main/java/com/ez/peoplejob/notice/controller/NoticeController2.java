package com.ez.peoplejob.notice.controller;


import java.util.List;
import java.util.Map;

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

import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.common.WebUtility;
import com.ez.peoplejob.notice.model.NoticeService;
import com.ez.peoplejob.notice.model.NoticeVO;

@Controller
public class NoticeController2 {
	private Logger logger=LoggerFactory.getLogger(NoticeController2.class);

	@Autowired private NoticeService noticeService;
	
	@RequestMapping("/notice/list.do")
	public String list(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		
		logger.info("공지 글 목록 파라미터 searchVo={}" ,searchVo);
		
		
		//2
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo에 페이징 관련 변수 셋팅
		searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setBlockSize(WebUtility.BLOCK_SIZE);
		logger.info("셋팅 후 searchVo={}", searchVo);
		
		//[3] 조회처리
		List<Map<String, Object>> list=noticeService.selectAll(searchVo);
		logger.info("공지 글 목록 결과, list.size={}",list.size());
		
		//[4] 전체 레코드 개수 조회
		int totalRecord=0;
		totalRecord=noticeService.selectTotalCount(searchVo);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}", totalRecord);
		
		//[5] PaginationInfo에 totalRecord 값 셋팅
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "notice/list";
	}
	

	@RequestMapping("/notice/countUpdate.do")
	public String countUpdate(@RequestParam(defaultValue = "0") int notifyCode, 
			Model model) {
		logger.info("조회수 증가, 파라미터 notifyCode={}", notifyCode);
		
		if(notifyCode==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/notice/list.do");
			
			return "common/message";
		}
		
		int cnt= noticeService.updateReadCount(notifyCode);
		logger.info("조회수 증가 결과, cnt={}", cnt);
		
		return "redirect:/notice/detail.do?notifyCode="+notifyCode;
	}
	
	
		@RequestMapping("/notice/detail.do")
		public String detail(@RequestParam(defaultValue = "0") int notifyCode, 
				ModelMap model) {
			logger.info("글 상세보기, 파라미터 notifyCode={}", notifyCode);
			
			if(notifyCode==0) {
				model.addAttribute("msg", "잘못된 url입니다.");
				model.addAttribute("url", "/notice/list.do");
				
				return "common/message";
			}
			
			NoticeVO noticeVo=noticeService.selectByNo(notifyCode);
			logger.info("상세보기 결과 vo={}", noticeVo);
			
			model.addAttribute("vo", noticeVo);
			
			return "notice/detail";
		}
		@RequestMapping("/notice/notice_view.do")
		public String notice_view(@ModelAttribute SearchVO searchVo,Model model) {
			logger.info("메인 채용공고 임포트");
			PaginationInfo pagingInfo=new PaginationInfo();
			pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
			pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
			pagingInfo.setCurrentPage(searchVo.getCurrentPage());
			
			//[2] SearchVo에 페이징 관련 변수 셋팅
			searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
			searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
			searchVo.setBlockSize(WebUtility.BLOCK_SIZE);
			logger.info("셋팅 후 searchVo={}", searchVo);
			List<Map<String, Object>> list=noticeService.selectAll(searchVo);
			logger.info("공지 글 목록 결과, list.size={}",list.size());
			
			//[4] 전체 레코드 개수 조회
			int totalRecord=0;
			totalRecord=noticeService.selectTotalCount(searchVo);
			logger.info("전체 레코드 개수 조회 결과, totalRecord={}", totalRecord);
			
			//[5] PaginationInfo에 totalRecord 값 셋팅
			//3
			model.addAttribute("list", list);
			return "notice/notice_view";
		}
	}

