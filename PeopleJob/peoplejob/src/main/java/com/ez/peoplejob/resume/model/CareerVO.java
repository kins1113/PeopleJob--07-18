package com.ez.peoplejob.resume.model;

import java.sql.Timestamp;

public class CareerVO {
	private int dvCode;    
	private String companyName; 
	private String workTerm;   
	private String workTerm2;   
	private String chargeWork;
	private String workcheck;
	private String jobgrade;
	private String workcondition;
	
	
	public String getWorkTerm2() {
		return workTerm2;
	}
	public void setWorkTerm2(String workTerm2) {
		this.workTerm2 = workTerm2;
	}
	public String getWorkcheck() {
		return workcheck;
	}
	public void setWorkcheck(String workcheck) {
		this.workcheck = workcheck;
	}
	public String getJobgrade() {
		return jobgrade;
	}
	public void setJobgrade(String jobgrade) {
		this.jobgrade = jobgrade;
	}
	public String getWorkcondition() {
		return workcondition;
	}
	public void setWorkcondition(String workcondition) {
		this.workcondition = workcondition;
	}
	public void setWorkTerm(String workTerm) {
		this.workTerm = workTerm;
	}
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
	
	public String getChargeWork() {
		return chargeWork;
	}
	public void setChargeWork(String chargeWork) {
		this.chargeWork = chargeWork;
	}
	
	@Override
	public String toString() {
		return "CareerVO [dvCode=" + dvCode + ", companyName=" + companyName + ", workTerm=" + workTerm + ", workTerm2="
				+ workTerm2 + ", chargeWork=" + chargeWork + ", workcheck=" + workcheck + ", jobgrade=" + jobgrade
				+ ", workcondition=" + workcondition + "]";
	}
	
	
	
}
