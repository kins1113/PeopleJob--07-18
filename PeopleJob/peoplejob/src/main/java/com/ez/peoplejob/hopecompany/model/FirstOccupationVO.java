package com.ez.peoplejob.hopecompany.model;

public class FirstOccupationVO {
	private int firstCode;
	private String firstname;
	private int secondCode;
	public int getFirstCode() {
		return firstCode;
	}
	public void setFirstCode(int firstCode) {
		this.firstCode = firstCode;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public int getSecondCode() {
		return secondCode;
	}
	public void setSecondCode(int secondCode) {
		this.secondCode = secondCode;
	}
	@Override
	public String toString() {
		return "FirstOccupationVO [firstCode=" + firstCode + ", firstname=" + firstname + ", secondCode=" + secondCode
				+ "]";
	}
	
	
}
