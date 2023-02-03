package com.jh.trip.place.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.trip.place.model.vo.Place;

@Repository
public class PlaceMapperDao {
	
	
	public List<Place> searchPlace(SqlSessionTemplate session,Map param, Place p) {
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("place.searchPlace",p, new RowBounds((offset-1)*limit,limit));
	}
	
	public int searchPlaceCount(SqlSessionTemplate session, Map<String, Object> pData) {
		return session.selectOne("place.searchPlaceCount",pData);
	}
	
	
	public List<Place> searchTest(SqlSessionTemplate session, Map<String, Object> pData){
		System.out.println(pData.get("areacode"));
		System.out.println(pData.get("sigungucode"));
		System.out.println(pData.get("cat1"));
		System.out.println(pData.get("cat2"));
		System.out.println("------------");
		return session.selectList("place.searchTest", pData);
	}

	public List<Place> searchPlaceTest(SqlSessionTemplate session, Map param, Map<String, Object> pData) {
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		System.out.println(pData.get("areacode"));
		System.out.println(pData.get("sigungucode"));
		System.out.println(pData.get("cat1"));
		System.out.println(pData.get("cat2"));
		System.out.println("------------");
		// return session.selectList("place.searchPlaceTest",pData, new RowBounds((offset-1)*limit,limit));
		return null;
	}
	
	public List<Place> param(SqlSessionTemplate session, Place p) {
		return session.selectList("placeParam", p);
	}
}
