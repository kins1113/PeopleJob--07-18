package com.ez.peoplejob.resume.model;

public class CertificateVO {
	
	private int lNo; 				//격증번호
	private String lName;			//자격증이름
	private String lGetdate;		// 취득일
	private String lInstitution; 	//발행기관
	public int getlNo() {
		return lNo;
	}
	public void setlNo(int lNo) {
		this.lNo = lNo;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getlGetdate() {
		return lGetdate;
	}
	public void setlGetdate(String lGetdate) {
		this.lGetdate = lGetdate;
	}
	public String getlInstitution() {
		return lInstitution;
	}
	public void setlInstitution(String lInstitution) {
		this.lInstitution = lInstitution;
	}
	@Override
	public String toString() {
		return "CertificateVO [lNo=" + lNo + ", lName=" + lName + ", lGetdate=" + lGetdate + ", lInstitution="
				+ lInstitution + "]";
	}

}
