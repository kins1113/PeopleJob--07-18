package com.ez.peoplejob.board.model;

import java.util.List;

public interface BoardKindService {
	public int insertBKind(BoardKindVO boardKindVO);
	public List<BoardKindVO> selectBKind();
	public int deleteBKind(String[] bkList);
	
}
