package com.ez.peoplejob.cusanswer.model;

import java.sql.Timestamp;

public class CusanswerVO {
	private int answerCode;
	private int custextCode;
	private String answertitle;
	private String answercontent;
	private Timestamp answerRegdate;
	private int adminCode;
	public int getAnswerCode() {
		return answerCode;
	}
	public void setAnswerCode(int answerCode) {
		this.answerCode = answerCode;
	}
	public int getCustextCode() {
		return custextCode;
	}
	public void setCustextCode(int custextCode) {
		this.custextCode = custextCode;
	}
	public String getAnswertitle() {
		return answertitle;
	}
	public void setAnswertitle(String answertitle) {
		this.answertitle = answertitle;
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
		return "CusanswerVO [answerCode=" + answerCode + ", custextCode=" + custextCode + ", answertitle=" + answertitle
				+ ", answercontent=" + answercontent + ", answerRegdate=" + answerRegdate + ", adminCode=" + adminCode
				+ "]";
	}
	
	
	
	
}
