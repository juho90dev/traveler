package com.jh.trip.request.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.trip.request.model.vo.Request;

@Repository
public class RequestMapperDao {
	
	
	public List<Request> selectRequestList(SqlSessionTemplate session, Map param, String id) {
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("request.selectRequestList",id,new RowBounds((offset-1)*limit,limit));
	}
	
	public int requestCount(SqlSessionTemplate session, String id) {
		return session.selectOne("request.requestCount", id);
	}

}
