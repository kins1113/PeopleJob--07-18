package com.ez.peoplejob.hopecompany.model;

public class LanguageCertificationVO {
	private int langlicenceCode;
	private String langlicencename;
	private String institute;
	private String certificationtype;
	private String language;
	private String langpoint;
	private String langGrade;
	private String langGetdate;
	public int getLanglicenceCode() {
		return langlicenceCode;
	}
	public void setLanglicenceCode(int langlicenceCode) {
		this.langlicenceCode = langlicenceCode;
	}
	public String getLanglicencename() {
		return langlicencename;
	}
	public void setLanglicencename(String langlicencename) {
		this.langlicencename = langlicencename;
	}
	public String getInstitute() {
		return institute;
	}
	public void setInstitute(String institute) {
		this.institute = institute;
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
	@Override
	public String toString() {
		return "LanguageCertificationVO [langlicenceCode=" + langlicenceCode + ", langlicencename=" + langlicencename
				+ ", institute=" + institute + ", certificationtype=" + certificationtype + ", language=" + language
				+ ", langpoint=" + langpoint + ", langGrade=" + langGrade + ", langGetdate=" + langGetdate
				+ ", getLanglicenceCode()=" + getLanglicenceCode() + ", getLanglicencename()=" + getLanglicencename()
				+ ", getInstitute()=" + getInstitute() + ", getCertificationtype()=" + getCertificationtype()
				+ ", getLanguage()=" + getLanguage() + ", getLangpoint()=" + getLangpoint() + ", getLangGrade()="
				+ getLangGrade() + ", getLangGetdate()=" + getLangGetdate() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
