package com.jh.trip.inquiry.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jh.trip.common.PageBar;
import com.jh.trip.inquiry.model.service.InquiryService;
import com.jh.trip.inquiry.model.service.ReplyInquiryService;
import com.jh.trip.inquiry.model.vo.Inquiry;
import com.jh.trip.inquiry.model.vo.ReplyInquiry;
import com.jh.trip.member.model.vo.Member;

@Controller
public class InquiryController {

	@Autowired
	public InquiryService service;
	
	@Autowired
	public ReplyInquiryService riservice;
	
//	// 문의사항 페이지로 이동
//	@RequestMapping(value="/inquiryList", method = RequestMethod.GET)
//	public String inquiry() {
//		return "inquiry/inquiryList";
//	}
	
	// 문의사항 작성 페이지
	
	@RequestMapping(value="/inquiryWrite")
	public String inquiryWrite() {
		return "inquiry/inquiryWrite";
	}
	
	
	// 문의사항 작성
	@RequestMapping("/insertInquiry")
	public String insertInquiry(Model model, @RequestParam("writer") String writer, @RequestParam("inquiryTitle") String inquiryTitle,
			@RequestParam("inquiryEmail") String inquiryEmail, @RequestParam("inquiryContent")String inquiryContent,
			@RequestParam("inquiryType") String inquiryType, MultipartHttpServletRequest mtRequest) {
		
		MultipartFile mFile = mtRequest.getFile("img");
		String path = mtRequest.getServletContext().getRealPath("/resources/upload/inquiry/");
		File uploadPath = new File(path);
		if(!uploadPath.exists()) uploadPath.mkdirs();
		
		String oriFileName = "";
		String ext = "";
		String rename = "";
		
		if(!mFile.isEmpty()) {
			oriFileName = mFile.getOriginalFilename();
			ext = oriFileName.substring(oriFileName.lastIndexOf("."));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum = (int)Math.random()*10000;
			rename = sdf.format(System.currentTimeMillis())+"_"+rndNum+ext;
			
			try {
				mFile.transferTo(new File(path+rename));
			}catch(IOException e) {
				System.out.println("실패");
			}
		}
		Member loginMember=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Inquiry i = Inquiry.builder().writer(loginMember).inquiryContent(inquiryContent).inquiryEmail(inquiryEmail).inquiryPhone(loginMember.getPhone())
				.inquiryTitle(inquiryTitle).inquiryType(inquiryType).renameFileName(rename).originalFileName(oriFileName).build();
		
		System.out.println(i.getWriter());
		
		
		Inquiry inq = service.insertInquiry(i);;
		
		String msg="";
		String loc="";
		try {
			service.insertInquiry(i);;
			msg = "문의글 작성 완료!";
			loc = "/inquiryList";
		}catch(Exception e) {
			msg = "문의글 작성 실패";
			loc = "/inquiryList";
			
		}
				
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	
	@RequestMapping("/inquiryList")
	@ResponseBody
	public ModelAndView selectInquiryList(@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="5") int numPerpage, ModelAndView model) {
		
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
		List<Inquiry> inquiry = service.selectInquiryList(param);
		int totalData = service.selectInquiryCount();
		System.out.println(inquiry);
		
		model.addObject("inquiry", inquiry);
		model.addObject("pageBar", PageBar.getPageBar(cPage, numPerpage, totalData, "inquiry"));
		model.addObject("totalData", totalData);
		model.setViewName("inquiry/inquiryList");
		return model;
	}
	
	
	// 문의글 상세 페이지
	@RequestMapping("/inquiryView/{id}")
	public ModelAndView inquiryView(@PathVariable int id, ModelAndView mv) {
		
		Inquiry i = service.selectInquiry(id);
		System.out.println(i);
		mv.addObject("inquiry", i);
		mv.setViewName("inquiry/inquiryView");
		return mv;
	}
	
	
	// 문의글 답변 페이지
	@RequestMapping("/replyInquiry/{id}")
	public ModelAndView replyInquiry(@PathVariable int id, ModelAndView mv) {
		Inquiry i = service.selectInquiry(id);
		mv.addObject("inquiry", i);
		mv.setViewName("inquiry/replyInquiry");
		return mv;
	}
	
	// 문의글 답변 작성
	@RequestMapping("/insertReply")
	public ModelAndView insertReply(@RequestParam("writer") String writer, @RequestParam("reinquiryContent") String reinquiryContent,
			@RequestParam("reinquiryTitle") String reinquiryTitle, @RequestParam("inquiryNo") int inquiryNo, ModelAndView mv) {
		Inquiry i = service.selectInquiry(inquiryNo);
		
		ReplyInquiry r = ReplyInquiry.builder().reinquiryContent(reinquiryContent).reinquiryTitle(reinquiryTitle)
				.writer(writer).inquiry(i).build();
		 
		
		try {
			ReplyInquiry ri = riservice.insertReply(r);
			mv.addObject("msg", "문의글 답변완료");
			mv.addObject("loc","/inquiryList");
		}catch(Exception e) {
			mv.addObject("msg", "문의글 답변실패");
			mv.addObject("loc","inquiry/replyInquiry");
			
		}
		mv.setViewName("common/msg");
		return mv;
	}
	
	// 문의글 답변 상세 페이지
	
	
	
}
