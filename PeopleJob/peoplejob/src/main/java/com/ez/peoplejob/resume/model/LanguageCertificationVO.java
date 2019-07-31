package com.ez.peoplejob.resume.model;

import java.sql.Timestamp;

public class LanguageCertificationVO {
	private int langLicenseCode; 
	private String langLicenseName; 
	private String institute;
	private String certificationtype;
	private String language;
	private String langpoint;
	private String langGrade;
	private String langGetdate;
	
	public String getCertificationtype() {
		return certificationtype;
	}
	public void setCertificationtype(String certificationtype) {
		this.certificationtype = certificationtype;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getLangpoint() {
		return langpoint;
	}
	public void setLangpoint(String langpoint) {
		this.langpoint = langpoint;
	}
	public String getLangGrade() {
		return langGrade;
	}
	public void setLangGrade(String langGrade) {
		this.langGrade = langGrade;
	}
	public String getLangGetdate() {
		return langGetdate;
	}
	public void setLangGetdate(String langGetdate) {
		this.langGetdate = langGetdate;
	}
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
	public String getInstitute() {
		return institute;
	}
	public void setInstitute(String institute) {
		this.institute = institute;
	}
	@Override
	public String toString() {
		return "LanguageCertificationVO [langLicenseCode=" + langLicenseCode + ", langLicenseName=" + langLicenseName
				+ ", institute=" + institute + ", certificationtype=" + certificationtype
				+ ", language=" + language + ", langpoint=" + langpoint + ", langGrade=" + langGrade + ", langGetdate="
				+ langGetdate + "]";
	}
	
	
	
	
	
}
