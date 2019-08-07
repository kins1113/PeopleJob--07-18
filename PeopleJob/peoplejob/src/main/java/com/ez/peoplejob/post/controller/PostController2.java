package com.ez.peoplejob.post.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.sl.usermodel.ObjectMetaData.Application;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.peoplejob.board.model.BoardService;
import com.ez.peoplejob.board.model.BoardVO;
import com.ez.peoplejob.common.FileUploadUtility;
import com.ez.peoplejob.common.PaginationInfo;
import com.ez.peoplejob.common.WebUtility;
import com.ez.peoplejob.member.model.MemberService;
import com.ez.peoplejob.member.model.MemberVO;
import com.ez.peoplejob.post.model.PostService;
import com.ez.peoplejob.post.model.PostVO;
import com.ez.peoplejob.post.model.UploadInfoService;
import com.ez.peoplejob.post.model.UploadInfoVO;
import com.ez.peoplejob.post_cmt.model.PostCmtVO;

@Controller
public class PostController2 {
	private Logger logger=LoggerFactory.getLogger(PostController2.class);
	@Autowired private PostService postService;
	@Autowired private BoardService boardService;
	@Autowired private MemberService memberService;
	@Autowired private FileUploadUtility fileUploadUtil;
	@Autowired private UploadInfoService uploadInfoService;
	
	@RequestMapping(value="/board/boardByCategory.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String boardByCategory(Model model, @RequestParam int boardCode, @ModelAttribute PostVO postVo) {
logger.info("boardByCategory 목록 파라미터, boardCode={}, postVo={}",boardCode, postVo);
		
		List<BoardVO> boardkindlist=boardService.selectByUsage();
		logger.info("게시판 목록 조회 boardkindlist.size={}",boardkindlist.size());
		
		//2
				//[1] PaginationInfo 객체 생성
				PaginationInfo pagingInfo=new PaginationInfo();
				pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
				pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
				pagingInfo.setCurrentPage(postVo.getCurrentPage());
				
				//[2] SearchVo에 페이징 관련 변수 셋팅
				postVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
				postVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
				//postVo.setBlockSize(WebUtility.BLOCK_SIZE);
				//logger.info("셋팅 후 postVo={}", postVo);
				
				//[3] 조회처리
				List<Map<String, Object>> list=postService.selectAll(postVo);
				logger.info("게시판 글 목록 결과, list.size={}",list.size());
				
				//[4] 전체 레코드 개수 조회
				int totalRecord=0;
				totalRecord=postService.selectTotalCount(postVo);
				logger.info("전체 레코드 개수 조회 결과, totalRecord={}", totalRecord);
				
				//[5] PaginationInfo에 totalRecord 값 셋팅
				pagingInfo.setTotalRecord(totalRecord);
				
				
			/*	
		List<Map<String, Object>> list=postService.selectByboardCode(boardCode);
		logger.info("게시글 목록 list.size={}",list.size());
		*/
		model.addAttribute("boardkindlist",boardkindlist);
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "board/boardByCategory";
	}
	
	@RequestMapping("/board/boardList.do")
	public String selectboardList(Model model) {
		logger.info("게시판 목록 조회");
		List<BoardVO> list=boardService.selectByUsage();
		logger.info("게시판 목록 조회 list.size={}",list.size());
		
		model.addAttribute("list",list);
		return "main/inc/boardList";
		
	}
	
	@RequestMapping(value="/board/detail.do", method = RequestMethod.GET)
	public String detail(@RequestParam(defaultValue = "0") int no, Model model) {
		logger.info("게시판 상세보기 파라미터 pk={}",no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/board/boardByCategory.do?boardCode="+no);
			
			return "common/message";
		}
		
		List<Map<String, Object>> postList=postService.selectByboardCode2(no);
		logger.info("상세보기 결과 postList.size={}",postList.size());
		List<Map<String, Object>> list=postService.selectCmt(no);
		logger.info("댓글 목록 list.size={}",list.size());
		PostVO postVo=postService.selectOneByBoardCode2(no);
		logger.info("게시판 detail, postVo={}",postVo);
		List<UploadInfoVO> uploadList=uploadInfoService.uploadInfoSelectByBoardCode2(no);
		logger.info("게시판 detail, uploadList.size={}",uploadList.size());
		
		model.addAttribute("uploadList",uploadList);
		model.addAttribute("postVo",postVo);
		model.addAttribute("list",list);
		model.addAttribute("postList",postList);
		
		
		return "board/detail";
	}
	
