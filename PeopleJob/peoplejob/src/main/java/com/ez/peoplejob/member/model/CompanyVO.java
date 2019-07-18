package com.ez.peoplejob.member.model;

public class CompanyVO {
	private int companyCode;
	private String companyname;
	private String businessNumber;
	private String image;
	private String companyZipcode;
	private String companyAddress;
	private String companyAddressdetail;
	
	//9개 추가
	private String womannum; //남녀사원수
	private String mannum;
	private String establishyear; //설립년도
	private String companytype; //기업형태
	private String site;	//홈페이지 주소
	private String sales;	//매출액
	private String capital;	//자본금
	private String majorbusiness;	//주요사업
	private String introduction;	//기업소개
	
	public int getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(int companyCode) {
		this.companyCode = companyCode;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCompanyZipcode() {
		return companyZipcode;
	}
	public void setCompanyZipcode(String companyZipcode) {
		this.companyZipcode = companyZipcode;
	}
	public String getCompanyAddress() {
		return companyAddress;
	}
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	public String getCompanyAddressdetail() {
		return companyAddressdetail;
	}
	public void setCompanyAddressdetail(String companyAddressdetail) {
		this.companyAddressdetail = companyAddressdetail;
	}
	
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	
	public String getWomannum() {
		return womannum;
	}
	public void setWomannum(String womannum) {
		this.womannum = womannum;
	}
	public String getMannum() {
		return mannum;
	}
	public void setMannum(String mannum) {
		this.mannum = mannum;
	}
	public String getSales() {
		return sales;
	}
	public void setSales(String sales) {
		this.sales = sales;
	}
	public String getCapital() {
		return capital;
	}
	public void setCapital(String capital) {
		this.capital = capital;
	}
	public String getEstablishyear() {
		return establishyear;
	}
	public void setEstablishyear(String establishyear) {
		this.establishyear = establishyear;
	}
	public String getCompanytype() {
		return companytype;
	}
	public void setCompanytype(String companytype) {
		this.companytype = companytype;
	}
	public String getMajorbusiness() {
		return majorbusiness;
	}
	public void setMajorbusiness(String majorbusiness) {
		this.majorbusiness = majorbusiness;
	}
	
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	@Override
	public String toString() {
		return "CompanyVO [companyCode=" + companyCode + ", companyname=" + companyname + ", businessNumber="
				+ businessNumber + ", image=" + image + ", companyZipcode=" + companyZipcode + ", companyAddress="
				+ companyAddress + ", companyAddressdetail=" + companyAddressdetail + ", womannum=" + womannum
				+ ", mannum=" + mannum + ", establishyear=" + establishyear + ", companytype=" + companytype + ", site="
				+ site + ", sales=" + sales + ", capital=" + capital + ", majorbusiness=" + majorbusiness
				+ ", introduction=" + introduction + "]";
	}
	
	

	
	
}
