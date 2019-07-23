package com.ez.peoplejob.popup.model;

import java.sql.Timestamp;

public class PopupVO {

	private int adminCode;         //등록 관리자
	private String popupName;	//팝업 이름
	private String popupImg;	//팝업 이미지
	private int width;		//팝어창 가로사이즈
	private int height;		//팝업창 세로사이즈
	private int left;	   //왼쪽위치
	private int top;		   //세로위치
	private Timestamp regdate;		//등록일
	private String usage;		//사용여부
	private int popupCode;	//팝업 코드
	private String startDay;	//시작날짜
	private String endDay;		//끝나는 날짜
	
	
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public int getAdminCode() {
		return adminCode;
	}
	public void setAdminCode(int adminCode) {
		this.adminCode = adminCode;
	}
	public String getPopupName() {
		return popupName;
	}
	public void setPopupName(String popupName) {
		this.popupName = popupName;
	}
	public String getPopupImg() {
		return popupImg;
	}
	public void setPopupImg(String popupImg) {
		this.popupImg = popupImg;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getLeft() {
		return left;
	}
	public void setLeft(int left) {
		this.left = left;
	}
	public int getTop() {
		return top;
	}
	public void setTop(int top) {
		this.top = top;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getUsage() {
		return usage;
	}
	public void setUsage(String usage) {
		this.usage = usage;
	}
	public int getPopupCode() {
		return popupCode;
	}
	public void setPopupCode(int popupCode) {
		this.popupCode = popupCode;
	}
	@Override
	public String toString() {
		return "PopupVO [adminCode=" + adminCode + ", popupName=" + popupName + ", popupImg=" + popupImg + ", width="
				+ width + ", height=" + height + ", left=" + left + ", top=" + top + ", regdate=" + regdate + ", usage="
				+ usage + ", popupCode=" + popupCode + ", startDay=" + startDay + ", endDay=" + endDay + "]";
	}
	
}

