package com.ez.peoplejob.post.controller;

import java.util.Map;

import java.util.List;

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

import com.ez.peoplejob.board.model.BoardService;
import com.ez.peoplejob.board.model.BoardVO;
import com.ez.peoplejob.common.FileUploadUtility;
import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.common.WebUtility;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.member.model.MemberVO;
import com.ez.peoplejob.post.model.PostService;
import com.ez.peoplejob.post.model.PostVO;
import com.ez.peoplejob.post_cmt.model.PostCmtVO;

@Controller
public class PostController2 {
	private Logger logger=LoggerFactory.getLogger(PostController2.class);
	@Autowired private PostService postService;
	@Autowired private BoardService boardService;
	@Autowired private MemberService memberService;
	@Autowired private FileUploadUtility fileUploadUtil;
	
	@RequestMapping("/board/boardByCategory.do")
	public String boardkind(Model model, @RequestParam int boardCode, @ModelAttribute SearchVO searchVo) {
		logger.info("board 파라미터, boardCode={}",boardCode);
		
		//2
				//[1] PaginationInfo 객체 생성
				PaginationInfo pagingInfo=new PaginationInfo();
				pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
				pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
				pagingInfo.setCurrentPage(searchVo.getCurrentPage());
				
				//[2] SearchVo에 페이징 관련 변수 셋팅
				searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
				searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
				searchVo.setBlockSize(WebUtility.BLOCK_SIZE);
				logger.info("셋팅 후 searchVo={}", searchVo);
				
				//[3] 조회처리
				List<Map<String, Object>> list=postService.selectAll(searchVo);
				logger.info("게시판 글 목록 결과, list.size={}",list.size());
				
				//[4] 전체 레코드 개수 조회
				int totalRecord=0;
				totalRecord=postService.selectTotalCount(searchVo);
				logger.info("전체 레코드 개수 조회 결과, totalRecord={}", totalRecord);
				
				//[5] PaginationInfo에 totalRecord 값 셋팅
				pagingInfo.setTotalRecord(totalRecord);
				
				//3
				model.addAttribute("list", list);
				model.addAttribute("pagingInfo", pagingInfo);
				
			/*	
		List<Map<String, Object>> list=postService.selectByboardCode(boardCode);
		logger.info("게시글 목록 list.size={}",list.size());
		*/
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "board/boardByCategory";
	}
	
	@RequestMapping("/board/boardList.do")
	public String boardList(Model model) {
		logger.info("게시판 목록 조회");
		List<BoardVO> list=boardService.selectByUsage();
		logger.info("게시판 목록 조회 list.size={}",list.size());
		
		model.addAttribute("list",list);
		return "main/inc/boardList";
		
	}
	
	@RequestMapping(value="/board/detail.do", method = RequestMethod.GET)
	public String detail(@RequestParam(defaultValue = "0") int no, Model model) {
		logger.info("게시판 상세보기 파라미터 pk={}",no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/board/boardByCategory.do?boardCode="+no);
			
			return "common/message";
		}
		
		List<Map<String, Object>> postList=postService.selectByboardCode2(no);
		logger.info("상세보기 결과 postList.size={}",postList.size());
		List<Map<String, Object>> list=postService.selectCmt(no);
		logger.info("댓글 목록 list.size={}",list.size());
		
		
		model.addAttribute("list",list);
		model.addAttribute("postList",postList);
		return "board/detail";
	}
	
	@RequestMapping(value="/post/countUpdate.do",method = RequestMethod.GET)
	public String countUpdate(@RequestParam(defaultValue = "0") int pk,
			@RequestParam int boardCode, Model model) {
		logger.info("post 글 조회수 증가 파라미터 boardCode2={}",pk);
		logger.info("파라미터 boardCode={}",boardCode);
		
		int cnt=postService.postcountUpdate(pk);
		logger.info("조회수 증가 결과 cnt={}",cnt);
		
			if(pk==0) {
				model.addAttribute("msg", "잘못된 url입니다.");
				model.addAttribute("url", "/board/boardByCategory.do?boardCode="+boardCode);
				
				return "common/message";
			}
			
		return "redirect:/board/detail.do?no="+pk;
	}
	
