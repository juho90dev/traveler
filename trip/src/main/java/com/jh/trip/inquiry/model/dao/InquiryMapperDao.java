package com.jh.trip.inquiry.model.dao;

import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.trip.inquiry.model.vo.Inquiry;

@Repository
public class InquiryMapperDao {
	
	public List<Inquiry> selectInquiryList(SqlSessionTemplate session, Map param) {
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		
		return session.selectList("inquiry.selectInquiryList",null,new RowBounds((offset-1)*limit,limit));
		
	}
	
	public int selectInquiryCount(SqlSessionTemplate session) {
		return session.selectOne("inquiry.selectInquiryCount");
	}
	
	

}
