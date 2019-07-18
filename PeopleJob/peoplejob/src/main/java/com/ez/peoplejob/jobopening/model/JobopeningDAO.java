package com.ez.peoplejob.jobopening.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.member.model.CompanyVO;
import com.ez.peoplejob.member.model.MemberVO;

public interface JobopeningDAO {
	public int insertJobOpen(JobopeningVO vo);
	List<JobopeningVO>selectJobOpen(Map<String, Object>map);
	List<JobopeningVO>selectJobOpen2(Map<String, Object>map);
	JobopeningVO selectJobOpenByNo(int jobopening);
	int updateJobOpen(JobopeningVO vo);
	int updateHits(int jobopening);
	int deleteJobOpen(int jobopening);
	int updateAdminagree(JobopeningVO vo);
	int selectTotalCount(Map<String,Object>map);
	int selectTotalCount2(Map<String,Object>map);
	int selectPwdCheck(Map<String,Object>map);
	List<JobopeningVO>selectJobopeningBycomcode(int companyCode);
	
	List<Map<String, Object>> deadlineimminentBymonth();
	
}
