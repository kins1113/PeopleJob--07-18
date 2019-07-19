package com.ez.peoplejob.service.model;

import java.util.List;

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
	@Override
	public List<ServiceVO> selectAll() {
		List<ServiceVO> list
		=sqlSession.selectList(namespace+"selectService");
		
		return list;
	}
	@Override
	public int deleteService(int serviceCode) {
		return sqlSession.delete(namespace+"deleteService",serviceCode);
	}

}
