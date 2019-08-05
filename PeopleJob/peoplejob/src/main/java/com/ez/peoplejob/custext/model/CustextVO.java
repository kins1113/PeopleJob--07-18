package com.ez.peoplejob.custext.model;

import java.sql.Timestamp;

public class CustextVO {
	private int custextCode;
	private String custextcategory;
	private String custitle;
	private String cuscontent;
	private Timestamp cusRegdate;
	private int memberCode;
	private String answercontent;
	private Timestamp answerRegdate;
	private int adminCode;
	public int getCustextCode() {
		return custextCode;
	}
	public void setCustextCode(int custextCode) {
		this.custextCode = custextCode;
	}
	public String getCustextcategory() {
		return custextcategory;
	}
	public void setCustextcategory(String custextcategory) {
		this.custextcategory = custextcategory;
	}
	public String getCustitle() {
		return custitle;
	}
	public void setCustitle(String custitle) {
		this.custitle = custitle;
	}
	public String getCuscontent() {
		return cuscontent;
	}
	public void setCuscontent(String cuscontent) {
		this.cuscontent = cuscontent;
	}
	public Timestamp getCusRegdate() {
		return cusRegdate;
	}
	public void setCusRegdate(Timestamp cusRegdate) {
		this.cusRegdate = cusRegdate;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getAnswercontent() {
		return answercontent;
	}
	public void setAnswercontent(String answercontent) {
		this.answercontent = answercontent;
	}
	public Timestamp getAnswerRegdate() {
		return answerRegdate;
	}
	public void setAnswerRegdate(Timestamp answerRegdate) {
		this.answerRegdate = answerRegdate;
	}
	public int getAdminCode() {
		return adminCode;
	}
	public void setAdminCode(int adminCode) {
		this.adminCode = adminCode;
	}
	@Override
	public String toString() {
		return "CustextVO [custextCode=" + custextCode + ", custextcategory=" + custextcategory + ", custitle="
				+ custitle + ", cuscontent=" + cuscontent + ", cusRegdate=" + cusRegdate + ", memberCode=" + memberCode
				+ ", answercontent=" + answercontent + ", answerRegdate=" + answerRegdate + ", adminCode=" + adminCode
				+ "]";
	}
	
}
