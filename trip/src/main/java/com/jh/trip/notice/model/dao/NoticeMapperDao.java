package com.jh.trip.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.trip.notice.model.vo.Notice;

@Repository
public class NoticeMapperDao {
	
	// 공지사항 리스트
	public List<Notice> selectNotice(SqlSessionTemplate session, Map param){
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("notice.selectNotice",null,new RowBounds((offset-1)*limit,limit));
	}
	
	public int selectNoticeCount(SqlSessionTemplate session) {
		return session.selectOne("notice.selectNoticeCount");
	}
	

	// 공지사항 삭제
	public int deleteNotice(SqlSessionTemplate session, int id) {
		return session.delete("notice.deleteNotice",id);
	}
	
	//공지사항 수정
	public int updateNotice(SqlSessionTemplate session, Notice n) {
		return session.update("notice.updateNotice", n);
	}
	
}
