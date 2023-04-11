package com.jh.trip.plan.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.trip.place.model.vo.Place;
import com.jh.trip.plan.model.dao.PlanMapperDao;


@Service
public class PlanServiceImpl implements PlanService {
	
	
	@Autowired
	private PlanMapperDao pmdao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	//키워드 검색
	@Override
	public List<Place> searchKeyword(Map param, String keyword) {
		// TODO Auto-generated method stub
		return pmdao.searchKeyword(session, param, keyword);
	}

	@Override
	public int serarchKeywordCount(String keyword) {
		// TODO Auto-generated method stub
		return pmdao.searchKeywordCount(session, keyword);
	}

}
