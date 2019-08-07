package com.ez.peoplejob.hopecompany.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HopeWorkingServiceImpl implements HopeWorkingService{
	@Autowired private HopeWorkingDAO hopeworkingDao;


	@Override
	public List<HopeWorkingVO> selecthopeWorking() {

		return hopeworkingDao.selecthopeWorking();
	}
	
}
