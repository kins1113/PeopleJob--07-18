package com.ez.peoplejob.admin.Index;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.custext.model.CustextVO;

public interface ConnetDAO {
	public int checkConnet(ConnetVO connetVo);
	public int insertConnet(ConnetVO connetVo);
	public ConnetVO selectConnet(String today);
	public int selectMemberCount(Map<String, Object>map);
	public int selectResumeManagerIndex(Map<String, Object> map);
	public int selectJobopeningManagerIndex(Map<String, Object> map);
	public List<CustextVO> selectCustextManagerIndex();
	public int selectPaymentManagerIndex(Map<String, Object>map);
	public int selectPopupManagerIndex(Map<String, Integer>map);
}
