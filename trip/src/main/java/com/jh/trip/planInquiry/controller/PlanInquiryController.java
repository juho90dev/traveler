package com.jh.trip.planInquiry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jh.trip.member.model.service.MemberService;
import com.jh.trip.member.model.vo.Member;

@Controller
public class PlanInquiryController {
	
	
	@Autowired
	private MemberService mservice;
	
	
	
	// 플랜 요청 내역 페이지
	@RequestMapping("/requestPlanList/{id}")
	public ModelAndView planInquiry(ModelAndView mv, @PathVariable String id) {
		
		Member m = mservice.selectMember(id);
		
		mv.addObject("member", m);
		mv.setViewName("plannerMember/requestPlanList");
		
		return mv;
	}
	
	// 플랜 요청 페이지
	@RequestMapping("/request/{id}")
	public ModelAndView requsetPlan(ModelAndView mv, @PathVariable String id) {
		
		mv.addObject("userId", id);
		mv.setViewName("plannerMember/request");
		
		return mv;
	}
	
	
	
	

}
