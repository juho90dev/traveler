package com.jh.trip.request.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jh.trip.member.model.service.MemberService;
import com.jh.trip.member.model.vo.Member;
import com.jh.trip.request.model.service.RequestService;
import com.jh.trip.request.model.vo.Request;

@Controller
public class RequestController {
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private RequestService rservice;
	
	// 플랜 요청 페이지
	@RequestMapping("/request/{id}")
	public ModelAndView requsetPlan(ModelAndView mv, @PathVariable String id) {
		
		Member m = mservice.selectMember(id);
		
		mv.addObject("member",m);
		mv.setViewName("request/request");
		
		return mv;
	}
	
	// 플랜 요청 작성
	@RequestMapping("/insertRequest")
	public ModelAndView insertRequest(ModelAndView mv, @RequestParam String memberId, @RequestParam String plannerId,
			@RequestParam String requestTitle, @RequestParam String requestContent, @RequestParam String startDay,
			@RequestParam String endDay, @RequestParam String transport, @RequestParam String theme) {
		
		System.out.println(memberId);
		System.out.println(plannerId);
		System.out.println(requestTitle);
		System.out.println(requestContent);
		System.out.println(startDay);
		System.out.println(endDay);
		System.out.println(theme);
		System.out.println(transport);
		
		Request r = Request.builder().memberId(memberId).plannerId(plannerId).requestTitle(requestTitle).requestContent(requestContent).
				startDay(startDay).endDay(endDay).theme(theme).transport(transport).build();
		
		
		String msg="";
		String loc="";
		try {
			Request req = rservice.insertRequest(r);
			mv.addObject("msg", "요청글 작성 완료!");
			mv.addObject("loc","/myRequest/"+memberId);
		}catch(Exception e) {
			mv.addObject("msg", "요청글 작성 완료!");
			mv.addObject("loc","request/request");
		}
		
		mv.setViewName("common/msg");
		return mv;

	}
	
	
	// 플랜 요청 내역 페이지
	@RequestMapping("/myRequest/{id}")
	public ModelAndView planInquiry(@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="5") int numPerpage, ModelAndView mv, @PathVariable String id) {
		
		// Member m = mservice.selectMember(id);
		List<Request> request = new ArrayList();
		int totalData = 0;
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
		request = rservice.selectRequestList(param, id);
		totalData = rservice.requestCount(id);
		
		
		mv.addObject("request", request);
		mv.setViewName("request/myRequest");
		
		return mv;
	}

}
