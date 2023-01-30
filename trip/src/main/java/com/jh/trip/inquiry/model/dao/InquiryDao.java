package com.jh.trip.inquiry.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jh.trip.inquiry.model.vo.Inquiry;

@Repository
public interface InquiryDao extends JpaRepository<Inquiry, String>{
	
	Inquiry findByInquiryNo(int id);
	Inquiry save(Inquiry i);

}
