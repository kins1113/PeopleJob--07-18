package com.ez.peoplejob.notice.model;

import java.sql.Timestamp;

public class NoticeVO {

	private int notifyCode;
	private String notifytitle; 
	private String notifycontent;
	private Timestamp notifydate;
	private int adminCode;
	private int readcount;
	
	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

		//24시간 이내의 글인 경우 image표시하기 위해 사용
		private double newImgTerm;

		public int getNotifyCode() {
			return notifyCode;
		}

		public void setNotifyCode(int notifyCode) {
			this.notifyCode = notifyCode;
		}

		public String getNotifytitle() {
			return notifytitle;
		}

		public void setNotifytitle(String notifytitle) {
			this.notifytitle = notifytitle;
		}

		public String getNotifycontent() {
			return notifycontent;
		}

		public void setNotifycontent(String notifycontent) {
			this.notifycontent = notifycontent;
		}

		public Timestamp getNotifydate() {
			return notifydate;
		}

		public void setNotifydate(Timestamp notifydate) {
			this.notifydate = notifydate;
		}

		public int getAdminCode() {
			return adminCode;
		}

		public void setAdminCode(int adminCode) {
			this.adminCode = adminCode;
		}

		public double getNewImgTerm() {
			return newImgTerm;
		}

		public void setNewImgTerm(double newImgTerm) {
			this.newImgTerm = newImgTerm;
		}

		@Override
		public String toString() {
			return "NoticeVO [notifyCode=" + notifyCode + ", notifytitle=" + notifytitle + ", notifycontent="
					+ notifycontent + ", notifydate=" + notifydate + ", adminCode=" + adminCode + ", readcount="
					+ readcount + ", newImgTerm=" + newImgTerm + "]";
		}
	
	
	
}
