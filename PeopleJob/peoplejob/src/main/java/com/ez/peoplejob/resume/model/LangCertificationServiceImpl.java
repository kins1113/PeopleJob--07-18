package com.ez.peoplejob.resume.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.peoplejob.common.SearchVO;

@Service
public class LangCertificationServiceImpl implements LangcertificationService{
	@Autowired
	private LangcertificationDAO langcertificationDao;

	@Override
	public List<LangCertificationVO> selectlanglicencename() {
		return langcertificationDao.selectlanglicencename();
	}

	

}
