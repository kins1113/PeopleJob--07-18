package com.ez.peoplejob.manager.model;

import java.util.List;
import java.util.Map;

public interface ManagerService {
	//관리자 로그인 관련 상수 
	int LOGIN_OK=1;			//로그인 성공
	int LOGIN_PWD_NOT=2;	//비밀번호가 틀림
	int LOGIN_ID_NOT=3;		//아이디가 없다.
	
	//관리자 권한 관련 상수 authority
	String AUTHORITY_GM="GM";			//그랜드 마스터 - 뭐든 가능
	String AUTHORITY_MASTER="Master";	//마스터
	String AUTHORITY_ADMIN="Admin";		//어드민
	
	//관리자 아이디 체크 관련 상수 
	public final static int ID_OK=1;	//사용가능한 아이디
	public final static int ID_NOT=2;	//사용 불가한 아이디
	public final static int ID_OUT=3;	//삭제한 아이디

	public ManagerVO selectPwdById(String adminid);
	public int selectPwdById(String adminid,String adminpwd);
	public List<ManagerVO> selectManagerAll();
	public int insertManager(ManagerVO managerVo);
	public int delectManager(int adminCode);
	public boolean isAuthority(String adminid);
	public int selectIdChk(String adminid);
	public ManagerVO selectByCode(int adminCode);
	public int updateManager(ManagerVO managerVo);
	public int selectCheckPwd(Map<String, String> map);
}
