package com.ez.peoplejob.scrap.model;

import java.sql.Timestamp;

public class ScrapVO {
	private int scrapCode;
	private Timestamp scrapdate;
	private int scrapmemberCode;
	private int jobopeningCode;
	private int resumeCode;
	public int getScrapCode() {
		return scrapCode;
	}
	public void setScrapCode(int scrapCode) {
		this.scrapCode = scrapCode;
	}
	public Timestamp getScrapdate() {
		return scrapdate;
	}
	public void setScrapdate(Timestamp scrapdate) {
		this.scrapdate = scrapdate;
	}
	public int getScrapmemberCode() {
		return scrapmemberCode;
	}
	public void setScrapmemberCode(int scrapmemberCode) {
		this.scrapmemberCode = scrapmemberCode;
	}
	public int getJobopeningCode() {
		return jobopeningCode;
	}
	public void setJobopeningCode(int jobopeningCode) {
		this.jobopeningCode = jobopeningCode;
	}
	public int getResumeCode() {
		return resumeCode;
	}
	public void setResumeCode(int resumeCode) {
		this.resumeCode = resumeCode;
	}
	@Override
	public String toString() {
		return "ScrapVO [scrapCode=" + scrapCode + ", scrapdate=" + scrapdate + ", scrapmemberCode=" + scrapmemberCode
				+ ", jobopeningCode=" + jobopeningCode + ", resumeCode=" + resumeCode + "]";
	}
	
	
	

}
