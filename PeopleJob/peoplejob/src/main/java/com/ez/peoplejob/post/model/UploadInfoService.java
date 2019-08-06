package com.ez.peoplejob.post.model;

import java.util.List;

public interface UploadInfoService {

	public int fileUpload(UploadInfoVO uploadInfoVo);
	public List<UploadInfoVO> uploadInfoSelectByBoardCode2(int boardCode2);
	
	int updatedowncount(String fileName);
	int deleteupload(int uploadCode);
	int deletePostByName(String fileName);
}
