package com.ez.peoplejob.hopecompany.model;

public class LocationVO {
	private int localCode; 
	private String sido;      
	private String gugun;
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
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	
	@Override
	public String toString() {
		return "LocationVO [localCode=" + localCode + ", sido=" + sido + ", gugun=" + gugun + "]";
	}
	
	
	
}
