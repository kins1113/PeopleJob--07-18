package com.ez.peoplejob.resume.model;

import java.sql.Timestamp;

public class LanguageCertificationVO {
	private int langLicenseCode; 
	private String langLicenseName; 
	private Timestamp getdate;          
	private String institute;
	public int getLangLicenseCode() {
		return langLicenseCode;
	}
	public void setLangLicenseCode(int langLicenseCode) {
		this.langLicenseCode = langLicenseCode;
	}
	public String getLangLicenseName() {
		return langLicenseName;
	}
	public void setLangLicenseName(String langLicenseName) {
		this.langLicenseName = langLicenseName;
	}
	public Timestamp getGetdate() {
		return getdate;
	}
	public void setGetdate(Timestamp getdate) {
		this.getdate = getdate;
	}
	public String getInstitute() {
		return institute;
	}
	public void setInstitute(String institute) {
		this.institute = institute;
	}
	@Override
	public String toString() {
		return "LanguageCertificationVO [langLicenseCode=" + langLicenseCode + ", langLicenseName=" + langLicenseName
				+ ", getdate=" + getdate + ", institute=" + institute + "]";
	}
	
	
	
	
	
}
