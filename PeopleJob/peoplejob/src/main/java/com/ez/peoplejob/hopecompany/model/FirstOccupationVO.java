package com.ez.peoplejob.hopecompany.model;

public class FirstOccupationVO {
	private int firstCode;
	private String firstname;
	
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
	@Override
	public String toString() {
		return "FirstOccupationVO [firstCode=" + firstCode + ", firstname=" + firstname + "]";
	}
	
	
}
