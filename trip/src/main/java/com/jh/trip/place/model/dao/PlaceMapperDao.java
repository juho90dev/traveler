package com.jh.trip.place.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.trip.place.model.vo.Place;

@Repository
public class PlaceMapperDao {
	
	

	// 통합 검색
	public List<Place> searchTotal(SqlSessionTemplate session,Map param, Map<String, Object> pData) {
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		System.out.println("Dao!!!!!");
		System.out.println(pData.get("area"));
		System.out.println(pData.get("sigungu"));
		System.out.println(pData.get("mainTema"));
		System.out.println(pData.get("subTema"));
		System.out.println("------------");
		System.out.println(param);
		return session.selectList("place.searchTotal",pData, new RowBounds((offset-1)*limit,limit));
		// return null;
	}
	
	
	public int searchTotalCount(SqlSessionTemplate session, Map<String, Object> pData) {
		return session.selectOne("place.searchTotalCount",pData);
	}
	
	
	// 테마 검색
	public List<Place> searchTema(SqlSessionTemplate session, Map param, Map<String, Object> pData) {
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("place.searchTema",pData, new RowBounds((offset-1)*limit,limit));
	}
	
	public int searchTemaCount(SqlSessionTemplate session, Map<String, Object> pData) {
		return session.selectOne("place.searchTemaCount",pData);
	}
	
	public List<Place> param(SqlSessionTemplate session, Place p) {
		return session.selectList("placeParam", p);
	}
	
	
	// 지역 검색
	
	public List<Place> searchArea(SqlSessionTemplate session, Map param, Map<String, Object> pData){
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("place.searchArea", pData, new RowBounds((offset-1)*limit, limit));
	}
	
	public int searchAreaCount(SqlSessionTemplate session, Map<String, Object> pData) {
		return session.selectOne("place.searchAreaCount",pData);
	}
	
	// 키워드 검색
	
	public List<Place> searchKeyword(SqlSessionTemplate session, Map param, String keyword){
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("place.searchKeyword", keyword, new RowBounds((offset-1)*limit, limit));
	}
	
	public int searchKeywordCount(SqlSessionTemplate session, String keyword) {
		return session.selectOne("place.searchKeywordCount", keyword);
	}
}
