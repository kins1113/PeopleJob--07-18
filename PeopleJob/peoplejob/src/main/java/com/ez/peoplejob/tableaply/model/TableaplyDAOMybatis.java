package com.ez.peoplejob.tableaply.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.peoplejob.resume.model.ResumeVO;

@Repository
public class TableaplyDAOMybatis implements TableaplyDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.apply.";
	@Override
	public int insertapply(TableaplyVO vo) {
		return sqlSession.insert(namespace+"insertapply",vo);
	}
	@Override
	public List<TableaplyVO> selectapply(Map<String,Object> map) {
		return sqlSession.selectList(namespace+"selectapply",map);
	}
	@Override
	public int selectapplyCount(Map<String,Object> map) {
		return sqlSession.selectOne(namespace+"selectapplyCount",map);
	}
	@Override
	public int deleteapply(Map<String, Object> map) {
		return sqlSession.delete(namespace+"deleteapply",map);
	}
	@Override
	public List<TableaplyVO> selectapplyComp(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectapplyComp",map);
	}
	@Override
	public int selectapplyCompcount(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectapplyCompcount",map);
	}
	@Override
	public int dupapply(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"dupapply",map);
	}
	@Override
	public int cntpay(int MemberCode) {
		return sqlSession.selectOne(namespace+"cntpay",MemberCode);
	}
	@Override
	public int opencheckY(Map<String,Object> map) {
		return sqlSession.update(namespace+"opencheckY",map);
	}
	@Override
	public int cntresume(int MemberCode) {
		return sqlSession.selectOne(namespace+"cntresume",MemberCode);
	}
	@Override
	public ResumeVO selectresumebyid(int memberCode) {
		return sqlSession.selectOne(namespace+"selectresumebyid",memberCode);
	}
	@Override
	public List<ResumeVO> selectresumebyid2(int memberCode) {
		return sqlSession.selectList(namespace+"selectresumebyid2",memberCode);
	}
	@Override
	public TableaplyVO selectresumebyid3(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectresumebyid3",map);
	}
	@Override
	public int applyCnt(int jobopening) {
		return sqlSession.selectOne(namespace+"applyCnt",jobopening);
	}
	
}
