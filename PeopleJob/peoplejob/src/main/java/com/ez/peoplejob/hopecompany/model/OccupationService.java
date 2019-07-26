package com.ez.peoplejob.hopecompany.model;

import java.util.List;
import java.util.Map;

public interface OccupationService {

	public List<FirstOccupationVO> selectFirst();
	List<SecondOccupationVO> selectSecond(int firstCode);
	List<ThirdOccupationVO> selectThird(int secondCode);
	List<LocationVO> selectLocation();
	List<Map<String, Object>> selectLocation2(int sidoCode);
	List<Map<String, Object>> selectBtype1();
	List<Map<String, Object>> selectBtype2(int btypeCode1);
	List<Map<String, Object>> selectBtype3(int btypeCode2);
}
