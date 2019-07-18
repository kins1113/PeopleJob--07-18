package com.ez.peoplejob.payment.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.jobopening.model.JobopeningService;
import com.ez.peoplejob.jobopening.model.JobopeningVO;
import com.ez.peoplejob.login.controller.LoginController;
import com.ez.peoplejob.member.model.CompanyVO;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.member.model.MemberVO;
import com.ez.peoplejob.payment.model.PaymentService;
import com.ez.peoplejob.payment.model.PaymentVO;

@Controller

public class PaymentController {
	private Logger logger=LoggerFactory.getLogger(LoginController.class);
	@Autowired private PaymentService paymentService;
	@Autowired private MemberService memberService;
	@Autowired private JobopeningService jobService;
	
	@RequestMapping("/service/success.do")
	public String sucesspay(HttpSession session, Model model) {
		logger.info("결제 성공시 보여주는 userpage화면");
		String memberId=(String) session.getAttribute("memberid");
		MemberVO memberVo=memberService.selectByUserid(memberId);
		
		List<JobopeningVO> list=jobService.selectJobopeningBycomcode(memberVo.getCompanyCode());
		logger.info("company_code로 조회한 채용공고 list.size={}",list.size());
		
		if(list.size()<1) {
			model.addAttribute("msg","등록된 채용공고가 없습니다.");
			model.addAttribute("url","/service/payment.do");
			
			return "common/message";
		}else {
			PaymentVO paymentVo=new PaymentVO();
			paymentVo.setMemberCode(memberVo.getMemberCode());
			paymentVo.setPaymentway("카드");
			paymentVo.setProgress("결제완료");
			
			int cnt=paymentService.insertPayService1(paymentVo);
			logger.info("결제완료 cnt={}",cnt);
			
			return "redirect:/mypage/user/userpage.do";
		}
		
	}
	
	@RequestMapping("/service/payment.do")
	public String importInfo(HttpSession session, Model model) {
		String membername=(String) session.getAttribute("memberName");
		String memberId=(String)session.getAttribute("memberid");
		logger.info("ajax로 결제내역 확인을 위한 정보 보내주기, membername={}",membername);
		
		/*List<Map<String , Object>> list=memberService.selectPayInfo(membername);
		model.addAttribute("lsit",list); */
		
		if(memberId!=null && !memberId.isEmpty()) {
			MemberVO memberVo=memberService.selectByUserid(memberId);
			logger.info("회원 정보 memberVo={}",memberVo);
			CompanyVO companyVo=memberService.selectCompanyById(memberId);
			logger.info("기업 정보 companyVo={}",companyVo);
			List<JobopeningVO> list=jobService.selectJobopeningBycomcode(memberVo.getCompanyCode());
			logger.info("company_code로 조회한 채용공고 list.size={}",list.size());
			
			model.addAttribute("memberVo",memberVo);
			model.addAttribute("companyVO",companyVo);
			model.addAttribute("list",list);
			
		}
			return "service/payment";
		
	}
	
	@RequestMapping(value="/mypage/corp/paymentDetail.do", method = RequestMethod.POST)
	public String cancelpay(@RequestParam int paymentCode, Model model) {
		logger.info("결제 취소 파라미터 paymentCode={}",paymentCode);

		PaymentVO paymentVo=paymentService.selectPaymentByCode(paymentCode);
		logger.info("paymentCode로 select 결과 paymentVo={}",paymentVo);
		
		int cnt=0;
		String msg="", url="/mypage/corp/paymentDetail.do";
		if(paymentVo.getProgress().equals("결제완료")) {
			cnt=paymentService.cancelPay(paymentCode);
			logger.info("결제 취소 처리 결과 cnt={}",cnt);
				if(cnt>0) {
					msg="결제 취소되었습니다.";
				}else {
					msg="결제 취소 실패";
				}
			
		}else if(paymentVo.getProgress().equals("결제취소요청")){
			msg="이미 결제 취소 요청 하신 상품입니다.";
		}else { //결제취소완료
			msg="결제취소 완료된 상품입니다.";
		}
		
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
}
