package com.ez.peoplejob.resume.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.peoplejob.common.SearchVO;

@Repository
public class CareerDAOMybatis implements CareerDAO {
	@Autowired
	private SqlSessionTemplate sqlsession;
	private String namespace="config.mybatis.mapper.oracle.career.";
	@Override
	public List<CareerVO> selectBydvCode(int dvCode) {
		return sqlsession.selectOne(namespace+"selectBydvCode",dvCode);
	}
	

}
