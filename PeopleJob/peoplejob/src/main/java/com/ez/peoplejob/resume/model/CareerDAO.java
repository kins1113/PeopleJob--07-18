package com.ez.peoplejob.resume.model;

import java.util.List;

import com.ez.peoplejob.common.SearchVO;

public interface CareerDAO {
	public List<CareerVO>selectBydvCode(int dvCode);
	
}
