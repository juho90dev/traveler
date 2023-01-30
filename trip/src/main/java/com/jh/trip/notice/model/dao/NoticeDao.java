package com.jh.trip.notice.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jh.trip.notice.model.vo.Notice;

@Repository
public interface NoticeDao extends JpaRepository<Notice, String>{
	
	Notice save(Notice n);
	
	Notice findByNotiNo(int notiNo);
}
