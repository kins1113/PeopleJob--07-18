package com.ez.peoplejob.post.model;

import java.util.List;

public interface UploadInfoDAO {
	
	public int fileUpload(UploadInfoVO uploadInfoVo);
	public List<UploadInfoVO> uploadInfoSelectByBoardCode2(int boardCode2);
}
