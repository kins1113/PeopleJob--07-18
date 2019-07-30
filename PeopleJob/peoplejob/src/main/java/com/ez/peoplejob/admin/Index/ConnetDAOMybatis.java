package com.ez.peoplejob.admin.Index;


import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConnetDAOMybatis implements ConnetDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private	String namespace="config.mybatis.mapper.oracle.adminIndex.";
	
	@Override
	public int insertConnet(int memberCode) {
		return sqlSession.insert(namespace+"insertConnet", memberCode);
	}
	@Override
	public ConnetVO selectConnet(String today) {
		return sqlSession.selectOne(namespace+"selectConnet", today);
	}
	@Override
	public int selectMemberCount(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectMemberCount",map);
	}
	
	
}
