package com.ez.peoplejob.member.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired private MemberDAO memberDao;

	@Override
	public int insertMember(MemberVO memberVo) {
		return memberDao.insertMember(memberVo);
	}


	@Override
	public int dupUserid(String memberId) {
		int count= memberDao.dupUserid(memberId);
		int result=0;
		
		if(count>0) {
			result=NON_USEFUL_USERID;
		}else {
			result=MemberService.USEFUL_USERID;
		}
		return result;
	}

	@Override
	public int loginCheck(String memberid, String pwd) {
		String dbPwd=memberDao.selectPwdForLogin(memberid);
		
		int result=0;
		
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=ID_NONE;
		}else { //있을 때는 같은지 다른지 확인
			if(dbPwd.equals(pwd)) {
				result=LOGIN_OK;
			}else {
				result=PWD_DISAGREE;
			}
		}
		return result;
	}


	@Override
	public MemberVO selectByUserid(String memberId) {
		return memberDao.selectByUserid(memberId);
	}


	@Override
	public int insertCompany(CompanyVO companyVo) {
		return memberDao.insertCompany(companyVo);
	}


	@Override
	public int updateMember(MemberVO memberVo) {
		return memberDao.updateMember(memberVo);
	}


	@Override
	public int memberOut(String memberId) {
		return memberDao.memberOut(memberId);
	}


	@Override
	public int insertIndividaulMember(MemberVO memberVo) {
		return memberDao.insertIndividaulMember(memberVo);
	}


	@Override
	public int updateCompany(CompanyVO companyVo) {
		return memberDao.updateCompany(companyVo);
	}


	@Override
	public CompanyVO selectCompanyById(String memberId) {
		return memberDao.selectCompanyById(memberId);
	}


	@Override
	public int updatePwd(MemberVO memberVo) {
		return memberDao.updatePwd(memberVo);
	}


	@Override
	public String findId(MemberVO memberVo) {
		return memberDao.findId(memberVo);
	}


	@Override
	public List<Map<String, Object>> selectPayInfo(String membername) {
		return memberDao.selectPayInfo(membername);
	}


	@Override
	public int findPwd(MemberVO memberVo) {
		return memberDao.findPwd(memberVo);
	}


	@Override
	public MemberVO selectBymemberCode(int memberCode) {
		return memberDao.selectBymemberCode(memberCode);
	}





	

}
