package com.ez.peoplejob.service.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ServiceDAOMybatis implements ServiceDAO {
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.service.";
	@Override
	public int insertService(ServiceVO vo) {
		int cnt=sqlSession.insert(namespace+"insertService",vo);
		return cnt;
	}

}
