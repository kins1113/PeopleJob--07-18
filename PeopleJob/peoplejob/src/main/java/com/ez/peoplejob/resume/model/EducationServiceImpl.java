package com.ez.peoplejob.resume.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.peoplejob.common.SearchVO;

@Service
public class EducationServiceImpl implements EducationService{
	@Autowired
	private EducationDAO educationDao;

	@Override
	public List<EducationVO> selectMajor() {
		
		return educationDao.selectMajor();
	}

	@Override
	public List<EducationVO> selectMajor2(int academicCode) {
		return educationDao.selectMajor2(academicCode);
	}

	
	

}