	@RequestMapping(value="/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(@RequestParam(defaultValue = "0") int boardCode, Model model) {
		logger.info("게시판 글쓰기 파라미터, boardCode={}",boardCode);
		BoardVO boardVo=boardService.selectByBoardCode(boardCode);
		logger.info("boardVo={}",boardVo);
		
		if(boardCode==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/board/boardByCategory.do?boardCode="+boardCode);
			
			return "common/message";
		}
		
		model.addAttribute("boardVo",boardVo);
		return "board/boardWrite";
		
	}
	
	@RequestMapping(value="/board/boardWrite.do", method = RequestMethod.POST)
	public String boardWrite_post(@ModelAttribute PostVO postVo, HttpSession session, Model model) {
		logger.info("게시판 글쓰기 파라미터 , postVO={}",postVo);
		
		String memberid=(String)session.getAttribute("memberid");
		logger.info("memberid={}",memberid);
		
		if(memberid!=null) {
			MemberVO memberVo=memberService.selectByUserid(memberid);
			logger.info("memberVo= {}",memberVo);
			postVo.setMemberCode(memberVo.getMemberCode());
		}
		
		int cnt=postService.insertPost(postVo);
		logger.info("글쓰기 등록 결과 cnt={}",cnt);
		
		String msg="", url="/board/boardWrite.do";
		if(cnt>0) {
			msg="새로운 글이 등록되었습니다.";
			url="/board/boardByCategory.do?boardCode="+postVo.getBoardCode();
		}else {
			msg="글쓰기 등록 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
		
	}
	
	@RequestMapping(value="/post/postCmt.do", method=RequestMethod.POST)
	public String postCmt(@ModelAttribute PostCmtVO postcmtVo, Model model, HttpSession session) {
		logger.info("댓글 쓰기 파라미터, postCmtVo={}", postcmtVo);
		String memberid=(String)session.getAttribute("memberid");
		
		MemberVO memberVo=memberService.selectByUserid(memberid);
		
		postcmtVo.setMemberCode(memberVo.getMemberCode());
		int cnt=postService.insertcmt(postcmtVo);
		logger.info("댓글 쓰기 결과 cnt={}",cnt);
		
		String url="/board/detail.do?no="+postcmtVo.getBoardCode2();
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/board/boardEdit.do", method=RequestMethod.GET)
	public String postCmt(@RequestParam int no, Model model) {
		logger.info("게시판 글 수정 화면");
		List<Map<String, Object>> postList=postService.selectByboardCode2(no);
		logger.info("수정할 글 postList.size={}",postList.size());
		
		model.addAttribute("postList",postList);
		return "board/boardEdit";
	}
	
	@RequestMapping(value="/board/report.do", method=RequestMethod.GET)
	public String report(@RequestParam(defaultValue = "0", required = false ) int no) {
		logger.info("게시판 글 신고 화면 보여주기");
		return "board/report";
	}
	
	@RequestMapping(value="/board/report.do", method=RequestMethod.POST)
	public String report_post(@RequestParam int boardCode2,@RequestParam String reportUser,
			@RequestParam String reportComent,@RequestParam String close, Model model) {
		logger.info("게시판 글 신고 화면 파라미터, boardCode2={}, reportUser={}",boardCode2, reportUser);
		logger.info("게시판 글 신고 화면 파라미터2,reportComent={}, close={}",reportComent, close);
		
		PostVO postVo=new PostVO();
		postVo.setBoardCode2(boardCode2);
		postVo.setReportUser(reportUser);
		postVo.setReportComent(reportComent);
		
		int cnt=postService.updatereport(postVo);
		logger.info("신고하기 결과 cnt={}",cnt);
		
		String url="/board/report.do?close=close", msg="";		
		if(cnt>0) {
			msg="신고가 접수되었습니다.\n관리자에 의해 해당 글은 삭제될 수있습니다.";
		}else {
			msg="신고 접수 실패";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
	
	
	

}
