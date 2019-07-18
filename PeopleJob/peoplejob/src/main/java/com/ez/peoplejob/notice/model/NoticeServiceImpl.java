package com.ez.peoplejob.notice.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.peoplejob.common.SearchVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDao;
	
	public int insertNotice(NoticeVO vo) {
		return noticeDao.insertNotice(vo);
	}

	@Override
	public List<Map<String, Object>> selectAll(SearchVO searchVo) {
		return noticeDao.selectAll(searchVo);
	}

	@Override
	public int selectTotalCount(SearchVO searchVo) {
		return noticeDao.selectTotalCount(searchVo);
	}

	@Override
	public int updateReadCount(int notifyCode) {
		return noticeDao.updateReadCount(notifyCode);
	}

	@Override
	public NoticeVO selectByNo(int notifyCode) {
		return noticeDao.selectByNo(notifyCode);
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		return noticeDao.updateNotice(vo);
	}

	@Override
	public int deleteNotice(String[] list) {
		int count=0;
		try {
			for(String a:list) {
				int cnt=0;
				cnt=noticeDao.deleteNotice(Integer.parseInt(a));
				count+=cnt;
			}
		}catch(RuntimeException e){
			e.printStackTrace();
		}
		return count;
	}
}
