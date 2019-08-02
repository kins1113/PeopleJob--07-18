package com.ez.peoplejob.resume.model;


public class ResumeManagerVO {
	private int resumeCode;
	private String resumeTitle;
	private String resumeRegdate;
	private String introduce;
	private String award;
	private int langlicenceCode;
	private int licenceCode;
	private int dvCode;
	private int academicCode;
	private int desiredWorkCode;
	private String opencheck;
	private int memberCode;
	private String picture;
	public int getResumeCode() {
		return resumeCode;
	}
	public void setResumeCode(int resumeCode) {
		this.resumeCode = resumeCode;
	}
	public String getResumeTitle() {
		return resumeTitle;
	}
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	public String getResumeRegdate() {
		return resumeRegdate;
	}
	public void setResumeRegdate(String resumeRegdate) {
		this.resumeRegdate = resumeRegdate;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getAward() {
		return award;
	}
	public void setAward(String award) {
		this.award = award;
	}
	public int getLanglicenceCode() {
		return langlicenceCode;
	}
	public void setLanglicenceCode(int langlicenceCode) {
		this.langlicenceCode = langlicenceCode;
	}
	public int getLicenceCode() {
		return licenceCode;
	}
	public void setLicenceCode(int licenceCode) {
		this.licenceCode = licenceCode;
	}
	public int getDvCode() {
		return dvCode;
	}
	public void setDvCode(int dvCode) {
		this.dvCode = dvCode;
	}
	public int getAcademicCode() {
		return academicCode;
	}
	public void setAcademicCode(int academicCode) {
		this.academicCode = academicCode;
	}
	public int getDesiredWorkCode() {
		return desiredWorkCode;
	}
	public void setDesiredWorkCode(int desiredWorkCode) {
		this.desiredWorkCode = desiredWorkCode;
	}
	public String getOpencheck() {
		return opencheck;
	}
	public void setOpencheck(String opencheck) {
		this.opencheck = opencheck;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	@Override
	public String toString() {
		return "ResumeManagerVO [resumeCode=" + resumeCode + ", resumeTitle=" + resumeTitle + ", resumeRegdate="
				+ resumeRegdate + ", introduce=" + introduce + ", award=" + award + ", langlicenceCode="
				+ langlicenceCode + ", licenceCode=" + licenceCode + ", dvCode=" + dvCode + ", academicCode="
				+ academicCode + ", desiredWorkCode=" + desiredWorkCode + ", opencheck=" + opencheck + ", memberCode="
				+ memberCode + ", picture=" + picture + "]";
	}
	
	
}
