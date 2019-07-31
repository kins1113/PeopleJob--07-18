package com.ez.peoplejob.hopecompany.model;

import com.ez.peoplejob.resume.model.CertificateVO;

public class HopeWorkingConditionsVO {
	private int hopworkCode;		//희망근무코드
	private String hopeworkdate;		//근무일시
	private String hopepay;			//급여
	private String hopeworkform;		//근무형태
	private String localCode;		//지역코드
	private String btypeCode3;	//3차업종코드
	private String thirdCode;	//3차직종코드
	
	
	public int getHopworkCode() {
		return hopworkCode;
	}
	public void setHopworkCode(int hopworkCode) {
		this.hopworkCode = hopworkCode;
	}
	public String getHopeworkdate() {
		return hopeworkdate;
	}
	public void setHopeworkdate(String hopeworkdate) {
		this.hopeworkdate = hopeworkdate;
	}
	public String getHopepay() {
		return hopepay;
	}
	public void setHopepay(String hopepay) {
		this.hopepay = hopepay;
	}
	public String getHopeworkform() {
		return hopeworkform;
	}
	public void setHopeworkform(String hopeworkform) {
		this.hopeworkform = hopeworkform;
	}
	public String getLocalCode() {
		return localCode;
	}
	public void setLocalCode(String localCode) {
		this.localCode = localCode;
	}
	public String getBtypeCode3() {
		return btypeCode3;
	}
	public void setBtypeCode3(String btypeCode3) {
		this.btypeCode3 = btypeCode3;
	}
	public String getThirdCode() {
		return thirdCode;
	}
	public void setThirdCode(String thirdCode) {
		this.thirdCode = thirdCode;
	}
	@Override
	public String toString() {
		return "HopeWorkingConditionsVO [hopworkCode=" + hopworkCode + ", hopeworkdate=" + hopeworkdate + ", hopepay="
				+ hopepay + ", hopeworkform=" + hopeworkform + ", localCode=" + localCode + ", btypeCode3=" + btypeCode3
				+ ", thirdCode=" + thirdCode + "]";
	}
	
}
