package com.ez.peoplejob.popup.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PopupDAOMybatis implements PopupDAO{

	private String namespace="config.mybatis.mapper.oracle.popup.";
	@Autowired private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertPopup(PopupVO popupVo) {
		return sqlSession.insert(namespace+"insertPopup",popupVo);
	}

	@Override
	public List<PopupVO> selectPopupAll() {
		return sqlSession.selectList(namespace+"selectPopupAll");
	}

	
}
