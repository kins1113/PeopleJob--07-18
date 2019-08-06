package com.ez.peoplejob.peopleinfo.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.hopecompany.model.FirstOccupationVO;
import com.ez.peoplejob.hopecompany.model.LocationVO;
import com.ez.peoplejob.hopecompany.model.SecondOccupationVO;
import com.ez.peoplejob.hopecompany.model.ThirdOccupationVO;
import com.ez.peoplejob.resume.model.ResumeVO;

public interface PeopleInfoDAO {
   List<ResumeVO>selectCareer(Map<String, Object> map);
   List<ResumeVO>selectAge(Map<String, Object> map);
   List<ResumeVO>selectGraduatetype(Map<String, Object> map);
   List<ResumeVO>selectSido(Map<String, Object> map);
   List<ResumeVO>selectBtype(Map<String, Object> map);
   List<ResumeVO>selectJobtype(Map<String, Object> map);
   int selectTotalCountCareer(Map<String, Object> map);
   int selectTotalCountAge(Map<String, Object> map);
   int selectTotalCountGraduatetype(Map<String, Object> map);
   int selectTotalCountSido(Map<String, Object> map);
   int selectTotalCountBtype(Map<String, Object> map);
   int selectTotalCountJobtype(Map<String, Object> map);
   List<ResumeVO>selectPeoplew(Map<String, Object>map);
   int selectTotalCountPeople(Map<String, Object> map);
   List<FirstOccupationVO> selectFirst();
   List<SecondOccupationVO> selectSecond(int firstCode);
   List<ThirdOccupationVO> selectThird(int secondCode);
   List<LocationVO> selectLocation();
   List<Map<String, Object>> selectLocation2(int sidoCode);
   List<Map<String, Object>> selectBtype1();
   List<Map<String, Object>> selectBtype2(int btypeCode1);
   List<Map<String, Object>> selectBtype3(int btypeCode2);
   List<ResumeVO>selectResumeView(int resumeCode);
}