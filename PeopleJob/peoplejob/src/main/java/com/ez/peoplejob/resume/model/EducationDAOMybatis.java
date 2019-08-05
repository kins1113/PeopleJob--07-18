package com.ez.peoplejob.resume.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class EducationDAOMybatis implements EducationDAO {
	@Autowired
	private SqlSessionTemplate sqlsession;
	private String namespace="config.mybatis.mapper.oracle.education.";
	@Override
	public List<EducationVO> selectMajor() {
		return sqlsession.selectList(namespace+"selectMajor");
	}
	@Override
	public List<EducationVO> selectMajor2(int academicCode) {
		return sqlsession.selectList(namespace+"selectMajor",academicCode);
	}
	

}
