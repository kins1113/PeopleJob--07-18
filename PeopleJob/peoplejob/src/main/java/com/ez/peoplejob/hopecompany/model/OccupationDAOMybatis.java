package com.ez.peoplejob.hopecompany.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OccupationDAOMybatis implements OccupationDAO{

	private String namespace="config.mybatis.mapper.oracle.occupantion.";
	@Autowired private SqlSessionTemplate sqlSession;
	
	@Override
	public List<FirstOccupationVO> selectFirst() {
		return sqlSession.selectList(namespace+"selectFirst");
	}

	
}
