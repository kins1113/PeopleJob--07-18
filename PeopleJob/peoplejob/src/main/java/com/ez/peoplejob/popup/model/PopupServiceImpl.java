package com.ez.peoplejob.popup.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PopupServiceImpl implements PopupService{
	
	@Autowired private PopupDAO popupDao;

	private Logger logger=LoggerFactory.getLogger(PopupServiceImpl.class);

	@Override
	public int insertPopup(PopupVO popupVo) {
		return popupDao.insertPopup(popupVo);
	}

	@Override
	public List<PopupVO> selectPopupAll() {
		return popupDao.selectPopupAll();
	}

	@Override
	public int updateUsage(Map<String, Object> map) {
		return popupDao.updateUsage(map);
	}

	@Override
	public int multUpdateUsage(Map<String, Object> map) {
		String[] usageCkArr=(String[]) map.get("usageCkArr");
		int[] popupCodeArr=(int[]) map.get("popupCodeArr");
		
		int result=0;
		if(usageCkArr.length>0) {
				result = popupDao.updateUsageYandN(map);
		}
		logger.info("update 결과 service에서 result={}",result);
		return result;
	}

	@Override
	public int updateTrem(Map<String, Object> map) {
		return popupDao.updateTrem(map);
	}

	@Override
	public int deleteByPopupCode(int popupCode) {
		return popupDao.deleteByPopupCode(popupCode);
	}

	@Override
	public int deleteMultiByPopupCode(int[] popupCode) {
		int re=0;
		for(int i=0;i<popupCode.length;i++) {
			int code=popupCode[i];
			re+=popupDao.deleteByPopupCode(code);
		}
		logger.info("service에서 popup다중 삭제 처리 결과 re ={}" ,re);
		return re;
	}

	@Override
	public PopupVO selectByPopupCode(int popupCode) {
		return popupDao.selectByPopupCode(popupCode);
	}

	@Override
	public int updatePopup(PopupVO popupVo) {
		return popupDao.updatePopup(popupVo);
	}

	@Override
	public List<PopupVO> selectUsageY() {
		return popupDao.selectUsageY();
	}
	
}
