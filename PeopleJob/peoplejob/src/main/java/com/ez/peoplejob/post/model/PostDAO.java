package com.ez.peoplejob.post.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.common.SearchVO;
import com.ez.peoplejob.post_cmt.model.PostCmtVO;

public interface PostDAO {
	
	List<Map<String, Object>> selectPostAll(PostVO postVO);
	int gettotalRecord(PostVO postVO);
	int updateDelete(Map<String, int[]> map);
	int changeDelete(Map<String, Object> map);
	int insertPosToManager(PostVO postVo);
	
	List<Map<String, Object>> selectByboardCode(int boardCode);
	List<Map<String, Object>> selectByboardCode2(int boardCode2);
	int postcountUpdate(int boardCode2);
	int insertPost(PostVO postVo);
	int selectTotalCount(SearchVO searchVo);
	List<Map<String, Object>> selectAll(SearchVO searchVo);
	int updatereport(PostVO postVo);
	
	//댓글
	int insertcmt(PostCmtVO postcmtVo);
	List<Map<String, Object>> selectCmt(int boardCode2);
}
