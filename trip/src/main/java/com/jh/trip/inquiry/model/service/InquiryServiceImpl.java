package com.jh.trip.inquiry.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.trip.inquiry.model.dao.InquiryDao;
import com.jh.trip.inquiry.model.dao.InquiryMapperDao;
import com.jh.trip.inquiry.model.vo.Inquiry;


@Service
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private InquiryDao dao;
	
	@Autowired
	private InquiryMapperDao imdao;
	
	
	@Autowired
	private SqlSessionTemplate session;
	
	// 문의글 목록
	@Override
	public List<Inquiry> selectInquiryList(Map param) {
		// TODO Auto-generated method stub
		return imdao.selectInquiryList(session, param);
	}
	
	public int selectInquiryCount() {
		
		return imdao.selectInquiryCount(session);
	}

	// 문의글 작성
	@Override
	public Inquiry insertInquiry(Inquiry i) {
		return dao.save(i);
	}
	
	// 문의글 상세정보
	@Override
	public Inquiry selectInquiry(int id) {
		return dao.findByInquiryNo(id);
	}

	// 문의글 수정
	@Override
	public int updateInquiry(Inquiry i) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 문의글 삭제
	@Override
	public int deleteInquiry(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 문의글 검색(제목/유형)
	@Override
	public List<Inquiry> searchList(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Inquiry> searchListType(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

}