	@RequestMapping(value="/post/countUpdate.do",method = RequestMethod.GET)
	public String countUpdate(@RequestParam(defaultValue = "0") int pk,
			@RequestParam int boardCode, Model model) {
		logger.info("post 글 조회수 증가 파라미터 boardCode2={}",pk);
		logger.info("파라미터 boardCode={}",boardCode);
		
		int cnt=postService.postcountUpdate(pk);
		logger.info("조회수 증가 결과 cnt={}",cnt);
		
			if(pk==0) {
				model.addAttribute("msg", "잘못된 url입니다.");
				model.addAttribute("url", "/board/boardByCategory.do?boardCode="+boardCode);
				
				return "common/message";
			}
			
		return "redirect:/board/detail.do?no="+pk;
	}
	
	@RequestMapping(value="/board/boardWrite.do", method = RequestMethod.GET)
	public String boardpostWrite(@RequestParam(defaultValue = "0") int boardCode, Model model) {
		logger.info("게시판 글쓰기 파라미터, boardCode={}",boardCode);
		BoardVO boardVo=boardService.selectByBoardCode(boardCode);
		logger.info("boardVo={}",boardVo);
		
		if(boardCode==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/board/boardByCategory.do?boardCode="+boardCode);
			
			return "common/message";
		}
		
		model.addAttribute("boardVo",boardVo);
		return "board/boardWrite";
		
	}
	
