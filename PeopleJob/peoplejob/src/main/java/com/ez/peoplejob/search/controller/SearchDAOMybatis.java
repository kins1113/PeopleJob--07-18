package com.ez.peoplejob.search.controller;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.peoplejob.jobopening.model.JobopeningVO;
import com.ez.peoplejob.member.model.CompanyVO;
@Repository
public class SearchDAOMybatis implements SearchDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.search.";
	@Override
	public List<JobopeningVO> searchjobopen(Map<String, Object>map) {
		return sqlSession.selectList(namespace+"searchjobopen",map);
	}
	@Override
	public int cntsearch(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"cntsearch",map);
	}
	@Override
	public List<CompanyVO> searchcompany(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"searchcompany",map);
	}
	@Override
	public int cntcompany(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"cntcompany",map);
	}
}
