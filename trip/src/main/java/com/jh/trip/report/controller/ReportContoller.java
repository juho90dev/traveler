package com.jh.trip.report.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jh.trip.member.model.vo.Member;



@Controller
public class ReportContoller {
	
	
	// 신고 페이지로 이동
	@RequestMapping(value="/reportList", method = RequestMethod.GET)
	public String report() {
		
		return "report/reportList";
	}
	
	
	// 신고 작성 페이지
	@RequestMapping("/reportWrite")
	public String reportWrite() {
		return "report/reportWrite";
	}
	
	
	// 신고글 작성
	
	@RequestMapping("/insertReport")
	public ModelAndView insertReport(@RequestParam("repId") String id, @RequestParam("repType") String repType,  @RequestParam("repTitle") String repTitle, 
			@RequestParam("repContent") String repContent, @RequestParam("targetId") String targetId, ModelAndView mv) {
		
		Member loginMember=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		
		return mv;
	}

}
