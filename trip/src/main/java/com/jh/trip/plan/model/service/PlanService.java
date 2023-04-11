package com.jh.trip.plan.model.service;

import java.util.List;
import java.util.Map;

import com.jh.trip.place.model.vo.Place;

public interface PlanService {
	
	//키워드 검색
	
	List<Place> searchKeyword(Map param, String keyword);
	int serarchKeywordCount(String keyword);

}
