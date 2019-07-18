package com.ez.peoplejob.board.model;

import java.sql.Timestamp;

public class BoardKindVO {
	private int typeCode; // 종류 코드
	private String type;	//종류
	private String usage; 
	private Timestamp regdate;
	
	public int getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(int typeCode) {
		this.typeCode = typeCode;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUsage() {
		return usage;
	}
	public void setUsage(String usage) {
		this.usage = usage;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "BoardKindVO [typeCode=" + typeCode + ", type=" + type + ", usage=" + usage + ", regdate=" + regdate
				+ "]";
	} 
	
	
}
