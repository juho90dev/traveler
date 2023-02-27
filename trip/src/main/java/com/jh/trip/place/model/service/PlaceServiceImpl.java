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
	
	
	// 통합 검색
	@Override 
	public List<Place> searchTotal(Map param, Map<String, Object> pData) { 
		System.out.println("Service!!!!!");
		System.out.println(pData.get("area"));
		System.out.println(pData.get("sigungu"));
		System.out.println(pData.get("mainTema"));
		System.out.println(pData.get("subTema"));
		System.out.println("------------");
		System.out.println(param);
		return pmdao.searchTotal(session,param, pData);
	}
	
	@Override
	public int searchTotalCount(Map pData) {
		return pmdao.searchTotalCount(session, pData);
				
	}

	// 테마 검색
	@Override
	public List<Place> searchTema(Map param, Map<String, Object> pData) {
		
		return pmdao.searchTema(session, param, pData);
	}
	
	@Override
	public int searchTemaCount(Map<String, Object> pData) {
		return pmdao.searchTemaCount(session, pData);
	}
	
	// 지역 검색
	
	@Override
	public List<Place> searchArea(Map param, Map<String, Object> pData){
		return pmdao.searchArea(session, param, pData);
	}

	@Override
	public int searchAreaCount(Map<String, Object> pData) {
		return pmdao.searchAreaCount(session, pData);
	}

	// 키워드 검색
	@Override
	public List<Place> searchKeyword(Map param, String keyword){
		return pmdao.searchKeyword(session, param, keyword);
	}
	
	@Override
	public int searchKeywordCount(String keyword) {
		return pmdao.searchKeywordCount(session, keyword);
	}
	
}
