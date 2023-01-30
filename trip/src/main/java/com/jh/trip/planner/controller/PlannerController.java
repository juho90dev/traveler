package com.jh.trip.planner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jh.trip.member.model.service.MemberService;
import com.jh.trip.member.model.vo.Member;

@Controller
public class PlannerController {
	
	@Autowired
	private MemberService mservice;
	
	@RequestMapping("/planList")
	public String planList() {
		
		return "plannerMember/planList";
	}
	
	
	// 플랜 요청 내역 페이지
	@RequestMapping("/myRequest/{id}")
	public ModelAndView planInquiry(ModelAndView mv, @PathVariable String id) {
		
		Member m = mservice.selectMember(id);
		
		mv.addObject("member", m);
		mv.setViewName("request/myRequest");
		
		return mv;
	}

}
