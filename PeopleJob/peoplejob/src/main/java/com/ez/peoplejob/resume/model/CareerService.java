package com.ez.peoplejob.resume.model;

import java.util.List;

import com.ez.peoplejob.common.SearchVO;

public interface CareerService {
	public List<CareerVO> selectBydvCode();
	List<CareerVO> selectcareer();
	List<CareerVO> selectSecond(String chargework);
	List<CareerVO> selectThird(String chargework2);
}
