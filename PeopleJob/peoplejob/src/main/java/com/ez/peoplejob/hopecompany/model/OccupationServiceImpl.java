package com.ez.peoplejob.hopecompany.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OccupationServiceImpl implements OccupationService{

	@Autowired private OccupationDAO occupantionDao;

	@Override
	public List<FirstOccupationVO> selectFirst() {
		return occupantionDao.selectFirst();
	}
	
	
}
