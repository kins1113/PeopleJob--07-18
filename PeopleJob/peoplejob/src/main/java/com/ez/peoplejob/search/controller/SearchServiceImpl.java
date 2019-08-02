package com.ez.peoplejob.search.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.peoplejob.jobopening.model.JobopeningVO;
import com.ez.peoplejob.member.model.CompanyVO;
@Service
public class SearchServiceImpl implements SearchService {
	@Autowired
	private SearchDAO searchDao;
	@Override
	public List<JobopeningVO> searchjobopen(Map<String, Object>map) {
		return searchDao.searchjobopen(map);
	}
	@Override
	public int cntsearch(Map<String, Object> map) {
		return searchDao.cntsearch(map);
	}
	@Override
	public List<CompanyVO> searchcompany(Map<String, Object> map) {
		return searchDao.searchcompany(map);
	}
	@Override
	public int cntcompany(Map<String, Object> map) {
		return searchDao.cntcompany(map);
	}
}
