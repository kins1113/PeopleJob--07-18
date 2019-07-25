package com.ez.peoplejob.hopecompany.model;

import java.util.List;
import java.util.Map;

public interface OccupationDAO {
	
	List<FirstOccupationVO> selectFirst();
	List<SecondOccupationVO> selectSecond(int firstCode);
	List<ThirdOccupationVO> selectThird(int secondCode);
	List<LocationVO> selectLocation();
	List<Map<String, Object>> selectLocation2(int sidoCode);
}
