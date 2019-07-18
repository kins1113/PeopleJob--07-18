package com.ez.peoplejob.notice.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.common.SearchVO;

public interface NoticeDAO {
	public int insertNotice(NoticeVO vo);
	public List<Map<String, Object>> selectAll(SearchVO searchVo);
	int selectTotalCount(SearchVO searchVo);
	public int updateReadCount(int notifyCode);
	public NoticeVO selectByNo(int notifyCode);
	public int updateNotice(NoticeVO vo);
	public int deleteNotice(int notifyCode);
}
