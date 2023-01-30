package com.jh.trip.notice.model.service;

import java.util.List;
import java.util.Map;

import com.jh.trip.notice.model.vo.Notice;

public interface NoticeService {

	
	// 공지사항 작성
	Notice insertNotice(Notice n);
	
	// 공지사항 리스트
	List<Notice> selectNotice(Map param);
	
	int selectNoticeCount();
	
	// 공지사항 상세 페이지 
	Notice selectNoticeInfo(int notiNo);
	
	// 공지사항 삭제 
	int deleteNotice(int notiNo);
	
	// 공지사항 수정
	int updateNotice(Notice n);
}
