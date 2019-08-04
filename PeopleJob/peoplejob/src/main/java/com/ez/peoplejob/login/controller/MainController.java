package com.ez.peoplejob.login.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.peoplejob.board.model.BoardService;
import com.ez.peoplejob.board.model.BoardVO;
import com.ez.peoplejob.jobopening.model.JobopeningService;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.member.model.MemberVO;
import com.ez.peoplejob.payment.model.PaymentService;
import com.ez.peoplejob.popup.model.PopupService;
import com.ez.peoplejob.popup.model.PopupVO;

@Controller
public class MainController {

	private Logger logger=LoggerFactory.getLogger(MainController.class);
	@Autowired private PaymentService paymentService;
	@Autowired private JobopeningService jobService;
	@Autowired private MemberService memberService;
	@Autowired private BoardService BoardService;
	@Autowired private PopupService popupService;
	
	@RequestMapping("/main/mainindex.do")
	public String mainindex(Model model,HttpSession session) {
		logger.info("<<메인 화면 보여주기>>");
		String memberid=(String)session.getAttribute("memberid");
		if(memberid!=null) {
			MemberVO memVo=memberService.selectByUserid(memberid);
			logger.info("memberVo={}",memVo);
			model.addAttribute("memVo",memVo);
			
		}
		
		List<Map<String, Object>> list=paymentService.selectMainAdvertiseByServiceCode(1);
		logger.info("서비스 결제내역 list.size={}",list.size());
		List<Map<String, Object>> deadlineList=jobService.deadlineimminentBymonth();
		logger.info("마감 임박 공채 리스트내역 deadlineList.size={}",deadlineList.size());
		List<Map<String, Object>> randomList=jobService.selectRandom();
		logger.info("비회원 추천공고 랜덤5 randomList.size={}",randomList.size());
		
		model.addAttribute("randomList",randomList);
		model.addAttribute("list",list);
		model.addAttribute("deadlineList",deadlineList);
		
		//popup을 위한 추가 -옥환
		//활성화 된것만 가져오기
		List<PopupVO> popupList=popupService.selectUsageY();
		logger.info("popup은 popupList.size={}",popupList.size());
		
		model.addAttribute("popupList", popupList);
		
		return "main/mainindex";
	}
	
	@RequestMapping("/main/chkLchar.do")
	public String chkLchar() {
		logger.info("글자수 세기 화면 보여주기");
		return "main/chkLchar";
		
	}
	
	@RequestMapping("/main/chkgrammer.do")
	public String chkgrammer() {
		logger.info("글자수 세기 화면 보여주기");
		return "main/chkgrammer";
		
	}
	
	@RequestMapping("/references/FreeLecture.do")
	public String freelecture() {
		logger.info("자료실-무료강좌 화면 보여주기");
		return "references/FreeLecture";
		
	}
	
	@RequestMapping("/references/news.do")
	public String news() {
		logger.info("취업뉴스 화면 보여주기");
		return "references/news";
		
	}
	
	@RequestMapping("/references/news_detail.do")
	public String newsdetail() {
		logger.info("취업뉴스 상세보기화면 보여주기");
		return "references/news_detail";
		
	}
	


	
}
