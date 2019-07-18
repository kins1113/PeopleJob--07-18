package com.ez.peoplejob.popup.model;

import java.util.List;

public interface PopupService {

	int insertPopup(PopupVO popupVo);
	List<PopupVO> selectPopupAll();
}
