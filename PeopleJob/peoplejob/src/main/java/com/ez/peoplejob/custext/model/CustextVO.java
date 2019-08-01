package com.ez.peoplejob.custext.model;

import java.sql.Timestamp;

public class CustextVO {
	private int custextCode;
	private String custextcategory;
	private String custitle;
	private String cuscontent;
	private Timestamp cusRegdate;
	private int memberCode;
	private int answercontent;
	private String answerRegdate;
	private int adminCode;
	
	
	public int getAnswercontent() {
		return answercontent;
	}
	public void setAnswercontent(int answercontent) {
		this.answercontent = answercontent;
	}
	public String getAnswerRegdate() {
		return answerRegdate;
	}
	public void setAnswerRegdate(String answerRegdate) {
		this.answerRegdate = answerRegdate;
	}
	public int getAdminCode() {
		return adminCode;
	}
	public void setAdminCode(int adminCode) {
		this.adminCode = adminCode;
	}
	public int getCustextCode()	{
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
	public String getcustitle() {
		return custitle;
	}
	public void setcustitle(String custitle) {
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
	@Override
	public String toString() {
		return "CustextVO [custextCode=" + custextCode + ", custextcategory=" + custextcategory + ", custitle="
				+ custitle + ", cuscontent=" + cuscontent + ", cusRegdate=" + cusRegdate + ", memberCode="
				+ memberCode + ", answercontent=" + answercontent + ", answerRegdate=" + answerRegdate + ", adminCode="
				+ adminCode + "]";
	}
	
	
	
}
