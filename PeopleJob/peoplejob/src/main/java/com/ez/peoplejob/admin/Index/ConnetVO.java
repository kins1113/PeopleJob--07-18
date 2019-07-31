package com.ez.peoplejob.admin.Index;

public class ConnetVO {
	
	private int connetCode;
	private int memberCode;
	private String connetDay;
	
	//
	private int count;

	public int getConnetCode() {
		return connetCode;
	}

	public void setConnetCode(int connetCode) {
		this.connetCode = connetCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getConnetDay() {
		return connetDay;
	}

	public void setConnetDay(String connetDay) {
		this.connetDay = connetDay;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "ConnetVO [connetCode=" + connetCode + ", memberCode=" + memberCode + ", connetDay=" + connetDay
				+ ", count=" + count + "]";
	}
	
	
	
}
