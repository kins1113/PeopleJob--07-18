package com.ez.peoplejob.hopecompany.model;

public class LocationVO {
	private int localCode; 
	private String sido;      
	private int localCode2;
	
	
	public int getLocalCode2() {
		return localCode2;
	}
	public void setLocalCode2(int localCode2) {
		this.localCode2 = localCode2;
	}
	public int getLocalCode() {
		return localCode;
	}
	public void setLocalCode(int localCode) {
		this.localCode = localCode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	@Override
	public String toString() {
		return "LocationVO [localCode=" + localCode + ", sido=" + sido + ", localCode2=" + localCode2 + "]";
	}
	
	
}
