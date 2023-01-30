package com.jh.trip.planner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlannerController {
	
	@RequestMapping("/planList")
	public String planList() {
		
		return "plannerMember/planList";
	}

}
