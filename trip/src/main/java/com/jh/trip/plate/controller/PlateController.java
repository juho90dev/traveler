package com.jh.trip.plate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlateController {
	
	// 장소 검색 페이지
	@RequestMapping("/plateList")
	public String plate() {
		return "plate/plateList";
	}

	

}