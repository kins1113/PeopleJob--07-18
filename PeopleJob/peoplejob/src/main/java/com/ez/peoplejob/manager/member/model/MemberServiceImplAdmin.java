package com.ez.peoplejob.manager.member.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.peoplejob.member.model.MemberVO;

@Service
public class MemberServiceImplAdmin  implements MemberServiceAdmin{
	@Autowired
	private MemberDAOAdmin memberDaoAdmin;
		
	@Override
	public List<MemberVO> selectAllManager(Map<String, Object> map) {
		return memberDaoAdmin.selectAllManager(map);
	}

	@Override
	public int getTotalRecord(Map<String, Object> map) {
		return memberDaoAdmin.getTotalRecord(map);
	}

	@Override
	public List<MemberVO> memberByAuthority(Map<String, int[]> map) {
		return memberDaoAdmin.memberByAuthority(map);
	}

	@Override
	public List<Map<String, Object>> selectCompanyManager(Map<String, Object> map) {
		return memberDaoAdmin.selectCompanyManager(map);
	}

	@Override
	public int updateAuthorityManager(Map<String, Integer> map) {
		return memberDaoAdmin.updateAuthorityManager(map);
	}

	@Override
	public int getTotalRecordCompanyManager(Map<String, Object> map) {
		return memberDaoAdmin.getTotalRecordCompanyManager(map);
	}

	@Override
	public List<Map<String, Object>> selectAllCompanyManager(Map<String, Object> map) {
		return memberDaoAdmin.selectAllCompanyManager(map);
	}

	
}
