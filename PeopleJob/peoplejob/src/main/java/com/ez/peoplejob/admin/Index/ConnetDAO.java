package com.ez.peoplejob.admin.Index;

import java.util.Map;

public interface ConnetDAO {
	public int insertConnet(int memberCode);
	public ConnetVO selectConnet(String today);
	public int selectMemberCount(Map<String, Object>map);
	public int selectResumeManagerIndex(Map<String, Object> map);
	public int selectJobopeningManagerIndex(Map<String, Object> map);
}
