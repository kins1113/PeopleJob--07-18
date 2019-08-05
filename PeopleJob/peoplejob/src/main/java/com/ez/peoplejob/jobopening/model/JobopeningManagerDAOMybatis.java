package com.ez.peoplejob.jobopening.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JobopeningManagerDAOMybatis implements JobopeningManagerDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.jobopeningManager.";
	@Override
	public List<Map<String, Object>> selectJobopeningManager(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectJobopeningManager", map);
	}
	@Override
	public int getTotalCountJobopeningManager(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"getTotalCountJobopeningManager", map);
	}
	
}
