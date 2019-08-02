package com.ez.peoplejob.resume.model;

public class LangCertificationVO {
	private int langlicenseCode; 
	private String langlicensename; 
	private String institute;
	private String certificationtype;
	private String language;
	private String langpoint;
	private String langGrade;
	private String langGetdate;
	
	public int getLanglicenseCode() {
		return langlicenseCode;
	}
	public void setLanglicenseCode(int langlicenseCode) {
		this.langlicenseCode = langlicenseCode;
	}
	public String getLanglicensename() {
		return langlicensename;
	}
	public void setLanglicensename(String langlicensename) {
		this.langlicensename = langlicensename;
	}
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
	
	public String getInstitute() {
		return institute;
	}
	public void setInstitute(String institute) {
		this.institute = institute;
	}
	
	@Override
	public String toString() {
		return "LangCertificationVO [langlicenseCode=" + langlicenseCode + ", langlicensename=" + langlicensename
				+ ", institute=" + institute + ", certificationtype=" + certificationtype + ", language=" + language
				+ ", langpoint=" + langpoint + ", langGrade=" + langGrade + ", langGetdate=" + langGetdate + "]";
	}
	
	
	
	
	
}
