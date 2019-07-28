package com.ez.peoplejob.tableaply.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.peoplejob.resume.model.ResumeVO;

@Service
public class TableaplyServiceImpl implements TableaplyService{
	@Autowired TableaplyDAO tableaplyDao;

	@Override
	public int insertapply(TableaplyVO vo) {
		return tableaplyDao.insertapply(vo);
	}
	@Override
	public List<TableaplyVO> selectapply(Map<String,Object> map) {
		return tableaplyDao.selectapply(map);
	}
	@Override
	public int selectapplyCount(Map<String,Object> map) {
		return tableaplyDao.selectapplyCount(map);
	}
	@Override
	public int dupapply(Map<String, Object> map) {
		return tableaplyDao.dupapply(map);
	}
	@Override
	
	public int deleteapply(Map<String,Object>map) {
		return tableaplyDao.deleteapply(map);
	}
	@Override
	public List<TableaplyVO> selectapplyComp(Map<String, Object> map) {
		return tableaplyDao.selectapplyComp(map);
	}
	@Override
	public int selectapplyCompcount(Map<String, Object> map) {
		return tableaplyDao.selectapplyCompcount(map);
	}
	@Override
	public int cntpay(int MemberCode) {
		return tableaplyDao.cntpay(MemberCode);
	}
	@Override
	public int opencheckY(Map<String,Object> map) {
		return tableaplyDao.opencheckY(map);
	}
	@Override
	public int cntresume(int MemberCode) {
		return tableaplyDao.cntresume(MemberCode);
	}
	@Override
	public ResumeVO selectresumebyid(int memberCode) {
		return tableaplyDao.selectresumebyid(memberCode);
	}
	@Override
	public List<ResumeVO> selectresumebyid2(int memberCode) {
		return tableaplyDao.selectresumebyid2(memberCode);
	}
	@Override
	public TableaplyVO selectresumebyid3(Map<String, Object> map) {
		return tableaplyDao.selectresumebyid3(map);
	}
	@Override
	public int applyCnt(int jobopening) {
		return tableaplyDao.applyCnt(jobopening);
	}

}
