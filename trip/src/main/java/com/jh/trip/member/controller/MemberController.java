package com.jh.trip.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jh.trip.common.PageBar;
import com.jh.trip.common.PlannerPageBar;
import com.jh.trip.member.model.service.MemberService;
import com.jh.trip.member.model.service.MemberServiceImpl;
import com.jh.trip.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes("loginMember")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그인페이지 이동
	@RequestMapping("/loginpage")
	public String login() {
		return "member/newLogin";
	}
	
	//최종 회원가입 페이지
	@RequestMapping(value="/joinForm", method = RequestMethod.GET)
	public String test() {
		return "member/joinForm";
	}
	
	// 회원 리스트 
	@RequestMapping("/memberList")
	@ResponseBody
	public ModelAndView memberList(@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="5") int numPerpage, ModelAndView model) {
		
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
		
		List<Member> member  = service.memberList(param);
		int totalData = service.memberCount();
		for(int i=0;i<member.size();i++) {
			System.out.println(member.get(i));
		}
		model.addObject("member",member);
		model.addObject("pageBar", PageBar.getPageBar(cPage, numPerpage, totalData, "memberList"));
		model.addObject("totalData", totalData);
		model.setViewName("admin/memberList");
		
		
		return model;
	}
	

	// 플래너멤버페이지로 이동
	@RequestMapping(value="/plannerMember", method = RequestMethod.GET)
	public ModelAndView plannerMemberList(@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="6") int numPerpage, ModelAndView model) {
		
		String grade ="플래너";
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
		List<Member> member  = service.plannerMember(param, grade);
		int totalData = service.plannermemberCount(grade);
		
		model.addObject("member",member);
		model.addObject("pageBar", PlannerPageBar.getPageBar(cPage, numPerpage, totalData, "plannerMember"));
		model.addObject("totalData", totalData);
		model.setViewName("plannerMember/plannerMember");
		
		System.out.println(member);
		
		return model;
	}
	
	//메인페이지로 이동
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	
	@RequestMapping("/successlogin")
	public String successLogin(Model m) {
		Object o = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		m.addAttribute("loginMember", (Member)o);
		return "redirect:/";
	}
	
	
	// 회원가입 
	//@RequestMapping(value="/member/join.do", method = RequestMethod.GET)
	@PostMapping("/join")
	public ModelAndView join(@ModelAttribute Member member) {
		System.out.println(member);
		
		service.join(member);
		return new ModelAndView("redirect:/"); 
	}
	
	
	@RequestMapping("/successLogout.do")
	public String successLogout(SessionStatus session) {
		if(!session.isComplete()) {
			session.setComplete();
		}
		return "redirect:/";
	}
	

	
	//자주묻는질문
	
	@RequestMapping(value="/faq", method = RequestMethod.GET)
	public String faq() {
		return "notice/faq";
	}
	

	// 마이 페이지
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public String mypagetest() {
		return "member/myPage";
	}
	
	// 내 정보 수정 페이지
	@RequestMapping(value="/myPage1", method=RequestMethod.GET)
	public String mypage() {
		return "member/myPage1";
	}
	
	
	// 컨텍트 페이지
	@RequestMapping(value="/contact", method = RequestMethod.GET)
	public String contact() {
		return "common/contact";
	}
	
	/*
	 * // 내 정보 수정페이지
	 * 
	 * @RequestMapping(value="/infoChange", method = RequestMethod.GET) public
	 * String infoChange() { return "member/infoChange"; }
	 */
	
	// 정보 수정
	@RequestMapping("/updateInfo")
	public String memberUpdate(Model model,@RequestParam("password") String password,
			@RequestParam("email") String email, @RequestParam("phone") String phone,
			@RequestParam("city") String city, @RequestParam("country") String country,
			@RequestParam("introduce") String introduce,
			@RequestParam("userId") String userId, MultipartHttpServletRequest mtRequest) {
		//Member m = service.selectMember(userId);
		
		
		// 이미지 처리
		MultipartFile mFile = mtRequest.getFile("img");
		// 이미지 저장 경로 설정
		String path = mtRequest.getServletContext().getRealPath("/resources/upload/profile/");
		File uploadPath = new File(path);
		// 디렉토리 생성
		if(!uploadPath.exists()) uploadPath.mkdirs();
		System.out.println("--------");
		System.out.println(path);
		System.out.println(uploadPath);
		System.out.println(mFile);
		System.out.println(mtRequest);
		System.out.println(userId);
		System.out.println(password);
		System.out.println(email);
		System.out.println("--------");
		
		String oriFileName = "";
		String ext = "";
		String image = "";
		
		if(mFile != null) {
			if(!mFile.isEmpty()) {
				oriFileName = mFile.getOriginalFilename();
				ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				image = userId+ext;
				
				try {
					mFile.transferTo(new File(path+image));
				}catch(IOException e) {
					System.out.println("실패");
				}
			}
			
		}
		
//		m.setPassword(password);
//		m.setEmail(email);
//		m.setCity(city);
//		m.setCountry(country);
//		m.setImage(rename);
//		m.setPhone(phone);
//		m.setIntroduce(introduce);
		Member m = Member.builder().userId(userId).city(city).country(country).email(email).password(password)
				.phone(phone).image(image).introduce(introduce).build();
		
		System.out.println("이미지는 : "+ m.getImage());
		System.out.println(m.getUserId());
		System.out.println(m.getCity());
		System.out.println(m.getCountry());
		System.out.println(m.getEmail());
		System.out.println(m.getPassword());
		System.out.println(m.getPhone());
		System.out.println(m.getImage());
		System.out.println(image);
		System.out.println(m.getIntroduce());
		
		
		int result = service.updateMember(m);
		
		model.addAttribute("image", image);
		model.addAttribute("userId", userId);
		model.addAttribute("email", email);
		model.addAttribute("phone", phone);
		model.addAttribute("introduce", introduce);
		model.addAttribute("city", city);
		
		return "member/myPage1";
	}
	
	
	// 회원 등급 승급
	@RequestMapping("/upGrade/{id}")
	public ModelAndView upgrade(@PathVariable String id, ModelAndView mv) {
		String grade ="플래너";
		Member m = Member.builder().userId(id).grade(grade).build();
		int result = service.upgrade(m);
		
		if(result>0) {
			mv.addObject("msg", "회원 등급 변경 성공");
			mv.addObject("loc","/memberList");
		}else {
			mv.addObject("msg", "회원 등급 변경  실패");
			mv.addObject("loc","/memberList");
		}
		
		mv.setViewName("common/msg");		
		return mv;
	}
	
	// 회원 등급 강등
	
	@RequestMapping("/downGrade/{id}")
	public ModelAndView downGrade(@PathVariable String id, ModelAndView mv) {
		String grade = "일반";
		Member m = Member.builder().userId(id).grade(grade).build();
		int result = service.upgrade(m);
		
		if(result>0) {
			mv.addObject("msg", "회원 등급 변경 성공");
			mv.addObject("loc","/memberList");
		}else {
			mv.addObject("msg", "회원 등급 변경  실패");
			mv.addObject("loc","/memberList");
		}
		
		mv.setViewName("common/msg");	
		return mv;
	}
	
	
	// 일반 멤버
	@RequestMapping("/normalMemberList")
	@ResponseBody
	public ModelAndView normalMember(@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="5") int numPerpage, ModelAndView model) {
		
		String grade ="일반";
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
		List<Member> member  = service.normalMember(param, grade);
		int totalData = service.normalmemberCount(grade);
		
		model.addObject("member",member);
		model.addObject("pageBar", PageBar.getPageBar(cPage, numPerpage, totalData, "/normalMemberList"));
		model.addObject("totalData", totalData);
		model.setViewName("admin/memberList");
		
		//System.out.println(member);
		
		return model;
	}
	
	// 플래너 멤버
	@RequestMapping("/plannerMemberList")
	@ResponseBody
	public ModelAndView plannerMember(@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="5") int numPerpage, ModelAndView model) {
		
		String grade ="플래너";
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
		List<Member> member  = service.plannerMember(param, grade);
		int totalData = service.plannermemberCount(grade);
		
		model.addObject("member",member);
		model.addObject("pageBar", PageBar.getPageBar(cPage, numPerpage, totalData, "/plannerMemberList"));
		model.addObject("totalData", totalData);
		model.setViewName("admin/memberList");
		
		System.out.println(member);
		
		return model;
		
	}
	
	// 도시 검색
	@RequestMapping("/searchMember")
	public ModelAndView searchList(@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="5") int numPerpage,@RequestParam("searchType") String searchType, @RequestParam("searchKeyword") String keyword,
			ModelAndView mv) {
		System.out.println(keyword);
		System.out.println(searchType);
		
		List<Member> member = new ArrayList();
		int totalData = 0;
		if(searchType.equals("city")) {
			Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
			member = service.searchMemberCity(param, keyword);
			totalData = service.searchMemberCityCount(keyword);
		}else if(searchType.equals("country")) {
			Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
			member = service.searchMemberCountry(param, keyword);
			totalData = service.searchMemberCountryCount(keyword);
		}else if(searchType.equals("email")){
			Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
			member = service.searchMemberEmail(param, keyword);
			totalData = service.searchMemberEmailCount(keyword);
		}
		
		Map<String,Object> mList = Map.of("searchType",searchType,"keyword",keyword);
		
		mv.addObject("member", member);
		mv.addObject("pageBar", PageBar.searchPageBar(cPage, numPerpage, totalData, "/searchMember", mList ));
		mv.addObject("totalData", totalData);
		mv.setViewName("admin/memberList");
		return mv;
		
	}

	// 다른 회원 페이지
	@RequestMapping("/memberPage/{id}")
	public ModelAndView memberPage(@PathVariable String id, ModelAndView mv) {
		
		Member m = service.selectMember(id);
		System.out.println(m);
		System.out.println(m.getImage());
		mv.addObject("member", m);
		mv.setViewName("member/memberPage");
		
		return mv;
	}
	
	
	// test
	
	@RequestMapping("/test")
	public String testPage() {
		return "common/testPage";
	}
	
	
	
}

