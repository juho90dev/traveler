package com.jh.trip.request.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.trip.request.model.dao.RequestDao;
import com.jh.trip.request.model.vo.Request;


@Service
public class RequestSerivceImpl implements RequestService {
	
	@Autowired
	private RequestDao rdao;

	@Override
	public List<Request> selectRequestList() {
		// TODO Auto-generated method stub
		return null;
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
