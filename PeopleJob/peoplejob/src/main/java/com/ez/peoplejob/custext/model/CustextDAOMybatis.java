package com.ez.peoplejob.custext.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustextDAOMybatis implements CustextDAO{
	private String namespase="config.mybatis.mapper.oracle.custext.";
	@Autowired SqlSessionTemplate sqlSession;
	@Override
	public int insertCustext(CustextVO vo) {
		return sqlSession.insert(namespase+"insertCustext",vo);
	}

	@Override
	public int ReinsertCustext(CustextVO vo) {
		return sqlSession.update(namespase+"ReinsertCustext",vo);
	}

	@Override
	public List<CustextVO> mycustext(Map<String, Object> map) {
		return sqlSession.selectList(namespase+"mycustext",map);
	}

	@Override
	public CustextVO CustextView(int custextCode) {
		return sqlSession.selectOne(namespase+"CustextView",custextCode);
	}

	@Override
	public int Editcustext(CustextVO vo) {
		return sqlSession.update(namespase+"Editcustext",vo);
	}

	@Override
	public int Delcustext(int custextCode) {
		return sqlSession.delete(namespase+"Delcustext",custextCode);
	}
	
}
