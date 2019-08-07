package com.ez.peoplejob.resume.model;

import java.util.List;

import com.ez.peoplejob.common.SearchVO;

public interface EducationDAO {
	public List<EducationVO>selectMajor();
	public List<EducationVO>selectMajor2(int academicCode);
	
}
