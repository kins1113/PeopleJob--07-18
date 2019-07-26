package com.ez.peoplejob.popup.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.peoplejob.common.FileUploadUtility;
import com.ez.peoplejob.popup.model.PopupService;
import com.ez.peoplejob.popup.model.PopupVO;

@Controller
@RequestMapping("/manager/popup")
public class PopupController {
	private Logger logger=LoggerFactory.getLogger(PopupController.class);
	@Autowired private PopupService popupService;
	@Autowired private FileUploadUtility fileUploadUtil;
	
	@RequestMapping("/popupList.do")
	public String popupList(Model model) {
		logger.info("팝업 리스트 화면 보여주기");
		
		List<PopupVO> list=popupService.selectPopupAll();
		
		model.addAttribute("list", list);
		logger.info("팝업 조회 결과 list.size={}",list.size());
		return "manager/popup/popupList";
	}
	@RequestMapping(value = "/popupAdd.do",method = RequestMethod.GET)
	public String popupAdd_get() {
		
		return "manager/popup/popupAdd";
	}
	
	@RequestMapping(value = "/popupAdd.do",method = RequestMethod.POST)
	public String popupAdd_post(@ModelAttribute PopupVO popupVo, HttpServletRequest request) {
		int adminCode=(Integer)request.getSession().getAttribute("adminCode");
		logger.info("팝업 등록 처리 파라미터 adminCode={} popupVo={} , ",adminCode,popupVo);
		
		List<Map<String,Object>>list=fileUploadUtil.fileUpload(request,FileUploadUtility.POPUP_UPLOAD);
		
		//파일 이름 확인후 insert 
		String imageURL="";
		for(Map<String,Object>map:list) {
			imageURL=(String)map.get("fileName");
		}
		logger.info("popup등록된 img 이름 imageURL={}",imageURL);
		popupVo.setPopupImg(imageURL);
		popupVo.setAdminCode(adminCode);
		logger.info("insert 전  popupVo={} ",popupVo);
		
		int re=popupService.insertPopup(popupVo);
		logger.info("insert 결과 re={} ",re);
		
		return "redirect:/manager/popup/popupList.do";
	}
	
	@RequestMapping("/updateUsage.do")
	@ResponseBody
	public int updateUsage(@RequestParam String usageCk, @RequestParam(defaultValue = "0") int popupCode) {
		logger.info("popup사용중 변경 처리 ajax 파라미터 usageCk={},  popupCode={}",usageCk,popupCode);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("usageCk",usageCk);
		map.put("popupCode", popupCode);
		
		int count=popupService.updateUsage(map);
		logger.info("사용여부 변경 결과 count ={}",count);
		
		int result=0;
		if(count>0) {
			result=PopupService.USAGE_USA;
		}
		
		return result;
	}
	
	@RequestMapping("/multUpdateUsage.do")
	@ResponseBody
	public int[] MUUsage(@RequestParam String[] usageCk, @RequestParam int[] popupCode, @RequestParam String NYck) {
		logger.info("여기는 들어옵니까?? 파라미터 NYck={}",NYck);
		logger.info("시작 : 여기는 들어옵니까?? usageCk[]={}, popupCode[]={}",usageCk.length,popupCode.length);
		
		Map<String,Object>map=new HashMap<String, Object>();
		map.put("usageCkArr", usageCk);
		map.put("popupCodeArr", popupCode);
		map.put("NYck",	NYck);
		
		
		int re = popupService.multUpdateUsage(map);
		logger.info("끝 : 여기는 들어옵니까??  결과 re={}",re);
		
		
		return popupCode;
	}
	
	@RequestMapping("/updateTerm.do")
	@ResponseBody
	public int updateTerm(@RequestParam String startDay, @RequestParam String endDay, 
					@RequestParam(defaultValue = "0") int popupCode) {
		logger.info("날짜 변경 처리 파라미터 startDay={}, endDay={}",startDay,endDay);
		logger.info("popupCode={}",popupCode);
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("startDay",startDay);
		map.put("endDay",endDay);
		map.put("popupCode",popupCode);
		
		int result = popupService.updateTrem(map);
		
		return result;
	}

