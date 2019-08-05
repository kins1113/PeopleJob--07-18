package com.ez.peoplejob.jobopening.model;

import java.util.List;
import java.util.Map;

public interface JobopeningManagerDAO {
	List<Map<String, Object>>selectJobopeningManager(Map<String, Object>map);
	int getTotalCountJobopeningManager(Map<String, Object>map);
}
