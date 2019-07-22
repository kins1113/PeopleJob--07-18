package com.ez.peoplejob.tableaply.model;

import java.sql.Timestamp;

import com.ez.peoplejob.common.SearchVO;

public class TableaplyVO extends SearchVO{
	private int applyCode ;
	private Timestamp applydate;
	private String applylist;
	private String applycondition;
	private String oepncheck;
	private int memberCode;
	private int jobopening;
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
	public String getOepncheck() {
		return oepncheck;
	}
	public void setOepncheck(String oepncheck) {
		this.oepncheck = oepncheck;
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
	@Override
	public String toString() {
		return "TableaplyVO [applyCode=" + applyCode + ", applydate=" + applydate + ", applylist=" + applylist
				+ ", applycondition=" + applycondition + ", oepncheck=" + oepncheck + ", memberCode=" + memberCode
				+ ", jobopening=" + jobopening + "]";
	}
	
	
	
}
