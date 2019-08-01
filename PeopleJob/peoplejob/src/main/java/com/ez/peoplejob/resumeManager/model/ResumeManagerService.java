package com.ez.peoplejob.resumeManager.model;

import com.ez.peoplejob.hopecompany.model.HopeWorkingConditionsVO;
import com.ez.peoplejob.resume.model.CareerVO;
import com.ez.peoplejob.resume.model.CertificateVO;
import com.ez.peoplejob.resume.model.EducationVO;
import com.ez.peoplejob.resume.model.LangCertificationVO;
import com.ez.peoplejob.resume.model.ResumeManagerVO;

public interface ResumeManagerService {

	public int insertResumeMN (HopeWorkingConditionsVO hopeVo, CertificateVO ceritificateVo, EducationVO educationVo,
			LangCertificationVO langVo, CareerVO careerVo ,ResumeManagerVO resumeVo);					//이력서
}