	@RequestMapping(value="/board/boardWrite.do", method = RequestMethod.POST)
	public String boardpostWrite_post(@ModelAttribute PostVO postVo, HttpSession session, Model model
			,HttpServletRequest request) {
		logger.info("게시판 글쓰기 파라미터 , postVO={}",postVo);
		
		String memberid=(String)session.getAttribute("memberid");
		logger.info("memberid={}",memberid);
		
		if(memberid!=null) {
			MemberVO memberVo=memberService.selectByUserid(memberid);
			logger.info("memberVo= {}",memberVo);
			postVo.setMemberCode(memberVo.getMemberCode());
		}
		
		int cnt=postService.insertPost(postVo);
		logger.info("글쓰기 등록 결과 cnt={}",cnt);
		
		List<Map<String,Object>> list=fileUploadUtil.fileMultiUpload("file", request,  FileUploadUtility.POST_UPLOAD);
		logger.info("list.size={}",list.size());
		
		//업로드를 insert하기 위한 객체 생성
				UploadInfoVO uploadInfoVo=new UploadInfoVO();
				uploadInfoVo.setBoardCode2(postVo.getBoardCode2());
				
				for(Map<String, Object> map:list) {
					uploadInfoVo.setFileName(map.get("fileName")+"");
					uploadInfoVo.setFileSize(Integer.parseInt(map.get("fileSize")+""));
					uploadInfoVo.setOriginalFileName(map.get("originalFileName")+"");
					
					logger.info("insert전 uploadInfoVo={}",uploadInfoVo);
					uploadInfoService.fileUpload(uploadInfoVo);
				}
		
		String msg="", url="/board/boardWrite.do";
		if(cnt>0) {
			msg="새로운 글이 등록되었습니다.";
			url="/board/boardByCategory.do?boardCode="+postVo.getBoardCode();
		}else {
			msg="글쓰기 등록 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
		
	}
	
	@RequestMapping(value="/post/postCmt.do", method=RequestMethod.POST)
	public String postCmt(@ModelAttribute PostCmtVO postcmtVo, Model model, HttpSession session) {
		logger.info("댓글 쓰기 파라미터, postCmtVo={}", postcmtVo);
		String memberid=(String)session.getAttribute("memberid");
		
		MemberVO memberVo=memberService.selectByUserid(memberid);
		
		postcmtVo.setMemberCode(memberVo.getMemberCode());
		int cnt=postService.insertcmt(postcmtVo);
		logger.info("댓글 쓰기 결과 cnt={}",cnt);
		
		String url="/board/detail.do?no="+postcmtVo.getBoardCode2();
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/board/boardEdit.do", method=RequestMethod.GET)
	public String postedit(@RequestParam int no, Model model) {
		logger.info("게시판 글 수정 화면");
		PostVO postVo=postService.selectOneByBoardCode2(no);
		logger.info("게시판 글 수정화면, postVo={}",postVo);
		BoardVO boardVo=postService.selectBoardByboardCode2(no);
		logger.info("게시판 글 수정화면, boardVo={}",boardVo);
		List<UploadInfoVO> uploadList=uploadInfoService.uploadInfoSelectByBoardCode2(no);
		logger.info("게시판 글 수정화면, uploadList={}",uploadList);
		
		model.addAttribute("uploadList",uploadList);
		model.addAttribute("boardVo",boardVo);
		model.addAttribute("postVo",postVo);
		return "board/boardEdit";
	}
	
	@RequestMapping(value="/board/boardEdit.do", method=RequestMethod.POST)
	public String postedit_post(@ModelAttribute PostVO postVo, Model model, HttpServletRequest request,
			@RequestParam(defaultValue = "0",required = false) String[] oldFileCode) {
		logger.info("게시판 글 수정 화면 파라미터, postVo={}",postVo);
		logger.info("게시판 글 수정 화면 파라미터2, oldFileCode.length={}", oldFileCode.length);
		
		//check된 oldFileCode 확인
		for(int i=0;i<oldFileCode.length;i++) {
			logger.info("i={}, oldFileCode={}",i,oldFileCode[i]);
		}
		
		int cnt=postService.updatePost(postVo);
		logger.info("게시글 update 결과 cnt={}",cnt);
		
		List<Map<String,Object>> list=fileUploadUtil.fileMultiUpload("file", request,  FileUploadUtility.POST_UPLOAD);
		logger.info("list.size={}",list.size());
		
		
		//업로드를 insert하기 위한 객체 생성
				UploadInfoVO uploadInfoVo=new UploadInfoVO();
				uploadInfoVo.setBoardCode2(postVo.getBoardCode2());
				
				for(Map<String, Object> map:list) {
					uploadInfoVo.setFileName(map.get("fileName")+"");
					uploadInfoVo.setFileSize(Integer.parseInt(map.get("fileSize")+""));
					uploadInfoVo.setOriginalFileName(map.get("originalFileName")+"");
					
					logger.info("insert전 uploadInfoVo={}",uploadInfoVo);
					uploadInfoService.fileUpload(uploadInfoVo);
				}
				
	
		String msg="", url="/board/detail.do?no="+postVo.getBoardCode2();
		if(cnt>0) {
			msg="글이 정상적으로 수정되었습니다.";
			
			//기존파일 삭제
			int delcnt=0;
				for(int i=0;i<oldFileCode.length;i++) {
					if(oldFileCode[i]!=null) {
						delcnt+=uploadInfoService.deletePostByName(oldFileCode[i]);
						logger.info("각각 deletecnt={}",delcnt);
						
						String path=fileUploadUtil.getUploadPath(request,FileUploadUtility.POST_UPLOAD);
						File oldFile=new File(path, oldFileCode[i]);
						if(oldFile.exists()) {
							boolean bool=oldFile.delete();
							logger.info("기존 파일 삭제 여부={}", bool);
						}
					}
				}
				
			logger.info("delcnt={}",delcnt);
			
		}else {
			msg="글 수정 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/board/postDel.do")
	public String postDel(@RequestParam int no, Model model, HttpServletRequest request) {
		BoardVO boardVo=postService.selectBoardByboardCode2(no);
		logger.info("게시판 글 삭제 화면 파라미터, no={}",no);
		logger.info("boardVo={}",boardVo);
		
		int cnt=postService.deletePost(no);
		logger.info("게시판 글 삭제 결과 cnt={}",cnt);
		
		
		String msg="", url="/board/boardByCategory.do?boardCode="+boardVo.getBoardCode1();
		if(cnt>0) {
			msg="글이 정상적으로 삭제되었습니다.";
			
			String path=fileUploadUtil.getUploadPath(request,FileUploadUtility.POST_UPLOAD);
			List<UploadInfoVO> uploadList=uploadInfoService.uploadInfoSelectByBoardCode2(no);
			logger.info("no={}번호에 해당하는 업로드 파일 개수 uploadList.size={}",no,uploadList.size());
			
			if(uploadList.size()>0) {
				for(int i=0;i<uploadList.size();i++) {
					UploadInfoVO uploadVo=uploadList.get(i);
					
					int delcnt=uploadInfoService.deleteupload(uploadVo.getUploadCode());
					logger.info("삭제할 글 업로드 파일 삭제 결과 delcnt={}",delcnt);
					
					File oldFile=new File(path, uploadVo.getFileName());
					if(oldFile.exists()) {
						boolean bool=oldFile.delete();
						logger.info("기존 파일 삭제 여부={}", bool);
					}
					
				}
				
			}
			
		}else {
			msg="글 삭제 실패";
			url="/board/detail.do?no="+no;
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	
	@RequestMapping(value="/board/report.do", method=RequestMethod.GET)
	public String report(@RequestParam(defaultValue = "0", required = false ) int no) {
		logger.info("게시판 글 신고 화면 보여주기");
		return "board/report";
	}
	
	@RequestMapping(value="/board/report.do", method=RequestMethod.POST)
	public String report_post(@RequestParam int boardCode2,@RequestParam String reportUser,
			@RequestParam String reportComent,@RequestParam String close, Model model) {
		logger.info("게시판 글 신고 화면 파라미터, boardCode2={}, reportUser={}",boardCode2, reportUser);
		logger.info("게시판 글 신고 화면 파라미터2,reportComent={}, close={}",reportComent, close);
		
		PostVO postVo=new PostVO();
		postVo.setBoardCode2(boardCode2);
		postVo.setReportUser(reportUser);
		postVo.setReportComent(reportComent);
		
		int cnt=postService.updatereport(postVo);
		logger.info("신고하기 결과 cnt={}",cnt);
		
		String url="/board/report.do?close=close", msg="";		
		if(cnt>0) {
			msg="신고가 접수되었습니다.관리자에 의해 해당 글은 삭제될 수 있습니다.";
		}else {
			msg="신고 접수 실패";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
	
	@RequestMapping("/board/filedownload.do")
	public void filddownload(@RequestParam int no, @RequestParam String fileName,
			HttpServletRequest request,HttpServletResponse response) {
		logger.info("파일 다운로드 파라미터, no={}, fileName={}",no, fileName);
		
		int cnt=uploadInfoService.updatedowncount(fileName);
		logger.info("upload_info downcount 증가 결과 cnt={}",cnt);
		
		@SuppressWarnings("deprecation")
		String dirPath= request.getRealPath("post_upload");
		//파일이름을 인코딩한다.(euc-kr => ISO-8859-1)
		//=> url전송시에는 모든 문자가 ISO-8859-1로 인코딩 되기 때문에
		//강제 다운로드 창 띄우기
		try{
		File myfile = new File(dirPath, fileName);
		//page의 설정을 바꾸기 위해서 response를 다 날려버림
		response.reset();
		//setContentType는 MIME 타입을 지정-octet-stream으로 지정시, 형식을 지정하지 않겠다는 것
		response.setContentType("application/octet-stream");
		//브라우저 파일 확장자를 포함하여 모든 확장자의 파일들에 대해 다운로드시 무조건 파일다운로드
		//대화상자가 뜨도록 하는 헤더속성
		response.setHeader("Content-Disposition", "attachment;filename="
		+ new String(fileName.getBytes("euc-kr"),"ISO-8859-1")+"");

		

		//url 전송시 ISO-8859-1 로 인코딩되므로 한글 처리 위해 인코딩 42

		response.setContentLength((int)myfile.length());
		//바이너리 데이터를 아스키 텍스트 형식으로 변환하기 위한 방법
		response.setHeader("Content-Treansper-Encoding", "binary");
		//cache에서 해당 페이지 읽기방지, 로딩시마다 새로고침한 것
		response.setHeader("Pargma","no-cache");
		//cache 막기
		response.setHeader("Expires","-1");
		//out.clear();
		//out=pageContext.pushBody();
		byte[] data = new byte[1024 * 1024];
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(myfile));
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		int count = 0;
		while((count = bis.read(data))!= -1){

		bos.write(data);

	}
		if(bis !=null) bis.close();
		if(bos != null) bos.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
}
