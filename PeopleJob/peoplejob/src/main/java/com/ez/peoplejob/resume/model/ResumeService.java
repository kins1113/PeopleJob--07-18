package com.ez.peoplejob.resume.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.common.SearchVO;

public interface ResumeService {
	public int insertMember2(ResumeVO vo);
	public int insertResume(ResumeVO vo);
	public ResumeVO selectResumeByNo(int resumeCode);
	public int deleteResumeByNo(int resumeCode);
	
	public int updateResume(ResumeVO vo);
	public int insertLangcertification(ResumeVO vo);
	
	public int insertCertificate(ResumeVO vo);
	
	public int insertCareer(ResumeVO vo);
	
	public int insertEducation(ResumeVO vo);
	
	public int insertHopeWorking(ResumeVO vo);
	public int insertLocation(ResumeVO vo);
	public int insertFirst(ResumeVO vo);
	
	public int insertSecond(ResumeVO vo);
	
	public int insertThird(ResumeVO vo);
	
	public ResumeVO selectByMemverid (String memberid);
	
	public List<ResumeVO> selectAll(SearchVO searscVo);
	
	public ResumeVO selectBylanglicenceCode(int langlicenceCode);
	public ResumeVO selectBylicenceCode(int lNo);
	public ResumeVO selectBydvCode(int dvCode);
	public ResumeVO selectByacademicCode(int academicCode);
	public ResumeVO selectBydesiredWorkCode(int hopeworkCode);
	public ResumeVO selectBymemberCode(int memberCode);
	public ResumeVO selectBybtype1(int btypeCode1);
	public ResumeVO selectBybtype2(int btypeCode2);
	public ResumeVO selectBybtype3(int btypeCode3);
	public ResumeVO selectBylocation(int localCode);
	public ResumeVO selectBylocation2(int localCode2);
	public ResumeVO selectByfirst(int firstCode);
	public ResumeVO selectBysecond(int secondCode);
	public ResumeVO selectBythird(int thirdCode);
	public List<ResumeVO>selectAllBtype();
	
	public int insertBtype1(ResumeVO vo);
	public int insertBtype2(ResumeVO vo);
	public int insertBtype3(ResumeVO vo);
	public int insertLocation2(ResumeVO vo);
	
	int updatelang(ResumeVO vo);
	int updatecer(ResumeVO vo);
	int updatecareer(ResumeVO vo);
	int updateedu(ResumeVO vo);
	int updatehope(ResumeVO vo);
	int updatemember(ResumeVO vo);
	
	List<Map<String, Object>> selectResumeByid(String memberid);
	int insertCopy(int resumeCode);
}
