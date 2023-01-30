package com.jh.trip.inquiry.model.service;

import java.util.List;
import java.util.Map;

import com.jh.trip.inquiry.model.vo.Inquiry;

public interface InquiryService {
	
	// 문의글 목록
	List<Inquiry> selectInquiryList(Map param);
	
	int selectInquiryCount();
	
	// 문의글 작성
	Inquiry insertInquiry(Inquiry i);
	
	// 문의글 상세 정보
	Inquiry selectInquiry(int id);
	
	// 문의글 수정
	int updateInquiry(Inquiry i);
	
	// 문의글 삭제
	int deleteInquiry(int id);
	
	//문의글 검색
	List<Inquiry> searchList(String keyword);
	List<Inquiry> searchListType(String keyword);

}
