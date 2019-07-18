package com.ez.peoplejob.payment.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAOMybatis implements PaymentDAO{

	private String namespace="config.mybatis.mapper.oracle.payment.";
	@Autowired private SqlSessionTemplate sqlSession;
	@Override
	public int insertPayService1(PaymentVO paymentVo) {
		return sqlSession.insert(namespace+"insertPayService1",paymentVo);
	}
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
}
