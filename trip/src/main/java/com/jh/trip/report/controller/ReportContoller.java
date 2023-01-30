package com.jh.trip.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReportContoller {
	
	
	// 신고 페이지로 이동
	@RequestMapping(value="/report", method = RequestMethod.GET)
	public String report() {
		
		return "report/reportList";
	}

}
