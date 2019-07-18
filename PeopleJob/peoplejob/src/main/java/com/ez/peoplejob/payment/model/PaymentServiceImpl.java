package com.ez.peoplejob.payment.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImpl implements PaymentService{
	@Autowired private PaymentDAO paymentDao;

	@Override
	public int insertPayService1(PaymentVO paymentVo) {
		return paymentDao.insertPayService1(paymentVo);
	}

	@Override
	public List<Map<String, Object>> selectPaymentById(String memberid) {
		return paymentDao.selectPaymentById(memberid);
	}

	@Override
	public int cancelPay(int paymentCode) {
		return paymentDao.cancelPay(paymentCode);
	}

	@Override
	public PaymentVO selectPaymentByCode(int paymentCode) {
		return paymentDao.selectPaymentByCode(paymentCode);
	}

	@Override
	public List<Map<String, Object>> selectMainAdvertiseByServiceCode(int serviceCode) {
		return paymentDao.selectMainAdvertiseByServiceCode(serviceCode);
	}
	
}
