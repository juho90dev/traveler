package com.jh.trip.place.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.trip.place.model.vo.Place;

@Repository
public class PlaceMapperDao {
	
	
	public List<Place> searchPlate(SqlSessionTemplate session, Map param, Map<String, Object> pData) {
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("plate.searchPlate",pData,new RowBounds((offset-1)*limit,limit));
	}
	
	public int searchPlateCount(SqlSessionTemplate session, Map pData) {
		return session.selectOne("plate.searchPlateCount",pData);
	}

}
