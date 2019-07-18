package com.ez.peoplejob.scrap.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.peoplejob.jobopening.model.JobopeningVO;

@Repository
public class ScrapDAOMybatis implements ScrapDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.scrap.";
	@Override
	public int insertScrap(ScrapVO vo) {
		return sqlSession.insert(namespace+"insertScrap",vo);
	}
	@Override
	public List<ScrapVO> selectScrap(int member_code) {
		return sqlSession.selectList(namespace+"selectScrap",member_code);
	}
	@Override
	public List<JobopeningVO> selectScrapJobOpen(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectScrapJobOpen",map);
	}
	@Override
	public int selectTotalCount(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectTotalCount",map);
	}
	@Override
	public int deleteScrap(Map<String, Object> map) {
		return sqlSession.delete(namespace+"deleteScrap",map);
	}
}
