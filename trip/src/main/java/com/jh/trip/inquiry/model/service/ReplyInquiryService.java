package com.jh.trip.inquiry.model.service;

import com.jh.trip.inquiry.model.vo.ReplyInquiry;

public interface ReplyInquiryService {
	
	
	// 문의글 답글 작성
	ReplyInquiry insertReply(ReplyInquiry r);
	
	// 문의 답글 상세페이지
	ReplyInquiry selectReply();
	
	// 문의 답글 수정
	int updateReply();
	
	// 문의 답글 삭제
	int deleteReply();

}
