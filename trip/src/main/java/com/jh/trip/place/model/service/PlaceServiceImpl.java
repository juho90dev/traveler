package com.jh.trip.place.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.trip.place.model.dao.PlaceDao;
import com.jh.trip.place.model.dao.PlaceMapperDao;
import com.jh.trip.place.model.vo.Place;


@Service
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	private PlaceDao pdao;
	
	@Autowired
	private PlaceMapperDao pmdao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override 
	public List<Place> searchPlate(Map param, Map<String, Object> pData) {
		return pmdao.searchPlate(session, param, pData);
	}
	
	@Override
	public int searchPlateCount(Map pData) {
		return pmdao.searchPlateCount(session, pData);
				
	}

}
