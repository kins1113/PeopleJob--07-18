package com.ez.peoplejob.member.model;

public class AuthorityVO {
	private int authorityCode;
	private String authorityName;
	public int getAuthorityCode() {
		return authorityCode;
	}
	public void setAuthorityCode(int authorityCode) {
		this.authorityCode = authorityCode;
	}
	public String getAuthorityName() {
		return authorityName;
	}
	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
	}
	@Override
	public String toString() {
		return "AuthorityVO [authorityCode=" + authorityCode + ", authorityName=" + authorityName + "]";
	}
	
	
}
