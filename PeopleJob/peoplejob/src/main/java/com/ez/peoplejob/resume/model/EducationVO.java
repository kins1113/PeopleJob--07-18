package com.ez.peoplejob.resume.model;


public class EducationVO {
	private int academicCode; 
	private String schoolName;    
	private String major;         
	private String degree;        
	private String graduate;     
	private String graduateCheck;
	private String schoollocal;
	private String graduatetype;
	private String graduate2;
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
	public String getGraduate() {
		return graduate;
	}
	public void setGraduate(String graduate) {
		this.graduate = graduate;
	}
	public String getGraduateCheck() {
		return graduateCheck;
	}
	public void setGraduateCheck(String graduateCheck) {
		this.graduateCheck = graduateCheck;
	}
	public String getSchoollocal() {
		return schoollocal;
	}
	public void setSchoollocal(String schoollocal) {
		this.schoollocal = schoollocal;
	}
	public String getGraduatetype() {
		return graduatetype;
	}
	public void setGraduatetype(String graduatetype) {
		this.graduatetype = graduatetype;
	}
	public String getGraduate2() {
		return graduate2;
	}
	public void setGraduate2(String graduate2) {
		this.graduate2 = graduate2;
	}
	@Override
	public String toString() {
		return "EducationVO [academicCode=" + academicCode + ", schoolName=" + schoolName + ", major=" + major
				+ ", degree=" + degree + ", graduate=" + graduate + ", graduateCheck=" + graduateCheck
				+ ", schoollocal=" + schoollocal + ", graduatetype=" + graduatetype + ", graduate2=" + graduate2 + "]";
	}

	
}
