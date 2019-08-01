package com.ez.peoplejob.resume.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CareerDAOMybatis implements CareerDAO {
	@Autowired
	private SqlSessionTemplate sqlsession;
	private String namespace="config.mybatis.mapper.oracle.career.";
	@Override
	public List<CareerVO> selectBydvCode() {
		return sqlsession.selectList(namespace+"selectBydvCode");
	}
	@Override
	public List<CareerVO> selectcareer() {
		return sqlsession.selectList(namespace+"selectcareer");
	}
	@Override
	public List<CareerVO> selectSecond(String chargework) {
		return sqlsession.selectList(namespace+"selectSecond",chargework);
	}
	@Override
	public List<CareerVO> selectThird(String chargework2) {
		return sqlsession.selectList(namespace+"selectThird",chargework2);
	}
	

}
