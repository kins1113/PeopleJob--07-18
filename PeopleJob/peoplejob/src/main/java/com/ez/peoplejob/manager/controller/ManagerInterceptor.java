package com.ez.peoplejob.manager.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class ManagerInterceptor extends HandlerInterceptorAdapter{
	private Logger logger=LoggerFactory.getLogger(ManagerInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("adminid");
		logger.info("인터셉트 로그인 체크, 세션에 id={}",id);
		
		if(id==null || id.isEmpty()) {
			response.setContentType("text/html;charset=utf-8");		
			PrintWriter out = response.getWriter();
			out.print("<script type='text/javascript'>");
			out.print("alert('로그인을 하셔야합니다.');");
			out.print("location.href='"+request.getContextPath()+"/manager/login/managerLogin.do';");
			out.print("</script>");
			return false;
		}else {
			return true;
		}
	}
	
	
	
}
