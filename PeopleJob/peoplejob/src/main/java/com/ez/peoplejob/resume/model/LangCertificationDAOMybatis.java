package com.ez.peoplejob.resume.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class LangCertificationDAOMybatis implements LangcertificationDAO {
	@Autowired
	private SqlSessionTemplate sqlsession;
	private String namespace="config.mybatis.mapper.oracle.langcertification.";
	@Override
	public List<LangCertificationVO> selectlanglicencename() {
		return sqlsession.selectList(namespace+"selectlanglicencename");
	}
	

}
