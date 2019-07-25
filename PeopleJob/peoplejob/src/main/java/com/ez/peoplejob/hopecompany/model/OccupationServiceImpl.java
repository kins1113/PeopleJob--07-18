package com.ez.peoplejob.hopecompany.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OccupationServiceImpl implements OccupationService{

	@Autowired private OccupationDAO occupantionDao;

	@Override
	public List<FirstOccupationVO> selectFirst() {
		return occupantionDao.selectFirst();
	}

	@Override
	public List<SecondOccupationVO> selectSecond(int firstCode) {
		return occupantionDao.selectSecond(firstCode);
	}

	@Override
	public List<ThirdOccupationVO> selectThird(int secondCode) {
		return occupantionDao.selectThird(secondCode);
	}

	@Override
	public List<LocationVO> selectLocation() {
		return occupantionDao.selectLocation();
	}

	@Override
	public List<Map<String, Object>> selectLocation2(int sidoCode) {
		return occupantionDao.selectLocation2(sidoCode);
	}
	
	
}
