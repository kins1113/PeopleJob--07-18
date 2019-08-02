package com.ez.peoplejob.hopecompany.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class HopeWorkingDAOMybatis implements HopeWorkingDAO {
	

		private String namespace="config.mybatis.mapper.oracle.hopeworking.";
		@Autowired private SqlSessionTemplate sqlSession;
		
		@Override
		public List<HopeWorkingVO> selecthopeWorking() {
			return sqlSession.selectList(namespace+"selecthopeWorking");
		}
}
