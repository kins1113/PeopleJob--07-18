package com.ez.peoplejob.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyDAOMybatis implements CompanyDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.company.";
	@Override
	public CompanyVO selectcompany(int companyCode) {
		return sqlSession.selectOne(namespace+"selectcompany",companyCode);
	}
	
}
