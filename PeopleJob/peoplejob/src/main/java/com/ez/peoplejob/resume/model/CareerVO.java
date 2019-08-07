package com.ez.peoplejob.resume.model;

public class CareerVO {
	private int dvCode;    
	private String companyname; 
	private String workterm; 
	private String workterm2; 
	private String chargework;
	private String workcheck; //경력구분 (신입,경력)
	private String jobgrade; //직급
	private String workcondition; //근무상태(재직중,퇴직)
	public int getDvCode() {
		return dvCode;
	}
	public void setDvCode(int dvCode) {
		this.dvCode = dvCode;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getWorkterm() {
		return workterm;
	}
	public void setWorkterm(String workterm) {
		this.workterm = workterm;
	}
	public String getWorkterm2() {
		return workterm2;
	}
	public void setWorkterm2(String workterm2) {
		this.workterm2 = workterm2;
	}
	public String getChargework() {
		return chargework;
	}
	public void setChargework(String chargework) {
		this.chargework = chargework;
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
	@Override
	public String toString() {
		return "CareerVO [dvCode=" + dvCode + ", companyname=" + companyname + ", workterm=" + workterm + ", workterm2="
				+ workterm2 + ", chargework=" + chargework + ", workcheck=" + workcheck + ", jobgrade=" + jobgrade
				+ ", workcondition=" + workcondition + "]";
	}

	
	
}