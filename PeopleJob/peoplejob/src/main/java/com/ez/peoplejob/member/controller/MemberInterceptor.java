package com.ez.peoplejob.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class MemberInterceptor extends HandlerInterceptorAdapter{
	private Logger logger=LoggerFactory.getLogger(MemberInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		String memberid=(String) session.getAttribute("memberid");
		logger.info("인터셉트 로그인 체크, 세션 memberid={}",memberid);
		
		if(memberid==null || memberid.isEmpty()) {
			response.setContentType("text/html;charset=utf-8");		
			PrintWriter out = response.getWriter();
			out.print("<script type='text/javascript'>");
			out.print("alert('먼저 로그인을 해주세요');");
			out.print("location.href='"+request.getContextPath()+"/login/login.do';");
			out.print("</script>");
			return false;
		}else {
			return true;
		}
	}
	
	
	
}
