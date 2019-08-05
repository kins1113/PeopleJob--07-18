package com.ez.peoplejob.member.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyDAOMybatis implements CompanyDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.company.";
	@Override
	public CompanyVO selectcompany(int companyCode) {
		return sqlSession.selectOne(namespace+"selectcompany",companyCode);
	}
	@Override
	public List<MemberVO> selectMemeberByAuthority(Map<String, Integer> map) {
		return sqlSession.selectList(namespace+"selectMemeberByAuthority",map);
	}
	@Override
	public MemberVO selectMemberById(String id) {
		return sqlSession.selectOne(namespace+"selectMemberById",id);
	}
	@Override
	public List<Map<String, Object>> selectMemberSearch(Map<String, String> map) {
		return sqlSession.selectList(namespace+"selectMemberSearch", map);
	}
	@Override
	public MemberVO selectMemberByMcode(int Mcode) {
		return sqlSession.selectOne(namespace+"selectMemberByMcode",Mcode);
	}
	
	
}
