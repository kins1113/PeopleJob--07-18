package com.ez.peoplejob.manager.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.common.FileUploadUtility;

@Controller
@RequestMapping("/manager/email_sms")
public class ManagerEmailController {

	private Logger logger=LoggerFactory.getLogger(ManagerEmailController.class);
	@Autowired private FileUploadUtility fileUtility;
	
	@RequestMapping(value = "/emailWrite.do",method = RequestMethod.GET)
	public String emailWrite_get() {
		logger.info("이메일쓰기 화면 보여주기입니다.");
		
		return "manager/email_sms/emailWrite";
	}
	
	@RequestMapping(value = "/emailWrite.do",method = RequestMethod.POST)
	public String emailWrite_post(@RequestParam String emailAddress, 
			@RequestParam String title,
			@RequestParam String coment,
			HttpServletRequest request,
			Model model) {
		  logger.info("파라미터 title={}, coment={}",title,coment);
		  logger.info("파라미터 emailAddress={}",emailAddress);
		  logger.info("파라미터  coment={}",coment);
		  
		  //coment=coment.replace("<p>", "");
		  //coment=coment.replace("</p>", "\n");
		  //coment=coment.replace("&nbsp;", "");
		  
		  //보내는 사람 쪽의 메일 정보
		  String host     = "smtp.naver.com";
		  final String user   = "kins1113@naver.com";
		  final String password  = "kimok1277!";
		  //받는 사람 메일 주소
		  String to     =emailAddress;

		  
		  // Get the session object
		  Properties props = new Properties();
		  props.put("mail.smtp.host", host);
		  props.put("mail.smtp.auth", "true");

		  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		   protected PasswordAuthentication getPasswordAuthentication() {
			   
		    return new PasswordAuthentication(user, password);
		    
		   }
		  });

		  // Compose the message
		  try {
		   MimeMessage message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(user));
		   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		   // Subject 메일 제목
		   message.setSubject(title);
		   
		   //파일 처리 
		   
		   String fileName="";
		   List<Map<String, Object>> fileList=fileUtility.fileUpload(request);
		   if(fileList.size()>0) {
			   
		   
		   for(int i=0;i<fileList.size();i++) {
				Map<String, Object> map=fileList.get(i);
				fileName=(String) map.get("fileName");
			}
		   
		   MimeBodyPart mbp1=new MimeBodyPart();
		   mbp1.setContent(coment,"text/html; charset=utf-8");
		   
		   File file=new File(fileUtility.getUploadPath(request),fileName);
		   
		   MimeBodyPart mbp2= new MimeBodyPart();
		   FileDataSource fds=new FileDataSource(file.getAbsolutePath());
		   mbp2.setDataHandler(new DataHandler(fds));
		   mbp2.setFileName(fds.getName());
		   
		   Multipart mp = new MimeMultipart();
		   mp.addBodyPart(mbp1);
		   mp.addBodyPart(mbp2);
		   message.setContent(mp);
		   }else {
			// Text 메일 내용
			   message.setContent(coment,"text/html; charset=utf-8");
		   }
		   // send the message 메일 보내기
		   Transport.send(message);
		   /*
		   logger.info("message sent successfully...");
			*/

		  } catch (MessagingException e) {
		   e.printStackTrace();
		  }
		  
		  model.addAttribute("msg", "성공");
		  model.addAttribute("url", "/manager/email_sms/emailWrite.do");
		  
		  return "common/message";
	 }
	
	
	@RequestMapping(value = "/emailMultWrite.do",method = RequestMethod.GET)
	public String emailMultWrite_get(@RequestParam(required = false)String[] memberCk, Model model) {
		logger.info("이메일 다중 보내기 화면 보여주기입니다.");
		
		String result="";
		if(memberCk!=null && memberCk.length>0) {
			for(int i=0; i<memberCk.length;i++) {
				logger.info("{}",memberCk.length);
				if(i==memberCk.length-1) {
					result+=memberCk[i];
				}else {
					result+=memberCk[i]+",";
				}
			}
		}
		logger.info("체크된 메일주소 result={}",result);
		if(memberCk!=null && memberCk.length>0) {
			model.addAttribute("result", result);
		}
		
		return "manager/email_sms/emailMultWrite";
	}
	
	
	@RequestMapping(value = "/emailMultWrite.do",method = RequestMethod.POST)
	public String emailMultWrite_post(@RequestParam String emailAddress, 
			@RequestParam String title,
			@RequestParam String coment,
			HttpServletRequest request,
			Model model) {
		logger.info("파라미터 title={}, coment={}",title,coment);
		logger.info("파라미터 emailAddress={}",emailAddress);
		
		coment=coment.replace("<p>", "");
		coment=coment.replace("</p>", "\n");
		coment=coment.replace("&nbsp;", "");
		logger.info("파라미터 변경후  coment={}",coment);
		
		//보내는 사람 쪽의 메일 정보
		String host     = "smtp.naver.com";
		final String user   = "kins1113";
		final String password  = "kimok1277!";
		//받는 사람 메일 주소
		String to     =emailAddress;
		//스필릿한 주소 
		String[] emailList=emailAddress.split(",");
		
		
		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		// Compose the message
		try {
			//다중 처리를 위함
			InternetAddress[] addArray=new InternetAddress[emailList.length];
			for(int i=0;i<emailList.length;i++) {
				addArray[i]=new InternetAddress(emailList[i]);
			}
			
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			
			message.addRecipients(Message.RecipientType.TO, addArray);

			
			
			//message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			// Subject 메일 제목
			message.setSubject(title);
			/*
		   // Text 메일 내용
		   message.setText(coment);
			 */
			
			//파일 처리 
			
			String fileName="";
			List<Map<String, Object>> fileList=fileUtility.fileUpload(request);
			if(fileList.size()>0) {
				for(int i=0;i<fileList.size();i++) {
					Map<String, Object> map=fileList.get(i);
					fileName=(String) map.get("fileName");
				}
				
			
			MimeBodyPart mbp1=new MimeBodyPart();
			mbp1.setContent(coment,"text/html; charset=utf-8");
			
			File file=new File(fileUtility.getUploadPath(request),fileName);
			
			MimeBodyPart mbp2= new MimeBodyPart();
			FileDataSource fds=new FileDataSource(file.getAbsolutePath());
			mbp2.setDataHandler(new DataHandler(fds));
			mbp2.setFileName(fds.getName());
			
			Multipart mp = new MimeMultipart();
			mp.addBodyPart(mbp1);
			mp.addBodyPart(mbp2);
			
			message.setContent(mp);
			}else {
				message.setSubject(title);
			   // Text 메일 내용
				 message.setContent(coment,"text/html; charset=utf-8");
				
			}
			// send the message 메일 보내기
			Transport.send(message);
			/*
		   logger.info("message sent successfully...");
			 */
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("msg", "성공");
		model.addAttribute("url", "/manager/email_sms/emailMultWrite.do");
		
		return "common/message";
	}
}
