package com.ez.peoplejob.payment.model;

import java.util.List;

public class PaymentListVO {
	private List<PaymentVO> payItems;

	public List<PaymentVO> getPayItems() {
		return payItems;
	}

	public void setPayItems(List<PaymentVO> payItems) {
		this.payItems = payItems;
	}

	@Override
	public String toString() {
		return "PaymentListVO [payItems=" + payItems + "]";
	}
	
	

}
