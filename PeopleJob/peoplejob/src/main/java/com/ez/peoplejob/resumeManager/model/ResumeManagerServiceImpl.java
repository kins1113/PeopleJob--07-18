package com.ez.peoplejob.resumeManager.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.peoplejob.hopecompany.model.HopeWorkingConditionsVO;
import com.ez.peoplejob.resume.model.CareerVO;
import com.ez.peoplejob.resume.model.CertificateVO;
import com.ez.peoplejob.resume.model.EducationVO;
import com.ez.peoplejob.resume.model.LangCertificationVO;
import com.ez.peoplejob.resume.model.ResumeManagerVO;

@Service
public class ResumeManagerServiceImpl implements ResumeManagerService{
	
	@Autowired ResumeManagerDAO resumeManagerDao;
	private Logger logger=LoggerFactory.getLogger(ResumeManagerServiceImpl.class);
	@Override
	@Transactional
	public int insertResumeMN(HopeWorkingConditionsVO hopeVo, CertificateVO ceritificateVo, EducationVO educationVo,
			LangCertificationVO langVo, CareerVO careerVo, ResumeManagerVO resumeVo){
		logger.info("서비스인대 여기는 들어옴????");
		//hope_working 희망근무 insert 필수 
		
		int hopeRe=resumeManagerDao.insertHopeWorkingMN(hopeVo);
		resumeVo.setDesiredWorkCode(hopeVo.getHopworkCode());
		
		int checkRe=0;
		//certificate 자격증 insert 선택
		if(ceritificateVo!=null) {
			checkRe=resumeManagerDao.insertCertificateMN(ceritificateVo);
			resumeVo.setLicenceCode(ceritificateVo.getlNo());
			logger.info("서비스에 자격증 checkRe={}",checkRe);
			checkRe=0;
		}
		
		//ducation 학력 insert 선택
		if(educationVo!=null) {
			if(educationVo.getMajor()==null) educationVo.setMajor("N");
			if(educationVo.getDegree()==null) educationVo.setDegree("N");
			if(educationVo.getGraduateCheck()==null) educationVo.setGraduateCheck("N");
			if(educationVo.getGraduate2()==null) educationVo.setGraduate2("N");
			if(educationVo.getGraduatetype()==null) educationVo.setGraduatetype("N");
			checkRe=resumeManagerDao.insertEducationMN(educationVo);
			resumeVo.setAcademicCode(educationVo.getAcademicCode());
			logger.info("서비스에 학력 checkRe={}",checkRe);
			checkRe=0;
		}
		
		//langcertification 언어 선택
		if(langVo!=null) {
			if(langVo.getLanglicensename()!=null) { //이름이 있을때만 처리
			checkRe=resumeManagerDao.insertLangcertificationMN(langVo);
			resumeVo.setLanglicenceCode(langVo.getLanglicenseCode());
			checkRe=0;
			}
			logger.info("서비스에 언어 checkRe={}",checkRe);
		}
		
		//career 경력  insert 선택
		if("경력".equals(careerVo.getWorkcheck())) {
			checkRe=resumeManagerDao.insertCareerMN(careerVo);
			resumeVo.setDvCode(careerVo.getDvCode());
			logger.info("서비스에 경력 checkRe={}",checkRe);
			checkRe=0;
		}
		if(resumeVo.getPicture()==null) resumeVo.setPicture("");
		
		//resume insert
		logger.info("resume테이블 insert 전 resumeVo={}",resumeVo);
		resumeManagerDao.insertResumeMN(resumeVo);
		
		return 500;
	}


}
