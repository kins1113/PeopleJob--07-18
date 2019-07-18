package com.ez.peoplejob.jobopening.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.ez.peoplejob.jobopening.model.JobopeningService;
import com.ez.peoplejob.jobopening.model.JobopeningVO;
import com.ez.peoplejob.member.model.CompanyService;
import com.ez.peoplejob.member.model.CompanyVO;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.member.model.MemberVO;

@RequestMapping("/company")
@Controller
public class JobopeningController {
	private Logger logger=LoggerFactory.getLogger(JobopeningController.class);
	@Autowired JobopeningService jobopeningService;
	@Autowired private FileUploadUtility fileUploadUtil;
	@Autowired MemberService memberService;
	@Autowired CompanyService companyService;
	@RequestMapping(value="/jobopening_register.do",method = RequestMethod.GET)
	public String jobopening_register_get(HttpSession session,Model model) {
		String id=(String)session.getAttribute("memberid");
		logger.info("채용공고폼");
		MemberVO mvo=memberService.selectByUserid(id);
		model.addAttribute("mvo",mvo);
		return "company/jobopening_register";
		
	}
	
	@RequestMapping(value="/jobopening_register.do",method = RequestMethod.POST)
	public String jobopening_register_post(@ModelAttribute JobopeningVO vo,HttpSession session,
			//@RequestParam(required=false) String[] welfare1,
			HttpServletRequest request,Model model) {
		/*
		 * String wel=""; for(int i=0;i<welfare1.size();i++) { if(i!=0) { wel+=","; }
		 * wel+=welfare1.get(i); } vo.setWelfare(wel);
		 */
		/*
		 * String walfare=vo.getWelfare(); String[] arr=walfare.split(",");
		 */
		String id=(String)session.getAttribute("memberid");
		logger.info("채용공고 등록 파라미터 vo={}",vo);
		List<Map<String,Object>>list=fileUploadUtil.fileUpload(request);
		 
		String imageURL="";
		for(Map<String,Object>map:list) {
			imageURL=(String)map.get("fileName");
		}
		vo.setCompanyimage(imageURL);
		//logger.info("welfare1={}",welfare1);
		int cnt=jobopeningService.insertJobOpen(vo);
		logger.info("공고등록결과 cnt={}",cnt);
		String msg="",url="/company/jobopening_register.do";
		if(cnt>0) {
			msg="공고등록성공";
			url="/company/jobopening_list.do";
		}else {
			msg="공고등록 실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	@RequestMapping("/jobopening_list.do")
	public String jobopening_list(
			@RequestParam(required=false) String[] localcheck1,
			@RequestParam(required=false) String[] workway1,
			@RequestParam(required=false) String[] payway1,
			@RequestParam(required=false) String[] academicCondition1, HttpSession session,
			@ModelAttribute SearchVO searchVo,Model model) {
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
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//2]SearchVo에 페이징 관련 변수 세팅
		searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("셋팅 후 serchVo={}",searchVo);
		
		List<JobopeningVO> list=new ArrayList<JobopeningVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("localcheck1={},workway1={}",localcheck1,workway1);
		logger.info("payway1={},academicCondition1={}",payway1,academicCondition1);
		logger.info("searchVo.getFirstRecordIndex()={},getRecordCountPerPage={}",searchVo.getFirstRecordIndex(),searchVo.getRecordCountPerPage());
			map.put("localcheck1", localcheck1);
			map.put("workway1", workway1);
			map.put("payway1", payway1);
			map.put("academicCondition1", academicCondition1);
			map.put("firstRecordIndex", searchVo.getFirstRecordIndex());
			map.put("recordCountPerPage", searchVo.getRecordCountPerPage());
			logger.info("map={}",map);
		list = jobopeningService.selectJobOpen2(map);
		logger.info("공고 검색 결과: list.size()={}",list.size());
		//list=jobopeningService.selectJobOpen(searchVo);
		//logger.info("공고 list.size={}",list.size());
		List<CompanyVO> clist=new ArrayList<CompanyVO>();
		for(int i=0;i<list.size();i++){
			clist.add(companyService.selectcompany(list.get(i).getCompanyCode()));
			logger.info("clist[{}]={}",i,clist.get(i).getCompanyname());
		}
		logger.info("clist.size={}",clist.size());
		int totalRecord=0;
		totalRecord=jobopeningService.selectTotalCount(map);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}",totalRecord);
		
		//5]PaginationInfo에 totalRecord값셋팅
		pagingInfo.setTotalRecord(totalRecord);
		//3
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("clist",clist);
		model.addAttribute("mvo", mvo);
		return "company/jobopening_list";
	}
	@RequestMapping("/my_jobopening_list.do")
	public String my_jobopening_list(
			@RequestParam(required=false) String[] localcheck1,
			@RequestParam(required=false) String[] workway1,
			@RequestParam(required=false) String[] payway1,
			@RequestParam(required=false) String[] academicCondition1, HttpSession session,
			@ModelAttribute SearchVO searchVo,
			@RequestParam int companycode1,
			Model model) {
		String id=(String)session.getAttribute("memberid");
		MemberVO mvo=memberService.selectByUserid(id);
		logger.info("로그인한 회원정보 mvo={}",mvo);
		logger.info("채용공고 리스트");
		//1]PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//2]SearchVo에 페이징 관련 변수 세팅
		searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("셋팅 후 serchVo={}",searchVo);
		
		List<JobopeningVO> list=new ArrayList<JobopeningVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("localcheck1={},workway1={}",localcheck1,workway1);
		logger.info("payway1={},academicCondition1={}",payway1,academicCondition1);
		logger.info("searchVo.getFirstRecordIndex()={},getRecordCountPerPage={}",searchVo.getFirstRecordIndex(),searchVo.getRecordCountPerPage());
		map.put("localcheck1", localcheck1);
		map.put("workway1", workway1);
		map.put("payway1", payway1);
		map.put("academicCondition1", academicCondition1);
		map.put("firstRecordIndex", searchVo.getFirstRecordIndex());
		map.put("recordCountPerPage", searchVo.getRecordCountPerPage());
		map.put("companycode1", companycode1);
		logger.info("map={}",map);
		list = jobopeningService.selectJobOpen(map);
		logger.debug("상품 검색 결과: list.size()={}",list.size());		
		List<CompanyVO> clist=new ArrayList<CompanyVO>();
		for(int i=0;i<list.size();i++){
			clist.add(companyService.selectcompany(list.get(i).getCompanyCode()));
			logger.info("clist[{}]={}",i,clist.get(i).getCompanyname());
		}
		//list=jobopeningService.selectJobOpen(searchVo);
		//logger.info("공고 list.size={}",list.size());
		
		int totalRecord=0;
		totalRecord=jobopeningService.selectTotalCount2(map);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}",totalRecord);
		
		//5]PaginationInfo에 totalRecord값셋팅
		pagingInfo.setTotalRecord(totalRecord);
		//3
		model.addAttribute("clist",clist);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("mvo", mvo);
		return "company/my_jobopening_list";
	}
	@RequestMapping("/jobopening_view.do")
	public String jobopening_view(@RequestParam (defaultValue = "0")int jobopening,HttpSession session,Model model) {
		logger.info("채용공고뷰보기 파라미터 jobopening={}",jobopening);
		JobopeningVO vo=jobopeningService.selectJobOpenByNo(jobopening);
		String id=(String)session.getAttribute("memberid");
		if(id==null) {
			id="비회원";
		}
		MemberVO mvo=memberService.selectByUserid(id);
		CompanyVO cvo=companyService.selectcompany(vo.getCompanyCode());
		logger.info("로그인한 회원 정보 mvo={}",mvo);
		logger.info("자세히보기 변수 vo=",vo);
		model.addAttribute("vo", vo);
		model.addAttribute("mvo", mvo);
		model.addAttribute("cvo", cvo);
		return "company/jobopening_view";
	}
	@RequestMapping("/jobopening_where.do")
	public String jobopening_where() {
		logger.info("조건지정");
		return "company/jobopening_where";
	}
	@RequestMapping(value="/jobopening_edit.do",method = RequestMethod.GET)
	public String jobopening_edit(@RequestParam (defaultValue = "0")int jobopening,HttpServletRequest request,
			Model model) {
		logger.info("수정");
		JobopeningVO vo=jobopeningService.selectJobOpenByNo(jobopening);
		
		
		String fileInfo
		=fileUploadUtil.getFileInfo(vo.getCompanyimage(), 1, request);
		model.addAttribute("vo", vo);
		model.addAttribute("fileInfo", fileInfo);
		return "company/jobopening_edit";
	}
	@RequestMapping(value="/jobopening_edit.do",method =RequestMethod.POST)
	public String jobopening_edit_post(@ModelAttribute JobopeningVO vo,@RequestParam String oldFileName,HttpServletRequest request,Model model) {
		logger.info("수정처리");
		
		List<Map<String,Object>>list=fileUploadUtil.fileUpload(request);
		 
		String imageURL="";
		for(Map<String,Object>map:list) {
			imageURL=(String)map.get("fileName");
		}
		vo.setCompanyimage(imageURL);
		
		int cnt=jobopeningService.updateJobOpen(vo);
		logger.info("수정처리결과 cnt={}",cnt);
		String msg="",url="/company/jobopening_edit.do?jobopening="+vo.getJobopening();
		if(cnt>0) {
			msg="수정성공";
			url="/company/jobopening_view.do?jobopening="+vo.getJobopening();
			//새로 업로드한 경우, 기존 파일이 있으면 기존파일은 삭제
			if(imageURL!=null && !imageURL.isEmpty()) {
				if(oldFileName!=null && !oldFileName.isEmpty()) {
					String path=fileUploadUtil.getUploadPath(request);
					File oldFile=new File(path, oldFileName);
					if(oldFile.exists()) {
						boolean bool=oldFile.delete();
						logger.info("기존 파일 삭제 여부={}", bool);
					}
				}
			}
		}else {
			msg="수정실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	@RequestMapping(value="/jobopening_upHit.do",method = RequestMethod.GET)
	public String jobopening_upHit(@RequestParam (defaultValue = "0")int jobopening,HttpServletRequest request,Model model) {
		logger.info("수정처리");
		int cnt=jobopeningService.updateHits(jobopening);
		logger.info("조회수 증가 결과 cnt={}",cnt);
		String url="";
		if(cnt>0) {
			url="/company/jobopening_view.do?jobopening="+jobopening;
		}else {
			url="/company/jobopening_list.do";
		}
		model.addAttribute("url", url);
		return "redirect:"+url;
	}

	/* @Transactional */
	@RequestMapping(value="/jobopening_del.do",method=RequestMethod.POST)
	public String jobopening_del_post(@ModelAttribute JobopeningVO vo,@RequestParam String pwd,HttpSession session,HttpServletRequest request,Model model) {
		logger.info("삭제처리 vo={}, pwd={}",vo,pwd);
		String id=(String)session.getAttribute("memberid");
		if(id==null) {
			id="비회원";
		}
		String msg="",url="";
		MemberVO mvo=memberService.selectByUserid(id);
		logger.info("로그인한 회원 mvo={}",mvo);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("companyCode", mvo.getCompanyCode());
		map.put("pwd", pwd);
		logger.info("map={}",map);
		int cnt2=0;
		if(mvo.getCompanyCode()==vo.getCompanyCode()) {
			cnt2=jobopeningService.selectPwdCheck(map);
		}
		logger.info("본인확인결과={}",cnt2);
		int cnt=0;
		if(cnt2>0) {
			cnt=jobopeningService.deleteJobOpen(vo.getJobopening());
			logger.info("삭제결과={}",cnt);
			if(cnt>0) {
				msg="삭제완료";
				url="/company/jobopening_list.do";
				if(vo.getCompanyimage()!=null 
						&& !vo.getCompanyimage().isEmpty()) {
					String path=fileUploadUtil.getUploadPath(request);
					File file=new File(path, vo.getCompanyimage());
					if(file.exists()) {
						boolean bool=file.delete();
						logger.info("파일삭제 여부={}", bool);
					}
				}	
			}else {
				msg="삭제실패";
				url="/company/jobopening_view.do?jobopening=";
			}
		}else {
			msg="비밀번호 틀렸습니다.";
			url="/company/jobopening_deleteck.do?jobopening="+vo.getJobopening();
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("mvo", mvo);
		return "common/message";
	}
	
	@RequestMapping(value="/jobopening_del.do",method=RequestMethod.GET)
	public String jobopening_del(@RequestParam int[]jobopening,HttpServletRequest request,
			HttpSession session,
			Model model) {
		logger.info("삭제처리");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("jobopening", jobopening);
		JobopeningVO vo=new JobopeningVO();
		String msg="",url="";
		for(int i=0;i<jobopening.length;i++) {
			logger.info("jobopening.length={}",jobopening.length);
			logger.info("jobopening[{}]={}",i,jobopening[i]);
			vo=jobopeningService.selectJobOpenByNo(jobopening[i]);
			int cnt=jobopeningService.deleteJobOpen(jobopening[i]);
			logger.info("vo={}",vo);
			if(cnt>0) {
				msg="삭제완료";
				url="/company/jobopening_list.do";
				if(vo.getCompanyimage()!=null 
						&& !vo.getCompanyimage().isEmpty()) {
					String path=fileUploadUtil.getUploadPath(request);
					File file=new File(path, vo.getCompanyimage());
					if(file.exists()) {
						boolean bool=file.delete();
						logger.info("파일삭제 여부={}", bool);
					}
				}	
			}else {
				msg="삭제실패";
				url="/company/jobopening_view.do?jobopening="+jobopening;
			}
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	@RequestMapping(value="/jobopening_agreeEdit.do",method=RequestMethod.GET)
	public String jobopening_agreeEdit(@RequestParam (defaultValue = "0")int jobopening,Model model) {
		logger.info("활성화 변경 jobopening={}",jobopening);
		JobopeningVO vo=jobopeningService.selectJobOpenByNo(jobopening);
		logger.info("jobopeningbyno={}",vo);
		int cnt=jobopeningService.updateAdminagree(vo);
		logger.info("활성화 변경 결과 cnt={}",cnt);
		String msg="",url="/company/jobopening_view.do?jobopening="+jobopening;
		if(cnt>0) {
			msg="활성화 변경 완료";
			url="/company/jobopening_list.do";
		}else {
			msg="활성화 변경 실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	@RequestMapping(value="/jobopening_deleteck.do")
	public String jobopening_deleteck(@RequestParam int jobopening,Model model)
	{
		logger.info("본인이 쓴 글인지 체크 jobopening={}",jobopening);
		JobopeningVO vo=jobopeningService.selectJobOpenByNo(jobopening);
		model.addAttribute("vo", vo);
		return "company/jobopening_deleteck";
	}
	@RequestMapping(value="/jobopening_agreeeditck.do", method = RequestMethod.GET)
	public String jobopening_agreeeditck_get(@RequestParam int jobopening,Model model) {
		logger.info("본인이 쓴 글인지 체크 jobopening={}",jobopening);
		JobopeningVO vo=jobopeningService.selectJobOpenByNo(jobopening);
		model.addAttribute("vo", vo);
		return "company/jobopening_agreeeditck";
	}
	@RequestMapping(value="/jobopening_agreeeditck.do", method = RequestMethod.POST)
	public String jobopening_agreeeditck_post(@ModelAttribute JobopeningVO vo,@RequestParam String pwd,HttpSession session,HttpServletRequest request,Model model) {
		logger.info("본인확인처리 vo={}, pwd={}",vo,pwd);
		String id=(String)session.getAttribute("memberid");
		if(id==null) {
			id="비회원";
		}
		String msg="본인의 공고만 수정할 수 있습니다." ,url="/company/jobopening_agreeeditck.do?jobopening="+vo.getJobopening();
		MemberVO mvo=memberService.selectByUserid(id);
		logger.info("로그인한 회원 mvo={}",mvo);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("companyCode", mvo.getCompanyCode());
		map.put("pwd", pwd);
		logger.info("map={}",map);
		int cnt2=0;
		if(mvo.getCompanyCode()==vo.getCompanyCode()) {
			cnt2=jobopeningService.selectPwdCheck(map);
		}
		logger.info("본인확인결과={}",cnt2);
		if(cnt2>0) {
			msg="본인확인성공";
			url="/company/jobopening_agreeEdit.do?jobopening="+vo.getJobopening();
		}else {
			if(mvo.getCompanyCode()==vo.getCompanyCode()) {
				msg="비밀번호 틀림.";
			}
			else {
				msg="본인의 공고만 수정할 수 있습니다.";
			}
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		return "common/message";
	}
	@RequestMapping(value="/jobopening_editck.do",method = RequestMethod.GET)
	public String jobopening_editck_get(@RequestParam int jobopening,Model model) {
		logger.info("본인이 쓴 글인지 체크 jobopening={}",jobopening);
		JobopeningVO vo=jobopeningService.selectJobOpenByNo(jobopening);
		model.addAttribute("vo", vo);
		return "company/jobopening_editck";
	}
	@RequestMapping(value="/jobopening_editck.do",method = RequestMethod.POST)
	public String jobopening_editck_post(@ModelAttribute JobopeningVO vo,@RequestParam String pwd,HttpSession session,HttpServletRequest request,Model model) {
		logger.info("본인확인처리 vo={}, pwd={}",vo,pwd);
		String id=(String)session.getAttribute("memberid");
		if(id==null) {
			id="비회원";
		}
		String msg="본인의 공고만 수정할 수 있습니다.",url="/company/jobopening_editck.do?jobopening="+vo.getJobopening();
		MemberVO mvo=memberService.selectByUserid(id);
		logger.info("로그인한 회원 mvo={}",mvo);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("companyCode", mvo.getCompanyCode());
		map.put("pwd", pwd);
		logger.info("map={}",map);
		int cnt2=0;
		if(mvo.getCompanyCode()==vo.getCompanyCode()) {
			cnt2=jobopeningService.selectPwdCheck(map);
		}
		logger.info("본인확인결과={}",cnt2);
		if(cnt2>0) {
			msg="본인확인성공";
			url="/company/jobopening_edit.do?jobopening="+vo.getJobopening();
		}else {
			if(mvo.getCompanyCode()==vo.getCompanyCode()) {
				msg="비밀번호 틀림.";
			}
			else {
			}
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		return "common/message";
	}
}
