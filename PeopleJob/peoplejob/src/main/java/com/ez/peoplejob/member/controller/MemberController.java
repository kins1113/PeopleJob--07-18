package com.ez.peoplejob.member.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.ez.peoplejob.common.FileUploadUtility;
import com.ez.peoplejob.common.WebUtility;
import com.ez.peoplejob.member.model.CompanyVO;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.member.model.MemberVO;

@Controller
@RequestMapping("/login")
public class MemberController {
	private Logger logger=LoggerFactory.getLogger(MemberController.class);
	@Autowired private FileUploadUtility fileUploadUtil;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/registerU.do", method = RequestMethod.GET)
	public String registerU() {
		logger.info("개인 회원가입 화면 보여주기");
		return "login/registerU";
	}
	
	@RequestMapping(value="/registerC.do", method = RequestMethod.GET)
	public String registerC() {
		logger.info("기업 회원가입 화면 보여주기");
		return "login/registerC";
	}
	
	
	@RequestMapping(value="/registerU.do", method = RequestMethod.POST)
	public String register_post(@ModelAttribute MemberVO memberVo, Model model) {
		logger.info("회원가입 등록 처리 파라미터 memberVo={}",memberVo);
		logger.info("회원가입 등록 파라미터, 권한번호 authority_code={}",memberVo.getAuthorityCode());
		memberVo.setAuthorityCode(1);
		
		int cnt=memberService.insertIndividaulMember(memberVo);
		logger.info("회원가입 등록 처리 결과 cnt={}",cnt);
		
		String msg="", url="/login/registerU.do";
		if(cnt>0) {
			msg="회원가입이 완료되었습니다.";
			url="/login/login.do";
		}else {
			msg="회원가입 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/registerC.do", method = RequestMethod.POST)
	public String register2_post( Model model,
			@ModelAttribute CompanyVO companyVo, HttpServletRequest request, @ModelAttribute MemberVO memberVo) {
	
		logger.info("기업회원 등록 파라미터, companyVo={}",companyVo);
		logger.info("기업회원 등록 파라미터, memberVo={}",memberVo);
		
		int comcnt=memberService.insertCompany(companyVo);
		logger.info("기업 등록 처리 결과 comcnt={}",comcnt);
		logger.info("기업 등록 처리 후, companyVo={}",companyVo);
		
		memberVo.setCompanyCode(companyVo.getCompanyCode());
		int cnt=memberService.insertMember(memberVo);
		
		logger.info("기업회원 등록 처리 결과 cnt={}",cnt);
		
		String msg="",url="/login/registerC.do";
		
		if(cnt>0) {
			msg="기업회원 회원가입이 완료되었습니다. "
					+ "하루 뒤 관리자의 승인을 받은 후 채용공고를 등록할 수 있습니다.";
			url="/login/login.do";
		}else {
			msg="기업회원 회원가입 실패";
		}
		
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/person_update.do", method = RequestMethod.GET)
	public String person_update(HttpSession session, Model model) {
		logger.info("개인회원 정보수정 화면 보여주기");
		String memberId=(String) session.getAttribute("memberid");
		MemberVO memberVo=memberService.selectByUserid(memberId);
		logger.info("selectByUserid 결과 memberVo={}",memberVo);
		
		model.addAttribute("memberVo",memberVo);
		return "login/person_update";
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login() {
		logger.info("로그인 화면 보여주기");
		return "login/login";
	}
	
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String login_post(@RequestParam String memberId, @RequestParam String pwd, Model model, HttpServletRequest request
			,HttpServletResponse response, @RequestParam(required = false) String saveId) {
		logger.info("로그인 화면 처리, 파라미터, memberId={}, pwd={}",memberId, pwd);
		
		//비밀번호 일치하는지 확인
		int result=memberService.loginCheck(memberId, pwd);
		logger.info("로그인 처리 결과 result={}",result);
		
		
		//
		String msg="", url="/login/login.do";
		if(result==MemberService.LOGIN_OK) {
			msg="로그인되었습니다.";
			
			//로그인 성공
			MemberVO memVo=memberService.selectByUserid(memberId);
			logger.info("selectByUserid 결과 memVo={}",memVo);
			
			//[1] session에 저장 (request에서 받아오기)
			HttpSession session=request.getSession();
			session.setAttribute("memberid", memberId);
			session.setAttribute("author_code", memVo.getAuthorityCode());
			session.setAttribute("memberName", memVo.getMembername());
			
			//[2] 쿠키에 저장
			Cookie ck=new Cookie("ck_memberid", memberId);
			ck.setPath("/"); //안쓰면 못찾음 => 다른경로에서 쿠키지우려고하면 접근안되서 path설정해줘야함(/로 설정하면 지금 경로와 하위경로에서 사용가능)
			
			if(saveId!=null) {//아이디 저장하기를 체크한 경우
				//checkbox => 체크하면 on, 안하면 null 
				//(equals(on)으로 하게 되면 null point exception때문에 null이 아닐때는 check, null일 때는 체크안된걸로 확인하기)
				
				ck.setMaxAge(10*24*60*60); //유효기간 10일
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0); //쿠키 삭제
				response.addCookie(ck); 
			}
		
			msg=memberId+"님 로그인되었습니다.";
			url="/main/mainindex.do";
		}else if(result==MemberService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
			
		}else if(result==MemberService.ID_NONE){
			msg="아이디가 존재하지 않습니다.";
			
		}else {
			msg="로그인 처리 실패.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	
	}
	
	//메인화면에서 로그인했을시
	@RequestMapping(value="/mainlogin.do", method = RequestMethod.POST)
	public String mainlogin(@RequestParam String memberId, @RequestParam String pwd, Model model, HttpServletRequest request
			,HttpServletResponse response, @RequestParam(required = false) String saveId) {
		logger.info("로그인 화면 처리, 파라미터, memberId={}, pwd={}",memberId, pwd);
		
		//비밀번호 일치하는지 확인
		int result=memberService.loginCheck(memberId, pwd);
		logger.info("로그인 처리 결과 result={}",result);
		
		
		//
		String msg="", url="/main/mainindex.do";
		if(result==MemberService.LOGIN_OK) {
			msg="로그인되었습니다.";
			
			//로그인 성공
			MemberVO memVo=memberService.selectByUserid(memberId);
			logger.info("selectByUserid 결과 memVo={}",memVo);
			
			//[1] session에 저장 (request에서 받아오기)
			HttpSession session=request.getSession();
			session.setAttribute("memberid", memberId);
			session.setAttribute("author_code", memVo.getAuthorityCode());
			session.setAttribute("memberName", memVo.getMembername());
			
			//[2] 쿠키에 저장
			Cookie ck=new Cookie("ck_memberid", memberId);
			ck.setPath("/"); //안쓰면 못찾음 => 다른경로에서 쿠키지우려고하면 접근안되서 path설정해줘야함(/로 설정하면 지금 경로와 하위경로에서 사용가능)
			
			if(saveId!=null) {//아이디 저장하기를 체크한 경우
				//checkbox => 체크하면 on, 안하면 null 
				//(equals(on)으로 하게 되면 null point exception때문에 null이 아닐때는 check, null일 때는 체크안된걸로 확인하기)
				
				ck.setMaxAge(100*24*60*60); //유효기간 100일
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0); //쿠키 삭제
				response.addCookie(ck); 
			}
		
			msg=memberId+"님 로그인되었습니다.";
		}else if(result==MemberService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
			
		}else if(result==MemberService.ID_NONE){
			msg="아이디가 존재하지 않습니다.";
			
		}else {
			msg="로그인 처리 실패.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		logger.info("로그아웃 처리");
		
		session.removeAttribute("memberid");
		session.removeAttribute("memberName");
		session.removeAttribute("author_code");
		
		return "redirect:/login/login.do";
	}
	
	
	
	//마이페이지-회원정보 관리(수정)
	@RequestMapping(value="/person_update.do", method = RequestMethod.POST)
	public String person_update_post(@ModelAttribute MemberVO memberVo, Model model) {
		logger.info("회원정보 수정 처리, 파라미터 memberVo={}",memberVo);
		
		
		String msg="", url="/login/person_update.do";
		int result=memberService.loginCheck(memberVo.getMemberid(), memberVo.getPwd());
		logger.info("로그인 체크  결과 result={}",result);
		
		if(result==MemberService.LOGIN_OK) {
			int cnt=memberService.updateMember(memberVo);
			logger.info("회원 수정 처리 결과 cnt={}",cnt);
			
			if(cnt>0) {
				msg="회원정보 수정되었습니다.";
				url="/mypage/user/userpage.do";
			}else {
				msg="회원정보 수정 실패";
				
			}
		}else if(result==MemberService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else{
			msg="비밀번호 체크 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/emailcertificate.do")
	public String emailcertificate() {
		logger.info(" 인증번호 전송 완료 후, 인증번호 입력하는 창 보여주기");
		
		return "login/emailcertificate";
		
	}
	
	
	@RequestMapping(value = "/registeremail.do",method = RequestMethod.GET)
	public String registeremail(@RequestParam String email, Model model) {
		
		logger.info("파라미터 email={}",email);
		/*
		coment=coment.replace("<p>", "");
		coment=coment.replace("</p>", "\n");
		coment=coment.replace("&nbsp;", "");
		logger.info("파라미터 변경후  coment={}",coment);
		*/
		
		//보내는 사람 쪽의 메일 정보
		String host     = "smtp.naver.com";
		final String user   = "kins1113";
		final String password  = "kimok1277!";
		
		//받는 사람 메일 주소
		String to     =email;
		
		String authNum=WebUtility.RandomNum();
		String coment="인증번호 = "+authNum;
		logger.info("랜덤생성한 수 authNum={}",authNum);
		
		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		// Compose the message
		try {
		
			MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(user));
			
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			// Subject 메일 제목
			message.setSubject("PEOPLEJOB 회원가입 인증번호입니다.");
			// Text 메일 내용
			message.setText(coment);
				
			// send the message 메일 보내기
			Transport.send(message);
			/*
		   logger.info("message sent successfully...");
			 */
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
			
		
		//model.addAttribute("msg", "인증번호 발송 성공!");
		//model.addAttribute("url", "/login/emailcertificate.do");
		model.addAttribute("authNum",authNum);
		
		return "login/emailcertificate";
	}
	
	//탈퇴
	@RequestMapping(value="/memberOut.do", method = RequestMethod.GET)
	public String memberOut() {
		logger.info("회원 탈퇴 화면 보여주기");
		return "login/memberOut";
	}
	
	@RequestMapping(value="/memberOut.do", method = RequestMethod.POST)
	public String memberOut_post(HttpSession session, @RequestParam String pwd, Model model, HttpServletResponse response) {
		String memberId=(String)session.getAttribute("memberid");
		logger.info("회원 탈퇴 처리 파라미터, memberid={}, pwd={}",memberId,pwd);
		
		int result=memberService.loginCheck(memberId, pwd);
		
		String msg="", url="/login/memberOut.do";
		if(result==MemberService.LOGIN_OK) {
			int cnt=memberService.memberOut(memberId);
			
			if(cnt>0) {
				msg="회원 탈퇴처리되었습니다.";
				url="/main/mainindex.do";
				
				//세션, 쿠키 정보 삭제
				session.removeAttribute("memberid");
				session.removeAttribute("memberName");
				
				Cookie ck=new Cookie("ck_memberid",memberId);
				ck.setPath("/"); // /와 하위폴더에서 사용가능
				ck.setMaxAge(0);
				response.addCookie(ck);
				
			}else {
				msg="회원 탈퇴 실패 ";
			}
		}else if(result==MemberService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
			
		}else {
			msg="회원 탈퇴 실패 ";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
		
		
	}
	
	@RequestMapping(value="/c_update.do", method = RequestMethod.GET)
	public String c_update(HttpSession session, Model model, HttpServletRequest request) {
		logger.info("기업정보 수정 화면 보여주기");
		String memberId=(String) session.getAttribute("memberid");
		MemberVO memberVo=memberService.selectByUserid(memberId);
		logger.info("아이디로 member select 결과 memberVo={}",memberVo);
		
		CompanyVO companyVo=memberService.selectCompanyById(memberId);
		logger.info("아이디로 company select 결과 companyVo={}",companyVo);
		
		String fileInfo
		=fileUploadUtil.getFileInfo(companyVo.getImage(), 1, request);
		model.addAttribute("fileInfo", fileInfo);
		
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("companyVo",companyVo);
		return "login/c_update";
	}
	
	@RequestMapping(value="/c_update.do", method = RequestMethod.POST)
	public String c_update(@ModelAttribute CompanyVO companyVo, Model model, HttpServletRequest request
			, @RequestParam String oldFileName, HttpSession session, @ModelAttribute MemberVO memVo) {
		
		logger.info("기업정보 수정 화면 처리 파라미터, companyVo={}, oldfileName={}",companyVo,oldFileName);
		logger.info("가져온 memVo={}", memVo);
		String memberId=(String)session.getAttribute("memberid");
		
		//아이디로 memberVo가져오기 (비밀번호 가져오기)
		MemberVO memberVo=memberService.selectByUserid(memberId);
		logger.info("아이디로 memberVo 가져오기 결과 memberVo={}",memberVo);
		
		//파일이 있을 경우 파일 업로드
		List<Map<String,Object>>list=fileUploadUtil.fileUpload(request);
		String imageURL="";
		for(Map<String,Object>map:list) {
			imageURL=(String)map.get("fileName");
		}
		
		companyVo.setImage(imageURL);
		
		//수정처리 전 비밀번호 체크
		int result=memberService.loginCheck(memberId, memVo.getPwd());
		logger.info("로그인 체크  결과 result={}",result);
		
		String msg="", url="/login/c_update.do";
		if(result==MemberService.LOGIN_OK) {
			int cnt=memberService.updateCompany(companyVo);
			logger.info("기업정보 수정 처리 결과 cnt={}",cnt);
			
		if(cnt>0) {
			msg="기업정보 수정이 완료되었습니다.";
			url="/mypage/user/userpage.do";
			if(imageURL!=null && !imageURL.isEmpty()) {
				if(oldFileName!=null && !oldFileName.isEmpty()) {
					String path=fileUploadUtil.getUploadPath(request);
					File oldFile=new File(path, oldFileName);
					if(oldFile.exists()) {
						boolean bool=oldFile.delete();
						logger.info("기존 파일 삭제 여부={}", bool);
					}
				}
			}//기존 image가 있을 때 삭제
		
	}else {
		msg="기업정보 수정 실패";
	}
		}else if(result==MemberService.PWD_DISAGREE) {
		msg="비밀번호가 일치하지 않습니다.";
		
	}else {
		msg="비밀번호를 입력해 주세요";
	}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	
	} 
	
	@RequestMapping(value="/changePwd.do",method = RequestMethod.GET)
	public String changePwd() {
		logger.info("비밀번호 변경 화면 보여주기");
		return "login/changePwd";
	}
	
	@RequestMapping(value="/changePwd.do",method = RequestMethod.POST)
	public String changePwd(@RequestParam String pwd,Model model,HttpSession session) {
		logger.info("비밀번호 변경 처리 파라미터, pwd={}",pwd);
		String memberId=(String) session.getAttribute("memberid");
		
		MemberVO memberVo=new MemberVO();
		memberVo.setMemberid(memberId);
		memberVo.setPwd(pwd);
		int cnt=memberService.updatePwd(memberVo);
		logger.info("비밀번호 변경 결과 cnt={}",cnt);
		
		String msg="", url="/login/changePwd.do";
		if(cnt>0) {
			msg="비밀번호가 수정되었습니다.";
			url="/mypage/user/userpage.do";
		}else {
			msg="비밀번호 수정 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/ajaxDupUserid.do")
	@ResponseBody
	public Boolean ajaxDupUserid(@RequestParam String memberid) {
		logger.info("아이디 중복확인 파라미터,memberid={}",memberid);
		int cnt=memberService.dupUserid(memberid);
		logger.info("아이디 중복확인 결과 cnt={}",cnt);
		
		Boolean bool=false;
		if(cnt==MemberService.USEFUL_USERID) {
			bool=true;
		}else if(cnt==MemberService.NON_USEFUL_USERID) {
			bool=false;
		}
		return bool;
		
	}
	
	@RequestMapping("/ajaxchkPwd.do")
	@ResponseBody
	public Boolean ajaxchkPwd(@RequestParam String pwd, @RequestParam String pwd2) {
		logger.info("비밀번호 일치 확인 파라미터 pwd={}, pwd2={}",pwd,pwd2);
		
		Boolean bool=false;
		if(pwd.equals(pwd2)) {
			bool=true;
			logger.info("비밀번호 일치할 때 bool={}",bool);
		}else {
			bool=false;
			logger.info("비밀번호 일치하지 않을때 bool={}",bool);
		}
		return bool;
	}
	
	@RequestMapping("/findId.do")
	public String findId() {
		logger.info("아이디찾기 화면 보여주기");
		return "login/findId";
	}
	
	@RequestMapping(value="/findPwd.do",method = RequestMethod.GET)
	public String findPwd() {
		logger.info("비밀번호 찾기 화면 보여주기");
		return "login/findPwd";
	}
	

	@RequestMapping("/ajaxfindId.do")
	@ResponseBody
	public String ajaxfindId(@RequestParam String membername, @RequestParam String email, HttpServletResponse response) {
		logger.info("아이디 찾기 파라미터 membername={}, email={}",membername,email);
		//response.setCharacterEncoding("UTF-8");
		MemberVO memberVo=new MemberVO();
		memberVo.setMembername(membername);
		memberVo.setEmail(email);
		String memberid=memberService.findId(memberVo);
		logger.info("아이디 찾기 결과 memberid={}",memberid);
		
		return memberid;
		
	}
	
	@RequestMapping(value="/findPwd.do", method = RequestMethod.POST)
	public String findPwd_post(@RequestParam String membername, @RequestParam String memberid, @RequestParam String email,Model model) {
		logger.info("비밀번호 찾기 파라미터 membername={},email={}",membername,email );
		logger.info("비밀번호 찾기 파라미터 아이디={}",memberid);
		
		MemberVO memberVo=memberService.selectByUserid(memberid);
		String msg="", url="/login/findPwd.do";
		if(memberVo==null) {
			msg="해당 아이디가 없습니다.";
		}else if(!membername.equals(memberVo.getMembername()) || !email.equals(memberVo.getEmail())) {
			msg="입력하신 정보와 일치하는 회원이 없습니다.";
		}else {
			
			//이메일 보내기
			//보내는 사람 쪽의 메일 정보
			String host     = "smtp.naver.com";
			final String user   = "kins1113";
			final String password  = "kimok1277!";
			
			//받는 사람 메일 주소
			String to     =email;
			
			String authNum=WebUtility.RandomNum();
			String coment="임시비밀번호 = "+authNum;
			logger.info("랜덤생성한 수 authNum={}",authNum);
			
			// Get the session object
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.auth", "true");
			
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});
			
			// Compose the message
			try {
			
				MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(user));
				
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				// Subject 메일 제목
				message.setSubject("PEOPLEJOB 비밀번호 찾기 - 임시비밀번호 입니다.");
				// Text 메일 내용
				message.setText(coment);
					
				// send the message 메일 보내기
				Transport.send(message);
				
			   logger.info("임시 비밀번호 message sent successfully...");
				 
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
				
			
			msg="해당 이메일로 임시 비밀번호가 전송되었습니다. 로그인 후 비밀번호를 변경해주세요";
			url="/login/login.do";
			model.addAttribute("authNum",authNum);
			
			//성공 후 dbPwd를 임시 비밀번호로 변경
			MemberVO memVo=new MemberVO();
			memVo.setMemberid(memberid);
			memVo.setPwd(authNum);
			int cnt=memberService.updatePwd(memVo);
			logger.info("임시 비밀번호로 변경 결과 cnt={}",cnt);
		
		} //else
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
}

