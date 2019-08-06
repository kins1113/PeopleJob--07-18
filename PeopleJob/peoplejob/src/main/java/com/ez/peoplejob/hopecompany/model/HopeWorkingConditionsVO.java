package com.ez.peoplejob.hopecompany.model;

import java.sql.Timestamp;

public class HopeWorkingConditionsVO {
	private int hopworkCode;		//희망근무코드
	private String jobtype;		//업직종
	private Timestamp hopeworkdate;		//근무일시
	private String hopepay;			//급여
	private String hopeworkform;		//근무형태
	private int localCode;		//지역코드
	private int firstjobCode;	//1차직종코드
	
	public int getHopworkCode() {
		return hopworkCode;
	}
	public void setHopworkCode(int hopworkCode) {
		this.hopworkCode = hopworkCode;
	}
	public String getJobtype() {
		return jobtype;
	}
	public void setJobtype(String jobtype) {
		this.jobtype = jobtype;
	}
	public Timestamp getHopeworkdate() {
		return hopeworkdate;
	}
	public void setHopeworkdate(Timestamp hopeworkdate) {
		this.hopeworkdate = hopeworkdate;
	}
	public String getHopepay() {
		return hopepay;
	}
	public void setHopepay(String hopepay) {
		this.hopepay = hopepay;
	}
	public String getHopeworkform() {
		return hopeworkform;
	}
	public void setHopeworkform(String hopeworkform) {
		this.hopeworkform = hopeworkform;
	}
	public int getLocalCode() {
		return localCode;
	}
	public void setLocalCode(int localCode) {
		this.localCode = localCode;
	}
	public int getFirstjobCode() {
		return firstjobCode;
	}
	public void setFirstjobCode(int firstjobCode) {
		this.firstjobCode = firstjobCode;
	}
	@Override
	public String toString() {
		return "HopeWorkingConditionsVO [hopworkCode=" + hopworkCode + ", jobtype=" + jobtype + ", hopeworkdate="
				+ hopeworkdate + ", hopepay=" + hopepay + ", hopeworkform=" + hopeworkform + ", localCode=" + localCode
				+ ", firstjobCode=" + firstjobCode + "]";
	}
	
}
