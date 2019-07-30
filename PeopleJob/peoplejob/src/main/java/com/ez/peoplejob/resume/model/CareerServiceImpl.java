package com.ez.peoplejob.resume.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.peoplejob.common.SearchVO;

@Service
public class CareerServiceImpl implements CareerService{
	@Autowired
	private CareerDAO careerDao;

	@Override
	public List<CareerVO> selectBydvCode(int dvCode) {
		
		return careerDao.selectBydvCode(dvCode);
	}
	

}
