package com.ez.peoplejob.board.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.peoplejob.board.model.BoardKindService;
import com.ez.peoplejob.board.model.BoardKindVO;
import com.ez.peoplejob.board.model.BoardService;
import com.ez.peoplejob.board.model.BoardVO;

@Controller
@RequestMapping("/manager/board")
public class BoardController {
	private Logger logger=LoggerFactory.getLogger(BoardController.class);
	@Autowired private BoardKindService boardKindService; 
	@Autowired private BoardService boardService;
	
	@RequestMapping(value="/boardAdd.do",method = RequestMethod.GET)
	public String boardAdd_get(Model model) {
		logger.info("게시판 추가 보여주기");
		//1	카테고리 전체 조회해서 뿌려주기
		List<BoardKindVO> BKList=boardKindService.selectBKind();
		logger.info("게시판 추가 보여주기 결과 BKList={}",BKList.size());
		//2 
		
		model.addAttribute("BKList",BKList);
		
		return "manager/board/boardAdd";
	}
	
	@RequestMapping(value="/boardKindAdd.do",method=RequestMethod.POST)
	public String boardKindAdd(@ModelAttribute BoardKindVO boardKindVO, Model model) {
		logger.info("게시판 카테고리 추가 처리, 파라미터 boardKindVO={}",boardKindVO);
		
		int re=boardKindService.insertBKind(boardKindVO);
		logger.info("게시판 카테고리 추가 처리, re={}",re);
		String msg="",url="/manager/board/boardAdd.do";
		if(re>0) {
			msg="카테고리 추가 성공";
		}else {
			msg="카테고리 추가 실패";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
	
	@RequestMapping("/boardInsert.do")
	public String boardInsert(@ModelAttribute BoardVO boardVo,
			HttpServletRequest request,
			Model model) {
		String adminid=(String) request.getSession().getAttribute("adminid");
		logger.info("계시판 추가 처리, 파라미터 boardVo={}\n adminid={}",boardVo,adminid);
		boardVo.setFirAdmin(adminid);
		
		//업로드가 가능한지 체크여부
		if(boardVo.getUpage()==null) {
			boardVo.setUpage("N");
		}else {
			boardVo.setUpage("Y");
		}
		//댓글처리가 가능한지 체크 여부
		if(boardVo.getCommentage()==null) {
			boardVo.setCommentage("N");
		}else {
			boardVo.setCommentage("Y");
		}
		int re=boardService.insetBoard(boardVo);
		String msg="", url="/manager/board/boardAdd.do";
		if(re>0) {
			msg="게시판 등록 성공";
		}else {
			msg="게시판 등록 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	//카테고리 삭제
	@RequestMapping("/boardkindDel.do")
	public String boardkindDel(@RequestParam String[] bkCheck,Model model) {
		for(int i=0; i<bkCheck.length;i++) {
			logger.info("{}번째 넘어온 값={}",i,bkCheck[i]);
		}
		int re=boardKindService.deleteBKind(bkCheck);
		
		String msg="", url="/manager/board/boardAdd.do";
		if(re>0) {
			msg=re+"건 삭제 성공";
		}else {
			msg="삭제 실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/boardList.do")
	public String boardList(@RequestParam(required = false, defaultValue = "") String key, @RequestParam(required = false, defaultValue = "") String content,
			@RequestParam(required = false ,defaultValue = "") String fileter,
			@RequestParam(required = false) String useCheck
			,Model model ) {
		logger.info("게시판 보여주기 파라미터 key={}, content={}",key, content);
		logger.info("fileter={} useCheck={}",fileter,useCheck);
		//게시판 정보 보여주기.
		Map<String,String> map=new HashMap<String,String>();
		map.put("key", key);
		map.put("content", content);
		map.put("fileter", fileter);
		map.put("useCheck",	useCheck);
		
		List<BoardVO> boardList=boardService.selectBoardSerch(map);
		logger.info("게시판 리스트 보여주기 처리 결과 boardList.size={}",boardList.size());
		List<BoardKindVO> BKList=boardKindService.selectBKind();
		
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("BKList",BKList);
		
		return "manager/board/boardList";
	}
	
	@RequestMapping("/boardUpdate.do")
	public String updateBoard(@RequestParam(defaultValue = "0")int boardCode,
				@RequestParam String usage, @RequestParam(required = false) String fileter) {
		logger.info("계시판 업로드 처리 파라미터 , boardCode={} usage={}",boardCode,usage);
		
		Map<String , Object> map=new HashMap<String, Object>();
		map.put("boardCode", boardCode);
		map.put("usage", usage);
		map.put("fileter", fileter);
		int re=boardService.boardUpdate(map);
		
		return "redirect:/manager/board/boardList.do";
	}
	
	@RequestMapping("/boardDelete.do")
	public String boardDelete(@RequestParam int[] boardCheckBox) {
		Map<String, int[]> map=new HashMap<String, int[]>();
		for(int i=0; i<boardCheckBox.length ;i++) {
			logger.info("게시판 삭제 파라미터 i={}",i);
		}
		map.put("boardCheckBox", boardCheckBox);
		
		int re=boardService.deleteMultDelete(map);
		
		return "redirect:/manager/board/boardList.do";
	}
	
	@RequestMapping(value="/boardEdit.do",method = RequestMethod.POST)
	public String boardEdit(@RequestParam int[] boardCheckBox, Model model) {
		Map<String, int[]> map=new HashMap<String, int[]>();
		for(int i=0; i<boardCheckBox.length ;i++) {
			logger.info("게시판 수정 화면 보여주기; 파라미터 i={}",i);
		}
		map.put("boardCordList",boardCheckBox);
		List<BoardVO> list=boardService.selectByCodeVariable(map);
		logger.info("게시판 수정 조회 결과 list.size={}",list.size());
		
		List<BoardKindVO> BKList=boardKindService.selectBKind();
		model.addAttribute("list", list);
		model.addAttribute("BKList", BKList);
		
		return "manager/board/boardEdit";
		
	}
	
	@RequestMapping("/boardKindChange.do")
	public String boardKindChange(@RequestParam String useCk ,@RequestParam int typeCode) {
		logger.info("카테고리 사용 미사용처리 파라미터 useCk={}, typeCode={}",useCk,typeCode);
		
		return "manager/board/boardAdd";
	}
	
	@RequestMapping(value="/boardEdit.do", method = RequestMethod.GET)
	@ResponseBody
	public BoardVO boardEdit(@ModelAttribute BoardVO boardVo, HttpSession session) {
		logger.info("수정처리 파라미터 boardVo={}",boardVo);
		String adminid=(String)session.getAttribute("adminid");
		
		boardVo.setLastAdmin(adminid);
		if(boardVo.getUpage()==null) {
			boardVo.setUpage("N");
		}
		if(boardVo.getCommentage()==null) {
			boardVo.setCommentage("N");
		}
		int re = boardService.boardEdit(boardVo);
		logger.info("수정 결과 : re={}",re);
		
		return boardVo;
	}
	
}
