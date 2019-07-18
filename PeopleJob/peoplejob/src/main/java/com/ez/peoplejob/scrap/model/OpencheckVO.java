package com.ez.peoplejob.scrap.model;

import java.sql.Timestamp;

public class OpencheckVO {
	private int openCode;		//열람 코드
	private int memberCode;		//회원 코드
	private int resumeCode;		//이력서 코드
	private Timestamp opendate; //열람 날짜
	public int getOpenCode() {
		return openCode;
	}
	public void setOpenCode(int openCode) {
		this.openCode = openCode;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public int getResumeCode() {
		return resumeCode;
	}
	public void setResumeCode(int resumeCode) {
		this.resumeCode = resumeCode;
	}
	public Timestamp getOpendate() {
		return opendate;
	}
	public void setOpendate(Timestamp opendate) {
		this.opendate = opendate;
	}
	@Override
	public String toString() {
		return "OpencheckVO [openCode=" + openCode + ", memberCode=" + memberCode + ", resumeCode=" + resumeCode
				+ ", opendate=" + opendate + ", getOpenCode()=" + getOpenCode() + ", getMemberCode()=" + getMemberCode()
				+ ", getResumeCode()=" + getResumeCode() + ", getOpendate()=" + getOpendate() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
