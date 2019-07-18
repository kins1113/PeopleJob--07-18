package com.ez.peoplejob.scrap.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.peoplejob.jobopening.model.JobopeningVO;

@Service
public class ScrapServiceImpl implements ScrapService{
	@Autowired ScrapDAO scrapDao;

	@Override
	public int insertScrap(ScrapVO vo) {
		return scrapDao.insertScrap(vo);
	}
	@Override
	public List<ScrapVO> selectScrap(int member_code) {
		return scrapDao.selectScrap(member_code);
	}
	@Override
	public List<JobopeningVO> selectScrapJobOpen(Map<String, Object> map) {
		return scrapDao.selectScrapJobOpen(map);
	}
	@Override
	public int selectTotalCount(Map<String, Object> map) {
		return scrapDao.selectTotalCount(map);
	}
	@Override
	public int deleteScrap(Map<String, Object> map) {
		return scrapDao.deleteScrap(map);
	}
	
}
