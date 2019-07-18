package com.ez.peoplejob.manager.model;

import java.util.List;
import java.util.Map;

public interface ManagerDAO {
	public ManagerVO selectPwdById(String adminid);
	public List<ManagerVO> selectManagerAll();
	public int insertManager(ManagerVO managerVo);
	public int delectManager(int adminCode);
	public String selectAuthorityById(String adminid);
	public int selectIdChk(String adminid);
	public ManagerVO selectByCode(int adminCode);
	public int updateManager(ManagerVO managerVo);
	public int selectCheckPwd(Map<String, String> map);
}
