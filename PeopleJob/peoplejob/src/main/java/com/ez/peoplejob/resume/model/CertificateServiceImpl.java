package com.ez.peoplejob.resume.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.peoplejob.common.SearchVO;

@Service
public class CertificateServiceImpl implements CertificateService{
	@Autowired
	private CertificateDAO certificateDao;

	@Override
	public List<CertificateVO> selectLname() {
		
		return certificateDao.selectLname();
	}

	
	

}
