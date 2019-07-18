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
public class NoticeController {
	private Logger logger=LoggerFactory.getLogger(NoticeController.class);

	@Autowired private NoticeService noticeService;
	
	@RequestMapping(value="/manager/notice/write.do", method = RequestMethod.GET)
	public String write_get() {
		
		//1
		logger.info("공지사항 쓰기 화면 보여주기");
		
	
		
		//2

		//3
		
		return "manager/notice/write";
	}
	
	@RequestMapping(value="/notice/write.do",method = RequestMethod.POST)
	public String write_post(@ModelAttribute NoticeVO vo, Model model) {
		//1
		logger.info("공지사항 쓰기 처리 파라미터 vo={}",vo );
		
		//2
		int cnt=noticeService.insertNotice(vo);
		logger.info("글쓰기 결과 cnt={}",cnt);
		
		//3
		
		String msg="", url="";
		if(cnt>0) {
			msg="공지사항 등록 완료";
			url="/manager/notice/list.do";
			
		}else {
			msg="공지사항 등록 실패";
			url="/notice/write.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		//뷰페이지 리턴
		return "common/message";
		
	}
	
	@RequestMapping("/manager/notice/list.do")
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
		
		return "manager/notice/list";
	}
	

	@RequestMapping("/manager/notice/countUpdate.do")
	public String countUpdate(@RequestParam(defaultValue = "0") int notifyCode, 
			Model model) {
		logger.info("조회수 증가, 파라미터 notifyCode={}", notifyCode);
		
		if(notifyCode==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/manager/notice/list.do");
			
			return "common/message";
		}
		
		int cnt= noticeService.updateReadCount(notifyCode);
		logger.info("조회수 증가 결과, cnt={}", cnt);
		
		return "redirect:/manager/notice/detail.do?notifyCode="+notifyCode;
	}
	
	
		@RequestMapping("/manager/notice/detail.do")
		public String detail(@RequestParam(defaultValue = "0") int notifyCode, 
				ModelMap model) {
			logger.info("글 상세보기, 파라미터 notifyCode={}", notifyCode);
			
			if(notifyCode==0) {
				model.addAttribute("msg", "잘못된 url입니다.");
				model.addAttribute("url", "/manager/notice/list.do");
				
				return "common/message";
			}
			
			NoticeVO noticeVo=noticeService.selectByNo(notifyCode);
			logger.info("상세보기 결과 vo={}", noticeVo);
			
			model.addAttribute("vo", noticeVo);
			
			return "manager/notice/detail";
		}
	
	
	

		
		@RequestMapping(value="/manager/notice/edit.do", method=RequestMethod.GET)
		public String edit_get(@RequestParam(defaultValue = "0") int notifyCode, 
				ModelMap model) {
			logger.info("수정화면, 파라미터 notifyCode={}", notifyCode);
			
			if(notifyCode==0) {
				model.addAttribute("msg", "잘못된 url입니다.");
				model.addAttribute("url", "/manager/notice/list.do");
				return "common/message";
			}
			
			NoticeVO noticeVo=noticeService.selectByNo(notifyCode);
			logger.info("수정화면 조회 결과, vo={}", noticeVo);
			
			model.addAttribute("vo", noticeVo);
			return "manager/notice/edit";
		}
		
		@RequestMapping(value="/manager/notice/edit.do", method=RequestMethod.POST)
		public String edit_post(@ModelAttribute NoticeVO noticeVo, Model model) {
			logger.info("글수정 처리, 파라미터 noticeVo={}", noticeVo);
			
			String msg="", url="/manager/notice/edit.do?notifyCode="+noticeVo.getNotifyCode();
				int cnt=noticeService.updateNotice(noticeVo);
				
				if(cnt>0) {
					msg="글 수정되었습니다.";
					url="/manager/notice/detail.do?notifyCode="+noticeVo.getNotifyCode();
				}else {
					msg="글 수정 실패.";
				}
		
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		}
		
	@RequestMapping("/manager/notice/noticeDel.do")
		public String noticeDel(@RequestParam String[] noChk, Model model) {
		
		for(int i=0; i<noChk.length;i++) {
			logger.info("{}번째 넘어온값={}",i,noChk[i]);
		}
		int cnt=noticeService.deleteNotice(noChk);
		String msg="", url="/manager/notice/list.do";
		
		if(cnt>0) {
			msg=cnt+"건 삭제 성공";
		}else {
			msg="삭제 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	

	
	
	}

