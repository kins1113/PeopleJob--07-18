package com.ez.peoplejob.member.model;

import java.sql.Timestamp;

import com.ez.peoplejob.common.SearchVO;

public class MemberVO extends SearchVO{
	private int memberCode;

	private String memberid;
	private Timestamp regdate;
	private String membername;
	private String zipcode;
	private String address;
	private String addressdetail;
	private Timestamp withdrawaldate;
	private String pwd;
	private String birth;
	private String membergender;
	private String email;
	private String tel;
	private int authorityCode;
	private int companyCode;
	
	
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getMembername() {
		return membername;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressdetail() {
		return addressdetail;
	}
	public void setAddressdetail(String addressdetail) {
		this.addressdetail = addressdetail;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public Timestamp getWithdrawaldate() {
		return withdrawaldate;
	}
	public void setWithdrawaldate(Timestamp withdrawaldate) {
		this.withdrawaldate = withdrawaldate;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getMembergender() {
		return membergender;
	}
	public void setMembergender(String membergender) {
		this.membergender = membergender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getAuthorityCode() {
		return authorityCode;
	}
	public void setAuthorityCode(int authorityCode) {
		this.authorityCode = authorityCode;
	}
	public int getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(int companyCode) {
		this.companyCode = companyCode;
	}
	@Override
	public String toString() {
		return "MemberVO [memberCode=" + memberCode + ", memberid=" + memberid + ", regdate=" + regdate
				+ ", membername=" + membername + ", zipcode=" + zipcode + ", address=" + address + ", addressdetail="
				+ addressdetail + ", withdrawaldate=" + withdrawaldate + ", pwd=" + pwd + ", birth=" + birth
				+ ", membergender=" + membergender + ", email=" + email + ", tel=" + tel + ", authorityCode="
				+ authorityCode + ", companyCode=" + companyCode + ", toString()=" + super.toString() + "]";
	}
	
	
	
	

}
