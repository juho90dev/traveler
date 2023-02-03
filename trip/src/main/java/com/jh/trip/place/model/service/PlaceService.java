package com.jh.trip.place.model.service;

import java.util.List;
import java.util.Map;

import com.jh.trip.place.model.vo.Place;

public interface PlaceService {

	// 검색
	List<Place> searchPlate(Map param, Map<String, Object> pData);
	int searchPlateCount(Map pData);
	
	
	
}
