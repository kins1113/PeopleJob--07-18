package com.ez.peoplejob.jobopening.model;

import java.util.List;


public class JobopeningListVO {
	private List<JobopeningVO> jobItems;

	public List<JobopeningVO> getJobItems() {
		return jobItems;
	}

	public void setJobItems(List<JobopeningVO> jobItems) {
		this.jobItems = jobItems;
	}

	@Override
	public String toString() {
		return "JobopeningListVO [jobItems=" + jobItems + "]";
	}
	
	

}
