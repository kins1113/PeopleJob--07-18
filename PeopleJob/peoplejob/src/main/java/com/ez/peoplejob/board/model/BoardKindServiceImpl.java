package com.ez.peoplejob.board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardKindServiceImpl implements BoardKindService{
	@Autowired
	private BoardKindDAO boardKindDao;

	@Override
	public int insertBKind(BoardKindVO boardKindVO) {
		return boardKindDao.insertBKind(boardKindVO );
	}

	@Override
	public List<BoardKindVO> selectBKind() {
		return boardKindDao.selectBKind();
	}

	@Override
	@Transactional
	public int deleteBKind(String[] bkList) {
		int count=0;
		try {
			for(String bkCode:bkList) {
				int re=0;
				re=boardKindDao.deleteBKind(Integer.parseInt(bkCode));
				count+=re;
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	
	
}
