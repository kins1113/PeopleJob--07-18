package com.ez.peoplejob.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.ez.peoplejob.manager.model.ManagerService;
import com.ez.peoplejob.manager.model.ManagerVO;

@Controller
public class ManagerController2 {
	private Logger logger=LoggerFactory.getLogger(ManagerController2.class);

	@Autowired private ManagerService managerService;

	//관리자 로그인 화면 보여주는 핸들러
	@RequestMapping(value = "/manager/login/managerLogin.do", method =RequestMethod.GET)
	public String login_get() {
		logger.info("관리자 로그인 페이지 보여주기");

		return "manager/login/managerLogin";
	}

	//관리자 로그인 처리하는 핸들러
	@RequestMapping(value = "/manager/login/managerLogin.do", method = RequestMethod.POST)
	public String login_post(@RequestParam String adminid, @RequestParam String adminpwd ,
			HttpServletRequest request,Model model) {
		logger.info("관리자 로그인 처리 페이지 파라미터 adminid={}, adminpwd={}",adminid,adminpwd);

		//db
		int result=managerService.selectPwdById(adminid, adminpwd);

		String msg="",url="/manager/login/managerLogin.do";
		if(result==managerService.LOGIN_OK) {
			//로그인 성공
			msg="로그인 성공!";
			url="/manager/index.do";
			ManagerVO vo= managerService.selectPwdById(adminid);
			logger.info("로그인 정보 가져오기 vo={}",vo);
			
			//session에 저장 관리자 아이디 코드 저장.
			HttpSession session=request.getSession();
			session.setAttribute("adminid", adminid);
			session.setAttribute("adminCode", vo.getAdminCode());
			
		}else if(result==managerService.LOGIN_ID_NOT) {
			//아이디 가없을 때
			msg="존제하지 않는 아이디 입니다.";
		}else if(result==managerService.LOGIN_PWD_NOT) {
			//비밀번호가 틀림
			msg="비밀번호가 틀립니다.";
		}else {
			//그냥 예외처리
			msg="로그인 실패";
		}
		//결과처리
		model.addAttribute("msg", msg);
		model.addAttribute("url",url);
		return "common/message";
	}

	@RequestMapping(value = "/manager/manager/managerList.do", method = RequestMethod.GET)
	public String managerList_get(Model model) {
		logger.info("관리자 리스트 창입니다.");
		//2 db
		List<ManagerVO> mgList= managerService.selectManagerAll();
		logger.info("관리자 조회 결과, mgList.size()={}",mgList.size());
		//3 결과 출력
		model.addAttribute("mgList", mgList);

		return "manager/manager/managerList";

	}

	@RequestMapping(value ="/manager/manager/managerAdd.do", method = RequestMethod.GET)
	public String managerAdd_get(@RequestParam String adminid, Model model) {
		logger.info("관리자 추가 페이지 입니다. 파라미터 adminid={}",adminid);

		//추가하려는 관리자의 권한이 GM인지 확인 selectAuthorityById
		boolean isAuthority=managerService.isAuthority(adminid);
		logger.info("isAuthority={}",isAuthority);
		if(!isAuthority) { 	//true면 가능
			model.addAttribute("msg", "GM만이 관리자를 추가할 수 있습니다.");
			model.addAttribute("url", "manager/manager/managerAdd.do");
			model.addAttribute("close", "Y");
			return "common/message";
		}
		return "manager/manager/managerAdd";	//여기서 관리자 삭제쪽으로 간다.
	}

	@RequestMapping(value= "/manager/manager/managerAdd.do", method = RequestMethod.POST)
	public String managerAddPost(@ModelAttribute ManagerVO managerVo,
				@RequestParam String close
				) {
		logger.info("관리자 추가 처리 페이지, 파라미터 managerVo={} close={}",managerVo,close);

		//관리자가 아이디가 중복되면 안되게 처리
		int chkId=managerService.selectIdChk(managerVo.getAdminid());
		logger.info("아이디 중복 체크 결과 chkId={}",chkId);
	
		int result=managerService.insertManager(managerVo);
	
		logger.info("관리자 추가 결과 result={}",result);
		
		return "manager/manager/managerAdd";
	}
	
	
	@RequestMapping(value= "/manager/manager/managerEdit.do", method = RequestMethod.GET)
	public String managerEdit(@RequestParam(defaultValue = "0", required = false ) int adminCode,
			Model model) {
		logger.info("수정화면 보여주기");
		
		ManagerVO vo=managerService.selectByCode(adminCode);
		model.addAttribute("vo", vo);
		
		return "manager/manager/managerEdit";
	}
	
	@RequestMapping(value= "/manager/manager/managerEdit.do",method = RequestMethod.POST)
	public String managerEdit(@RequestParam String adminid, @RequestParam String adminpwd,
			@RequestParam String authority,
			@RequestParam String close,
			Model model) {
		logger.info("수정 처리 화면 , 파라미터 adminid={}, adminpwd={}",adminid,adminpwd);
		logger.info("authority={} close={}",authority,close);
		
		int result=managerService.selectPwdById(adminid,adminpwd);
		String url="/manager/manager/managerEdit.do?close=close", msg="";
		if(result==managerService.LOGIN_OK) {
			//수정 성공
			msg="수정 성공";
		}else if(result==managerService.LOGIN_PWD_NOT){
			msg="비밀번호가 일치해야합니다";
		}else {
			msg="비밀번호 처리 실패";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
	
	@RequestMapping(value= "/manager/manager/managerDel.do",method =RequestMethod.POST) 
	public String managerDel(@RequestParam(defaultValue ="0") int adminCode, Model model) {
		logger.info("관리자 삭제 처리, 파라미터 adminCode={}",adminCode);

		if(adminCode==0) { model.addAttribute("msg", "잘못된 값입니다.");
		model.addAttribute("url", "/manager/manager/managerList.do");

		return "common/message"; 
		} int result=managerService.delectManager(adminCode);

		String msg="관리자 삭제를 실패했습니다.", url="/manager/manager/managerList.do";
		if(result>0) {
			msg=adminCode+"번 관리자를 삭제했습니다."; 
		}
		model.addAttribute("msg",msg); model.addAttribute("url",url);

		return "common/message"; 
	}
	
	@RequestMapping("/manager/logout.do")
	public String managerLogOut(HttpSession session) {
		logger.info("로그아웃 처리 ");
		
		session.removeAttribute("adminid");
		
		return "redirect:/manager/login/managerLogin.do";
	}
	
	@RequestMapping(value="/manager/login/managerChengPwd.do",method = RequestMethod.GET)
	public String managerChengPwd_get() {
		logger.info("비밀번호 변경 페이지 보여주기");
		
		return "manager/manager/managerChengPwd";
	}
	
	@RequestMapping(value="/manager/manger/managerCheckPwd.do",method=RequestMethod.POST)
	public String managerCheckPwd(@RequestParam String adminpwd, HttpSession session,
			Model model) {
		String id=(String) session.getAttribute("adminid");
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", adminpwd);
		
		int re=managerService.selectCheckPwd(map);

		
		logger.info("비밀번호 확인 결과 re={}",re);
		
		model.addAttribute("count", re);
		
		return "manager/manager/managerChengPwd";
	}
	
	@RequestMapping("/manager/manger/managerChengPwd.do")
	public String managerChengPwd(@RequestParam String newPwd1) {
		
		logger.info("비밀번호 변경 처리 파라미터 newPwd1={}",newPwd1);
		
		return "";
	}
}

