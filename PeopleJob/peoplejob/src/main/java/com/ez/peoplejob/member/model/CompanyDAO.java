package com.ez.peoplejob.member.model;

import java.util.List;
import java.util.Map;

public interface CompanyDAO {
	CompanyVO selectcompany(int companyCode);
	public List<MemberVO> selectMemeberByAuthority(Map<String, Integer> map);
	public MemberVO selectMemberById(String id);
	public List<Map<String, Object>> selectMemberSearch(Map<String, String>map);
	public MemberVO selectMemberByMcode(int Mcode);
}
