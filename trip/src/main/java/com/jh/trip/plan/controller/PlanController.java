package com.jh.trip.plan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PlanController {
	
	
	@RequestMapping("/planMake")
	public String planMake() {
		return "plan/planMake";
	}

	
	@RequestMapping("/planKeword")
	public ModelAndView planKeword(ModelAndView mv, @RequestParam("keyword") String keyword) {
		
		System.out.println(keyword);
		return mv;
	}
}
