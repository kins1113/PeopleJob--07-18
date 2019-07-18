package com.ez.peoplejob.board.model;

import java.sql.Timestamp;

public class BoardVO {
	private int boardCode1;
	private String firAdmin;
	private String boardname;
	private Timestamp boardregdate1;
	private Timestamp boardupdate;
	private String lastAdmin;
	private String boardOrder;
	private String usage;
	private String commentage;
	private String upage;
	private String upnumage;
	private int upsizeage;
	private int typeCode;
	
	public int getBoardCode1() {
		return boardCode1;
	}
	public void setBoardCode1(int boardCode1) {
		this.boardCode1 = boardCode1;
	}
	public String getFirAdmin() {
		return firAdmin;
	}
	public void setFirAdmin(String firAdmin) {
		this.firAdmin = firAdmin;
	}
	public String getBoardname() {
		return boardname;
	}
	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}
	public Timestamp getBoardregdate1() {
		return boardregdate1;
	}
	public void setBoardregdate1(Timestamp boardregdate1) {
		this.boardregdate1 = boardregdate1;
	}
	public Timestamp getBoardupdate() {
		return boardupdate;
	}
	public void setBoardupdate(Timestamp boardupdate) {
		this.boardupdate = boardupdate;
	}
	public String getLastAdmin() {
		return lastAdmin;
	}
	public void setLastAdmin(String lastAdmin) {
		this.lastAdmin = lastAdmin;
	}
	public String getBoardOrder() {
		return boardOrder;
	}
	public void setBoardOrder(String boardOrder) {
		this.boardOrder = boardOrder;
	}
	public String getUsage() {
		return usage;
	}
	public void setUsage(String usage) {
		this.usage = usage;
	}
	public String getCommentage() {
		return commentage;
	}
	public void setCommentage(String commentage) {
		this.commentage = commentage;
	}
	public String getUpage() {
		return upage;
	}
	public void setUpage(String upage) {
		this.upage = upage;
	}
	public String getUpnumage() {
		return upnumage;
	}
	public void setUpnumage(String upnumage) {
		this.upnumage = upnumage;
	}
	public int getUpsizeage() {
		return upsizeage;
	}
	public void setUpsizeage(int upsizeage) {
		this.upsizeage = upsizeage;
	}
	public int getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(int typeCode) {
		this.typeCode = typeCode;
	}
	@Override
	public String toString() {
		return "BoardVO [boardCode1=" + boardCode1 + ", firAdmin=" + firAdmin + ", boardname=" + boardname
				+ ", boardregdate1=" + boardregdate1 + ", boardupdate=" + boardupdate + ", lastAdmin=" + lastAdmin
				+ ", boardOrder=" + boardOrder + ", usage=" + usage + ", commentage=" + commentage + ", upage=" + upage
				+ ", upnumage=" + upnumage + ", upsizeage=" + upsizeage + ", typeCode=" + typeCode + "]";
	}



}
