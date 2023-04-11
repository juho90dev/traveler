package com.jh.trip.plan.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jh.trip.common.PlanPageBar;
import com.jh.trip.place.model.vo.Place;
import com.jh.trip.plan.model.service.PlanService;

@Controller
public class PlanController {
	
	@Autowired
	private PlanService ps;
	
	@RequestMapping("/planMake")
	public String planMake() {
		return "plan/planMake";
	}

	
	@RequestMapping("/planKeword")
	public ModelAndView planKeword(ModelAndView mv,@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="6") int numPerpage, @RequestParam("keyword") String keyword) {
		List<Place> place = new ArrayList();
		int totalData = 0;
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
		Map<String,Object> areaP = Map.of("keyword",keyword);
		
		place = ps.searchKeyword(param, keyword);
		totalData = ps.serarchKeywordCount(keyword);
		
		
		mv.addObject("place",place);
		mv.addObject("pageBar", PlanPageBar.getPlanPageBar(cPage, numPerpage, totalData, "/planKeword", areaP));
		mv.addObject("totalData", totalData);
		mv.setViewName("plan/planMake");
		
		System.out.println(totalData);
		return mv;
	}
}
