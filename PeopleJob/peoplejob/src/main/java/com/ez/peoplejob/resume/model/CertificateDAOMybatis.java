package com.ez.peoplejob.resume.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CertificateDAOMybatis implements CertificateDAO{
	@Autowired
	private SqlSessionTemplate sqlsession;
	private String namespace="config.mybatis.mapper.oracle.certificate.";
	@Override
	public List<CertificateVO> selectLname() {
		return sqlsession.selectList(namespace+"selectLname");
	}

	
	

}
