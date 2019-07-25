package com.ez.peoplejob.payment.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.jobopening.model.JobopeningVO;

public interface PaymentService {
	
	int insertPayment(List<JobopeningVO> list,int serviceCode, int memberCode);
	
	List<Map<String, Object>> selectPaymentById(String memberid);
	int cancelPay(int paymentCode);
	PaymentVO selectPaymentByCode(int paymentCode);
	List<Map<String , Object>> selectMainAdvertiseByServiceCode(int serviceCode);
	int getpaymentJobCount(PaymentVO paymentVo);
	int getCountByJobopening(int jobno);
	/*public List<PaymentVO> selectAll();*/
	
	  public List<Map<String, Object>> selectAll(Map<String, Object> map); 
	  int selectTotalCount(SearchVO searchVo);
	 

}
