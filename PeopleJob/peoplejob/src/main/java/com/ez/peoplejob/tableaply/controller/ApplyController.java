package com.ez.peoplejob.tableaply.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.common.WebUtility;
import com.ez.peoplejob.jobopening.model.JobopeningService;
import com.ez.peoplejob.jobopening.model.JobopeningVO;
import com.ez.peoplejob.member.model.CompanyVO;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.member.model.MemberVO;
import com.ez.peoplejob.resume.model.ResumeService;
import com.ez.peoplejob.resume.model.ResumeVO;
import com.ez.peoplejob.tableaply.model.TableaplyService;
import com.ez.peoplejob.tableaply.model.TableaplyVO;

@Controller
@RequestMapping("/apply")
public class ApplyController {
	private Logger logger=LoggerFactory.getLogger(ApplyController.class);
	@Autowired JobopeningService jobopeningService;
	@Autowired TableaplyService tableaplyService;
	@Autowired MemberService memberService;
	@Autowired ResumeService resumeService;
	@RequestMapping("/insertapply.do")
	public String insertapply(@RequestParam int jobopening,
			@RequestParam int resumeCode,
			HttpSession session,Model model) {
		String id=(String)session.getAttribute("memberid");
		MemberVO mvo=memberService.selectByUserid(id);
		logger.info("지원현황 인서트 파라미터 jobopening={}",jobopening);
		logger.info("로그인 회원 정보 mvo={}",mvo);
		TableaplyVO vo=new TableaplyVO();
		vo.setJobopening(jobopening);
		vo.setMemberCode(mvo.getMemberCode());
		logger.info("지원현황 인서트 파라미터 vo={}",vo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jobopening", jobopening);
		map.put("memberCode", mvo.getMemberCode());
		vo.setResumeCode(resumeCode);
		map.put("resumeCode",resumeCode);
		int cnt=0;
		int cnt2=(int)tableaplyService.dupapply(map);
		int cnt3=tableaplyService.cntresume(mvo.getMemberCode());
		logger.info("지원현황 중복검사 cnt2={}",cnt2);
		logger.info("이력서 작성여부 cnt3={}",cnt3);
		String msg="",url="";
		if(cnt2==0) {
			if(cnt3>0) {
				cnt=tableaplyService.insertapply(vo);
				if(cnt>0) {
					msg="지원성공";
					url="/apply/apply_list.do";
				}else {
					if(cnt2==0) {
						msg="지원실패";
					}else {
						msg="같은 공고에 중복지원은 안됩니다.";
					}
					url="/company/jobopening_list.do";
				}
			}
			else {
				msg="이력서를 작성 후 지원가능합니다";
				url="/resume/register.do";
			}
		}else {
			msg="같은 공고에 중복지원은 안됩니다.";
			url="/company/jobopening_list.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	@RequestMapping(value="/apply_list.do",method = RequestMethod.GET)
	public String apply_list(HttpSession session,
			@ModelAttribute SearchVO searchVo,
			Model model) {
		String id=(String)session.getAttribute("memberid");
		MemberVO mvo=memberService.selectByUserid(id);
		logger.info("로그인한 회원정보 mvo={}",mvo);
		logger.info("지원현황 리스트");
		//1]PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//2]SearchVo에 페이징 관련 변수 세팅
		searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("셋팅 후 serchVo={}",searchVo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("searchVo.getFirstRecordIndex()={},getRecordCountPerPage={}",searchVo.getFirstRecordIndex(),searchVo.getRecordCountPerPage());
		map.put("firstRecordIndex", searchVo.getFirstRecordIndex());
		map.put("recordCountPerPage", searchVo.getRecordCountPerPage());
		map.put("memberCode",mvo.getMemberCode());
		logger.info("map={}",map);
		List<TableaplyVO> list=tableaplyService.selectapply(map);
		logger.info("지원현황 조회결과{}",list);
		int totalRecord=0;
		totalRecord=tableaplyService.selectapplyCount(map);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}",totalRecord);
		
		List<JobopeningVO> list4=new ArrayList<JobopeningVO>() ;
		List<CompanyVO> list5=new ArrayList<CompanyVO>() ;
		int jobopening[]=new int[list.size()];
		int company[]=new int[list.size()];
		for(int i=0;i<list.size();i++) {
			jobopening[i]=list.get(i).getJobopening();
			list4.add(jobopeningService.selectJobOpenByNo(jobopening[i]));
			company[i]=list4.get(i).getCompanyCode();
			list5.add(jobopeningService.selectcompany(company[i]));
		}
		
		//5]PaginationInfo에 totalRecord값셋팅
		pagingInfo.setTotalRecord(totalRecord);
		//3
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("list4",list4);
		model.addAttribute("list5",list5);
		model.addAttribute("mvo", mvo);
		return "apply/apply_list";
	}
	@RequestMapping("/apply_del.do")
	public String apply_delete(@RequestParam int []applyCode,Model model) {
		logger.info("삭제처리 파라미터 applyCode1={}",applyCode);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("applyCode1", applyCode);
		int cnt=tableaplyService.deleteapply(map);
		String msg="",url="/apply/apply_list.do";
		if (cnt>0) {
			msg="삭제성공";
		}else {
			msg="삭제실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/Capply_list.do")
	public String Capply_list(HttpSession session,
			@ModelAttribute SearchVO searchVo,
			Model model) {
		String id=(String)session.getAttribute("memberid");
		MemberVO mvo=memberService.selectByUserid(id);
		logger.info("로그인한 회원정보 mvo={}",mvo);
		logger.info("회사에 지원한 회원들 리스트");
		//1]PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//2]SearchVo에 페이징 관련 변수 세팅
		searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("셋팅 후 serchVo={}",searchVo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("searchVo.getFirstRecordIndex()={},getRecordCountPerPage={}",searchVo.getFirstRecordIndex(),searchVo.getRecordCountPerPage());
		map.put("firstRecordIndex", searchVo.getFirstRecordIndex());
		map.put("recordCountPerPage", searchVo.getRecordCountPerPage());
		List<JobopeningVO> list2=jobopeningService.selectJobopeningBycomcode(mvo.getCompanyCode());
		logger.info("로그인한 회원의 작성한 채용공고 사이즈list2.size={}",list2.size());
		int []jobopening=new int[list2.size()];
		for(int i=0;i<list2.size();i++) {
			jobopening[i]=list2.get(i).getJobopening();
		}
		map.put("jobopening",jobopening);
		logger.info("map={}",map);
		List<TableaplyVO> list=tableaplyService.selectapplyComp(map);
		logger.info("지원현황 조회결과{}",list.size());
		int totalRecord=0;
		totalRecord=tableaplyService.selectapplyCompcount(map);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}",totalRecord);
		List<MemberVO> list3=new ArrayList<MemberVO>() ;
		int []memberCode=new int[list.size()];
		List<JobopeningVO> list4=new ArrayList<JobopeningVO>() ;
		
		for(int i=0;i<list.size();i++) {
			memberCode[i]=list.get(i).getMemberCode();
			list3.add(memberService.selectBymemberCode(memberCode[i]));
			jobopening[i]=list.get(i).getJobopening();
			list4.add(jobopeningService.selectJobOpenByNo(jobopening[i]));
		}
		logger.info("지원한 회원들에 대한 정보={}",list3.size());
		//5]PaginationInfo에 totalRecord값셋팅
		pagingInfo.setTotalRecord(totalRecord);
		//3
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("list3",list3);
		model.addAttribute("list4",list4);
		model.addAttribute("mvo", mvo);
		return "apply/Capply_list";
	}
	@RequestMapping("/Check_pay.do") 
	public String Check_pay(@RequestParam (defaultValue = "0")int member_code,
			@RequestParam(defaultValue = "0")int jobopening,
			HttpSession session,Model model) {
		logger.info("결제내역 확인 파라미터 member_code{},jobopening{}",member_code,jobopening);
		String id=(String)session.getAttribute("memberid");
		MemberVO mvo=memberService.selectByUserid(id);
		logger.info("로그인한 회원정보 mvo={}",mvo);
		int cnt=tableaplyService.cntpay(mvo.getMemberCode());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberCode",member_code);
		map.put("jobopening",jobopening);
		TableaplyVO tvo=tableaplyService.selectresumebyid3(map);
		String msg="",url="";
		if(cnt>0) {
			int cnt2=tableaplyService.opencheckY(map);
			logger.info("읽음처리 결과cnt2={}",cnt2);
			msg="이력서보기로 이동합니다";
			url="/resume/resumedetail.do?resumeCode="+tvo.getResumeCode();
		}else {
			msg="결제내역이 없습니다. 결제후 진행가능합니다.";
			url="/service/payment.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	@RequestMapping("/resumelist.do")
	public String list(@ModelAttribute SearchVO searchVo,
			@RequestParam(defaultValue = "0") int jobopening,
			HttpSession session,
			Model model) {
			String id=(String)session.getAttribute("memberid");
			MemberVO mvo=memberService.selectByUserid(id);
			logger.info("로그인한 회원정보 mvo={}",mvo);
			//1
			logger.info("이력서목록 파라미터 searchVo={}", searchVo);
			
			//2
			//[1] PaginationInfo 객체 생성
			PaginationInfo pagingInfo=new PaginationInfo();
			pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
			pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
			pagingInfo.setCurrentPage(searchVo.getCurrentPage());
			
			//[2] SearchVo에 페이징 관련 변수 셋팅
			searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
			searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
			logger.info("셋팅 후 searchVo={}", searchVo);
			
			//[3] 조회처리
			List<ResumeVO> list=tableaplyService.selectresumebyid2(mvo.getMemberCode());
			logger.info("이력서목록 결과, list.size={}",list.size());
				
			//3
			model.addAttribute("list", list);
			model.addAttribute("pagingInfo", pagingInfo);
			
			return "apply/resumelist";
		}
	
}
