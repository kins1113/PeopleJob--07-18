package com.ez.peoplejob.resume.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.peoplejob.common.SearchVO;

@Repository
public class ResumeDAOMybatis implements ResumeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	private String namespace="config.mybatis.mapper.oracle.resume.";
	
	public int insertResume(ResumeVO vo) {
		int cnt=sqlsession.insert(namespace+"insertResume",vo);
		return cnt;
	}

	@Override
	public ResumeVO selectResumeByNo(int resumeCode) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectResumeByNo",resumeCode);
		
		return vo;
	}

	@Override
	public int deleteResumeByNo(int resumeCode) {
		int cnt=sqlsession.delete(namespace+"deleteResumeByNo",resumeCode);
		return cnt;
	}

	@Override
	public int updateResume(ResumeVO vo) {
		int cnt=sqlsession.update(namespace+"updateResume",vo);
		return cnt;
	}

	@Override
	public int insertLangcertification(ResumeVO vo) {
		int cnt=sqlsession.insert(namespace+"insertLangcertification",vo);
		return cnt;
	}

	@Override
	public int insertCertificate(ResumeVO vo) {
		int cnt=sqlsession.insert(namespace+"insertCertificate",vo);
		return cnt;
	}

	@Override
	public int insertCareer(ResumeVO vo) {
		int cnt=sqlsession.insert(namespace+"insertCareer",vo);
		return cnt;
	}

	@Override
	public int insertEducation(ResumeVO vo) {
		int cnt=sqlsession.insert(namespace+"insertEducation",vo);
		return cnt;
	}

	@Override
	public int insertHopeWorking(ResumeVO vo) {
		int cnt=sqlsession.insert(namespace+"insertHopeWorking",vo);
		return cnt;
	}

	@Override
	public int insertFirst(ResumeVO vo) {
		int cnt=sqlsession.insert(namespace+"insertFirst",vo);
		return cnt;
	}

	@Override
	public int insertSecond(ResumeVO vo) {
		int cnt=sqlsession.insert(namespace+"insertSecond",vo);
		return cnt;
	}

	@Override
	public int insertThird(ResumeVO vo) {
		int cnt=sqlsession.insert(namespace+"insertThird",vo);
		return cnt;
	}

	@Override
	public int insertLocation(ResumeVO vo) {
		int cnt=sqlsession.insert(namespace+"insertLocation",vo);
		return cnt;
	}

	@Override
	public ResumeVO selectByMemverid(String memberid) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectByMemverid",memberid);
		return vo;
	}

	@Override
	public List<ResumeVO> selectAll(SearchVO searscVo) {
		List<ResumeVO> list=sqlsession.selectList(namespace+"selectSearch",searscVo);
		return list;
	}

	@Override
	public int insertMember2(ResumeVO vo) {
		int cnt=sqlsession.insert(namespace+"insertMember2",vo);
		return cnt;
	}

	@Override
	public ResumeVO selectBylanglicenceCode(int langlicenceCode) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectBylanglicenceCode", langlicenceCode );
		return vo;
	}

	@Override
	public ResumeVO selectBylicenceCode(int licenceCode) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectBylicenceCode", licenceCode );
		return vo;
	}

	@Override
	public ResumeVO selectBydvCode(int dvCode) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectBydvCode", dvCode );
		return vo;
	}

	@Override
	public ResumeVO selectByacademicCode(int academicCode) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectByacademicCode", academicCode );
		return vo;
	}

	@Override
	public ResumeVO selectBydesiredWorkCode(int desiredWorkCode) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectBydesiredWorkCode", desiredWorkCode );
		return vo;
	}

	@Override
	public ResumeVO selectBymemberCode(int memberCode) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectBymemberCode", memberCode );
		return vo;
	}

	@Override
	public List<ResumeVO> selectAllBtype() {
		List<ResumeVO> list=sqlsession.selectList(namespace+"selectAllBtype");
		return list;
	}

	@Override
	public int insertBtype1(ResumeVO vo) {
		int cnt=sqlsession.insert(namespace+"insertBtype1",vo);
		return cnt;
	}

	@Override
	public int insertBtype2(ResumeVO vo) {
		int cnt=sqlsession.insert(namespace+"insertBtype2",vo);
		return cnt;
	}

	@Override
	public int insertBtype3(ResumeVO vo) {
		int cnt=sqlsession.insert(namespace+"insertBtype3",vo);
		return cnt;
	}

	@Override
	public int insertLocation2(ResumeVO vo) {
		int cnt=sqlsession.insert(namespace+"insertLocation2",vo);
		return cnt;
	}

	@Override
	public ResumeVO selectBybtype1(int btypeCode1) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectBybtype1",btypeCode1);
		return vo;
	}

	@Override
	public ResumeVO selectBybtype2(int btypeCode2) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectBybtype2",btypeCode2);
		return vo;
	}

	@Override
	public ResumeVO selectBybtype3(int btypeCode3) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectBybtype3",btypeCode3);
		return vo;
	}

	@Override
	public ResumeVO selectBylocation(int localCode) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectBylocation",localCode);
		return vo;
	}

	@Override
	public ResumeVO selectBylocation2(int localCode2) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectBylocation2",localCode2);
		return vo;
	}

	@Override
	public ResumeVO selectByfirst(int firstCode) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectByfirst",firstCode);
		return vo;
	}

	@Override
	public ResumeVO selectBysecond(int secondCode) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectBysecond",secondCode);
		return vo;
	}

	@Override
	public ResumeVO selectBythird(int thirdCode) {
		ResumeVO vo=sqlsession.selectOne(namespace+"selectBythird",thirdCode);
		return vo;
	}
}
