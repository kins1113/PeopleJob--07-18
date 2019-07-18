package com.ez.peoplejob.jobopening.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.member.model.MemberVO;

@Repository
public class JobopeningDAOMybatis implements JobopeningDAO{
	
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.company.";
	@Override
	public int insertJobOpen(JobopeningVO vo) {
		return sqlSession.insert(namespace+"insertJobOpen",vo);
	}
	
	@Override
	public JobopeningVO selectJobOpenByNo(int jobopening) {
		return sqlSession.selectOne(namespace+"selectJobOpenByNo",jobopening);
	}
	@Override
	public int updateJobOpen(JobopeningVO vo) {
		return sqlSession.update(namespace+"updateJobOpen",vo);
	}
	@Override
	public int updateHits(int jobopening) {
		return sqlSession.update(namespace+"updateHits",jobopening);
	}
	@Override
	public int deleteJobOpen(int jobopening) {
		return sqlSession.delete(namespace+"deleteJobOpen",jobopening);
	}
	@Override
	public int updateAdminagree(JobopeningVO vo) {
		return sqlSession.update(namespace+"updateAdminagree",vo);
	}
	@Override
	public int selectTotalCount(Map<String,Object>map) {
		return sqlSession.selectOne(namespace+"selectTotalCount",map);
	}
	@Override
	public int selectTotalCount2(Map<String,Object>map) {
		return sqlSession.selectOne(namespace+"selectTotalCount2",map);
	}
	@Override
	public List<JobopeningVO> selectJobOpen2(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectJobOpen2",map);
	}

	@Override
	public List<JobopeningVO> selectJobOpen(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectJobOpen",map);
	}
	@Override
	public int selectPwdCheck(Map<String,Object>map) {
		return sqlSession.selectOne(namespace+"selectPwdCheck",map);
	}

	@Override
	public List<JobopeningVO> selectJobopeningBycomcode(int companyCode) {
		return sqlSession.selectList(namespace+"selectJobopeningBycomcode",companyCode);
	}

	@Override
	public List<Map<String, Object>> deadlineimminentBymonth() {
		return sqlSession.selectList(namespace+"deadlineimminentBymonth");
	}


	         
	
}
