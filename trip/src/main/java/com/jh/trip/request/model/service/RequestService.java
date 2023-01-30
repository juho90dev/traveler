package com.jh.trip.request.model.service;

import java.util.List;
import java.util.Map;

import com.jh.trip.request.model.vo.Request;

public interface RequestService {
	
	//플랜 요청 목록
	List<Request> selectRequestList(Map param, String id);
	
	int requestCount(String id);
	
	
	// 플랜 요청 작성
	Request insertRequest(Request r);
	
	// 플랜 요청서 상세 정보
	Request infoRequest();
	
	// 플랜 요청 수정
	int updateRequest();
	
	// 플랜 요청 삭제
	int deleteRequest();
	
	 

}