	@RequestMapping("/popupDeleteMulti.do")
	@ResponseBody
	public int deleteMulti(@RequestParam int[] popupCodeArr, HttpServletRequest request) {
		logger.info("선택 삭제 파라미터 popupCodeArr.length={}",popupCodeArr.length);
		String[] fileNames=new String[popupCodeArr.length];
		for(int i=0;i<popupCodeArr.length;i++) {
			logger.info("{}번째 popupCode= {}",i,popupCodeArr[i]);
			int popupCode=popupCodeArr[i];
			PopupVO popupVo=popupService.selectByPopupCode(popupCode);
			fileNames[i]=popupVo.getPopupImg();
		}
		
		int re=popupService.deleteMultiByPopupCode(popupCodeArr);
		logger.info("다중 삭제 처리결과 re={}",re);
		if(re>0) {
			//파일 삭제
			String fileName="";
			logger.info("nullpoint 나는 곳 바로 위 fileNames.length= {}",fileNames.length);
			for(int j=0 ;j< fileNames.length;j++) {
				fileName=fileNames[j];
				if(fileName!=null && !fileName.isEmpty()) {
					String path=fileUploadUtil.getUploadPath(request,FileUploadUtility.POPUP_UPLOAD);
					File delFile=new File(path,fileName);
					if(delFile.exists()) {
						boolean bool=delFile.delete();
						logger.info("파일 삭제여부 bool={}",bool);
					}
				}
			}
		}
		return re;
	}
	
	@RequestMapping("/popupDelete.do")
	@ResponseBody
	public int delete(@RequestParam(defaultValue = "0") int popupCode, HttpServletRequest request) {
		logger.info("팝업 하나 삭제 파라미터 popupCode={}",popupCode);
		PopupVO popupVo=popupService.selectByPopupCode(popupCode);
		int re=popupService.deleteByPopupCode(popupCode);
		
		logger.info("팝업 삭제 결과 re={}",re);
		
		if(re>0) {
			//파일 삭제
			String fileName=popupVo.getPopupImg();
			if(fileName!=null && !fileName.isEmpty()) {
				String path=fileUploadUtil.getUploadPath(request,FileUploadUtility.POPUP_UPLOAD);
				File delFile=new File(path,fileName);
				if(delFile.exists()) {
					boolean bool=delFile.delete();
					logger.info("파일 삭제여부 bool={}",bool);
				}
			}
		}
		return re;
	}
	
	@RequestMapping(value = "/popupEdit.do",method = RequestMethod.GET)
	public String popupEdit(@RequestParam(defaultValue = "0")int popupCode,
			HttpServletRequest request,
			Model model) {
		logger.info("팜업 수정 화면 보여주 파라미터 popupCode={}",popupCode);
		PopupVO popupVo=popupService.selectByPopupCode(popupCode);
		
		model.addAttribute("popupVo",popupVo);
		
		return "manager/popup/popupAdd";
	}
	
	@RequestMapping(value = "/popupEdit.do", method = RequestMethod.POST)
	public String popupEdit_post(@ModelAttribute PopupVO popupVo, HttpServletRequest request) {
		logger.info("popup수정 처리 파라미터 popupVo={}",popupVo);
		String oldFileName="";
		if(popupVo.getPopupImg()!=null && !popupVo.getPopupImg().isEmpty()) {
			oldFileName=popupVo.getPopupImg();
		}
		List<Map<String,Object>>list=fileUploadUtil.fileUpload(request,FileUploadUtility.POPUP_UPLOAD);
		//파일 이름 확인후 insert 
		String imageURL="";
		for(Map<String,Object>map:list) {
			imageURL=(String)map.get("fileName");
		}
		
		
		logger.info("popup등록된 img 이름 imageURL={}",imageURL);
		popupVo.setPopupImg(imageURL);
		
		
		
		//업로드 처리
		int re=popupService.updatePopup(popupVo);
		if (re>0) {
			//새로 업로드한 경우, 기존 파일이 있으면 기존 파일은 삭제
			if(imageURL!=null && !imageURL.isEmpty()) {
				if(oldFileName != null && !oldFileName.isEmpty()) {
					String path=fileUploadUtil.getUploadPath(request,FileUploadUtility.POPUP_UPLOAD);
					File oldFile=new File(path, oldFileName);
					oldFile.delete();
				}
			}
		}
		
		return "redirect:/manager/popup/popupList.do";
	}
	
	@RequestMapping("/popupOpen.do")
	public String popupOpne(@RequestParam String popupImg) {
		logger.info("팝업창 띄우기");
		
		return "inc/popupFrame";
	}
	
	@RequestMapping("/popupOpenList.do")
	@ResponseBody
	public List<PopupVO> popupOpneList(){
		logger.info("ajax - 팝업 여는 리스트 ");
		
		List<PopupVO>list=popupService.selectUsageY();
		logger.info("ajax - 팝업 여는 리스트  결과 list.size={}",list.size());
		return list;
	}
	
	
	@RequestMapping("/testUpdate.do")
	@ResponseBody
	public int testpopup(@RequestParam String abc) {
		logger.info("test.do들어옴 파라미터 abc ={} ",abc);
		
		return 1000000;
	}
}
