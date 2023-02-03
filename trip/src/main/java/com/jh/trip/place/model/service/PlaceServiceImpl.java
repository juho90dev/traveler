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
	public List<Place> searchPlace(Map param, Place p) {
		return pmdao.searchPlace(session, param, p);
	}
	
	@Override
	public int searchPlaceCount(Map pData) {
		return pmdao.searchPlaceCount(session, pData);
				
	}

	@Override
	public List<Place> searchTest(Map<String, Object> pData) {
		System.out.println(pData.get("areacode"));
		System.out.println(pData.get("sigungucode"));
		System.out.println(pData.get("cat1"));
		System.out.println(pData.get("cat2"));
		System.out.println("------------");
		return pmdao.searchTest(session, pData);
	}
	
	
	@Override 
	public List<Place> searchPlaceTest(Map param,Map<String, Object> pData) { 
		System.out.println("Service!!!!!");
		System.out.println(pData.get("areacode"));
		System.out.println(pData.get("sigungucode"));
		System.out.println(pData.get("cat1"));
		System.out.println(pData.get("cat2"));
		System.out.println("------------");
		return pmdao.searchPlaceTest(session, param, pData);
	}
	
	@Override
	public Place test1(String k) {
		return pdao.findByContentId(k);

	}
	public List<Place> test2(String k) {
		return pdao.findBycat2(k);
	}
	
	public List<Place> param(Place p) {
		return pmdao.param(session, p);
	}
	
}
