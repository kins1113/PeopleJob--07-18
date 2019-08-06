package com.ez.peoplejob.post.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UploadInfoDAOMybatis implements UploadInfoDAO{

	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.uploadInfo.";
	
	@Override
	public int fileUpload(UploadInfoVO uploadInfoVo) {
		return sqlSession.insert(namespace+"fileUpload",uploadInfoVo);
	}

	@Override
	public List<UploadInfoVO> uploadInfoSelectByBoardCode2(int boardCode2) {
		return sqlSession.selectList(namespace+"uploadInfoSelectByBoardCode2", boardCode2);
	}

	@Override
	public int updatedowncount(String fileName) {
		return sqlSession.update(namespace+"updatedowncount",fileName);
	}

	@Override
	public int deleteupload(int uploadCode) {
		return sqlSession.delete(namespace+"deleteupload",uploadCode);
	}

	@Override
	public int deletePostByName(String fileName) {
		return sqlSession.delete(namespace+"deletePostByName",fileName);
	}

	
}
