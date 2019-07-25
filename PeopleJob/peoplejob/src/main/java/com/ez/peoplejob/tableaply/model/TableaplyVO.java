package com.ez.peoplejob.tableaply.model;

import java.sql.Timestamp;

import com.ez.peoplejob.common.SearchVO;

public class TableaplyVO extends SearchVO{
	private int applyCode ;
	private Timestamp applydate;
	private String applylist;
	private String applycondition;
	private String opencheck;
	private int memberCode;
	private int jobopening;
	private int resumeCode;

	
	
	
	

	public int getApplyCode() {
		return applyCode;
	}
	public void setApplyCode(int applyCode) {
		this.applyCode = applyCode;
	}
	public Timestamp getApplydate() {
		return applydate;
	}
	public void setApplydate(Timestamp applydate) {
		this.applydate = applydate;
	}
	public String getApplylist() {
		return applylist;
	}
	public void setApplylist(String applylist) {
		this.applylist = applylist;
	}
	public String getApplycondition() {
		return applycondition;
	}
	public void setApplycondition(String applycondition) {
		this.applycondition = applycondition;
	}
	public String getOpencheck() {
		return opencheck;
	}
	public void setOpencheck(String opencheck) {
		this.opencheck = opencheck;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public int getJobopening() {
		return jobopening;
	}
	public void setJobopening(int jobopening) {
		this.jobopening = jobopening;
	}

	public int getResumeCode() {
		return resumeCode;
	}
	public void setResumeCode(int resumeCode) {
		this.resumeCode = resumeCode;
	}

	@Override
	public String toString() {
		return "TableaplyVO [applyCode=" + applyCode + ", applydate=" + applydate + ", applylist=" + applylist

				+ ", applycondition=" + applycondition + ", opencheck=" + opencheck + ", memberCode=" + memberCode
				+ ", jobopening=" + jobopening + ", resumeCode=" + resumeCode + "]";
	}
	
	
	
}
