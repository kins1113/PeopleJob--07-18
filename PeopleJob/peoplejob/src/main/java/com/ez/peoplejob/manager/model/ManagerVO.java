package com.ez.peoplejob.manager.model;

import java.sql.Timestamp;

public class ManagerVO {
	private int adminCode;		//관리자 코드
	private String adminid;			//관리자아이디
	private String adminpwd;		//비밀번호
	private String authority;		//권한
	private Timestamp autRegdate;	//가입일
	private Timestamp autDeldate;	//삭제일
	
	
	public int getAdminCode() {
		return adminCode;
	}
	public void setAdminCode(int adminCode) {
		this.adminCode = adminCode;
	}
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getAdminpwd() {
		return adminpwd;
	}
	public void setAdminpwd(String adminpwd) {
		this.adminpwd = adminpwd;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public Timestamp getAutRegdate() {
		return autRegdate;
	}
	public void setAutRegdate(Timestamp autRegdate) {
		this.autRegdate = autRegdate;
	}
	public Timestamp getAutDeldate() {
		return autDeldate;
	}
	public void setAutDeldate(Timestamp autDeldate) {
		this.autDeldate = autDeldate;
	}
	@Override
	public String toString() {
		return "ManagerVO [adminCode=" + adminCode + ", adminid=" + adminid + ", adminpwd=" + adminpwd + ", authority="
				+ authority + ", autRegdate=" + autRegdate + ", autDeldate=" + autDeldate + "]";
	}
	
	
}
