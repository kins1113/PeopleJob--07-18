package com.ez.peoplejob.resume.model;

import java.sql.Timestamp;

public class EducationVO {
	private int academicCode; 
	private String schoolName;    
	private String major;         
	private String degree;        
	private Timestamp graduate;     
	private String graduateCheck;
	public int getAcademicCode() {
		return academicCode;
	}
	public void setAcademicCode(int academicCode) {
		this.academicCode = academicCode;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public Timestamp getGraduate() {
		return graduate;
	}
	public void setGraduate(Timestamp graduate) {
		this.graduate = graduate;
	}
	public String getGraduateCheck() {
		return graduateCheck;
	}
	public void setGraduateCheck(String graduateCheck) {
		this.graduateCheck = graduateCheck;
	}
	@Override
	public String toString() {
		return "EducationVO [academicCode=" + academicCode + ", schoolName=" + schoolName + ", major=" + major
				+ ", degree=" + degree + ", graduate=" + graduate + ", graduateCheck=" + graduateCheck + "]";
	}
	
	
	
}
