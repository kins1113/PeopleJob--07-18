package com.ez.peoplejob.custext.model;

import java.sql.Timestamp;

public class CustextVO {
	private int custextCode;
	private String custextcategory;
	private String custitleCUSTITLE;
	private String cuscontent;
	private Timestamp cusRegdate;
	private int memberCode;
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
	public String getCustitleCUSTITLE() {
		return custitleCUSTITLE;
	}
	public void setCustitleCUSTITLE(String custitleCUSTITLE) {
		this.custitleCUSTITLE = custitleCUSTITLE;
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
		return "CustextVO [custextCode=" + custextCode + ", custextcategory=" + custextcategory + ", custitleCUSTITLE="
				+ custitleCUSTITLE + ", cuscontent=" + cuscontent + ", cusRegdate=" + cusRegdate + ", memberCode="
				+ memberCode + "]";
	}
	
	
	
}
