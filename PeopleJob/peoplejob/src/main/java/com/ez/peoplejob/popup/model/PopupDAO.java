package com.ez.peoplejob.popup.model;

import java.util.List;
import java.util.Map;

public interface PopupDAO {

	int insertPopup(PopupVO popupVo);
	List<PopupVO> selectPopupAll();
	int updateUsage(Map<String, Object> map);
	int updateUsageYandN(Map<String, Object> map);
	int updateTrem(Map<String, Object> map);
	public int deleteByPopupCode(int popupCode);
	public PopupVO selectByPopupCode(int popupCode);
	public int updatePopup(PopupVO popupVo);
	public List<PopupVO> selectUsageY();
}
