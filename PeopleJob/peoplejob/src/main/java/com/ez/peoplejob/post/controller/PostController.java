package com.ez.peoplejob.post.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.board.model.BoardKindService;
import com.ez.peoplejob.board.model.BoardService;
import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.post.model.PostService;
import com.ez.peoplejob.post.model.PostVO;

@Controller
@RequestMapping("/manager/post")
public class PostController {
	private Logger logger=LoggerFactory.getLogger(PostController.class);
	@Autowired private PostService postService;
	@Autowired private BoardKindService boardKindService;
	@Autowired private BoardService boardService;

	@RequestMapping(value="/postList.do", method = {RequestMethod.POST, RequestMethod.GET})	//게시글 보여주는 핸들러
	public String postList(@ModelAttribute PostVO postVo,
			@RequestParam(required = false) String deleteChange,
			@RequestParam(required = false) String deletecheck,
			Model model) {
		logger.info("게시글 보여주기 삭제 처리를 위한 deleteChange={} postVo.getBoardCode2()={}",
						deleteChange, postVo.getBoardCode2());
		logger.info("deletecheck={}",deletecheck);
		
		//삭제를 누르면 바뀌도록
		if(deleteChange!=null) {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("deleteChange", deleteChange);
			map.put("code", postVo.getBoardCode2());
			map.put("deletecheck", deletecheck);
			int re=postService.changeDelete(map);
			logger.info("삭제 변경 처리 결과  re={}",re);
		}
		//페이징 처리를 위한 처리 
		//1
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(5);
		pagingInfo.setCurrentPage(postVo.getCurrentPage());
		//밖에서 들어올때는 10개를 기본값으로 
		if(postVo.getRecordCountPerPage()==0) {
			pagingInfo.setRecordCountPerPage(10);
		}else {
			pagingInfo.setRecordCountPerPage(postVo.getRecordCountPerPage());
		}
		postVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		postVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		logger.info("게시글 보여주기, 파라미터  postVo={}",postVo);
		List<Map<String, Object>>postList = postService.selectPostAll(postVo);
		logger.info("게시글 조회 결과 postList.size={}",postList.size());

		//총 레코드 수
		int totalRecord=postService.gettotalRecord(postVo);
		pagingInfo.setTotalRecord(totalRecord);
		

		model.addAttribute("postList",postList);
		model.addAttribute("pagingInfo", pagingInfo);
		return "manager/post/postList";
	}
	
	@RequestMapping("/postCheckDelete.do")
	public String postCheckDelete(@RequestParam(required = false) int[] postCheck, Model model) {
		for(int i=0;i<postCheck.length;i++) {
			logger.info("게시글 삭제 처리 , 파라미터 i={} ",postCheck[i]);
		}
		Map<String, int[]> map=new HashMap<String, int[]>();
		map.put("boardCodeList", postCheck);
		
		int re=postService.updateDelete(map);
		logger.info("게시글 삭제처리 업대이트 결과 re={} ",re);
		String msg="",url="/manager/post/postList.do";
		if(re>0) {
			msg=re+"건이 삭제 처리 되었습니다.";
		}else {
			msg="삭제 실패...";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	
}



