package com.ez.peoplejob.post.model;

import java.util.List;
import java.util.Map;

public interface PostService {
	List<Map<String, Object>> selectPostAll(PostVO postVO);
	int gettotalRecord(PostVO postVo);
	int updateDelete(Map<String, int[]> map);
	int changeDelete(Map<String, Object> map);
}
