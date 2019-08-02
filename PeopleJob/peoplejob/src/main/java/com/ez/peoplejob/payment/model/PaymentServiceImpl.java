package com.ez.peoplejob.payment.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.peoplejob.common.SearchVO;

@Service
public class PaymentServiceImpl implements PaymentService{
	@Autowired private PaymentDAO paymentDao;

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

	@Override
	public int insertPayment(PaymentVO paymentVo) {
		return paymentDao.insertPayment(paymentVo);
	}

	@Override
	public int getpaymentJobCount(PaymentVO paymentVo) {
		return paymentDao.getpaymentJobCount(paymentVo);
	}

	@Override
	public int getCountByJobopening(int jobno) {
		return paymentDao.getCountByJobopening(jobno);
	}

	@Override
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return paymentDao.selectAll(map);
	}

	@Override
	public int selectTotalCount(SearchVO searchVo) {
		return paymentDao.selectTotalCount(searchVo);
	}

	@Override
	public List<Map<String, Object>> selectPayByTime(String memberid) {
		return paymentDao.selectPayByTime(memberid);
	}

	@Override
	public List<Map<String, Object>> selectBySameTime(String paydate, int memberCode) {
		PaymentVO paymentVo=new PaymentVO();
		
		//String으로 받은 paydate를 setting하기 위해 timestamp로 형변환
		Timestamp paydate2=Timestamp.valueOf(paydate);
		
		paymentVo.setPaydate(paydate2);
		paymentVo.setMemberCode(memberCode);
		
		return paymentDao.selectBySameTime(paymentVo);
	}


	@Override
	public List<PaymentVO> selectCancelConfirm(String paydate, int memberCode) {
		PaymentVO paymentVo=new PaymentVO();
		
		//String으로 받은 paydate를 setting하기 위해 timestamp로 형변환
		Timestamp paydate2=Timestamp.valueOf(paydate);
				
		paymentVo.setPaydate(paydate2);
		paymentVo.setMemberCode(memberCode);
		
		return paymentDao.selectCancelConfirm(paymentVo);
	}

	
}
