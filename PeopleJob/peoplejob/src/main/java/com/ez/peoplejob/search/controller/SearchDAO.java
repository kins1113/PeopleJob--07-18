package com.ez.peoplejob.search.controller;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.jobopening.model.JobopeningVO;
import com.ez.peoplejob.member.model.CompanyVO;

public interface SearchDAO {
	List<JobopeningVO> searchjobopen(Map<String, Object>map);
	int cntsearch(Map<String,Object>map);
	List<CompanyVO> searchcompany(Map<String, Object>map);
	int cntcompany(Map<String,Object>map);
}
