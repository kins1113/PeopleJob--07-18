package com.ez.peoplejob.custext.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustextServiceImpl implements CustextService{
	@Autowired private CustextDAO custextDao;
	@Override
	public int insertCustext(CustextVO vo) {
		return custextDao.insertCustext(vo);
	}

	@Override
	public int ReinsertCustext(CustextVO vo) {
		return custextDao.ReinsertCustext(vo);
	}

	@Override
	public List<CustextVO> mycustext(Map<String, Object> map) {
		return custextDao.mycustext(map);
	}

	@Override
	public CustextVO CustextView(int custextCode) {
		return custextDao.CustextView(custextCode);
	}

	@Override
	public int Editcustext(CustextVO vo) {
		return custextDao.Editcustext(vo);
	}

	@Override
	public int Delcustext(int custextCode) {
		return custextDao.Delcustext(custextCode);
	}


	
}
