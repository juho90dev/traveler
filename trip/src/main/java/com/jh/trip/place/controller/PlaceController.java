package com.jh.trip.place.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.metamodel.SetAttribute;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jh.trip.common.PageBar;
import com.jh.trip.common.PlanPageBar;
import com.jh.trip.place.model.service.PlaceService;
import com.jh.trip.place.model.vo.Place;
import com.jh.trip.request.model.vo.Request;

@Controller
public class PlaceController {
	
	
	@Autowired
	private PlaceService ps;
	
	
	// 장소 검색 페이지
	@RequestMapping("/placeList")
	public String place() {
		return "place/placeList";
	}


	
	// 통합 검색
	
	@RequestMapping("/searchPlace")
	public ModelAndView searchResult(@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="12") int numPerpage,@RequestParam("mainTema") String mainTema, @RequestParam("subTema") String subTema,
			@RequestParam("area") String area, @RequestParam("sigungu") String sigungu, ModelAndView mv, HttpServletRequest req) {

		
		String url = req.getRequestURI();


		
		Place p = Place.builder().area(area).sigungu(sigungu).mainTema(mainTema).subTema(subTema).build();
		
		List<Place> place = new ArrayList();
		int totalData = 0;
		
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
		Map<String,Object> totalP = Map.of("mainTema",mainTema,"subTema",subTema,"area",area,"sigungu",sigungu);
		Map<String, Object> pData = new HashMap<>();
		
		pData.put("mainTema", mainTema);
		pData.put("subTema", subTema);
		pData.put("area", area);
		pData.put("sigungu", sigungu);
		

		place = ps.searchTotal(param,pData);
		totalData = ps.searchTotalCount(pData);
		
		mv.addObject("place",place);
		mv.addObject("pageBar", PlanPageBar.getPageBar(cPage, numPerpage, totalData, "/searchPlace", totalP));
		mv.addObject("totalData", totalData);
		mv.setViewName("place/placeList");
		return mv;
	}
	
	// 테마 검색
	@RequestMapping("/searchTema")
	public ModelAndView searchTema(ModelAndView mv, @RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="12") int numPerpage,@RequestParam("mainTema") String mainTema, @RequestParam("subTema1") String subTema) {
		

		
		List<Place> place = new ArrayList();
		int totalData = 0;
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
		Map<String,Object> temaP = Map.of("mainTema",mainTema,"subTema",subTema);
		Map<String, Object> pData = new HashMap<>();
		pData.put("mainTema", mainTema);
		pData.put("subTema", subTema);

		
		
		
		place = ps.searchTema(param,pData);
		totalData = ps.searchTemaCount(pData);

		mv.addObject("place",place);
		mv.addObject("pageBar", PlanPageBar.getPageBar(cPage, numPerpage, totalData, "/searchTema", temaP));
		mv.addObject("totalData", totalData);
		mv.setViewName("place/placeList");
		return mv;
	}
	
	
	// 장소 검색
	@RequestMapping("/searchArea")
	public ModelAndView searchArea(ModelAndView mv, @RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="12") int numPerpage,@RequestParam("area") String area, @RequestParam("sigungu1") String sigungu) {
		
		List<Place> place = new ArrayList();
		int totalData = 0;
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
		Map<String,Object> areaP = Map.of("area",area,"sigungu",sigungu);
		Map<String, Object> pData = new HashMap<>();
		pData.put("area", area);
		pData.put("sigungu", sigungu);
		
		place = ps.searchArea(param, pData);
		totalData = ps.searchAreaCount(pData);
	
		mv.addObject("place",place);
		mv.addObject("pageBar", PlanPageBar.getPageBar(cPage, numPerpage, totalData, "/searchArea", areaP));
		mv.addObject("totalData", totalData);
		mv.setViewName("place/placeList");
		
		return mv;
	}
	
	
	@RequestMapping("/searchKeyword")
	public ModelAndView searchKeyword(ModelAndView mv, @RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="12") int numPerpage,@RequestParam("keyword") String keyword) {
		
		List<Place> place = new ArrayList();
		int totalData = 0;
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
		Map<String,Object> areaP = Map.of("keyword",keyword);
		
		place = ps.searchKeyword(param, keyword);
		totalData = ps.searchKeywordCount(keyword);
		
		mv.addObject("place",place);
		mv.addObject("pageBar", PlanPageBar.getPageBar(cPage, numPerpage, totalData, "/searchKeyword", areaP));
		mv.addObject("totalData", totalData);
		mv.setViewName("place/placeList");
		return mv;
	}
	
	@RequestMapping("/placeView/{id}")
	public ModelAndView placeView(@PathVariable String id, ModelAndView mv) {
		System.out.println(id);
		
		Place p = ps.selectPlace(id);
		
		System.out.println(p);
		mv.addObject("place", p);
		mv.setViewName("place/placeView");
		return mv;
	}
	
	
	
	
	
	
	// 테스트페이지
	@RequestMapping("/testPlace")
	public String testplate() {
		
		return "place/testPlace";
	}
	

	

}