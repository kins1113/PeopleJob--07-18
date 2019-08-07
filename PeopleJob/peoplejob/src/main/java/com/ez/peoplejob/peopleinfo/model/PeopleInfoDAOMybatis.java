package com.ez.peoplejob.peopleinfo.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.peoplejob.hopecompany.model.FirstOccupationVO;
import com.ez.peoplejob.hopecompany.model.LocationVO;
import com.ez.peoplejob.hopecompany.model.SecondOccupationVO;
import com.ez.peoplejob.hopecompany.model.ThirdOccupationVO;
import com.ez.peoplejob.resume.model.ResumeVO;

@Repository
public class PeopleInfoDAOMybatis implements PeopleInfoDAO {
   @Autowired
   private SqlSessionTemplate sqlSession;
   private String namespace="config.mybatis.mapper.oracle.peopleinfo.";
   @Override
   public List<ResumeVO> selectCareer(Map<String, Object> map) {
      
      return sqlSession.selectList(namespace+"selectCareer",map);
   }
   @Override
   public List<ResumeVO> selectAge(Map<String, Object> map) {
      return sqlSession.selectList(namespace+"selectAge",map);
   }
   @Override
   public List<ResumeVO> selectGraduatetype(Map<String, Object> map) {
      return sqlSession.selectList(namespace+"selectGraduatetype",map);
   }
   
   @Override
   public List<ResumeVO> selectSido(Map<String, Object> map) {
      return sqlSession.selectList(namespace+"selectSido",map);
   }
   @Override
   public List<ResumeVO> selectBtype(Map<String, Object> map) {
      return sqlSession.selectList(namespace+"selectBtype",map);
   }
   @Override
   public List<ResumeVO> selectJobtype(Map<String, Object> map) {
      return sqlSession.selectList(namespace+"selectJobtype",map);
   }
   @Override
   public int selectTotalCountCareer(Map<String, Object> map) {
      return sqlSession.selectOne(namespace+"selectTotalCountCareer",map);
   }
   @Override
   public int selectTotalCountAge(Map<String, Object> map) {
      return sqlSession.selectOne(namespace+"selectTotalCountAge",map);
   }
   @Override
   public int selectTotalCountGraduatetype(Map<String, Object> map) {
      return sqlSession.selectOne(namespace+"selectTotalCountGraduatetype",map);
   }
   @Override
   public int selectTotalCountSido(Map<String, Object> map) {
      return sqlSession.selectOne(namespace+"selectTotalCountSido",map);
   }
   @Override
   public int selectTotalCountBtype(Map<String, Object> map) {
      return sqlSession.selectOne(namespace+"selectTotalCountBtype",map);
   }
   @Override
   public int selectTotalCountJobtype(Map<String, Object> map) {
      return sqlSession.selectOne(namespace+"selectTotalCountJobtype",map);
   }
   @Override
   public List<ResumeVO> selectPeoplew(Map<String, Object> map) {
      return sqlSession.selectList(namespace+"selectPeoplew",map);
   }
   @Override
   public int selectTotalCountPeople(Map<String, Object> map) {
      return sqlSession.selectOne(namespace+"selectTotalCountPeople",map);
   }
   @Override
   public List<FirstOccupationVO> selectFirst() {
      return sqlSession.selectList(namespace+"selectFirst");
   }

   @Override
   public List<SecondOccupationVO> selectSecond(int firstCode) {
      return sqlSession.selectList(namespace+"selectSecond",firstCode);
   }

   @Override
   public List<ThirdOccupationVO> selectThird(int secondCode) {
      return sqlSession.selectList(namespace+"selectThird",secondCode);
   }

   @Override
   public List<LocationVO> selectLocation() {
      return sqlSession.selectList(namespace+"selectLocation");
   }

   @Override
   public List<Map<String, Object>> selectLocation2(int sidoCode) {
      return sqlSession.selectList(namespace+"selectLocation2",sidoCode);
   }

   @Override
   public List<Map<String, Object>> selectBtype1() {
      return sqlSession.selectList(namespace+"selectBtype1");
      }

   @Override
   public List<Map<String, Object>> selectBtype2(int btypeCode1) {
      return sqlSession.selectList(namespace+"selectBtype2",btypeCode1);
   }

   @Override
   public List<Map<String, Object>> selectBtype3(int btypeCode2) {
      return sqlSession.selectList(namespace+"selectBtype3",btypeCode2);
   }
   @Override
   public List<ResumeVO> selectResumeView(int resumeCode) {
      
      return sqlSession.selectOne(namespace+"selectResumeView",resumeCode);
   }
	
   
}