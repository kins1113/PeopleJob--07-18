package com.ez.peoplejob.payment.model;

import java.sql.Timestamp;

public class PaymentVO {
	private int paymentCode;	// 결제 코드
	private String paymentway;   // 결제수단
	private String progress;     // 진행상황
	private int discount;     // 할인금액
	private Timestamp paydate;    // 결제일
	private Timestamp payendDate;  // 종료일
	private int serviceCode;   //서비스 코드
	private int memberCode;  //회원 코드
	
	public int getPaymentCode() {
		return paymentCode;
	}
	public void setPaymentCode(int paymentCode) {
		this.paymentCode = paymentCode;
	}
	public String getPaymentway() {
		return paymentway;
	}
	public void setPaymentway(String paymentway) {
		this.paymentway = paymentway;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public Timestamp getPaydate() {
		return paydate;
	}
	public void setPaydate(Timestamp paydate) {
		this.paydate = paydate;
	}
	public Timestamp getPayendDate() {
		return payendDate;
	}
	public void setPayendDate(Timestamp payendDate) {
		this.payendDate = payendDate;
	}
	public int getServiceCode() {
		return serviceCode;
	}
	public void setServiceCode(int serviceCode) {
		this.serviceCode = serviceCode;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	@Override
	public String toString() {
		return "PaymentVO [paymentCode=" + paymentCode + ", paymentway=" + paymentway + ", progress=" + progress
				+ ", discount=" + discount + ", paydate=" + paydate + ", payendDate=" + payendDate + ", serviceCode="
				+ serviceCode + ", memberCode=" + memberCode + "]";
	}
	

	
	

}
