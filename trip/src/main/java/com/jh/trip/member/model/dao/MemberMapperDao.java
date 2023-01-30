package com.jh.trip.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.trip.member.model.vo.Member;


@Repository
public class MemberMapperDao {
	
	// 내 정보 수정
	public int updateMember(SqlSessionTemplate session, Member m) {
		
		return session.update("member.updateMember", m);
	}

	// 회원 리스트
	public List<Member> memberList(SqlSessionTemplate session, Map param) {
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("member.memeberList",null,new RowBounds((offset-1)*limit,limit) );
	}
	
	public int memberCount(SqlSessionTemplate session) {
		return session.selectOne("member.memberCount");
	}
	
	// 승급
	public int upgrade(SqlSessionTemplate session, Member m) {
		
		return session.update("member.upgrade", m);
	}
	
	// 강등
	public int downGrade(SqlSessionTemplate session, Member m) {
		return session.update("member.downgrade", m);
	}
	
	// 일반 회원 리스트
	public List<Member> normalMember(SqlSessionTemplate session, Map param, String grade) {
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("member.normalMember",grade,new RowBounds((offset-1)*limit,limit));
	}
	
	public int normalmemberCount(SqlSessionTemplate session, String grade) {
		return session.selectOne("member.normalmemberCount", grade);
	}
	
	// 플래너 회원 리스트
	public List<Member> plannerMember(SqlSessionTemplate session, Map param, String grade) {
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("member.plannerMember",grade,new RowBounds((offset-1)*limit,limit));
	}
	
	public int plannermemberCount(SqlSessionTemplate session, String grade) {
		return session.selectOne("member.plannermemberCount", grade);
	}
	
	
	// 대도시로 검색
	public List<Member> searchMemberCity(SqlSessionTemplate session, Map param, String keyword) {
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("member.searchMemberCity",keyword,new RowBounds((offset-1)*limit,limit));
	}
	
	public int searchMemberCityCount(SqlSessionTemplate session, String keyword) {
		return session.selectOne("member.searchMemberCityCount", keyword);
	}
	
	// 소도시로 검색
	public List<Member> searchMemberCountry(SqlSessionTemplate session, Map param, String keyword) {
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("member.searchMemberCountry",keyword,new RowBounds((offset-1)*limit,limit));
	}
	
	public int searchMemberCountryCount(SqlSessionTemplate session, String keyword) {
		return session.selectOne("member.searchMemberCountryCount", keyword);
	}
	// 이메일로 검색
	public List<Member> searchMemberEmail(SqlSessionTemplate session, Map param, String keyword) {
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("member.searchMemberEmail",keyword,new RowBounds((offset-1)*limit,limit));
	}
	
	public int searchMemberEmailCount(SqlSessionTemplate session, String keyword) {
		return session.selectOne("member.searchMemberEmailCount", keyword);
	}
}
