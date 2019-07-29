package com.ez.peoplejob.payment.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.common.SearchVO;

public interface PaymentDAO {
	int insertPayment(PaymentVO paymentVo);
	List<Map<String, Object>> selectPaymentById(String memberid);
	int cancelPay(int paymentCode);
	PaymentVO selectPaymentByCode(int paymentCode);
	List<Map<String , Object>> selectMainAdvertiseByServiceCode(int serviceCode);
	int getpaymentJobCount(PaymentVO paymentVo);
	int getCountByJobopening(int jobno);
	List<Map<String, Object>> selectPayByTime(String memberid);
	
	
	public List<Map<String, Object>> selectAll(Map<String, Object> map);
	int selectTotalCount(SearchVO searchVo);
	
}
