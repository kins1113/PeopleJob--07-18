package com.ez.peoplejob.hopecompany.model;

public class SecondOccupationVO {
	private int secondCode;
	private String secondname;
	private int thirdCode;
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
	public int getThirdCode() {
		return thirdCode;
	}
	public void setThirdCode(int thirdCode) {
		this.thirdCode = thirdCode;
	}
	@Override
	public String toString() {
		return "SecondOccupationVO [secondCode=" + secondCode + ", secondname=" + secondname + ", thirdCode="
				+ thirdCode + "]";
	}
	
	

}
