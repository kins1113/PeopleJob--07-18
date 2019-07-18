package com.ez.peoplejob.popup.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PopupServiceImpl implements PopupService{
	
	@Autowired private PopupDAO popupDao;

	@Override
	public int insertPopup(PopupVO popupVo) {
		return popupDao.insertPopup(popupVo);
	}

	@Override
	public List<PopupVO> selectPopupAll() {
		return popupDao.selectPopupAll();
	}
	
	
	
}
