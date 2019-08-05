package com.ez.peoplejob.jobopening.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JobopeningManagerServiceImpl implements JobopeningManagerService{
	@Autowired
	private JobopeningManagerDAO jobManagerDao;
	private Logger logger=LoggerFactory.getLogger(JobopeningManagerServiceImpl.class);
	
	@Override
	public List<Map<String, Object>> selectJobopeningManager(Map<String, Object> map) {
		logger.info("\n\n\n여기는 채용공고 검색하는 서비스입니다.");
		
		JobopeningVO vo=(JobopeningVO) map.get("jobopeningVO");
		String[] ageLimitArr=null,careerArr=null,academiArr=null;
		if(vo.getAgelimit()!=null) {
			if(vo.getAgelimit().indexOf(",")>0) {
				ageLimitArr=vo.getAgelimit().split(",");
			}
		}
		if(map.get("careerCk")!=null) {
			String c=(String) map.get("careerCk");
			if(c.indexOf(",")>0) {
				careerArr=c.split(",");
			}
			if(vo.getCareer()!=null) {
				boolean isCareer=false;
				for(int i=0;i<careerArr.length;i++) {
					logger.info("careerArr[]={}",careerArr[i]);
					
					if(careerArr[i].equals("경력")) {
						isCareer=true;
					}
				}
				if(isCareer) {
					logger.info("isCareer={}",isCareer);
				}else {
					vo.setCareer(null);	//이건 다시 처리해야함 1~3년이계속 들어옴...
				}
				map.put("isCareer", isCareer);
				logger.info("vo.getCareer={}",vo.getCareer());
			}
		}
		if(vo.getAcademicCondition()!=null) {
			logger.info("vo.getAcademicCondition().indexOf()={}",vo.getAcademicCondition().indexOf(","));
			if(vo.getAcademicCondition().indexOf(",")>0) {
				academiArr=vo.getAcademicCondition().split(",");
				for(int i=0;i<academiArr.length;i++) {
					logger.info("academiArr[]={}",academiArr[i]);
				}
			}
		}
		
		map.put("ageLimitArr",ageLimitArr);
		map.put("careerArr", careerArr);
		map.put("academiArr",academiArr);
		
		
		logger.info("detailCk={}",map.get("detailCk"));
		logger.info("searchStartDay={}",map.get("searchStartDay"));
		logger.info("searchEndDay={}",map.get("searchEndDay"));
		logger.info("searchKeyword={}",map.get("searchKeyword"));
		logger.info("searchCondition={}",map.get("searchCondition"));
		logger.info("jobopeningVO={}",map.get("jobopeningVO"));
		
		logger.info("\n\n");
		return jobManagerDao.selectJobopeningManager(map);
	}

	@Override
	public int getTotalCountJobopeningManager(Map<String, Object> map) {
		return jobManagerDao.getTotalCountJobopeningManager(map);
	}
}
