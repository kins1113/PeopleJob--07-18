package com.ez.peoplejob.resume.model;

import java.util.List;
import java.util.Map;

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
		int cnt=resumeDao.insertEducation(vo);
		cnt=resumeDao.insertCareer(vo);
		cnt=resumeDao.insertCertificate(vo);
		cnt=resumeDao.insertLangcertification(vo);
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
	@Transactional
	public int updateResume(ResumeVO vo) {
		int cnt=resumeDao.updatemember(vo);
		cnt=resumeDao.updateedu(vo);
		cnt=resumeDao.updatecareer(vo);
		cnt=resumeDao.updatecer(vo);
		cnt=resumeDao.updatelang(vo);
		cnt=resumeDao.updatehope(vo);
		cnt=resumeDao.updateResume(vo);
		return cnt;
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
	public ResumeVO selectBylicenceCode(int lNo) {
		return resumeDao.selectBylicenceCode(lNo);
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
	public ResumeVO selectBydesiredWorkCode(int hopeworkCode) {
		return resumeDao.selectBydesiredWorkCode(hopeworkCode);
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
	@Override
	public int updatelang(ResumeVO vo) {
		return resumeDao.updatelang(vo);
	}
	@Override
	public int updatecer(ResumeVO vo) {
		return resumeDao.updatecer(vo);
	}
	@Override
	public int updatecareer(ResumeVO vo) {
		return resumeDao.updatecareer(vo);
	}
	@Override
	public int updateedu(ResumeVO vo) {
		return resumeDao.updateedu(vo);
	}
	@Override
	public int updatehope(ResumeVO vo) {
		return resumeDao.updatehope(vo);
	}
	@Override
	public int updatemember(ResumeVO vo) {
		return resumeDao.updatemember(vo);
	}
	
	@Override
	public List<Map<String, Object>> selectResumeByid(String memberid) {
		return resumeDao.selectResumeByid(memberid);
	}
	@Override
	public int insertCopy(int resumeCode) {
		return resumeDao.insertCopy(resumeCode);
	}
}
