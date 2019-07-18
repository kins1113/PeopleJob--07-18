package com.ez.peoplejob.board.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOMybatis implements BoardDAO{
	private String namespase="config.mybatis.mapper.oracle.board.";
	@Autowired SqlSessionTemplate sqlSession;
	
	@Override
	public int insetBoard(BoardVO vo) {
		return sqlSession.insert(namespase+"insetBoard", vo);
	}
	@Override
	public List<BoardVO> selectBoardSerch(Map<String, String> map) {
		return sqlSession.selectList(namespase+"selectBoardSerch", map);
	}
	@Override
	public int boardUpdate(Map<String, Object> map) {
		return sqlSession.update(namespase+"boardUpdate",map);
	}
	@Override
	public int deleteMultDelete(Map<String, int[]> map) {
		return sqlSession.delete(namespase+"deleteMultDelete",map);
	}
	@Override
	public List<BoardVO> selectByCodeVariable(Map<String, int[]> map) {
		return sqlSession.selectList(namespase+"selectByCodeVariable", map);
	}
	@Override
	public int boardEdit(BoardVO boardVo) {
		return sqlSession.update(namespase+"boardEdit", boardVo);
	}
	
}
