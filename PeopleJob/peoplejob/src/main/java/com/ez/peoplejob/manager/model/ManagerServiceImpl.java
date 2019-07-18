package com.ez.peoplejob.manager.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService{
	

	private Logger logger = LoggerFactory.getLogger(ManagerServiceImpl.class);
	@Autowired
	private ManagerDAO managerDao;
	
	public ManagerVO selectPwdById(String adminid) {
		return managerDao.selectPwdById(adminid);
	}
	
	//아이디를 가지고 페스워드 체크하는 메서드 - 옥환
	public int selectPwdById(String adminid,String adminpwd) {
		ManagerVO managerVo=managerDao.selectPwdById(adminid);
		int result=0;
		logger.info("ManagerServiceImpl에서  dbPwd={} adminpwd={}",managerVo.getAdminpwd(),adminpwd);
		String dbPwd=managerVo.getAdminpwd();
		if(dbPwd!=null && !dbPwd.isEmpty()){
		//비밀번호가 있을때   
			if(dbPwd.equals(adminpwd)) {
			//비밀번호 가 맞을때
				result=LOGIN_OK;
			}else{
			//비밀번호가 틀릴때
				result=LOGIN_PWD_NOT;
			}
		}else {
			// - 아이디가 없다
			result=LOGIN_ID_NOT;
		}
		//if
		logger.info("ManagerServiceImpl에서 로그인 체크 결과 result={}",result);
		
		return result;
	}
	
	public List<ManagerVO> selectManagerAll(){
		return managerDao.selectManagerAll();
	}
	public int insertManager(ManagerVO managerVo) {
		return managerDao.insertManager(managerVo);
	}
	public int delectManager(int adminCode) {
		return managerDao.delectManager(adminCode);
	}
	public boolean isAuthority(String adminid) {
		//GM이 맞으면 true 틀리면 false
		String authority=managerDao.selectAuthorityById(adminid);
		logger.info("메니저 서비스에 isAuthority메서드 adminid={} ,authority={}",adminid,authority);
		boolean isAuthority=false;
		if(AUTHORITY_GM.equals(authority)) {
			isAuthority = true;
		}else if(AUTHORITY_ADMIN.equals(authority) || AUTHORITY_MASTER.equals(authority)){
			isAuthority = false;
		}
		return isAuthority;
	}

	@Override
	public int selectIdChk(String adminid) {
		return managerDao.selectIdChk(adminid);
	}

	@Override
	public ManagerVO selectByCode(int adminCode) {
		return managerDao.selectByCode(adminCode);
	}

	@Override
	public int updateManager(ManagerVO managerVo) {
		return managerDao.updateManager(managerVo);
	}
	@Override
	public int selectCheckPwd(Map<String, String> map) {
		return managerDao.selectCheckPwd(map);
	}
	
}
