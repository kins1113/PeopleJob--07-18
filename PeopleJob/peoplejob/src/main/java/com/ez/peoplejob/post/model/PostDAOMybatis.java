package com.ez.peoplejob.post.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.peoplejob.board.model.BoardVO;
import com.ez.peoplejob.post_cmt.model.PostCmtVO;

@Repository
public class PostDAOMybatis implements PostDAO{
	@Autowired
	private SqlSessionTemplate sqlsession;
	private String namespace="config.mybatis.mapper.oracle.post.";
	
	private Logger logger=LoggerFactory.getLogger(PostDAOMybatis.class);
	@Override
	public List<Map<String, Object>> selectPostAll(PostVO postVO) {
		logger.info("서비스에서 vo값 vo={}",postVO);
		return sqlsession.selectList(namespace+"selectPostAll",postVO);
	}
	@Override
	public int gettotalRecord(PostVO postVO) {
		return sqlsession.selectOne(namespace+"gettotalRecord",postVO);
	}
	@Override
	public int updateDelete(Map<String, int[]> map) {
		return sqlsession.update(namespace+"updateDelete", map);
	}
	@Override
	public int changeDelete(Map<String, Object> map) {
		return sqlsession.update(namespace+"changeDelete",map);
	}
	@Override
	public int insertPosToManager(PostVO postVo) {
		return sqlsession.insert(namespace+"insertPosToManager",postVo);
	}
	@Override
	public List<Map<String, Object>> selectByboardCode(int boardCode) {
		return sqlsession.selectList(namespace+"selectByboardCode",boardCode);
	}
	
	@Override
	public int postcountUpdate(int boardCode2) {
		return sqlsession.update(namespace+"postcountUpdate",boardCode2);
	}
	@Override
	public List<Map<String, Object>> selectByboardCode2(int boardCode2) {
		return sqlsession.selectList(namespace+"selectByboardCode2",boardCode2);
	}
	@Override
	public int insertPost(PostVO postVo) {
		return sqlsession.insert(namespace+"insertPost",postVo);
	}
	@Override
	public int insertcmt(PostCmtVO postcmtVo) {
		return sqlsession.insert(namespace+"insertcmt",postcmtVo);
	}
	@Override
	public List<Map<String, Object>> selectCmt(int boardCode2) {
		return sqlsession.selectList(namespace+"selectCmt",boardCode2);
	}
	@Override
	public int selectTotalCount(PostVO postVo) {
		return sqlsession.selectOne(namespace+"selectTotalCount",postVo);
	}
	@Override
	public List<Map<String, Object>> selectAll(PostVO postVO) {
		return sqlsession.selectList(namespace+"selectAll",postVO);
	}
	@Override
	public int updatereport(PostVO postVo) {
		return sqlsession.update(namespace+"updatereport",postVo);
	}
	@Override
	public PostVO selectOneByBoardCode2(int boardCode2) {
		return sqlsession.selectOne(namespace+"selectOneByBoardCode2",boardCode2);
	}
	@Override
	public int updatePost(PostVO postVo) {
		return sqlsession.update(namespace+"updatePost",postVo);
	}
	@Override
	public BoardVO selectBoardByboardCode2(int boardCode2) {
		return sqlsession.selectOne(namespace+"selectBoardByboardCode2",boardCode2);
	}
	@Override
	public int deletePost(int boardCode2) {
		return sqlsession.delete(namespace+"deletePost",boardCode2);
	}
	@Override
	public List<PostVO> selectPostBymemId(String memberid) {
		return sqlsession.selectList(namespace+"selectPostBymemId",memberid);
	}
	

}
