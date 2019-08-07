package com.ez.peoplejob.post.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.peoplejob.board.model.BoardVO;
import com.ez.peoplejob.post_cmt.model.PostCmtVO;

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
	@Override
	public int insertPosToManager(PostVO postVo) {
		return postDao.insertPosToManager(postVo);
	}
	@Override
	public List<Map<String, Object>> selectByboardCode(int boardCode) {
		return postDao.selectByboardCode(boardCode);
	}
	@Override
	public int postcountUpdate(int boardCode2) {
		return postDao.postcountUpdate(boardCode2);
	}
	@Override
	public List<Map<String, Object>> selectByboardCode2(int boardCode2) {
		return postDao.selectByboardCode2(boardCode2);
	}
	@Override
	public int insertPost(PostVO postVo) {
		return postDao.insertPost(postVo);
	}
	@Override
	public int insertcmt(PostCmtVO postcmtVo) {
		return postDao.insertcmt(postcmtVo);
	}
	@Override
	public List<Map<String, Object>> selectCmt(int boardCode2) {
		return postDao.selectCmt(boardCode2);
	}
	@Override
	public int selectTotalCount(PostVO postVO) {
		return postDao.selectTotalCount(postVO);
	}
	@Override
	public List<Map<String, Object>> selectAll(PostVO postVO) {
		return postDao.selectAll(postVO);
	}
	@Override
	public int updatereport(PostVO postVo) {
		return postDao.updatereport(postVo);
	}
	@Override
	public PostVO selectOneByBoardCode2(int boardCode2) {
		return postDao.selectOneByBoardCode2(boardCode2);
	}
	@Override
	public int updatePost(PostVO postVo) {
		return postDao.updatePost(postVo);
	}
	@Override
	public BoardVO selectBoardByboardCode2(int boardCode2) {
		return postDao.selectBoardByboardCode2(boardCode2);
	}
	@Override
	public int deletePost(int boardCode2) {
		return postDao.deletePost(boardCode2);
	}
	@Override
	public List<PostVO> selectPostBymemId(String memberid) {
		return postDao.selectPostBymemId(memberid);
	}

	
	
}
