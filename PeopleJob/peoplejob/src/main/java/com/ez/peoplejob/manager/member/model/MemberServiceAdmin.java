package com.ez.peoplejob.manager.member.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.member.model.MemberVO;

public interface MemberServiceAdmin {
	//authorityCode  관련 상수
	public static final int AUTHORITY_MEMBER=1;	//일반회원
	public static final int AUTHORITY_COMPANY_BEFOR=2;	//기업회원 승인전
	public static final int AUTHORITY_COMPAMY_AFTER=3; 	//기업회원 승인후
	
	List<MemberVO> selectAllManager(Map<String, Object> map);
	int getTotalRecord(Map<String, Object> map);
	List<MemberVO> memberByAuthority(Map<String, int[]> map);
	List<Map<String, Object>> selectCompanyManager(Map<String, Object> map);
	int updateAuthorityManager(Map<String, Integer> map);
	int getTotalRecordCompanyManager(Map<String, Object> map);
	List<Map<String, Object>> selectAllCompanyManager(Map<String, Object> map);
}
