package com.ez.peoplejob.board.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired BoardDAO boardDao;
	private Logger logger=LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Override
	public int insetBoard(BoardVO vo) {
		return boardDao.insetBoard(vo);
	}
	@Override
	public List<BoardVO> selectBoardSerch(Map<String, String> map) {
		logger.info("서비스에서 map={},{}",map.get("content"), map.get("key"));
		return boardDao.selectBoardSerch(map);
	}
	@Override
	public int boardUpdate(Map<String, Object> map) {
		return boardDao.boardUpdate(map);
	}
	@Override
	public int deleteMultDelete(Map<String, int[]> map) {
		int count=boardDao.deleteMultDelete(map);
		return count;
	}
	@Override
	public List<BoardVO> selectByCodeVariable(Map<String, int[]> map) {
		return boardDao.selectByCodeVariable(map);
	}
	@Override
	public int boardEdit(BoardVO boardVo) {
		return boardDao.boardEdit(boardVo);
	}

}
