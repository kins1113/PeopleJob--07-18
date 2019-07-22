package com.ez.peoplejob.popup.model;

import java.util.List;
import java.util.Map;

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

	@Override
	public int updateUsage(Map<String, Object> map) {
		return sqlSession.update(namespace+"updateUsage",map);
	}

	@Override
	public int updateUsageYandN(Map<String, Object> map) {
		return sqlSession.update(namespace+"updateUsageYandN",map);
	}

	@Override
	public int updateTrem(Map<String, Object> map) {
		return sqlSession.update(namespace+"updateTrem", map);
	}

	@Override
	public int deleteByPopupCode(int popupCode) {
		return sqlSession.delete(namespace+"deleteByPopupCode",popupCode);
	}

	@Override
	public PopupVO selectByPopupCode(int popupCode) {
		return sqlSession.selectOne(namespace+"selectByPopupCode",popupCode);
	}

	@Override
	public int updatePopup(PopupVO popupVo) {
		return sqlSession.update(namespace+"updatePopup",popupVo);
	}

	@Override
	public List<PopupVO> selectUsageY() {
		return sqlSession.selectList(namespace+"selectUsageY");
	}
	
	
}
