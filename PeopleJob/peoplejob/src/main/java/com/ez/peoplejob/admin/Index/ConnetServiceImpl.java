package com.ez.peoplejob.admin.Index;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConnetServiceImpl implements ConnetService{

	@Autowired 
	private ConnetDAO connetDao;
	private Logger logger=LoggerFactory.getLogger(ConnetServiceImpl.class);
	
	//회원 통계 가져오기위함
	public static final int MEMBER_ALL=0;
	public static final int MEMBER_WITHDRAW=1;
	public static final int MEMBER_GEN=2;
	public static final int MEMBER_WITHDRAW_GEN=3;
	public static final int MEMBER_COM=4;
	public static final int MEMBER_WITHDRAW_COM=5;
	public static final int MEMBER_JOIN_GEN=6;
	public static final int MEMBER_JOIN_COM=7;
	@Override
	public int insertConnet(int memberCode) {
		return connetDao.insertConnet(memberCode);
	}

	@Override
	public List<ConnetVO> selectConnet() {
		List<ConnetVO> list =new ArrayList<ConnetVO>();
		
		Calendar c1 = new GregorianCalendar();
		for(int i=0;i<14;i++) {
			if(i!=0) {
				c1.add(Calendar.DATE, -1); // 오늘날짜로부터 -1
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 포맷 
			
			String d = sdf.format(c1.getTime()); // String으로 저장
			ConnetVO vo=connetDao.selectConnet(d);
			
			SimpleDateFormat voSdf=new SimpleDateFormat("MM/dd");
			if(vo!=null) {
				vo.setConnetDay(fometDay(vo.getConnetDay()));
				list.add(vo);
			}else {
				ConnetVO cVo=new ConnetVO();
				cVo.setConnetDay(fometDay(d));
				cVo.setCount(0);
				logger.info("fometDay(d)={}\n cVo={}",fometDay(d),cVo);
				list.add(cVo);
			}
			logger.info("서비스에서 접속 현황 조회결과 list.size={}",list.size());
			
		}
		return list;
	}
	
	public String fometDay(String day) {
		String fDay=day.substring(5,7)+"/"+day.substring(8,10);
		logger.info("메소드에서 포멧 완료된 값 fDay={}",fDay);
		return fDay;
	}
/*
 * 	public static final int MEMBER_ALL=0;
	public static final int MEMBER_WITHDRAW=1;
	public static final int MEMBER_GEN=2;
	public static final int MEMBER_WITHDRAW_GEN=3;
	public static final int MEMBER_COM=4;
	public static final int MEMBER_WITHDRAW_COM=5;
	public static final int MEMBER_JOIN_GEN=6;
	public static final int MEMBER_JOIN_COM=7;
 * */
	@Override
	public int[] selectMemberCount() {
		int[] result=new int[8];
		//type today 값 넣어서 넘겨주기
		for(int i=0;i<=7;i++) {
		Map<String, Object>map =new HashMap<String, Object>();
			if(i==1 || i==2 || i==4) {
				map.put("type", i);
				result[i]=connetDao.selectMemberCount(map);
			}else {
				map.put("type", i);
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				String today=sdf.format(new Date());
				map.put("today", today);
				result[i]=connetDao.selectMemberCount(map);
			}
		}
		return result;
	}
	
}
