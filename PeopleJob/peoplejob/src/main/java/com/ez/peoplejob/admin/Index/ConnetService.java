package com.ez.peoplejob.admin.Index;

import java.util.List;

import com.ez.peoplejob.custext.model.CustextVO;

public interface ConnetService {
	public int checkConnet(ConnetVO connetVo);
	public int insertConnet(ConnetVO connetVo);
	public List<ConnetVO> selectConnet();
	public int[] selectMemberCount();
	public int[] selectResumeManagerIndex();
	public List<CustextVO> selectCustextManagerIndex();
	public int[] selectPaymentManagerIndex();
	public int[] selectPopupManagerIndex();
}
