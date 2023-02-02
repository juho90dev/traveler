package com.jh.trip.plate.model.service;

import java.util.List;

import com.jh.trip.plate.model.vo.Plate;

public interface PlateService {

	// 검색
	List<Plate> selectList(Plate p);
	
	
	
}
