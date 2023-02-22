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
	public String plate() {
		return "place/placeList";
	}


	
	// 장소 검색
	
	@RequestMapping("/searchPlace")
	public ModelAndView searchResult(@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="8") int numPerpage,@RequestParam("mainTema") String mainTema, @RequestParam("subTema") String subTema,
			@RequestParam("area") String area, @RequestParam("sigungu") String sigungu, ModelAndView mv, HttpServletRequest req) {

		
		String url = req.getRequestURI();


		
		Place p = Place.builder().area(area).sigungu(sigungu)
				.mainTema(mainTema).subTema(subTema).build();
		System.out.println("넘어온 파라미터 : "+mainTema +","+ subTema +","+ area +","+ sigungu);
		System.out.println("대분류 :"+mainTema +","+"소분류 :"+ subTema +","+"지역코드 :"+ area +","+ "시군구코드 :"+sigungu);
		System.out.println("객체에 담음 :"+p);
		
		List<Place> place = new ArrayList();
		int totalData = 0;
		
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
		Map<String,Object> testP = Map.of("mainTema",mainTema,"subTema",subTema,"area",area,"sigungu",sigungu);
		Map<String, Object> pData = new HashMap<>();
		
		pData.put("mainTema", mainTema);
		pData.put("subTema", subTema);
		pData.put("area", area);
		pData.put("sigungu", sigungu);
		
		System.out.println("param : "+param);
		System.out.println("------------");
		System.out.println("Map에 담음 : "+pData);
		System.out.println(pData.get("area"));
		System.out.println(pData.get("mainTema"));
		System.out.println("------------");
		// 1. 오류1 페이징과 Map에 담아서 파라미터 전달하기 해결 : 오타였다.....하...
		place = ps.searchPlaceTest(param,pData);
		// 파라미터 조건의 해당하는 지역의 총 갯수
		totalData = ps.searchPlaceCount(pData);
		// 2. 오류2 Map이 아니라 객체에 담아서 전달해보기
//		place = ps.searchPlace(param,p);
		// 3. 그냥 Map만 전달하기. -> 테이블에 값이 들어가 있음에도 null이 나온다......
//		place = ps.searchTest(pData); 
		// 4. 그럼 그냥 파라미터 4개를 Map에 담지말고 객체에 담아서 보내보자. 그래도 null이 나온다//
//		place = ps.param(p);
//		System.out.println(place);
		
		
		
		// 특정 파라미터 테스트 이건 잘 나온다.
		String test1 = "134808";
		String test2 = "A0502";

		for(int i=0;i<place.size();i++) {
			System.out.println(place.get(i));
		}
//
//
		System.out.println(totalData);
		System.out.println(url);
		
		mv.addObject("place",place);
		mv.addObject("pageBar", PlanPageBar.getPageBar(cPage, numPerpage, totalData, "/searchPlace", testP));
		mv.addObject("totalData", totalData);
		mv.setViewName("place/placeList");
		return mv;
	}
	
	
	// 장소 검색 페이지
	@RequestMapping("/testPlace")
	public String testplate() {
		
		return "place/testPlace";
	}
	
	
	@RequestMapping("/searchTema")
	public String searchKeyword(@RequestParam("mainTema") String mainTema,@RequestParam("subTema1") String subTema) {
		
		System.out.println(mainTema);
		System.out.println(subTema);
		
		return "place/placeList";
	}
	

}