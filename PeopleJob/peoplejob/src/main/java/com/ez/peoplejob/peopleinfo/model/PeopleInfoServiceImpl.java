package com.ez.peoplejob.peopleinfo.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.peoplejob.resume.model.ResumeVO;

@Service
public class PeopleInfoServiceImpl implements PeopleinfoService {
	
	@Autowired
	private PeopleInfoDAO peopleinfoDao;
	@Override
	public List<ResumeVO> selectCareer(Map<String, Object> map) {
		
		return peopleinfoDao.selectCareer(map);
	}

	@Override
	public List<ResumeVO> selectAge(Map<String, Object> map) {
		return peopleinfoDao.selectAge(map);
	}

	@Override
	public List<ResumeVO> selectGraduatetype(Map<String, Object> map) {
		return peopleinfoDao.selectGraduatetype(map);
	}

	@Override
	public List<ResumeVO> selectSido(Map<String, Object> map) {
		return peopleinfoDao.selectSido(map);
	}

	@Override
	public List<ResumeVO> selectBtype(Map<String, Object> map) {
		return peopleinfoDao.selectBtype(map);
	}

	@Override
	public List<ResumeVO> selectJobtype(Map<String, Object> map) {
		return peopleinfoDao.selectJobtype(map);
	}

	@Override
	public int selectTotalCountCareer(Map<String, Object> map) {
		return peopleinfoDao.selectTotalCountCareer(map);
	}

	@Override
	public int selectTotalCountAge(Map<String, Object> map) {
		return peopleinfoDao.selectTotalCountAge(map);
	}

	@Override
	public int selectTotalCountGraduatetype(Map<String, Object> map) {
		return peopleinfoDao.selectTotalCountGraduatetype(map);
	}

	@Override
	public int selectTotalCountSido(Map<String, Object> map) {
		return peopleinfoDao.selectTotalCountSido(map);
	}

	@Override
	public int selectTotalCountBtype(Map<String, Object> map) {
		return peopleinfoDao.selectTotalCountBtype(map);
	}

	@Override
	public int selectTotalCountJobtype(Map<String, Object> map) {
		return peopleinfoDao.selectTotalCountJobtype(map);
	}

	@Override
	public List<ResumeVO> selectPeoplew(Map<String, Object> map) {
		return peopleinfoDao.selectPeoplew(map);
	}

	@Override
	public int selectTotalCountPeople(Map<String, Object> map) {
		return peopleinfoDao.selectTotalCountPeople(map);
	}

}
