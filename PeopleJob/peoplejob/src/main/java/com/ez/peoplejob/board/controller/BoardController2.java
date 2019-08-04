package com.ez.peoplejob.board.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.board.model.BoardService;
import com.ez.peoplejob.board.model.BoardVO;
import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.common.WebUtility;
import com.ez.peoplejob.post.model.PostService;
import com.ez.peoplejob.post.model.PostVO;

@Controller
@RequestMapping("/board")
public class BoardController2 {
	private Logger logger=LoggerFactory.getLogger(BoardController2.class);
	@Autowired private BoardService boardService;
	@Autowired private PostService postService;
	
	
	
}
