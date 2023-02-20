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
	public List<Place> searchPlace(Map param, Map<String, Object> pData) {
		return pmdao.searchPlace(session, param, pData);
	}
	
	@Override
	public int searchPlaceCount(Map pData) {
		return pmdao.searchPlaceCount(session, pData);
				
	}

	@Override
	public List<Place> searchTest(Map<String, Object> pData) {
		System.out.println(pData.get("area"));
		System.out.println(pData.get("sigungu"));
		System.out.println(pData.get("mainTema"));
		System.out.println(pData.get("subTema"));
		System.out.println("------------");
		return pmdao.searchTest(session, pData);
	}
	
	
	@Override 
	public List<Place> searchPlaceTest(Map param, Map<String, Object> pData) { 
		System.out.println("Service!!!!!");
		System.out.println(pData.get("area"));
		System.out.println(pData.get("sigungu"));
		System.out.println(pData.get("mainTema"));
		System.out.println(pData.get("subTema"));
		System.out.println("------------");
		System.out.println(param);
		return pmdao.searchPlaceTest1(session,param, pData);
	}
	
	@Override
	public Place test1(String k) {
		return pdao.findByContentId(k);

	}
	public List<Place> test2(String k) {
		return pdao.findBysubTema(k);
	}
	
	public List<Place> param(Place p) {
		return pmdao.param(session, p);
	}
	
}
