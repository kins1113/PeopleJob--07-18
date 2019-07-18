package com.ez.peoplejob.service.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceServiceImpl implements ServiceService  {
	@Autowired
	private ServiceDAO serviceDao;
	@Override
	public int insertService(ServiceVO vo) {
		return serviceDao.insertService(vo);
	}
	
}
