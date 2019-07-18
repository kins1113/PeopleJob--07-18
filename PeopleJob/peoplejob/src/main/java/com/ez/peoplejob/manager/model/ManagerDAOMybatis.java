package com.ez.peoplejob.manager.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDAOMybatis implements ManagerDAO {
	
	private String namespace="config.mybatis.mapper.oracle.manager.";
	@Autowired private SqlSessionTemplate sqlSession;
	
	public ManagerVO selectPwdById(String adminid) {
		return sqlSession.selectOne(namespace+"loginCheck",adminid);
	}
	public List<ManagerVO> selectManagerAll(){
		return sqlSession.selectList(namespace+"selectManagerAll");
	}
	public int insertManager(ManagerVO managerVo) {
		return sqlSession.insert(namespace+"insertManager",managerVo);
	}
	
	public int delectManager(int adminCode) {
		return sqlSession.update(namespace+"delectManager",adminCode);
	}
	public String selectAuthorityById(String adminid) {
		return sqlSession.selectOne(namespace+"selectAuthorityById",adminid);
	}
	public int selectIdChk(String adminid) {
		return sqlSession.selectOne(namespace+"selectIdChk",adminid);
	}
	public ManagerVO selectByCode(int adminCode) {
		return sqlSession.selectOne(namespace+"selectByCode", adminCode);
	}
	public int updateManager(ManagerVO managerVo) {
		return sqlSession.update(namespace+"updateManager", managerVo);
	}
	public int selectCheckPwd(Map<String, String> map) {
		return sqlSession.selectOne(namespace+"selectCheckPwd", map);
	}
}
