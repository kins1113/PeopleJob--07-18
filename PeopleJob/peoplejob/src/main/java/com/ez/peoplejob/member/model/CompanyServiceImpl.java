package com.ez.peoplejob.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyServiceImpl implements CompanyService{
	@Autowired CompanyDAO companyDao;

	@Override
	public CompanyVO selectcompany(int companyCode) {
		return companyDao.selectcompany(companyCode);
	}

	@Override
	public String[] selectMemeberByAuthority(int type) {
		Map<String, Integer>map=new HashMap<String, Integer>();
		map.put("type", type);
		List<MemberVO> list=companyDao.selectMemeberByAuthority(map);

		String[] idArr=new String[list.size()];
		
		for(int i=0;i<list.size();i++) {
			MemberVO vo=list.get(i);
			idArr[i]=vo.getMemberid();
		}
		return idArr;
	}

	@Override
	public MemberVO selectMemberById(String id) {
		return companyDao.selectMemberById(id);
	}

	@Override
	public List<Map<String, Object>> selectMemberSearch(Map<String, String> map) {
		return companyDao.selectMemberSearch(map);
	}

	@Override
	public MemberVO selectMemberByMcode(int Mcode) {
		return companyDao.selectMemberByMcode(Mcode);
	}
	
	
}
