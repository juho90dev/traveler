package com.jh.trip.inquiry.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jh.trip.inquiry.model.vo.ReplyInquiry;

@Repository
public interface ReplyInquiryDao extends JpaRepository<ReplyInquiry, String>{
	
	ReplyInquiry save(ReplyInquiry r);

}
