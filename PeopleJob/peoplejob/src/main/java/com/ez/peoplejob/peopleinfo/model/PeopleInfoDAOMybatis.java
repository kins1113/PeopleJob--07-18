package com.ez.peoplejob.peopleinfo.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.peoplejob.resume.model.ResumeVO;

@Repository
public class PeopleInfoDAOMybatis implements PeopleInfoDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.peopleinfo.";
	@Override
	public List<ResumeVO> selectCareer(Map<String, Object> map) {
		
		return sqlSession.selectList(namespace+"selectCareer",map);
	}
	@Override
	public List<ResumeVO> selectAge(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectAge",map);
	}
	@Override
	public List<ResumeVO> selectGraduatetype(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectGraduatetype",map);
	}
	
	@Override
	public List<ResumeVO> selectSido(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectSido",map);
	}
	@Override
	public List<ResumeVO> selectBtype(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectBtype",map);
	}
	@Override
	public List<ResumeVO> selectJobtype(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectJobtype",map);
	}
	@Override
	public int selectTotalCountCareer(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectTotalCountCareer",map);
	}
	@Override
	public int selectTotalCountAge(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectTotalCountAge",map);
	}
	@Override
	public int selectTotalCountGraduatetype(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectTotalCountGraduatetype",map);
	}
	@Override
	public int selectTotalCountSido(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectTotalCountSido",map);
	}
	@Override
	public int selectTotalCountBtype(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectTotalCountBtype",map);
	}
	@Override
	public int selectTotalCountJobtype(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectTotalCountJobtype",map);
	}
	
	
}
