package com.jh.trip.inquiry.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.trip.inquiry.model.dao.ReplyInquiryDao;
import com.jh.trip.inquiry.model.vo.ReplyInquiry;

@Service
public class ReplyInquiryServiceImpl implements ReplyInquiryService {
	
	@Autowired
	private ReplyInquiryDao ridao;
	

	@Override
	public ReplyInquiry insertReply(ReplyInquiry r) {
		// TODO Auto-generated method stub
		return ridao.save(r);
	}

	@Override
	public ReplyInquiry selectReply() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateReply() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply() {
		// TODO Auto-generated method stub
		return 0;
	}

}
