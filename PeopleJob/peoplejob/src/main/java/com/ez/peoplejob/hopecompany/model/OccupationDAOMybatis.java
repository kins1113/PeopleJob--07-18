package com.ez.peoplejob.hopecompany.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OccupationDAOMybatis implements OccupationDAO{

	private String namespace="config.mybatis.mapper.oracle.occupantion.";
	@Autowired private SqlSessionTemplate sqlSession;
	
	@Override
	public List<FirstOccupationVO> selectFirst() {
		return sqlSession.selectList(namespace+"selectFirst");
	}

	@Override
	public List<SecondOccupationVO> selectSecond(int firstCode) {
		return sqlSession.selectList(namespace+"selectSecond",firstCode);
	}

	@Override
	public List<ThirdOccupationVO> selectThird(int secondCode) {
		return sqlSession.selectList(namespace+"selectThird",secondCode);
	}

	@Override
	public List<LocationVO> selectLocation() {
		return sqlSession.selectList(namespace+"selectLocation");
	}

	@Override
	public List<Map<String, Object>> selectLocation2(int sidoCode) {
		return sqlSession.selectList(namespace+"selectLocation2",sidoCode);
	}

	@Override
	public List<Map<String, Object>> selectBtype1() {
		return sqlSession.selectList(namespace+"selectBtype1");
		}

	@Override
	public List<Map<String, Object>> selectBtype2(int btypeCode1) {
		return sqlSession.selectList(namespace+"selectBtype2",btypeCode1);
	}

	@Override
	public List<Map<String, Object>> selectBtype3(int btypeCode2) {
		return sqlSession.selectList(namespace+"selectBtype3",btypeCode2);
	}

	
}
