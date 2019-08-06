package com.ez.peoplejob.resume.model;

import java.sql.Timestamp;

public class CareerVO {
	private int dvCode;    
	private String companyName; 
	private Timestamp workTerm;   
	private String chargeWork;
	public int getDvCode() {
		return dvCode;
	}
	public void setDvCode(int dvCode) {
		this.dvCode = dvCode;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public Timestamp getWorkTerm() {
		return workTerm;
	}
	public void setWorkTerm(Timestamp workTerm) {
		this.workTerm = workTerm;
	}
	public String getChargeWork() {
		return chargeWork;
	}
	public void setChargeWork(String chargeWork) {
		this.chargeWork = chargeWork;
	}
	@Override
	public String toString() {
		return "CareerVO [dvCode=" + dvCode + ", companyName=" + companyName + ", workTerm=" + workTerm
				+ ", chargeWork=" + chargeWork + "]";
	}
	
	
	
}
