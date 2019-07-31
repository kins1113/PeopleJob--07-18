package com.ez.peoplejob.admin.Index;

import java.util.List;

public interface ConnetService {
	public int insertConnet(int memberCode);
	public List<ConnetVO> selectConnet();
	public int[] selectMemberCount();
	public int[] selectResumeManagerIndex();
}
