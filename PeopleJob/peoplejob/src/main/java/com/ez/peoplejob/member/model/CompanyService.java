package com.ez.peoplejob.member.model;

import java.util.List;
import java.util.Map;

public interface CompanyService {
	CompanyVO selectcompany(int companyCode);
	public String[] selectMemeberByAuthority(int type);
	public MemberVO selectMemberById(String id);
	public List<Map<String, Object>> selectMemberSearch(Map<String, String>map);
	public MemberVO selectMemberByMcode(int Mcode);
}
