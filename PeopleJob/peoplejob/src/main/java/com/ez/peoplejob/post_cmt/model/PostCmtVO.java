package com.ez.peoplejob.post_cmt.model;

import java.sql.Timestamp;

public class PostCmtVO {
	private int commentCode;
	private Timestamp boardDate;
	private int arrayno;
	private int stepno;
	private String deletecheck;
	private int memberCode;
	private int boardCode2;
	private int groupno;
	
	
	//내용 추가
	private String content;
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
	
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	
	public int getGroupno() {
		return groupno;
	}
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}
	
	
	public int getBoardCode2() {
		return boardCode2;
	}
	public void setBoardCode2(int boardCode2) {
		this.boardCode2 = boardCode2;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setDeletecheck(String deletecheck) {
		this.deletecheck = deletecheck;
	}
	@Override
	public String toString() {
		return "PostCmtVO [commentCode=" + commentCode + ", boardDate=" + boardDate + ", arrayno=" + arrayno
				+ ", stepno=" + stepno + ", deletecheck=" + deletecheck + ", memberCode=" + memberCode + ", boardCode2="
				+ boardCode2 + ", groupno=" + groupno + ", content=" + content + "]";
	}
	
	
	
}
