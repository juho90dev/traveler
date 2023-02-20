package com.jh.trip.place.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jh.trip.common.PageBar;
import com.jh.trip.place.model.service.PlaceService;
import com.jh.trip.place.model.vo.Place;

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
			@RequestParam(defaultValue="9") int numPerpage,@RequestParam("mainTema") String mainTema, @RequestParam("subTema") String subTema,
			@RequestParam("area") String area, @RequestParam("sigungu") String sigungu, ModelAndView mv) {
		
		
		


		
		Place p = Place.builder().area(area).sigungu(sigungu)
				.mainTema(mainTema).subTema(subTema).build();
		System.out.println("넘어온 파라미터 : "+mainTema +","+ subTema +","+ area +","+ sigungu);
		System.out.println("대분류 :"+mainTema +","+"소분류 :"+ subTema +","+"지역코드 :"+ area +","+ "시군구코드 :"+sigungu);
		System.out.println("객체에 담음 :"+p);
		
		List<Place> place = new ArrayList();
		int totalData = 0;
		
		Map param = Map.of("cPage", cPage, "numPerpage", numPerpage);
		Map<String, Object> pData = new HashMap<>();
		
		pData.put("mainTema", mainTema);
		pData.put("subTema", subTema);
		pData.put("area", area);
		pData.put("sigungu", sigungu);
		
		System.out.println("param : "+param);
		System.out.println("------------");
		System.out.println("Map에 담음 : "+pData);
		System.out.println(pData.get("area"));
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
//		Place rtest1 = ps.test1(test1);
//		List<Place> rtest2 = ps.test2(test2);
//		System.out.println("------------");
//		System.out.println("test1(특정 contentId) : "+rtest1);
//		System.out.println("------------");
//		System.out.println("------------");
//		System.out.println("test2(특정 소분류) : "+rtest2.get(0));
//		System.out.println("test2 : "+rtest2.get(1));
//		System.out.println("test2 : "+rtest2.get(2));
//		System.out.println("test2 : "+rtest2.get(3));
//		System.out.println("test2 : "+rtest2.get(4));
//		System.out.println("------------");
//		for(int i=0;i<place.size();i++) {
//			System.out.println(place.get(i));
//		}
//
//
//		System.out.println(totalData);
//		mv.addObject("place",place);
//		mv.addObject("pageBar", PageBar.getPageBar(cPage, numPerpage, totalData, "placeList"));
//		mv.addObject("totalData", totalData);
		mv.setViewName("place/testPlace");
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
		
		return "place/testPlace";
	}
	

}