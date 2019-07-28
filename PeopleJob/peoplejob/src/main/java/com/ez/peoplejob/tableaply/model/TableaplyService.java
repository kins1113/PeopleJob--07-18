package com.ez.peoplejob.tableaply.model;

import java.util.List;
import java.util.Map;

import com.ez.peoplejob.resume.model.ResumeVO;

public interface TableaplyService {
	int insertapply(TableaplyVO vo);
	List<TableaplyVO> selectapply(Map<String,Object> map);
	int selectapplyCount(Map<String,Object> map);
	int dupapply(Map<String,Object> map);
	int deleteapply(Map<String,Object>map);
	List<TableaplyVO> selectapplyComp(Map<String,Object> map);
	int selectapplyCompcount(Map<String,Object> map);
	int cntpay(int MemberCode);
	int opencheckY(Map<String,Object> map);
	int cntresume(int MemberCode);
	ResumeVO selectresumebyid(int memberCode);
	List<ResumeVO> selectresumebyid2(int memberCode);
	TableaplyVO selectresumebyid3(Map<String,Object> map);
	int applyCnt(int jobopening);
}
