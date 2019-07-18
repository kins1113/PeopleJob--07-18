package com.ez.peoplejob.member.model;
import java.util.List;
import java.util.Map;

public interface MemberDAO {
	int insertMember(MemberVO memberVo);
	String selectPwdForLogin(String memberId);
	int dupUserid(String memberId);
	MemberVO selectByUserid(String memberId);
	int insertCompany(CompanyVO companyVo);
	int updateMember(MemberVO memberVo);
	int memberOut(String memberId);
	
	int insertIndividaulMember(MemberVO memberVo);
	int updateCompany(CompanyVO companyVo);
	CompanyVO selectCompanyById(String memberId);
	int updatePwd(MemberVO memberVo);
	String findId(MemberVO memberVo);
	List<Map<String, Object>> selectPayInfo(String membername);
	int findPwd(MemberVO memberVo);
	
	MemberVO selectBymemberCode(int memberCode);
}
