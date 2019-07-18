package com.ez.peoplejob.resume.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.peoplejob.common.SearchVO;

@Service
public class ResumeServiceImpl implements ResumeService{
	@Autowired
	private ResumeDAO resumeDao;
	@Override
	@Transactional
	public int insertResume(ResumeVO vo) {
		
		int cnt=resumeDao.insertLangcertification(vo);
		cnt=resumeDao.insertCertificate(vo);
		cnt=resumeDao.insertCareer(vo);
		cnt=resumeDao.insertEducation(vo);
		cnt=resumeDao.insertLocation2(vo);
		cnt=resumeDao.insertLocation(vo);
		cnt=resumeDao.insertBtype1(vo);
		cnt=resumeDao.insertBtype2(vo);
		cnt=resumeDao.insertBtype3(vo);
		cnt=resumeDao.insertFirst(vo);
		cnt=resumeDao.insertSecond(vo);
		cnt=resumeDao.insertThird(vo);
		cnt=resumeDao.insertHopeWorking(vo);
		cnt=resumeDao.insertResume(vo);
		
		return cnt;
	}
	@Override
	public ResumeVO selectResumeByNo(int resumeCode) {
		return resumeDao.selectResumeByNo(resumeCode);
	}
	@Override
	public int deleteResumeByNo(int resumeCode) {
		return resumeDao.deleteResumeByNo(resumeCode);
	}
	@Override
	public int updateResume(ResumeVO vo) {
		return resumeDao.updateResume(vo);
	}
	@Override
	public int insertLangcertification(ResumeVO vo) {
		return resumeDao.insertLangcertification(vo);
	}
	@Override
	public int insertCertificate(ResumeVO vo) {
		return resumeDao.insertCertificate(vo);
	}
	@Override
	public int insertCareer(ResumeVO vo) {
		return resumeDao.insertCareer(vo);
	}
	@Override
	public int insertEducation(ResumeVO vo) {
		return resumeDao.insertEducation(vo);
	}
	@Override
	public int insertHopeWorking(ResumeVO vo) {
		return resumeDao.insertHopeWorking(vo);
	}
	@Override
	public int insertFirst(ResumeVO vo) {
		return resumeDao.insertFirst(vo);
	}
	@Override
	public int insertSecond(ResumeVO vo) {
		return resumeDao.insertSecond(vo);
	}
	@Override
	public int insertThird(ResumeVO vo) {
		return resumeDao.insertThird(vo);
	}
	@Override
	public int insertLocation(ResumeVO vo) {
		return resumeDao.insertLocation(vo);
	}
	@Override
	public ResumeVO selectByMemverid(String memberid) {
		return resumeDao.selectByMemverid(memberid);
	}
	@Override
	public List<ResumeVO> selectAll(SearchVO searscVo) {
		return resumeDao.selectAll(searscVo);
	}
	@Override
	public int insertMember2(ResumeVO vo) {
		return resumeDao.insertMember2(vo);
	}
	@Override
	public ResumeVO selectBylanglicenceCode(int langlicenceCode) {
		return resumeDao.selectBylanglicenceCode(langlicenceCode);
	}
	@Override
	public ResumeVO selectBylicenceCode(int licenceCode) {
		return resumeDao.selectBylicenceCode(licenceCode);
	}
	@Override
	public ResumeVO selectBydvCode(int dvCode) {
		return resumeDao.selectBydvCode(dvCode);
	}
	@Override
	public ResumeVO selectByacademicCode(int academicCode) {
		return resumeDao.selectByacademicCode(academicCode);
	}
	@Override
	public ResumeVO selectBydesiredWorkCode(int desiredWorkCode) {
		return resumeDao.selectBydesiredWorkCode(desiredWorkCode);
	}
	@Override
	public ResumeVO selectBymemberCode(int memberCode) {
		return resumeDao.selectBymemberCode(memberCode);
	}
	@Override
	public List<ResumeVO> selectAllBtype() {
		
		return resumeDao.selectAllBtype();
	}
	@Override
	public int insertBtype1(ResumeVO vo) {
		return resumeDao.insertBtype1(vo);
	}
	@Override
	public int insertBtype2(ResumeVO vo) {
		return resumeDao.insertBtype2(vo);
	}
	@Override
	public int insertBtype3(ResumeVO vo) {
		return resumeDao.insertBtype3(vo);
	}
	@Override
	public int insertLocation2(ResumeVO vo) {
		
		return resumeDao.insertLocation2(vo);
	}
	@Override
	public ResumeVO selectBybtype1(int btypeCode1) {
		return resumeDao.selectBybtype1(btypeCode1);
	}
	@Override
	public ResumeVO selectBybtype2(int btypeCode2) {
		return resumeDao.selectBybtype2(btypeCode2);
	}
	@Override
	public ResumeVO selectBybtype3(int btypeCode3) {
		return resumeDao.selectBybtype3(btypeCode3);
	}
	@Override
	public ResumeVO selectBylocation(int localCode) {
		return resumeDao.selectBylocation(localCode);
	}
	@Override
	public ResumeVO selectBylocation2(int localCode2) {
		return resumeDao.selectBylocation2(localCode2);
	}
	@Override
	public ResumeVO selectByfirst(int firstCode) {
		return resumeDao.selectByfirst(firstCode);
	}
	@Override
	public ResumeVO selectBysecond(int secondCode) {
		return resumeDao.selectBysecond(secondCode);
	}
	@Override
	public ResumeVO selectBythird(int thirdCode) {
		return resumeDao.selectBythird(thirdCode);
	}
	

}
