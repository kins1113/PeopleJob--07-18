package com.ez.peoplejob.payment.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.jobopening.model.JobopeningVO;

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
	@Transactional
	public int insertPayment(List<JobopeningVO> list, int serviceCode, int memberCode) {
		int cnt=0;
		
		try {
			for(JobopeningVO vo:list) {
				if(vo.getJobopening()!=0) {
					PaymentVO paymentVo=new PaymentVO();
					paymentVo.setJobopening(vo.getJobopening());
					paymentVo.setServiceCode(serviceCode);
					paymentVo.setMemberCode(memberCode);
					
					int count=paymentDao.getpaymentJobCount(paymentVo);
					if(count>0) { //해당 채용공고가 이미 payment에 등록되어 있는 경우
						cnt=1; //이미 등록한 것으로 간주
					}else {
						cnt=paymentDao.insertPayment(paymentVo);
						
					}
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		return cnt;
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
	


	

	
}
