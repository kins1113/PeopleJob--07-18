package com.ez.peoplejob.post_cmt.model;

import java.sql.Timestamp;

public class PostCmtVO {
	private int commentCode;
	private Timestamp boardDate;
	private int arrayno;
	private int stepno;
	private String deletechekc;
	private int memberCode;
	private int tboardCode2;
	private int groupno;
	public int getCommentCode() {
		return commentCode;
	}
	public void setCommentCode(int commentCode) {
		this.commentCode = commentCode;
	}
	public Timestamp getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Timestamp boardDate) {
		this.boardDate = boardDate;
	}
	public int getArrayno() {
		return arrayno;
	}
	public void setArrayno(int arrayno) {
		this.arrayno = arrayno;
	}
	public int getStepno() {
		return stepno;
	}
	public void setStepno(int stepno) {
		this.stepno = stepno;
	}
	public String getDeletechekc() {
		return deletechekc;
	}
	public void setDeletechekc(String deletechekc) {
		this.deletechekc = deletechekc;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public int getTboardCode2() {
		return tboardCode2;
	}
	public void setTboardCode2(int tboardCode2) {
		this.tboardCode2 = tboardCode2;
	}
	public int getGroupno() {
		return groupno;
	}
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}
	@Override
	public String toString() {
		return "Post_cmtVO [commentCode=" + commentCode + ", boardDate=" + boardDate + ", arrayno=" + arrayno
				+ ", stepno=" + stepno + ", deletechekc=" + deletechekc + ", memberCode=" + memberCode
				+ ", tboardCode2=" + tboardCode2 + ", groupno=" + groupno + "]";
	}
	
	
}
