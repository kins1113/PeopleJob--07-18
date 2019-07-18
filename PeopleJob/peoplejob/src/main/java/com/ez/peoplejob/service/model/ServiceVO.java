package com.ez.peoplejob.service.model;

public class ServiceVO {
	private int serviceCode;
	private String serviceName; 
	private int servicePrice;  
	private String serviceContent;
	private int serviceDay;
	public int getServiceCode() {
		return serviceCode;
	}
	public void setServiceCode(int serviceCode) {
		this.serviceCode = serviceCode;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public int getServicePrice() {
		return servicePrice;
	}
	public void setServicePrice(int servicePrice) {
		this.servicePrice = servicePrice;
	}
	public String getServiceContent() {
		return serviceContent;
	}
	public void setServiceContent(String serviceContent) {
		this.serviceContent = serviceContent;
	}
	public int getServiceDay() {
		return serviceDay;
	}
	public void setServiceDay(int serviceDay) {
		this.serviceDay = serviceDay;
	}
	
	@Override
	public String toString() {
		return "ServiceVO [serviceCode=" + serviceCode + ", serviceName=" + serviceName + ", servicePrice="
				+ servicePrice + ", serviceContent=" + serviceContent + ", serviceDay=" + serviceDay + "]";
	}
	
	
	
}
