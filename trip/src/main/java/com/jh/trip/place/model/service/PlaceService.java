package com.jh.trip.place.model.service;

import java.util.List;
import java.util.Map;

import com.jh.trip.place.model.vo.Place;

public interface PlaceService {

	// 통합 검색
	List<Place> searchTotal(Map param, Map<String, Object> pData);
	int searchTotalCount(Map<String, Object> pData);
	
	// 테마 검색
	List<Place> searchTema(Map param, Map<String, Object> pData);
	int searchTemaCount(Map<String, Object> pData);
	
	// 지역 검색
	List<Place> searchArea(Map param, Map<String, Object> pData);
	int searchAreaCount(Map<String, Object> pData);
	
	// 키워드 검색
	List<Place> searchKeyword(Map param, String keyword);
	int searchKeywordCount(String keyword);
	

	

	
	
}
