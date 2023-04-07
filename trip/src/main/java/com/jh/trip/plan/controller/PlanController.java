package com.jh.trip.plan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlanController {
	
	
	@RequestMapping("/planMake")
	public String planMake() {
		return "plan/planMake";
	}

}
