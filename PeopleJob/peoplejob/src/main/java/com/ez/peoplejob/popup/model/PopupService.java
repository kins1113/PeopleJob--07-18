package com.ez.peoplejob.popup.model;

import java.util.List;
import java.util.Map;

public interface PopupService {

	//popup사용 여부를 체크해주는 상수 usage관련
		int USAGE_USA=1; 	//사용
		int USAGE_NOT_USA=2; //미사용
		
		int insertPopup(PopupVO popupVo);
		List<PopupVO> selectPopupAll();
		int updateUsage(Map<String, Object> map);
		int multUpdateUsage(Map<String, Object> map);
		int updateTrem(Map<String, Object> map);
		public int deleteByPopupCode(int popupCode);
		public int deleteMultiByPopupCode(int[] popupCode);
		public PopupVO selectByPopupCode(int popupCode);
		public int updatePopup(PopupVO popupVo);
		public List<PopupVO> selectUsageY();
}
