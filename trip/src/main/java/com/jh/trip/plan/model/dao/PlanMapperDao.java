package com.jh.trip.plan.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.trip.place.model.vo.Place;


@Repository
public class PlanMapperDao {
	
	public List<Place> searchKeyword(SqlSessionTemplate session, Map param, String keyword){
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("plan.searchKeyword", keyword, new RowBounds((offset-1)*limit, limit));
	}
	
	public int searchKeywordCount(SqlSessionTemplate session, String keyword) {
		return session.selectOne("plan.searchKeywordCount", keyword);
	}

}
