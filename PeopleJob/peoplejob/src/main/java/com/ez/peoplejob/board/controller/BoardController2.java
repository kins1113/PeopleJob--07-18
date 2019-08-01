package com.ez.peoplejob.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.board.model.BoardService;
import com.ez.peoplejob.board.model.BoardVO;
import com.ez.peoplejob.common.FileUploadUtility;
import com.ez.peoplejob.post.model.PostService;
import com.ez.peoplejob.post.model.PostVO;

@Controller
@RequestMapping("/board")
public class BoardController2 {
	private Logger logger=LoggerFactory.getLogger(BoardController2.class);
	@Autowired private BoardService boardService;
	@Autowired private PostService postService;
	@Autowired private FileUploadUtility fileUploadUtil;
	
	@RequestMapping("/boardByCategory.do")
	public String boardkind(Model model, @RequestParam int boardCode, @RequestParam String boardName) {
		logger.info("\nboard 파라미터, boardCode={}, boardName={}",boardCode, boardName);

		List<PostVO> list=postService.selectByboardCode(boardCode);
		logger.info("게시글 목록 list.size={}",list.size());
		model.addAttribute("list",list);
		
		return "board/boardByCategory";
	}
	
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		logger.info("게시판 목록 조회");
		List<BoardVO> list=boardService.selectByUsage();
		logger.info("게시판 목록 조회 list.size={}",list.size());
		
		model.addAttribute("list",list);
		return "main/inc/boardList";
		
	}
}
