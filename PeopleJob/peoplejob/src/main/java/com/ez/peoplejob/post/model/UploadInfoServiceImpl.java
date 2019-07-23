package com.ez.peoplejob.post.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UploadInfoServiceImpl implements UploadInfoService{
	
	@Autowired UploadInfoDAO upInfoDao;

	@Override
	public int fileUpload(UploadInfoVO uploadInfoVo) {
		return upInfoDao.fileUpload(uploadInfoVo);
	}

	@Override
	public List<UploadInfoVO> uploadInfoSelectByBoardCode2(int boardCode2) {
		return upInfoDao.uploadInfoSelectByBoardCode2(boardCode2);
	}
	
	
}
