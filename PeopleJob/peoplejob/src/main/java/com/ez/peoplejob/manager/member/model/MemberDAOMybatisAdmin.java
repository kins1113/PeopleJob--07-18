package com.ez.peoplejob.manager.member.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.peoplejob.member.model.MemberVO;

@Repository
public class MemberDAOMybatisAdmin implements MemberDAOAdmin{
	private String namespace="config.mybatis.mapper.oracle.member.";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MemberVO> selectAllManager(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectAllManager",map);
	}

	@Override
	public int getTotalRecord(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"getTotalRecord",map);
	}

	@Override
	public List<MemberVO> memberByAuthority(Map<String, int[]> map) {
		return sqlSession.selectList(namespace+"memberByAuthority", map);
	}

	@Override
	public List<Map<String, Object>> selectCompanyManager(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectCompanyManager", map);
	}

	@Override
	public int updateAuthorityManager(Map<String, Integer> map) {
		return sqlSession.update(namespace+"updateAuthorityManager", map);
	}

	@Override
	public int getTotalRecordCompanyManager(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"getTotalRecordCompanyManager", map);
	}

	@Override
	public List<Map<String, Object>> selectAllCompanyManager(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectAllCompanyManager",map);
	}
	
	
}
