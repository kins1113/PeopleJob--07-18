package com.ez.peoplejob.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyServiceImpl implements CompanyService{
	@Autowired CompanyDAO companyDao;

	@Override
	public CompanyVO selectcompany(int companyCode) {
		return companyDao.selectcompany(companyCode);
	}
	
}
