package com.ez.peoplejob.resume.model;

import java.util.List;

import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.hopecompany.model.FirstOccupationVO;
import com.ez.peoplejob.hopecompany.model.SecondOccupationVO;
import com.ez.peoplejob.hopecompany.model.ThirdOccupationVO;

public interface CareerDAO {
	public List<CareerVO>selectBydvCode();
	List<CareerVO> selectcareer();
	List<CareerVO> selectSecond(String chargework);
	List<CareerVO> selectThird(String chargework2);
}
