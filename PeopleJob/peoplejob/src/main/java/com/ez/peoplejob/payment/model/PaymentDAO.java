package com.ez.peoplejob.payment.model;

import java.util.List;
import java.util.Map;

public interface PaymentDAO {
	int insertPayService1(PaymentVO paymentVo);
	List<Map<String, Object>> selectPaymentById(String memberid);
	int cancelPay(int paymentCode);
	PaymentVO selectPaymentByCode(int paymentCode);
	List<Map<String , Object>> selectMainAdvertiseByServiceCode(int serviceCode);
}
