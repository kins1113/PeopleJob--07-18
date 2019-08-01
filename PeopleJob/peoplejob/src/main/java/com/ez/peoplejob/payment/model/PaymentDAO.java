package com.ez.peoplejob.payment.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.post.model.PostVO;

public interface PaymentDAO {
	int insertPayment(PaymentVO paymentVo);
	List<Map<String, Object>> selectPaymentById(String memberid);
	int cancelPay(int paymentCode);
	PaymentVO selectPaymentByCode(int paymentCode);
	List<Map<String , Object>> selectMainAdvertiseByServiceCode(int serviceCode);
	int getpaymentJobCount(PaymentVO paymentVo);
	int getCountByJobopening(int jobno);
	List<Map<String, Object>> selectPayByTime(String memberid);
	List<Map<String, Object>> selectBySameTime(PaymentVO paymentVo);
	List<PaymentVO> selectCancelConfirm(PaymentVO paymentVo);
	
	
	
	public List<Map<String, Object>> selectAll(Map<String, Object> map);
	int selectTotalCount(SearchVO searchVo);
	
}
