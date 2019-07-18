package com.ez.peoplejob.manager.member.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.member.model.MemberVO;

public interface MemberDAOAdmin {

	List<MemberVO> selectAllManager(Map<String, Object> map);
	int getTotalRecord(Map<String, Object> map);
	List<MemberVO> memberByAuthority(Map<String, int[]> map);
	List<Map<String, Object>> selectCompanyManager(Map<String, Object> map);
	int updateAuthorityManager(Map<String, Integer> map);
	int getTotalRecordCompanyManager(Map<String, Object> map);
	List<Map<String, Object>> selectAllCompanyManager(Map<String, Object> map);
}
