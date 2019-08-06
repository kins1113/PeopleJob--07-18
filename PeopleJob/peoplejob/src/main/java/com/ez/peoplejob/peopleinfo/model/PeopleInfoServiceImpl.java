package com.ez.peoplejob.peopleinfo.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.peoplejob.hopecompany.model.FirstOccupationVO;
import com.ez.peoplejob.hopecompany.model.LocationVO;
import com.ez.peoplejob.hopecompany.model.SecondOccupationVO;
import com.ez.peoplejob.hopecompany.model.ThirdOccupationVO;
import com.ez.peoplejob.resume.model.ResumeVO;

@Service
public class PeopleInfoServiceImpl implements PeopleInfoService {
   
   @Autowired
   private PeopleInfoDAO peopleinfoDao;
   @Override
   public List<ResumeVO> selectCareer(Map<String, Object> map) {
      
      return peopleinfoDao.selectCareer(map);
   }

   @Override
   public List<ResumeVO> selectAge(Map<String, Object> map) {
      return peopleinfoDao.selectAge(map);
   }

   @Override
   public List<ResumeVO> selectGraduatetype(Map<String, Object> map) {
      return peopleinfoDao.selectGraduatetype(map);
   }

   @Override
   public List<ResumeVO> selectSido(Map<String, Object> map) {
      return peopleinfoDao.selectSido(map);
   }

   @Override
   public List<ResumeVO> selectBtype(Map<String, Object> map) {
      return peopleinfoDao.selectBtype(map);
   }

   @Override
   public List<ResumeVO> selectJobtype(Map<String, Object> map) {
      return peopleinfoDao.selectJobtype(map);
   }

   @Override
   public int selectTotalCountCareer(Map<String, Object> map) {
      return peopleinfoDao.selectTotalCountCareer(map);
   }

   @Override
   public int selectTotalCountAge(Map<String, Object> map) {
      return peopleinfoDao.selectTotalCountAge(map);
   }

   @Override
   public int selectTotalCountGraduatetype(Map<String, Object> map) {
      return peopleinfoDao.selectTotalCountGraduatetype(map);
   }

   @Override
   public int selectTotalCountSido(Map<String, Object> map) {
      return peopleinfoDao.selectTotalCountSido(map);
   }

   @Override
   public int selectTotalCountBtype(Map<String, Object> map) {
      return peopleinfoDao.selectTotalCountBtype(map);
   }

   @Override
   public int selectTotalCountJobtype(Map<String, Object> map) {
      return peopleinfoDao.selectTotalCountJobtype(map);
   }

   @Override
   public List<ResumeVO> selectPeoplew(Map<String, Object> map) {
      return peopleinfoDao.selectPeoplew(map);
   }

   @Override
   public int selectTotalCountPeople(Map<String, Object> map) {
      return peopleinfoDao.selectTotalCountPeople(map);
   }

   
   @Override
   public List<FirstOccupationVO> selectFirst() {
      return peopleinfoDao.selectFirst();
   }

   @Override
   public List<SecondOccupationVO> selectSecond(int firstCode) {
      return peopleinfoDao.selectSecond(firstCode);
   }

   @Override
   public List<ThirdOccupationVO> selectThird(int secondCode) {
      return peopleinfoDao.selectThird(secondCode);
   }

   @Override
   public List<LocationVO> selectLocation() {
      return peopleinfoDao.selectLocation();
   }

   @Override
   public List<Map<String, Object>> selectLocation2(int sidoCode) {
      return peopleinfoDao.selectLocation2(sidoCode);
   }

   @Override
   public List<Map<String, Object>> selectBtype1() {
      return peopleinfoDao.selectBtype1();
   }

   @Override
   public List<Map<String, Object>> selectBtype2(int btypeCode1) {
      return peopleinfoDao.selectBtype2(btypeCode1);
   }

   @Override
   public List<Map<String, Object>> selectBtype3(int btypeCode2) {
      return peopleinfoDao.selectBtype3(btypeCode2);
   }

   @Override
   public List<ResumeVO> selectResumeView(int resumeCode) {
      return peopleinfoDao.selectResumeView(resumeCode);
   }
}