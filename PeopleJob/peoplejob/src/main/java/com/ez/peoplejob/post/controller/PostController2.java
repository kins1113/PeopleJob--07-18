package com.ez.peoplejob.post.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.post.model.PostService;
import com.ez.peoplejob.post.model.PostVO;

@Controller
@RequestMapping("/post")
public class PostController2 {
	private Logger logger=LoggerFactory.getLogger(PostController2.class);
	@Autowired private PostService postService;
	
	@RequestMapping(value="/countUpdate.do",method = RequestMethod.GET)
	public String countUpdate(@RequestParam int no, Model model) {
		logger.info("post 글 조회수 증가 파라미터 boardCode2={}",no);
		int cnt=postService.postcountUpdate(no);
		logger.info("조회수 증가 결과 cnt={}",cnt);
		
		
		String url="";
		if(cnt>0) {
			url="/board/detail.do?code="+no;
		}else {
			url="main/mainindex.do";
		}
		model.addAttribute("url", url);
		return "redirect:"+url;
		
	}
	
	@RequestMapping(value="/detail.do", method = RequestMethod.GET)
	public String detail(@RequestParam int code, Model model) {
		logger.info("게시판 상세보기 파라미터 code={}",code);
		PostVO postVo=postService.selectByboardCode2(code);
		
		model.addAttribute("postVo",postVo);
		return "board/detail";
	}

}
