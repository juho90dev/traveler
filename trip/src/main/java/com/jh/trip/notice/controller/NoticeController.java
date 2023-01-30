package com.jh.trip.notice.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jh.trip.common.PageBar;
import com.jh.trip.member.model.vo.Member;
import com.jh.trip.notice.model.service.NoticeService;
import com.jh.trip.notice.model.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class NoticeController {
	
	@Autowired
	public NoticeService service;
	
	
	
	
//	// 공지사항 페이지
//	@RequestMapping(value="notice", method = RequestMethod.GET)
//	public String notice() {
//		return "notice/notice";
//	}
	
	// 공지사항 작성 페이지
	@RequestMapping(value="noticeWrite", method = RequestMethod.GET)
	public String noticeWrite() {
		return "notice/noticeWrite";
	}

	// 공지사항 작성
	@RequestMapping("/insertNotice")
	public String insertNotice(Model model, @RequestParam("writer") String writer, @RequestParam("noticeTitle") String noticeTitle,
			@RequestParam("noticeContent") String noticeContent, MultipartHttpServletRequest mtRequest ) {
		
		MultipartFile nFile = mtRequest.getFile("img");
		String path  = mtRequest.getServletContext().getRealPath("/resources/upload/notice/");
		File uploadPath = new File(path);
		if(!uploadPath.exists()) uploadPath.mkdirs();
		
		String oriFileName = "";
		String ext = "";
		String rename = "";
		
		
		if(!nFile.isEmpty()) {
			oriFileName = nFile.getOriginalFilename();
			ext = oriFileName.substring(oriFileName.lastIndexOf("."));
			
			// 첨부파일이 겹쳐지면 안되니 랜덤값을 돌려 작성한다.
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum = (int)Math.random()*10000;
			rename = sdf.format(System.currentTimeMillis())+"_"+rndNum+ext;
			
			try {
				nFile.transferTo(new File(path+rename));
			}catch(IOException e) {
				System.out.println("실패");
			}
		}
			
		
		Notice n = Notice.builder().noticeTitle(noticeTitle).noticeContent(noticeContent).originalFileName(oriFileName)
				.renameFileName(rename).writer(writer).build();
		String msg="";
		String loc="";
		try {
			service.insertNotice(n);;
			msg = "공지사항 작성 완료!";
			loc = "/notice";
		}catch(Exception e) {
			msg = "공지사항 작성 실패";
			loc = "/noticeWrite";
			
		}
		// service.insertNotice(n);
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
		
	}
	
	// 공지사항 리스트 가져오기
	@RequestMapping("/notice")
	@ResponseBody
	public ModelAndView selectNotice(@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="5") int numPerpage, ModelAndView model) {
		
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
		List<Notice> notice = service.selectNotice(param);
		int totalData = service.selectNoticeCount();		
		model.addObject("notice", notice);
		model.addObject("pageBar", PageBar.getPageBar(cPage, numPerpage, totalData, "notice"));
		model.addObject("totalData", totalData);
		model.setViewName("notice/notice");
		return model;
	}
	
	// 파일 다운로드
	
	@RequestMapping("nfDownload.do")
	public void fileDownload(String oriname, String rename, 
			HttpServletResponse res, 
			HttpServletRequest req, 
			@RequestHeader(value="User-agent") String header) {
		
		// 응답하기 위해 HttpServletResponse를,
		// HttpServletResponse객체에 Content Type, 응답코드, 응답 메시지등을 담아서 전송함
		
		// 경로를 받아오기 위해 HttpServletRequest를,
		// 인코딩처리 : @RequestHeader(value="User-agent")
		
		
		String path = req.getServletContext().getRealPath("/resources/upload/notice/");
		File saveFile = new File(path+rename);	
		
		
		// 스트림 열기
		try(BufferedInputStream bis = new BufferedInputStream (new FileInputStream(saveFile));
				ServletOutputStream sos = res.getOutputStream();){
			
			// 브라우저 별로 인코딩하기
			boolean isMS = header.contains("Trident")||header.contains("MSIE");
			
			String encodeFilename = "";
			if(isMS) {
				encodeFilename = URLEncoder.encode(rename, "UTF-8");
				encodeFilename = encodeFilename.replaceAll("\\+", "%20");
			
			}else {
				encodeFilename = new String(oriname.getBytes("UTF-8"),"ISO-8859-1");
			}
			
			res.setContentType("application/octet-stream;charset=utf-8");
			res.setHeader("Content-Disposition", "attachment;filename=\""+encodeFilename+"\"");
			
			
			int read=-1;
			// read() : 파일을 읽어올때 성공하면 수신바이트 수, 실패시 -1을 반환한다
			while((read=bis.read())!=-1) {
				sos.write(read);
			}
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	// 공지사항 상세페이지
	@RequestMapping("/noticeView/{id}")
	public ModelAndView noticeView(@PathVariable int id, ModelAndView mv) {
		
		Notice n = service.selectNoticeInfo(id);
		System.out.println(n);
		mv.addObject("notice",n);
		
		mv.setViewName("notice/noticeView");
		return mv;
	}

	
	// 공지사항 삭제
	@RequestMapping("/deleteNotice/{id}")
	public ModelAndView noticeDelete(@PathVariable int id,HttpServletRequest mtRequest, ModelAndView model ) {
		
		System.out.println(id);
		Notice n = service.selectNoticeInfo(id);
		System.out.println(n);
		String path  = mtRequest.getServletContext().getRealPath("/resources/upload/notice/");
		// System.out.println(n.getRenameFileName());
		File f = new File(path+n.getRenameFileName());
		// System.out.println(n);
		// if(f.exists()) System.out.println("있다");
		if(f.exists()) f.delete();
		
		
		int result = service.deleteNotice(id);
		if(result>0) {
			model.addObject("msg", "공지사항 삭제 성공");
			model.addObject("loc","/notice");
		}else {
			model.addObject("msg", "공지사항 삭제 실패");
			model.addObject("loc","/notice");
		}
		
		model.setViewName("common/msg");		
		return model;
	}
	
	
	// 공지사항 수정페이지
	@RequestMapping("/noticeUpdate/{id}")
	public ModelAndView noticeUpdate(@PathVariable int id, ModelAndView mv) {
		Notice n = service.selectNoticeInfo(id);
		mv.addObject("notice", n);
		mv.setViewName("notice/noticeUpdate");
		return mv;
		
	}
	
	// 공지사항 수정
	@RequestMapping("/notice/updateNotice.do")
	public String updateNotice(Model model, @RequestParam("notiNo") int notiNo, @RequestParam("writer") String writer, @RequestParam("noticeTitle") String noticeTitle,
			@RequestParam("noticeContent") String noticeContent, MultipartHttpServletRequest mtRequest ) {
		System.out.println(notiNo);
		
		Notice n1 = service.selectNoticeInfo(notiNo);
		
		MultipartFile nFile = mtRequest.getFile("img");
		String path  = mtRequest.getServletContext().getRealPath("/resources/upload/notice/");
		File uploadPath = new File(path);
		if(!uploadPath.exists()) uploadPath.mkdirs();
		
		String oriFileName = "";
		String ext = "";
		String rename = "";
		
		
		if(!nFile.isEmpty()) {
			// 첨부파일 또한 수정을 하게 되면 기존의 있던 파일을 먼저 삭제 후 넘겨받은 첨부파일을 저장한다.
			File f = new File(path+n1.getRenameFileName());
			if(f.exists()) f.delete();
			
			oriFileName = nFile.getOriginalFilename();
			ext = oriFileName.substring(oriFileName.lastIndexOf("."));
			
			// 첨부파일이 겹쳐지면 안되니 랜덤값을 돌려 작성한다.
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum = (int)Math.random()*10000;
			rename = sdf.format(System.currentTimeMillis())+"_"+rndNum+ext;
			
			try {
				nFile.transferTo(new File(path+rename));
			}catch(IOException e) {
				System.out.println("실패");
			}
		}
			
		
		Notice n = Notice.builder().notiNo(notiNo).noticeTitle(noticeTitle).noticeContent(noticeContent).originalFileName(oriFileName)
				.renameFileName(rename).writer(writer).build();
		
		System.out.println("------------");
		System.out.println(n);
		System.out.println("------------");
		String msg="";
		String loc="";
		try {
			int result = service.updateNotice(n);
			msg = "공지사항 수정 성공!";
			loc = "/notice";
		}catch(Exception e){
			msg = "공지사항 수정 실패!";
			loc = "/noticeUpdate"+notiNo;
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
}
