package com.ez.peoplejob.custext.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.ez.peoplejob.common.FileUploadUtility;
import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.common.WebUtility;
import com.ez.peoplejob.custext.model.CustextService;
import com.ez.peoplejob.custext.model.CustextVO;
import com.ez.peoplejob.jobopening.model.JobopeningVO;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.member.model.MemberVO;

@Controller
@RequestMapping("/custext")
public class CustextController {
	private Logger logger=LoggerFactory.getLogger(CustextController.class);
	@Autowired CustextService custextService;
	@Autowired MemberService memberService;
	@RequestMapping(value="/insertcustext.do",method = RequestMethod.GET)
	public String insertcustext_get() {
		logger.info("문의넣기 화면");
		return "custext/insertcustext";
	}
	@RequestMapping(value="/insertcustext.do",method = RequestMethod.POST)
	public String insertcustext_post(@ModelAttribute CustextVO vo,
			HttpSession session,
			Model model) {
		String id=(String)session.getAttribute("memberid");
		if(id==null) {
			id="비회원";
		}
		MemberVO mvo=memberService.selectByUserid(id);
		vo.setMemberCode(mvo.getMemberCode());
		logger.info("문의넣기 처리 파라미터={}",vo);
		int cnt=custextService.insertCustext(vo);
		String msg="",url="/custext/insertcustext";
		if(cnt>0) {
			msg="문의성공";
			url="/custext/mycustext.do";
		}else {
			msg="문의실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	@RequestMapping("/mycustext.do")
	public String mycustext(@ModelAttribute SearchVO searchVo,HttpSession session,Model model) {
		String id=(String)session.getAttribute("memberid");
		if(id==null) {
			id="비회원";
		}
		
		MemberVO mvo=memberService.selectByUserid(id);
		logger.info("로그인한 회원정보 mvo={}",mvo);
		logger.info("채용공고 리스트");
		//1]PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		//pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		//pagingInfo.setRecordCountPerPage(searchVo.getRecordCountPerPage());
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//2]SearchVo에 페이징 관련 변수 세팅
		searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		//searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("셋팅 후 serchVo={}",searchVo);
		
		List<CustextVO> list=new ArrayList<CustextVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("searchVo.getFirstRecordIndex()={},getRecordCountPerPage={}",searchVo.getFirstRecordIndex(),searchVo.getRecordCountPerPage());
			map.put("firstRecordIndex", searchVo.getFirstRecordIndex());
			map.put("recordCountPerPage", searchVo.getRecordCountPerPage());
			map.put("memberCode", mvo.getMemberCode());
			logger.info("map={}",map);
		list = custextService.mycustext(map);
		logger.info("문의사항  결과: list.size()={}",list.size());
		//list=jobopeningService.selectJobOpen(searchVo);
		//logger.info("공고 list.size={}",list.size());
		int totalRecord=0;
		//totalRecord=jobopeningService.selectTotalCount(map);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}",totalRecord);
		
		//5]PaginationInfo에 totalRecord값셋팅
		pagingInfo.setTotalRecord(totalRecord);
		//3
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("mvo", mvo);
		return "custext/mycustext";
	}
	@RequestMapping("/custext_view.do")
	public String custext_view(@RequestParam(defaultValue = "0") int custextCode,
			HttpSession session,
			Model model){
		String id=(String)session.getAttribute("memberid");
		if(id==null) {
			id="비회원";
		}
		MemberVO mvo=memberService.selectByUserid(id);
		logger.info("로그인한 회원정보 mvo={}",mvo);
		logger.info("문의사항 자세히보기 파라미터 custextCode={}",custextCode);
		CustextVO vo=custextService.CustextView(custextCode);
		logger.info("문의사항 vo={}",vo);
		model.addAttribute("vo", vo);
		model.addAttribute("mvo", mvo);
		return "custext/custext_view";
	}
	@RequestMapping(value="/editanswer_ck.do",method = RequestMethod.GET)
	public String answer_ck(@RequestParam (defaultValue = "0")int custextCode,HttpServletRequest request,
			Model model) {
		logger.info("수정 파라미터 custextCode={}",custextCode);
		CustextVO vo=custextService.CustextView(custextCode);
		logger.info("vo={}",vo);
		String msg="",url="";
		if(vo.getAnswerRegdate()!=null) {
			msg="답변된 글은 수정할 수 없습니다.";
			url="/custext/mycustext.do";
		}else {
			url="/custext/custextEdit.do?custextCode="+vo.getCustextCode();
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return "common/message";
	}
	@RequestMapping(value="/custextEdit.do",method = RequestMethod.GET)
	public String custextEdit_get(@RequestParam (defaultValue = "0")int custextCode,HttpServletRequest request,
			Model model) {
		logger.info("수정 파라미터 custextCode={}",custextCode);
		CustextVO vo=custextService.CustextView(custextCode);
		logger.info("vo={}",vo);
		String msg="",url="";
		model.addAttribute("vo", vo);
		return "custext/custextEdit";
	}
	@RequestMapping(value="/custextEdit.do",method =RequestMethod.POST)
	public String custextEdit_post(@ModelAttribute CustextVO vo,HttpServletRequest request,Model model) {
		logger.info("수정처리 파라미터 vo={}",vo);
		int cnt=custextService.Editcustext(vo);
		logger.info("수정처리결과 cnt={}",cnt);
		String msg="",url="/custext/custextEdit.do?custextCode="+vo.getCustextCode();
		if(cnt>0) {
			msg="수정성공";
			url="/custext/custext_view.do?custextCode="+vo.getCustextCode();
		}else {
			msg="수정실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping(value="/custextDel.do",method=RequestMethod.GET)
	public String custext_del_post(@RequestParam (defaultValue = "0")int custextCode,
			HttpSession session,HttpServletRequest request,
			Model model) {
		CustextVO vo=custextService.CustextView(custextCode);
		logger.info("삭제처리 vo={}",vo);
		String id=(String)session.getAttribute("memberid");
		if(id==null) {
			id="비회원";
		}
		String msg="",url="";
		MemberVO mvo=memberService.selectByUserid(id);
		logger.info("로그인한 회원 mvo={}",mvo);
		int cnt=0;
		if(vo.getAnswerRegdate()==null) {
			cnt=custextService.Delcustext(custextCode);
			logger.info("삭제결과={}",cnt);
			if(cnt>0) {
				msg="삭제완료";
				url="/custext/mycustext.do";
			}else {
				msg="삭제실패";
				url="/custext/custext_view.do?custextCode="+vo.getCustextCode();
			}
		}else {
			msg="답변이 달린 문의는 삭제할 수 없습니다.";
			url="/custext/custext_view.do?custextCode="+vo.getCustextCode();
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("mvo", mvo);
		return "common/message";
	}
	@Transactional
	@RequestMapping(value="/custextmultiDel.do",method=RequestMethod.GET)
	public String jobopening_del(@RequestParam int[]custextCode,HttpServletRequest request,
			HttpSession session,
			Model model) {
		logger.info("삭제처리");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("custextCode", custextCode);
		CustextVO vo=new CustextVO();
		String msg="",url="/custext/mycustext.do";
		for(int i=0;i<custextCode.length;i++) {
			logger.info("custextCode.length={}",custextCode.length);
			logger.info("custextCode[{}]={}",i,custextCode[i]);
			vo=custextService.CustextView(custextCode[i]);
			int cnt=0;
			if(vo.getAnswerRegdate()==null) {
				cnt=custextService.Delcustext(custextCode[i]);
			}
			logger.info("vo={}",vo);
			if(cnt>0) {
				msg="삭제완료";
			}else {
				msg="답변이 달린 글을 제외하고 삭제완료";
			}
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
}
