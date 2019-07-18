package com.ez.peoplejob.scrap.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.jobopening.model.JobopeningVO;

public interface ScrapService {
	int insertScrap(ScrapVO vo);
	List<ScrapVO> selectScrap(int member_code);
	List<JobopeningVO>selectScrapJobOpen(Map<String, Object>map);
	int selectTotalCount(Map<String,Object>map);
	int deleteScrap(Map<String,Object> map);
}
