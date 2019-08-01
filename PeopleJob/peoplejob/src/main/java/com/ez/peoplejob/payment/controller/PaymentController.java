package com.ez.peoplejob.payment.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.ez.peoplejob.payment.model.PaymentListVO;
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
		
		List<ServiceVO> serviceList=serviceService.selectAll();
		logger.info("serviceList.size={}",serviceList.size());
		model.addAttribute("serviceList",serviceList);
		
		if(memberId!=null && !memberId.isEmpty()) {
			MemberVO memberVo=memberService.selectByUserid(memberId);
			logger.info("회원 정보 memberVo={}",memberVo);
			CompanyVO companyVo=memberService.selectCompanyById(memberId);
			logger.info("기업 정보 companyVo={}",companyVo);
			
			List<JobopeningVO> list=jobService.selectJobopeningBycomcode(memberVo.getCompanyCode());
			logger.info("company_code로 조회한 채용공고 list.size={}",list.size());
			ServiceVO serviceVo1=serviceService.selectServiceByCode(1);
			logger.info("serviceCode로 service={}",serviceVo1);
			
			
			
			model.addAttribute("serviceVo1",serviceVo1);
			
			
			model.addAttribute("memberVo",memberVo);
			model.addAttribute("companyVo",companyVo);
			model.addAttribute("list",list);
			
		}
			return "service/payment";
		
	}
	
	@RequestMapping(value="/mypage/corp/paymentDetail.do", method = RequestMethod.GET)
	public String paymentDetail(HttpSession session, Model model) {
		String memberid=(String)session.getAttribute("memberid");
		List<Map<String , Object>> list=paymentService.selectPaymentById(memberid);
		logger.info("결제 내역 list.size={}",list.size());
		
		List<Map<String , Object>> Timelist=paymentService.selectPayByTime(memberid);
		logger.info("마이페이지 결제 내역 Timelist.size={}",Timelist.size());
		
		model.addAttribute("list",list);
		model.addAttribute("Timelist",Timelist);
		
		return "mypage/corp/paymentDetail";
	}
	
	
	@RequestMapping(value="/mypage/corp/paymentDetail.do", method = RequestMethod.POST)
	public String cancelpay(@RequestParam int memberCode,@RequestParam String paydate, Model model) {
		logger.info("결제 취소 파라미터 memberCode={}, paydate={}",memberCode,paydate);

		List<PaymentVO> confirmlist=paymentService.selectCancelConfirm(paydate, memberCode);
		logger.info("결제 취소 확인 리스트 confirmlist.size={}", confirmlist.size());
		
		int cnt=0;
		String msg="", url="/mypage/corp/paymentDetail.do";
		if(confirmlist.size()>0) {
			for(int i=0;i<confirmlist.size();i++) {
				PaymentVO paymentVo=confirmlist.get(i);
				logger.info("i번째={}번째,paymentVo={}", i, paymentVo);
				
				cnt=paymentService.cancelPay(paymentVo.getPaymentCode());
				if(cnt>0) {
					msg="결제 취소 요청 처리 완료";
					
				}else {
					msg="결제 취소 요청 실패";
				}
			}
		}else {
			msg="결제취소할 상품을 다시 선택해주세요";
		}
		
		
		logger.info("결제취소 결과 cnt={}",cnt);
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	@RequestMapping(value="/mypage/corp/paymoreDetail.do", method = RequestMethod.GET)
	public String paymoreDetail(@RequestParam String paydate, @RequestParam(defaultValue = "0") int memberCode,
			@RequestParam String serviceName, Model model) {
		logger.info("결제내역 상세보기 파라미터, paydate={}, memberCode={}",paydate, memberCode);
		logger.info("결제내역 상세보기 파라미터 serviceName={}",serviceName);
		
		List<Map<String, Object>> list=paymentService.selectBySameTime(paydate, memberCode);
		logger.info("같은 시간대, 결제내역 상세보기 list.size={}",list.size());
		
		model.addAttribute("serviceName",serviceName);
		model.addAttribute("list",list);
		return "mypage/corp/paymoreDetail";
		
	}
	
	@RequestMapping("/service/ListForPay.do")
	public String ListForPay() {
		
		return "service/ListForPay";
	}
	
	
	@RequestMapping(value="/service/ajaxpayList.do", method = RequestMethod.POST)
	@ResponseBody
	public Boolean ajaxpayList(@ModelAttribute PaymentListVO vo) {
		logger.info("결제할 공고 리스트 파라미터, paymentListVo={}",vo);
		
		List<PaymentVO> list=vo.getPayItems();
		
		int count=0;
		for(int i=0;i<list.size();i++) {
			PaymentVO paymentVo=list.get(i);
			logger.info("{} : paymentVo={}",i, paymentVo);
			
			count+=paymentService.getCountByJobopening(paymentVo.getJobopening());
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
	public String paysuccess(@ModelAttribute PaymentListVO vo) {
		List<PaymentVO> list=vo.getPayItems();
		logger.info("파라미터 vo={}",vo);
		
		int cnt=0;
		for(int i=0;i<list.size();i++) {
			PaymentVO paymentVo=list.get(i);
			logger.info("i번째={}, paymentVo={}",i, paymentVo);
			
			if(paymentVo.getJobopening()!=0) {
				cnt+=paymentService.insertPayment(paymentVo);
			}
			
		}
		
		logger.info("payment 등록 cnt={}",cnt+"\n");
		return "redirect:/mypage/corp/paymentDetail.do";
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
