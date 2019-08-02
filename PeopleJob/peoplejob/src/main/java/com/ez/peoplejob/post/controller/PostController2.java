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
public class PostController2 {
	private Logger logger=LoggerFactory.getLogger(PostController2.class);
	@Autowired private PostService postService;
	
	@RequestMapping(value="/board/detail.do", method = RequestMethod.GET)
	public String detail(@RequestParam(defaultValue = "0") int no,@RequestParam String name, Model model) {
		logger.info("게시판 상세보기 파라미터 code={}",no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/board/boardByCategory.do?boardCode="+no+"&boardName="+name);
			
			return "common/message";
		}
		
		PostVO postVo=postService.selectByboardCode2(no);
		logger.info("상세보기 결과 postVo={}",postVo);
		
		model.addAttribute("postVo",postVo);
		return "board/detail";
	}
	
	@RequestMapping(value="/post/countUpdate.do",method = RequestMethod.GET)
	public String countUpdate(@RequestParam(defaultValue = "0") int no,@RequestParam String name, Model model) {
		logger.info("post 글 조회수 증가 파라미터 boardCode2={}, boardName={}",no,name);
		int cnt=postService.postcountUpdate(no);
		logger.info("조회수 증가 결과 cnt={}",cnt);
		
			if(no==0) {
				model.addAttribute("msg", "잘못된 url입니다.");
				model.addAttribute("url", "/board/boardByCategory.do?boardCode="+no+"&boardName="+name);
				
				return "common/message";
			}
			
		return "redirect:/board/detail.do?no="+no+"&name="+name;
	}
	
	

}
