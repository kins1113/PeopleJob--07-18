package com.ez.peoplejob.admin.Index;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.peoplejob.custext.model.CustextVO;

@Repository
public class ConnetDAOMybatis implements ConnetDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private	String namespace="config.mybatis.mapper.oracle.adminIndex.";
	
	
	@Override
	public int checkConnet(ConnetVO connetVo) {
		return sqlSession.selectOne(namespace+"checkConnet",connetVo);
	}
	@Override
	public int insertConnet(ConnetVO connerVo) {
		return sqlSession.insert(namespace+"insertConnet", connerVo);
	}
	@Override
	public ConnetVO selectConnet(String today) {
		return sqlSession.selectOne(namespace+"selectConnet", today);
	}
	@Override
	public int selectMemberCount(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectMemberCount",map);
	}
	@Override
	public int selectResumeManagerIndex(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectResumeManagerIndex",map);
	}
	@Override
	public int selectJobopeningManagerIndex(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectJobopeningManagerIndex",map);
	}
	@Override
	public List<CustextVO> selectCustextManagerIndex() {
		return sqlSession.selectList(namespace+"selectCustextManagerIndex");
	}
	@Override
	public int selectPaymentManagerIndex(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectPaymentManagerIndex",map);
	}
	@Override
	public int selectPopupManagerIndex(Map<String, Integer> map) {
		return sqlSession.selectOne(namespace+"selectPopupManagerIndex", map);
	}
	
}
