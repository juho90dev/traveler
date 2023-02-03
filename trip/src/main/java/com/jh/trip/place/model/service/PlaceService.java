package com.jh.trip.place.model.service;

import java.util.List;
import java.util.Map;

import com.jh.trip.place.model.vo.Place;

public interface PlaceService {

	// 검색
	List<Place> searchPlace(Map param, Place p);
	int searchPlaceCount(Map<String, Object> pData);
	
	List<Place> searchTest(Map<String, Object> pData);
	
	List<Place> searchPlaceTest(Map param, Map<String, Object> pData);
	
	Place test1(String k);
	List<Place> test2(String k);
	
	List<Place> param(Place p);
	
	
}
