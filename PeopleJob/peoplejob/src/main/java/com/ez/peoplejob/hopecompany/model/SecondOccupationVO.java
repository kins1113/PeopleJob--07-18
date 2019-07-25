package com.ez.peoplejob.hopecompany.model;

public class SecondOccupationVO {
	private int secondCode;
	private String secondname;
	private int firstCode;
	
	public int getSecondCode() {
		return secondCode;
	}
	public void setSecondCode(int secondCode) {
		this.secondCode = secondCode;
	}
	public String getSecondname() {
		return secondname;
	}
	public void setSecondname(String secondname) {
		this.secondname = secondname;
	}
	public int getfirstCode() {
		return firstCode;
	}
	public void setfirstCode(int firstCode) {
		this.firstCode = firstCode;
	}
	@Override
	public String toString() {
		return "SecondOccupationVO [secondCode=" + secondCode + ", secondname=" + secondname + ", firstCode="
				+ firstCode + "]";
	}
	
	

}
