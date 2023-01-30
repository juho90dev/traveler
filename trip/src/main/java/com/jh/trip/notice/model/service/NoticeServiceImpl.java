package com.jh.trip.notice.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.trip.notice.model.dao.NoticeDao;
import com.jh.trip.notice.model.dao.NoticeMapperDao;
import com.jh.trip.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao dao;
	
	@Autowired
	private NoticeMapperDao nmdao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	// 공지사항 작성
	@Override
	public Notice insertNotice(Notice n) {
		return dao.save(n);
	}
	
	// 공지사항 전체조회  
	@Override
	public List<Notice> selectNotice(Map param) {
		
		return nmdao.selectNotice(session, param);
	}
	
	
	@Override
	public int selectNoticeCount() {
		return nmdao.selectNoticeCount(session);
	}
	
	// 공지사항 상세페이지
	
	public Notice selectNoticeInfo(int notiNo) {
		return dao.findByNotiNo(notiNo);
		
	}
	
	// 공지사항 삭제
	@Override
	public int deleteNotice(int notiNo) {
		
		return nmdao.deleteNotice(session, notiNo);
		//return dao.deleteByInquiryNo(inquiryNo);
	}
	
	// 공지사항 수정
	@Override
	public int updateNotice(Notice n) {
		return nmdao.updateNotice(session, n);
	}
	
}
