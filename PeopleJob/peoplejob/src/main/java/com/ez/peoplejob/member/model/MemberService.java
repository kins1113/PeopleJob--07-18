package com.ez.peoplejob.member.model;

import java.util.List;
import java.util.Map;

public interface MemberService {
	//아이디 중복확인에서 사용하는 final변수
	int USEFUL_USERID=1;  //사용가능한 아이디
	int NON_USEFUL_USERID=2;  //사용불가능한 아이디
			
	//로그인처리에서 사용하는 final 변수
	int LOGIN_OK=1; //로그인 성공
	int PWD_DISAGREE=2; //비밀번호 불일치
	int ID_NONE=3; //아이디 존재하지 않음
		
	int insertMember(MemberVO memberVo);
	int insertCompany(CompanyVO companyVo);
	int dupUserid(String memberId);
	int loginCheck(String memberid, String pwd);
	MemberVO selectByUserid(String memberId);
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
