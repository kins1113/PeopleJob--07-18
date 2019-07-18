package com.ez.peoplejob.notice.model;

import java.sql.Clob;
import java.sql.Timestamp;

public class NoticeCmt2VO {
	private int commentCode;
	private int memberCode;
	private int notifyCode;
	private Clob comcontent;
	private Timestamp comregdate;
	
	
	public int getCommentCode() {
		return commentCode;
	}
	public void setCommentCode(int commentCode) {
		this.commentCode = commentCode;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public int getNotifyCode() {
		return notifyCode;
	}
	public void setNotifyCode(int notifyCode) {
		this.notifyCode = notifyCode;
	}
	public Clob getComcontent() {
		return comcontent;
	}
	public void setComcontent(Clob comcontent) {
		this.comcontent = comcontent;
	}
	public Timestamp getComregdate() {
		return comregdate;
	}
	public void setComregdate(Timestamp comregdate) {
		this.comregdate = comregdate;
	}
	@Override
	public String toString() {
		return "NoticeCmt2VO [commentCode=" + commentCode + ", memberCode=" + memberCode + ", notifyCode=" + notifyCode
				+ ", comcontent=" + comcontent + ", comregdate=" + comregdate + "]";
	}
	
	

}
