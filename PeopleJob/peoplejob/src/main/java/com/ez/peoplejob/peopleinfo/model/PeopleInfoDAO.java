package com.ez.peoplejob.peopleinfo.model;

import java.util.List;
import java.util.Map;

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
}
