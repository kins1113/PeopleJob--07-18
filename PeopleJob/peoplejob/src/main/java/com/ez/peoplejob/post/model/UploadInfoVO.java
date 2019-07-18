package com.ez.peoplejob.post.model;

public class UploadInfoVO {
	private int uploadCode;      
	private String fileName;         
	private double fileSize;         
	private int downcount;      
	private String originalFileName; 
	private int boardCode2;
	public int getUploadCode() {
		return uploadCode;
	}
	public void setUploadCode(int uploadCode) {
		this.uploadCode = uploadCode;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public double getFileSize() {
		return fileSize;
	}
	public void setFileSize(double fileSize) {
		this.fileSize = fileSize;
	}
	public int getDowncount() {
		return downcount;
	}
	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public int getBoardCode2() {
		return boardCode2;
	}
	public void setBoardCode2(int boardCode2) {
		this.boardCode2 = boardCode2;
	}
	@Override
	public String toString() {
		return "UploadInfoVO [uploadCode=" + uploadCode + ", fileName=" + fileName + ", fileSize=" + fileSize
				+ ", downcount=" + downcount + ", originalFileName=" + originalFileName + ", boardCode2=" + boardCode2
				+ "]";
	}
	
	
	
	
	
}
