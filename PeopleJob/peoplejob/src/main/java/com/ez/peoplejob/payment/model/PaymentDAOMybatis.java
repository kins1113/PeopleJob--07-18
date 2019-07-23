package com.ez.peoplejob.payment.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.service.model.ServiceVO;

@Repository
public class PaymentDAOMybatis implements PaymentDAO{

	private String namespace="config.mybatis.mapper.oracle.payment.";
	@Autowired private SqlSessionTemplate sqlSession;

	
	@Override
	public List<Map<String, Object>> selectPaymentById(String memberid) {
		return sqlSession.selectList(namespace+"selectPaymentById",memberid);
	}
	@Override
	public int cancelPay(int paymentCode) {
		return sqlSession.update(namespace+"cancelPay",paymentCode);
	}
	@Override
	public PaymentVO selectPaymentByCode(int paymentCode) {
		return sqlSession.selectOne(namespace+"selectPaymentByCode",paymentCode);
	}
	@Override
	public List<Map<String, Object>> selectMainAdvertiseByServiceCode(int serviceCode) {
		return sqlSession.selectList(namespace+"selectMainAdvertiseByServiceCode",serviceCode);
	}
	@Override
	public int insertPayment(PaymentVO paymentVo) {
		return sqlSession.insert(namespace+"insertPayment",paymentVo);
	}
	@Override
	public int getpaymentJobCount(PaymentVO paymentVo) {
		return sqlSession.selectOne(namespace+"getpaymentJobCount",paymentVo);
	}
	@Override
	public int getCountByJobopening(int jobno) {
		return sqlSession.selectOne(namespace+"getCountByJobopening",jobno);
	}
	/*
	@Override
	public List<Map<String, Object>> selectAll(SearchVO searchVo) {
		List<Map<String, Object>>list
		=sqlSession.selectList(namespace+"selectSearch",searchVo);
		return list;
	}
	@Override
	public int selectTotalCount(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalCount",searchVo);
	}
	*/
	@Override
	public List<PaymentVO> selectAll() {
		List<PaymentVO> list
		=sqlSession.selectList(namespace+"selectPayment");
		
		return list;
	}
	
}
