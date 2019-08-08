package com.ez.peoplejob.login.controller;

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

import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.jobopening.model.JobopeningService;
import com.ez.peoplejob.jobopening.model.JobopeningVO;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.member.model.MemberVO;
import com.ez.peoplejob.payment.model.PaymentService;
import com.ez.peoplejob.post.model.PostService;
import com.ez.peoplejob.post.model.PostVO;
import com.ez.peoplejob.resume.model.ResumeService;
import com.ez.peoplejob.scrap.model.ScrapService;
import com.ez.peoplejob.scrap.model.ScrapVO;
import com.ez.peoplejob.tableaply.model.TableaplyService;
import com.fasterxml.jackson.databind.JsonNode;

@Controller
public class LoginController {
private Logger logger=LoggerFactory.getLogger(LoginController.class);

	@Autowired private MemberService memberService;
	@Autowired private PaymentService paymentService;
	@Autowired private ScrapService scrapService;
	@Autowired private JobopeningService jobService;
	@Autowired private TableaplyService applyService;

	@Autowired private ResumeService resumeService;
	@Autowired private PostService postService;
	
	private kakao_restapi kakao_restapi = new kakao_restapi();
	
	
	
	@RequestMapping("/mypage/user/userpage.do")
	public String mypage(HttpSession session, Model model, @ModelAttribute SearchVO searchVo) {
		String memberid=(String)session.getAttribute("memberid");
		MemberVO memberVo=memberService.selectByUserid(memberid);
		logger.info("마이페이지 화면 보!!여!!주!!기!! memberVo={}",memberVo);
		
		//
		List<Map<String , Object>> paylist=paymentService.selectPaymentById(memberid);
		logger.info("결제 내역 paylist.size={}",paylist.size());
		List<ScrapVO> scraplist=scrapService.selectScrap(memberVo.getMemberCode());
		logger.info("스크랩 리스트 scraplist.size={}",scraplist.size());
		List<JobopeningVO> joblist=jobService.selectJobopeningBycomcode(memberVo.getCompanyCode());
		logger.info("채용공고 리스트 joblist.size={}",joblist.size());

		List<Map<String , Object>> resumelist=resumeService.selectResumeByid(memberid);
		logger.info("이력서 리스트 resumelist.size={}",resumelist.size());
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("memberCode", memberVo.getMemberCode());
		int applycount=applyService.selectapplyCount(map);
		logger.info("개인회원입장 지원현황 applycount={}",applycount);
		List<PostVO> postlist=postService.selectPostBymemId(memberid);
		logger.info("내가 쓴 글 postlist.size={}",postlist.size());
		
		model.addAttribute("applycount",applycount);
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("resumelist",resumelist);
		model.addAttribute("postlist",postlist);
		model.addAttribute("paylist",paylist);
		model.addAttribute("scraplist",scraplist);
		model.addAttribute("joblist",joblist);
		
		return "mypage/user/userpage";
		
	}
	

	@RequestMapping("/user/copyresume.do")
	public String copyresume(HttpSession session, Model model,@RequestParam(defaultValue = "0") int resumeCode) {
		logger.info("이력서 복사 파라미터, resumeCode={}",resumeCode);
		String memberid=(String)session.getAttribute("memberid");
		MemberVO memberVo=memberService.selectByUserid(memberid);
		
		int cnt=resumeService.insertCopy(resumeCode);
		logger.info("이력서 복사 결과 cnt={}",cnt);
		
		String msg="", url="/mypage/user/userpage.do";
		if(cnt>0) {
			msg="이력서 복사가 완료되었습니다";
		}else {
			msg="이력서 복사 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/mypage/corp/paymentDetail.do")
	public String paymentDetail(HttpSession session, Model model) {
		String memberid=(String)session.getAttribute("memberid");
		List<Map<String , Object>> list=paymentService.selectPaymentById(memberid);
		logger.info("결제 내역 list.size={}",list.size());
		
		List<Map<String , Object>> Timelist=paymentService.selectPayByTime(memberid);
		logger.info("결제 내역 Timelist.size={}",Timelist.size());
		
		model.addAttribute("list",list);
		model.addAttribute("Timelist",Timelist);
		
		return "mypage/corp/paymentDetail";
	}
	
	
	
	//테스트
	@RequestMapping("/login/kaokaoTest.do")
	public String kaokaoTest() {
		logger.info("카카오테스트 화면 보여주기");
		return "login/kaokaoTest";
	}
	
	@RequestMapping("/login/home.do")
	public String kaokaoTest2() {
		logger.info("카카오테스트 화면 보여주기");
		return "login/home";
	}
	
	
	
	    @RequestMapping(value = "/oauth", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
	    public String kakaoLogin(@RequestParam("code") String code) {
	  
	        return "home";
	    }
	    
	  
	    
	    @RequestMapping(value = "/oauth", produces = "application/json")
	    public String kakaoLogin_post(@RequestParam("code") String code, Model model, HttpSession session) {
	    	
	    	/*
	        System.out.println("로그인 할때 임시 코드값");
	        //카카오 홈페이지에서 받은 결과 코드
	        System.out.println(code);
	        System.out.println("로그인 후 결과값"); */
	    	
	    	logger.info("파라미터 code={}",code);
	        
	        //카카오 rest api 객체 선언
	        kakao_restapi kr = new kakao_restapi();
	        //결과값을 node에 담아줌
	        JsonNode node = kr.getAccessToken(code);
	        //결과값 출력
	        logger.info("node={}",node);
	        
	        //노드 안에 있는 access_token값을 꺼내 문자열로 변환
	        String token = node.get("access_token").toString();
	        //세션에 담아준다.
	        session.setAttribute("token", token);
	        
	        return "login/logininfo";
	    }

	    

	    


	
}
