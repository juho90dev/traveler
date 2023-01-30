package com.jh.trip.request.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.trip.request.model.dao.RequestDao;
import com.jh.trip.request.model.dao.RequestMapperDao;
import com.jh.trip.request.model.vo.Request;


@Service
public class RequestSerivceImpl implements RequestService {
	
	@Autowired
	private RequestDao rdao;
	
	@Autowired
	private RequestMapperDao rmdao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Request> selectRequestList(Map param, String id) {
		// TODO Auto-generated method stub
		return rmdao.selectRequestList(session, param, id);
	}

	@Override
	public int requestCount(String id) {
		return rmdao.requestCount(session, id);
	}
	
	@Override
	public Request insertRequest(Request r) {
		// TODO Auto-generated method stub
		return rdao.save(r);
	}
	

	@Override
	public Request infoRequest() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateRequest() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRequest() {
		// TODO Auto-generated method stub
		return 0;
	}

}
