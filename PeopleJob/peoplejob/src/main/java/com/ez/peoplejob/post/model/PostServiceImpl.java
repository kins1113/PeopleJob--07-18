package com.ez.peoplejob.post.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostServiceImpl implements PostService{

	@Autowired private PostDAO postDao;

	@Override
	public List<Map<String, Object>> selectPostAll(PostVO postVO) {
		return postDao.selectPostAll(postVO);
	}
	@Override
	public int gettotalRecord(PostVO postVo) {
		return postDao.gettotalRecord(postVo);
	}
	@Override
	public int updateDelete(Map<String, int[]> map) {
		return postDao.updateDelete(map);
	}
	@Override
	public int changeDelete(Map<String, Object> map) {
		return postDao.changeDelete(map);
	}
	
	
}
