package com.ez.peoplejob.payment.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.common.WebUtility;
import com.ez.peoplejob.jobopening.model.JobopeningListVO;
import com.ez.peoplejob.jobopening.model.JobopeningService;
import com.ez.peoplejob.jobopening.model.JobopeningVO;
import com.ez.peoplejob.login.controller.LoginController;
import com.ez.peoplejob.member.model.CompanyVO;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.member.model.MemberVO;
import com.ez.peoplejob.payment.model.PaymentService;
import com.ez.peoplejob.payment.model.PaymentVO;
import com.ez.peoplejob.service.model.ServiceService;
import com.ez.peoplejob.service.model.ServiceVO;

@Controller

public class PaymentController {
	private Logger logger=LoggerFactory.getLogger(LoginController.class);
	@Autowired private MemberService memberService;
	@Autowired private PaymentService paymentService;
	@Autowired private JobopeningService jobService;
	@Autowired private ServiceService serviceService;
	
	@RequestMapping("/service/success.do")
	public String sucesspay(HttpSession session, Model model, @RequestParam int[] jobno) {
		logger.info("결제 성공시 보여주는 화면 파라미터, jobno={}",jobno);
		String memberId=(String) session.getAttribute("memberid");
		MemberVO memberVo=memberService.selectByUserid(memberId);
		
		int cnt=0;
		for(int i=0;i<jobno.length;i++) {
			logger.info(i+":"+jobno[i]);
			
			PaymentVO paymentVo=new PaymentVO();
			paymentVo.setJobopening(jobno[i]);
			paymentVo.setServiceCode(1);
			paymentVo.setMemberCode(memberVo.getMemberCode());
			
			//cnt=paymentService.insertPayment(paymentVo);
		}
		//logger.info(" payment 등록 결과 cnt={}",cnt);
		
		return "service/payment";
		
		
	}
	
	@RequestMapping("/service/payment.do")
	public String importInfo(HttpSession session, Model model) {
		String membername=(String) session.getAttribute("memberName");
		String memberId=(String)session.getAttribute("memberid");
		logger.info("결제내역 확인을 위한 정보 보내주기, membername={}",membername);
		
		/*List<Map<String , Object>> list=memberService.selectPayInfo(membername);
		model.addAttribute("lsit",list); */
		
		if(memberId!=null && !memberId.isEmpty()) {
			MemberVO memberVo=memberService.selectByUserid(memberId);
			logger.info("회원 정보 memberVo={}",memberVo);
			CompanyVO companyVo=memberService.selectCompanyById(memberId);
			logger.info("기업 정보 companyVo={}",companyVo);
			
			List<JobopeningVO> list=jobService.selectJobopeningBycomcode(memberVo.getCompanyCode());
			logger.info("company_code로 조회한 채용공고 list.size={}",list.size());
			ServiceVO serviceVo1=serviceService.selectServiceByCode(1);
			logger.info("serviceCode로 service={}",serviceVo1);
			List<ServiceVO> serviceList=serviceService.selectAll();
			logger.info("serviceList.size={}",serviceList.size()+"\n");
			
			
			model.addAttribute("serviceVo1",serviceVo1);
			
			model.addAttribute("serviceList",serviceList);
			model.addAttribute("memberVo",memberVo);
			model.addAttribute("companyVo",companyVo);
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
	
	@RequestMapping("/service/ListForPay.do")
	public String ListForPay() {
		
		return "service/ListForPay";
	}
	
	
	@RequestMapping(value="/service/ajaxpayList.do", method = RequestMethod.POST)
	@ResponseBody
	public Boolean ajaxpayList(@ModelAttribute JobopeningListVO job,@RequestParam int memberCode, @RequestParam int serviceCode) {
		logger.info("결제할 공고 리스트 파라미터, jobopeningListVo={}",job);
		logger.info("결제할 공고 리스트 파라미터 memberCode={}, serviceCode={}",memberCode, serviceCode);
		
		List<JobopeningVO> list=job.getJobItems();
		
		int count=0;
		for(int i=0;i<list.size();i++) {
			JobopeningVO jobvo=list.get(i);
			logger.info("{} : jobNo={}",i, jobvo.getJobopening());
			
			count+=paymentService.getCountByJobopening(jobvo.getJobopening());
		}
		logger.info("이미 결제한 상품인지 count={}",count);
		
		Boolean bool=false;
		if(count>0) {
			bool=false;
		}else {
			bool=true;
			
		}
		
		logger.info("bool={}",bool+"\n");
		return bool;
	}
	
	@RequestMapping(value="/service/paysuccess.do", method = RequestMethod.POST)
	public String paysuccess(@ModelAttribute JobopeningListVO job, @RequestParam int memberCode, @RequestParam int serviceCode ) {
		logger.info("결제 성공, jobopeningListVo={}",job);
		logger.info("결제 성공 memberCode={}, serviceCode={}",memberCode, serviceCode);
		
		List<JobopeningVO> list=job.getJobItems();
		
		int cnt=0;
		for(int i=0;i<list.size();i++) {
			JobopeningVO jobvo=list.get(i);
			logger.info("{}번째 : jobNo={}",i, jobvo.getJobopening());
			
			cnt=paymentService.insertPayment(list, serviceCode, memberCode);
			
		}
		logger.info("payment 등록 결과 cnt={}",cnt);
		
		return "mypage/corp/paymentDetail";
	}
	
	@RequestMapping("/manager/payment/list.do")
	public String list(@ModelAttribute SearchVO searchVo, 
			@RequestParam(required = false) String startDay,
			@RequestParam(required = false) String endDay,
			Model model
			) {
		//1
		
		logger.info("결제 목록 파라미터 searchVo={}" ,searchVo);
		logger.info("결제 목록 파라미터 startDay={}, endDay={}" ,startDay,endDay);
		
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
		
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("searchVo", searchVo);
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		
		//[3] 조회처리
		List<Map<String, Object>> list=paymentService.selectAll(map);
		logger.info("결제 목록 결과, list.size={}",list.size());
		
		//[4] 전체 레코드 개수 조회
		int totalRecord=0;
		totalRecord=paymentService.selectTotalCount(searchVo);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}", totalRecord);
		
		//[5] PaginationInfo에 totalRecord 값 셋팅
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "manager/payment/list";
	}
	
		
	/*
	@RequestMapping("manager/payment/list.do")
	public String list(Model model) {
		
		List<PaymentVO>list=paymentService.selectAll();
		logger.info("결제 목록 결과 , list.size={}",list.size());
		
		model.addAttribute("list",list);
		
		return "manager/payment/list";
	}
	*/
}
